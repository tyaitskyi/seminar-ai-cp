MOD = 10**9 + 7

def factorial(x):
    res = 1
    for i in range(1, x+1):
        res = (res * i) % MOD
    return res

def solve():
    n = int(input().strip())
    a = list(map(int, input().split()))
    
    # For each a_i, count how many of the a_j are divisible by a_i
    counts = []
    for x in a:
        cnt = sum((y % x == 0) for y in a)
        counts.append((cnt, x))
    
    # Find the maximum count
    max_cnt = max(cnt for cnt, x in counts)
    
    # If max_cnt < 3, no moves possible
    if max_cnt < 3:
        # No moves, length = 0, ways = 1
        print("0 1")
        return
    
    # Maximum number of moves is max_cnt - 2
    max_length = max_cnt - 2
    
    # Collect all pivots that have this max_cnt
    pivots = [x for (cnt, x) in counts if cnt == max_cnt]
    
    # For each pivot's group:
    # Number of ways = (max_cnt - 1)! since we remove (max_cnt - 2) out of (max_cnt - 1) multiples in some order
    ways_for_one = factorial(max_cnt - 1)
    
    # If multiple pivots yield the same maximum, we sum up their ways
    # However, these sets can differ because the pivot and its multiples differ,
    # producing different final piles.
    ways = (ways_for_one * len(pivots)) % MOD
    
    print(f"{max_length} {ways}")
