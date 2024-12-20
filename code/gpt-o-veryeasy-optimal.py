def max_algorithms(N, X, a):
    # Sort the list of learning times in non-decreasing order
    a.sort()
    
    total_time = 0
    algorithms_learned = 0
    
    # Iterate over the sorted times
    for time in a:
        if total_time + time <= X:
            total_time += time
            algorithms_learned += 1
        else:
            break  # No more time to learn further algorithms
            
    return algorithms_learned

if __name__ == "__main__":
    import sys
    
    # Read input
    input = sys.stdin.read
    data = input().split()
    
    N = int(data[0])
    X = int(data[1])
    a = list(map(int, data[2:2 + N]))
    
    # Solve the problem
    result = max_algorithms(N, X, a)
    
    # Output the result
    print(result)
