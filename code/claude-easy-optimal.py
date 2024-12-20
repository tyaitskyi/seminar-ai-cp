import math

t = int(input())
for _ in range(t):
    a, b, c = map(int, input().split())
    diff = b - a
    if diff < 0:
        diff = -diff
    n = 2 * diff
    while n % diff != 0:
        n += 2 * diff
    d = c + diff
    if d % n == 0 and d > 0 and d <= n:
        print(d)
    else:
        print(-1)
