n = int(input())
a = list(map(int, input().split()))
mod = 10**9 + 7

def is_divisible(i, j):
    return a[j] % a[i] == 0

def count_piles(i, used):
    if i == n:
        return 1
    count = 0
    for j in range(n):
        if not used[j] and is_divisible(i, j):
            for k in range(n):
                if not used[k] and is_divisible(i, k) and k != j:
                    used[j] = True
                    used[k] = True
                    count += count_piles(i + 1, used)
                    used[j] = False
                    used[k] = False
    return count

used = [False] * n
max_piles = 0
for i in range(n):
    count = count_piles(i, used)
    max_piles = max(max_piles, count)

print(max_piles % mod)
