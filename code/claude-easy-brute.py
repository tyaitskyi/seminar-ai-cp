def solve(a, b, c):
    # Try all even numbers of people from 4 to 2*max(a,b,c)
    for n in range(4, 2*max(a,b,c)+1, 2):
        # Check if a and b are opposite each other
        if (b - a) % n == n // 2:
            # If they are, calculate who c is looking at
            d = (c + n // 2 - 1) % n + 1
            return d
    
    # If no valid circle is found
    return -1

# Read the number of test cases
t = int(input())

# Process each test case
for _ in range(t):
    # Read a, b, c for this test case
    a, b, c = map(int, input().split())
    
    # Solve and print the result
    result = solve(a, b, c)
    print(result)
