import requests
import mysql.connector as connector
from random import randint

from .properties import *


SEARCH_URL = 'http://food2fork.com/api/search'
RECIPE_URL = 'http://food2fork.com/api/get'
SEARCH_TERMS = ['Soup', 'Mexican', 'Beef', 'Chicken', 'Sandwich']

products = []


def execute():
    cnx = connector.connect(user=DB_USER, password=DB_PASS, host=DB_HOST, database=DB_NAME)
    cursor = cnx.cursor()
    initialize_products(cursor)

    for term in SEARCH_TERMS:
        r = requests.get(SEARCH_URL + '?key=' + API_KEY + '&q=' + term)
        json_content = r.json()

        for recipe in json_content['recipes']:
            recipe_id = recipe.get('recipe_id')
            r = requests.get(RECIPE_URL + '?key=' + API_KEY + '&rId=' + recipe_id)
            recipe_content = r.json()['recipe']
            create_new_recipe(cursor, recipe_content)

    cnx.commit()
    cursor.close()


def create_new_recipe(cursor, recipe_content):
    name = recipe_content['title']
    if not recipe_exists(cursor, name):
        recipe_id = insert_recipe(cursor, name)
        for ingredient in recipe_content['ingredients']:
            ingredient = format_ingredient(ingredient)
            matching_product = matches_existing_product(ingredient)

            if matching_product:
                product_id = find_product(cursor, matching_product)
            else:
                products.append(ingredient)
                product_id = insert_product(cursor, ingredient)

            insert_ingredient(cursor, product_id, recipe_id, randomize_amount())


def format_ingredient(ingredient):
    ingredient = ''.join([i for i in ingredient if not i.isdigit()])
    ingredient = ingredient.strip().lower()
    return ingredient


def matches_existing_product(ingredient):
    for product in products:
        if product in ingredient:
            return product

    return False


def insert_product(cursor, name):
    create_general_product = 'insert into GeneralProduct (name) values (%s)'
    cursor.execute(create_general_product, (name,))

    general_product_id = cursor.lastrowid
    create_product = 'insert into Product (name, weight, general_product) values (%s, %s, %s)'
    cursor.execute(create_product, (name, randomize_weight(), general_product_id))
    return cursor.lastrowid


def randomize_weight():
    return randint(50, 1000)


def randomize_amount():
    return randint(10, 500)


def insert_recipe(cursor, name):
    create_recipe = 'insert into Recipe (name) values (%s)'
    cursor.execute(create_recipe, (name,))
    return cursor.lastrowid


def insert_ingredient(cursor, product_id, recipe_id, amount):
    create_ingredient = 'insert into Ingredient (product, recipe, amount) values (%s, %s, %s)'
    cursor.execute(create_ingredient, (product_id, recipe_id, amount))


def recipe_exists(cursor, name):
    recipe_query = 'select * from recipe where name = (%s)'
    cursor.execute(recipe_query, (name,))
    for _ in cursor:
        return True
    return False


def find_product(cursor, name):
    product_query = 'select id from Product where name = (%s)'
    cursor.execute(product_query, (name,))
    for product in cursor:
        return product[0]


def initialize_products(cursor):
    product_query = 'select name from Product'
    cursor.execute(product_query)
    for product in cursor:
        products.append(product[0])


# def truncate_tables(cursor):
#     cursor.execute('delete from Ingredient')
#     cursor.execute('delete from Product')
#     cursor.execute('delete from GeneralProduct')
#     cursor.execute('delete from Recipe')


execute()