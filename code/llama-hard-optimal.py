from collections import defaultdict
from itertools import combinations

def solve(n, a):
    MOD = 10**9 + 7
    graph = defaultdict(list)
    for i, j in combinations(range(n), 2):
        if a[i] % a[j] == 0:
            graph[j].append(i)
        if a[j] % a[i] == 0:
            graph[i].append(j)

    dp = [0] * (1 << n)
    for i in range(n):
        dp[1 << i] = 1
    for mask in range(1 << n):
        for i in range(n):
            if (mask & (1 << i)) > 0:
                for j in graph[i]:
                    if (mask & (1 << j)) == 0:
                        dp[mask | (1 << j)] += dp[mask]
                        dp[mask | (1 << j)] %= MOD

    max_count = max(dp)
    return sum(1 for x in dp if x == max_count) % MOD

n = int(input())
a = list(map(int, input().split()))
print(solve(n, a))
