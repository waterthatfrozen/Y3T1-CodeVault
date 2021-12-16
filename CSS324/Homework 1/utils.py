from collections import deque
import copy

def create_node(state, parent, action, path_cost, depth):
    return (state, parent, action, path_cost, depth)

def print_solution(n):
    r = deque()
    while n is not None:
        r.appendleft(n[0])
        n = n[1]
    step = 0
    for s in r:
        print("Step",step)
        print_s = []
        for i in range(6):
            if len(s[i]) < 4:
                empty_height = 4 - len(s[i])
                print_s.append('.'*empty_height+s[i])
            else:
                print_s.append(s[i])
        for i in range(4):
            for j in range(6):
                print(print_s[j][i],end=' ')
            print()
        step+=1
        print()