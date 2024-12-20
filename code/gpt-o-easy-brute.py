def find_opposite_person(t, cases):
    results = []
    for case in cases:
        a, b, c = case
        
        # Calculate the circle "half length" d_ab
        d_ab = abs(b - a)
        
        # The circle length "n" should be even and should be at least as large as either side
        n = d_ab * 2
        
        # Verify if a circle solution is possible with calculated n
        if max(a, b, c) > n:
            # No valid circle exists with the derived n
            results.append(-1)
        else:
            # Calculate the person's number `d` who `c` is looking at
            d = (c + d_ab) % n
            # If zero adjustment case reaches
            if d == 0:
                d = n
            # Add result 
            results.append(d)
    
    return results

if __name__ == "__main__":
    import sys
    
    # input = sys.stdin.read
    data = input().split()
    
    t = int(data[0])
    index = 1
    cases = []
    
    for _ in range(t):
        a = int(data[index])
        b = int(data[index + 1])
        c = int(data[index + 2])
        cases.append((a, b, c))
        index += 3
    
    results = find_opposite_person(t, cases)
    for result in results:
        print(result)
