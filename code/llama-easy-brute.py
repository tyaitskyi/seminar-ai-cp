def solve(a, b, c):
    for n in range(2, 10**8, 2):  # n is even
        if (a + n // 2 - 1) % n + 1 == b:
            return (c + n // 2 - 1) % n + 1
    return -1

t = int(input())
for _ in range(t):
    a, b, c = map(int, input().split())
    print(solve(a, b, c))
