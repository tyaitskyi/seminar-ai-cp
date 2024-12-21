n = int(input())
a = list(map(int, input().split()))
mod = 10**9 + 7

def get_divisors(i):
    divisors = []
    for j in range(n):
        if a[j] % a[i] == 0:
            divisors.append(j)
    return divisors

def count_piles(i, used, dp):
    if i == n:
        return 1
    if dp[i][used] != -1:
        return dp[i][used]
    count = 0
    divisors = get_divisors(i)
    for j in range(len(divisors)):
        for k in range(j + 1, len(divisors)):
            if not used[divisors[j]] and not used[divisors[k]]:
                used[divisors[j]] = True
                used[divisors[k]] = True
                count += count_piles(i + 1, used, dp)
                used[divisors[j]] = False
                used[divisors[k]] = False
    dp[i][used] = count
    return count

dp = [[-1] * (1 << n) for _ in range(n)]
used = [False] * n
max_piles = 0
for i in range(n):
    count = count_piles(i, used, dp)
    max_piles = max(max_piles, count)

print(max_piles % mod)
