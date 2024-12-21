import sys

def query(l, r):
    print(f"? {l} {r}")
    sys.stdout.flush()
    return int(input())

def solve(n, t, k):
    l, r = 1, n
    while l < r:
        m = (l + r) // 2
        cnt = query(l, m)
        if cnt >= k:
            r = m
        else:
            l = m + 1
            k -= cnt
    print(f"! {l}")
    sys.stdout.flush()

n, t = map(int, input().split())
for _ in range(t):
    k = int(input())
    solve(n, t, k)
