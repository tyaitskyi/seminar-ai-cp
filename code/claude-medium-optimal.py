import sys

n, t = map(int, input().split())
for _ in range(t):
    k = int(input())
    left, right = 1, n
    while left < right:
        mid = (left + right) // 2
        print(f"? {left} {mid}")
        sys.stdout.flush()
        response = int(input())
        if response < k:
            left = mid + 1
            k -= response
        else:
            right = mid
    print(f"! {left}")
    sys.stdout.flush()
