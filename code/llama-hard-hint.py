import sys
input = sys.stdin.readline

mod = 10**9 + 7

def solve():
    n = int(input())
    a = list(map(int, input().split()))
    a.sort()
    T = set()
    S = set()
    for i in a:
        if i in T:
            S.add(i)
        else:
            T.add(i)
    S = list(S)
    T = list(T)
    n_S = len(S)
    n_T = len(T)
    dp = [[0]*(n_T+1) for _ in range(n_S+1)]
    for i in range(n_T+1):
        dp[0][i] = 1
    for i in range(1, n_S+1):
        for j in range(1, n_T+1):
            if T[j-1] % S[i-1] == 0:
                for k in range(1, n_T+1):
                    if T[k-1] % S[i-1] == 0 and k != j:
                        dp[i][j] += dp[i-1][k]
                        dp[i][j] %= mod
            else:
                dp[i][j] = dp[i-1][j]
    ans = 0
    for i in range(1, n_T+1):
        ans += dp[n_S][i]
        ans %= mod
    print(ans)

solve()
