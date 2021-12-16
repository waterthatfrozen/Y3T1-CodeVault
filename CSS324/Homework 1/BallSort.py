# Ball Sorting
import copy

def initial_state():
    # "" as empty stack
    # return ["AAAA","BBBB","DCCC","CDDD","",""]
    S1 = S2 = S3 = S4 = ""
    for _ in range(4):
        a = input().split()
        S1+=a[0]
        S2+=a[1]
        S3+=a[2]
        S4+=a[3]
    init_state = [S1,S2,S3,S4,"",""]
    #print(init_state)
    return init_state

def is_goal(s):
    count = 0
    for i in s:
        if i in ["AAAA","BBBB","CCCC","DDDD",""]:
            count +=1
    return count == 6

# print("TEST GOAL FUNCTION")
# print(is_goal(["AADC","AADB","CCDD","CBBB","",""]))
# print(is_goal(["","BBBB","CCCC","DDDD","AAAA",""]))
# print(is_goal(["","","DDDD","BBBB","AAAA","CCCC"]))

def valid_move(s,orgn,dest):
	# check the valid move
    if s[orgn] == "" or len(s[dest]) == 4 or orgn == dest:
        return False
    else:
        if s[dest] == "":
            return True
        elif s[orgn][0] == s[dest][0]:
            # print(s[dest],s[orgn][0],len(s[dest]),s[dest].count(s[orgn][0]))
            return True
        else:
            return False
        # return True

#print("TEST VALID MOVE FUNCTION")
#print(valid_move(["AADC","AADB","CCDD","CBBB","",""],4,0))
#print(valid_move(["AADC","AADB","CCDD","CBBB","",""],0,4))

def move_ball(s,orgn,dest):
    new_s = copy.deepcopy(s)
    new_s[dest] = new_s[orgn][0] + new_s[dest]
    new_s[orgn] = new_s[orgn][1:]
    return new_s

#rint("TEST MOVE BALL FUNCTION")
#print(move_ball(["AADC","AADB","CCDD","CBBB","",""],0,4))

def successors(s):
	# Successor Function
    # not the same stack, not full, same character -> moveable
    for orgn in range (6):
        for dest in range(6):
            if valid_move(s,orgn,dest):
                #print("now trying to move top of orgn stk#",orgn," to dest stk#",dest)
                new_ball_s = move_ball(s,orgn,dest)
                # print(new_ball_s)
                yield new_ball_s,1