def find_opposite_person(t, cases):
    results = []
    for case in cases:
        a, b, c = case
        d_ab = abs(b - a)
        n = 2 * d_ab  # Total people in the circle

        # Check if a circle can be formed with the highest number in the list
        if max(a, b, c) > n:
            results.append(-1)
        else:
            # Calculate opposite of c
            d = (c + d_ab) % n
            if d == 0:
                d = n
            results.append(d)
    
    return results

if __name__ == "__main__":
    import sys
    
    input = sys.stdin.read
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
