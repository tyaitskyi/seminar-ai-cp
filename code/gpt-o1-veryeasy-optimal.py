def solve():
    # Read inputs
    N, X = map(int, input().split())
    times = list(map(int, input().split()))
    
    # Sort the required times in ascending order 
    # to learn as many as possible starting from the shortest ones
    times.sort()
    
    count = 0
    current_time = 0
    for t in times:
        if current_time + t <= X:
            current_time += t
            count += 1
        else:
            break
    
    print(count)
