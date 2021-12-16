# Ball Sort Puzzle Assignment 
# CSS324 Section 3
# 6222780379 Paphana Y. 
# 6222780833 Makhapoom E. 

import BallSort as BS
import UCGS
import utils

goal_node, _ = UCGS.uniform_cost_graph_search(BS)
if goal_node:
    utils.print_solution(goal_node)
else:
    print("No Solution")