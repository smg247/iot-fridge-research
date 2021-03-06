import mysql.connector as connector
import collections

from properties import *

recipes = {}
owned_ingredients = []

owned_ingredients_used = []


def execute(using_weight, number_of_meals, print_verbose):
    recipes.clear()
    owned_ingredients_used.clear()
    owned_ingredients.clear()

    cnx = connector.connect(user=DB_USER, password=DB_PASS, host=DB_HOST, database=DB_NAME)
    cursor = cnx.cursor()
    initialize_recipes(cursor)
    initialize_owned_ingredients(cursor)

    for recipe in recipes.values():
        ingredients_needed = determine_ingredients_needed_to_make_recipe(recipe, using_weight)
        recipe.set_ingredients_to_buy(ingredients_needed)
        if (len(ingredients_needed) == 0):
            print('we have all the ingredients to make: ' + recipe.get_name())

    determine_ingredients_on_shopping_list(using_weight, number_of_meals, print_verbose)
    return calculate_metrics()


def initialize_recipes(cursor):
    recipe_query = 'select id, name from Recipe'
    cursor.execute(recipe_query)
    for r in cursor:
        recipe = Recipe(r[1])
        recipes[r[0]] = recipe

    for r_id in recipes.keys():
        recipe = recipes[r_id]
        ingredient_query = 'select p.id, p.name, i.amount from Ingredient i, Product p where i.recipe = (%s) and i.product = p.id'
        cursor.execute(ingredient_query, (r_id,))
        for i in cursor:
            ingredient = Ingredient(i[0], i[1], i[2])
            recipe.add_ingredient(ingredient)


def initialize_owned_ingredients(cursor):
    user_product_query = 'select up.product, p.name, up.weight_left from UserProduct up, Product p where p.id = up.product'
    cursor.execute(user_product_query)
    for up in cursor:
        owned_ingredient = Ingredient(up[0], up[1], up[2])
        owned_ingredients.append(owned_ingredient)


def determine_ingredients_needed_to_make_recipe(recipe, using_weight):
    ingredients_needed = []
    for ingredient in recipe.get_ingredients():
        ingredient_owned = False
        for owned_ingredient in owned_ingredients:
            if owned_ingredient.get_product_id() == ingredient.get_product_id():
                ingredient_owned = True
                amount_needed = determine_amount_of_ingredient_needed(owned_ingredient, ingredient, using_weight)
                needed_ingredient = Ingredient(ingredient.get_product_id(), ingredient.get_name(), amount_needed)
                ingredients_needed.append(needed_ingredient)
                break


        if not ingredient_owned:
            needed_ingredient = Ingredient(ingredient.get_product_id(), ingredient.get_name(), ingredient.get_amount())
            ingredients_needed.append(needed_ingredient)

    return ingredients_needed


def determine_amount_of_ingredient_needed(owned_ingredient, ingredient, using_weight):
    amount_needed = ingredient.get_amount()
    if using_weight:
        amount_owned = owned_ingredient.get_amount()
        return amount_owned - amount_needed
    else:
        return -1 # If we don't know how much we have we will only be able to assume we have enough


def determine_ingredients_on_shopping_list(using_weight, number_of_meals, print_verbose):
    number_of_recipes_added = 0
    sorted_recipes = sort_recipes(recipes.values())
    while number_of_recipes_added < number_of_meals:
        recipe = sorted_recipes[0]
        sorted_recipes = sorted_recipes[1:]
        if recipe.is_valid():
            for ingredient in recipe.get_ingredients_to_buy():
                if (ingredient.get_amount() > 0):
                    if print_verbose:
                        print('buying: ' + str(ingredient.get_amount()) + 'g of ' + ingredient.get_name())
                elif using_weight:
                    owned_ingredients_used.append(ingredient.get_name())
                    if print_verbose:
                        print('I will still have: ' + str(abs(ingredient.get_amount())) + 'g of ' + ingredient.get_name())
                else:
                    owned_ingredients_used.append(ingredient.get_name())
                    if print_verbose:
                        print('I already have: ' + ingredient.get_name())

                if using_weight: # Otherwise we won't know if we have enough or not, no reason to change the amount when we never knew it in the first place
                    matching_ingredient = recipe.get_matching_ingredient(ingredient) # The total amount of the ingredient this recipe will use
                    for sorted_recipe in sorted_recipes:
                        sorted_recipe.add_amount_to_ingredient_to_buy(matching_ingredient.get_amount(), ingredient.get_product_id())

            sorted_recipes = sort_recipes(sorted_recipes)
            number_of_recipes_added += 1

            if print_verbose:
                print('     to make: ' + recipe.get_name())


def sort_recipes(recipes):
    return sorted(recipes, key=lambda recipe: recipe.get_number_of_ingredients_to_buy())


def calculate_metrics():
    ingredients_used_multiple_times = [ingredient for ingredient, count, in collections.Counter(owned_ingredients_used).items() if count > 1]
    return ingredients_used_multiple_times


class Recipe():
    def __init__(self, name):
        self.name = name
        self.ingredients = []
        self.ingredients_to_buy = []

    def add_ingredient(self, ingredient):
        self.ingredients.append(ingredient)

    def set_ingredients_to_buy(self, ingredients_to_buy):
        self.ingredients_to_buy = ingredients_to_buy

    def get_ingredients(self):
        return self.ingredients

    def get_name(self):
        return self.name

    def get_ingredients_to_buy(self):
        return self.ingredients_to_buy

    def get_number_of_ingredients_to_buy(self):
        number = 0
        for ingredient in self.ingredients_to_buy:
            if ingredient.get_amount() > 0:
                number += 1

        return number

    def add_amount_to_ingredient_to_buy(self, amount, product_id):
        for ingredient in self.ingredients_to_buy:
            if (ingredient.get_product_id() == product_id):
                ingredient.add_amount(amount)

    def get_matching_ingredient(self, ingredient_to_buy):
        for ingredient in self.ingredients:
            if ingredient.get_product_id() == ingredient_to_buy.get_product_id():
                return ingredient

    def is_valid(self): # Recipes that are too simple make for less interesting results
        return len(self.ingredients) > 4


class Ingredient():
    def __init__(self, product_id, name, amount):
        self.product_id = product_id
        self.name = name
        self.amount = amount

    def get_name(self):
        return self.name

    def get_amount(self):
        return self.amount

    def get_product_id(self):
        return self.product_id

    def subtract_amount(self, amount_to_subtract):
        self.amount = self.amount - amount_to_subtract

    def add_amount(self, amount_to_add):
        self.amount = self.amount + amount_to_add