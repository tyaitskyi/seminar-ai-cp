def solve(a, b, c):
    diff = abs(a - b)
    if diff % 2 != 0 or a == b:
        return -1
    diff //= 2
    return (c + diff) if a < b else (c - diff)

t = int(input())
for _ in range(t):
    a, b, c = map(int, input().split())
    print(solve(a, b, c))
