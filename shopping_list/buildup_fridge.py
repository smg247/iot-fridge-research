import mysql.connector as connector
from random import randint
import numpy
from properties import *

NUM_SHELVES = 4
GRID_SIZE = 10
products = []


def execute():
    cnx = connector.connect(user=DB_USER, password=DB_PASS, host=DB_HOST, database=DB_NAME)
    cursor = cnx.cursor()
    cursor.execute('delete from UserProduct')
    initialize_products(cursor)
    fridge = numpy.zeros(shape=(NUM_SHELVES - 1, GRID_SIZE - 1, GRID_SIZE - 1))

    for product in products:
        if should_insert_product():
            if not put_product_into_fridge(cursor, fridge, product): # we ran out of space
                break

    cnx.commit()


def initialize_products(cursor):
    product_query = 'select name from Product'
    cursor.execute(product_query)
    for product in cursor:
        products.append(product[0])


def put_product_into_fridge(cursor, fridge, product_name):
    shape, weight = determine_size_of_product(cursor, product_name)
    return place_item_in_fridge(cursor, fridge, shape, weight, product_name)


def insert_user_product(cursor, product_id, weight_left, x_loc, y_loc, shelf):
    insert_product = 'insert into UserProduct (product, weight_left, x_loc, y_loc, shelf) values (%s, %s, %s, %s, %s)'
    cursor.execute(insert_product, (product_id, weight_left, x_loc, y_loc, shelf))


def determine_size_of_product(cursor, product_name):
    shape = (randint(1, GRID_SIZE/2), randint(1, GRID_SIZE/2))
    weight = randint(10, get_total_product_size(cursor, product_name))
    return shape, weight


def place_item_in_fridge(cursor, fridge, shape, weight, product_name):
    for shelf in range(len(fridge)):
        for x in range(len(fridge[shelf])):
            for y in range(len(fridge[shelf][x])):
                if test_if_region_is_valid(fridge, shelf, x, y, shape):
                    insert_product_into_region(cursor, fridge, shelf, x, y, shape, weight, product_name)
                    return True

    return False

def test_if_region_is_valid(fridge, shelf, x, y, shape):
    x_to_try = x
    y_to_try = y

    try: # in order to just fail if we get out of bounds of the fridge
        while fridge[shelf][x_to_try][y_to_try] == 0:
            x_to_try += 1
            x_delta = x_to_try - x
            y_delta = y_to_try - y

            if y_delta == shape[1] - 1 and x_delta == shape[0]:
                return True
            elif x_delta == shape[0]:
                x_to_try = x
                y_to_try += 1
    except:
        return False

    return False


def insert_product_into_region(cursor, fridge, shelf, x, y, shape, weight, product_name):
    weight_for_each_square = weight/(shape[0] * shape[1])
    x_to_insert = x
    y_to_insert = y

    while fridge[shelf][x_to_insert][y_to_insert] == 0:
        fridge[shelf][x_to_insert][y_to_insert] = weight_for_each_square
        x_to_insert += 1
        x_delta = x_to_insert - x
        y_delta = y_to_insert - y

        if y_delta == shape[1] - 1 and x_delta == shape[0]:
            x_to_insert -= 1 # decrement as this has been incremented unnecessarily
            x_loc = str(x) + '-' + str(x_to_insert)
            y_loc = str(y) + '-' + str(y_to_insert)
            insert_user_product(cursor, find_product_id(cursor, product_name), weight, x_loc, y_loc, shelf)
            break
        elif x_delta == shape[0]:
            x_to_insert = x
            y_to_insert += 1


def get_total_product_size(cursor, product_name):
    find_size = 'select weight from Product where name = (%s)'
    cursor.execute(find_size, (product_name,))
    for size in cursor:
        return size[0]


def find_product_id(cursor, name):
    product_query = 'select id from Product where name = (%s)'
    cursor.execute(product_query, (name,))
    for product in cursor:
        return product[0]


def should_insert_product():
    return randint(0, 3) % 3 == 0