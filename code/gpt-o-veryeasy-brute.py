def max_algorithms(N, X, a):
    from itertools import combinations

    max_learned = 0
  
    # Check all possible numbers of algorithms to learn (from 1 to N)
    for r in range(1, N + 1):
        # Generate all combinations of r algorithms to consider
        for combo in combinations(a, r):
            # Calculate the total time for this combination
            total_time = sum(combo)
            # If this combination fits within the available time X, update the max if it's better
            if total_time <= X:
                max_learned = max(max_learned, r)
                
    return max_learned

if __name__ == "__main__":
    import sys
    
    # Read input
    # input = sys.stdin.read
    data = input().split()
    
    N = int(data[0])
    X = int(data[1])
    a = list(map(int, data[2:2 + N]))
    
    # Solve the problem
    result = max_algorithms(N, X, a)
    
    # Output the result
    print(result)
