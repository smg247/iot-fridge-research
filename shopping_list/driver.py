
from shopping_list.buildup_fridge import execute as buildup_fridge
from shopping_list.create_shopping_list import execute as create_shopping_list

def execute():
    buildup_fridge()

    create_shopping_list(True)
    print('\n\n\n\n\n\n')
    create_shopping_list(False)


execute()