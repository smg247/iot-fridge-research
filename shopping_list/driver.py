
from shopping_list.buildup_fridge import execute as buildup_fridge
from shopping_list.create_shopping_list import execute as create_shopping_list

ITERATIONS = 50
SHELVES = 4
MEALS = 15

def execute():

    total_mistakes = 0
    metrics = {}
    for i in range (0, ITERATIONS):
        buildup_fridge(SHELVES, 16)
        metrics_weighted = create_shopping_list(True, MEALS, False)
        metrics_unweighted = create_shopping_list(False, MEALS, False)
        metrics['weighted-' + str(i)] = metrics_weighted
        metrics['unweighted-' + str(i)] = metrics_unweighted

        unweighted_mistakes = set(metrics_unweighted) - set(metrics_weighted)
        total_mistakes += len(unweighted_mistakes)

    print(total_mistakes/ITERATIONS)
    print(metrics)

execute()