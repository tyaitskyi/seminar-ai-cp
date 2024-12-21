import sys

def query(l, r):
    print(f"? {l} {r}")
    sys.stdout.flush()
    return int(input())

def solve(n, t, k):
    for i in range(1, n+1):
        if query(i, i) == 0:
            k -= 1
            if k == 0:
                print(f"! {i}")
                sys.stdout.flush()
                return

n, t = map(int, input().split())
for _ in range(t):
    k = int(input())
    solve(n, t, k)
