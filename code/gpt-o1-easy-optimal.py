def solve():
    import sys
    input_data = sys.stdin.read().strip().split()
    t = int(input_data[0])
    idx = 1
    for _ in range(t):
        a, b, c = map(int, input_data[idx:idx+3])
        idx += 3
        
        diff = abs(a - b)
        # The total number of people in the circle
        N = 2 * diff
        
        # If any given number exceeds N, or if N doesn't make sense (like diff = 0), 
        # then such a circle can't exist
        if diff == 0 or max(a, b, c) > N:
            print(-1)
            continue
        
        # Determine the opposite person of c
        if c <= N//2:
            opposite_c = c + N//2
        else:
            opposite_c = c - N//2
        
        print(opposite_c)
