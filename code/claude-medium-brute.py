import sys

n, t = map(int, input().split())
for _ in range(t):
    k = int(input())
    for i in range(1, n + 1):
        print(f"? {i} {i}")
        sys.stdout.flush()
        response = int(input())
        if response == 0:
            k -= 1
            if k == 0:
                print(f"! {i}")
                sys.stdout.flush()
                break
