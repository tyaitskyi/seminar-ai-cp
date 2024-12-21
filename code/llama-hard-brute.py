def solve(n, a):
    MOD = 10**9 + 7
    max_count = 0
    count = [0] * (1 << n)
    for i in range(1 << n):
        for j in range(n):
            if (i & (1 << j)) > 0:
                for k in range(n):
                    if (i & (1 << k)) > 0 and k != j:
                        for l in range(n):
                            if (i & (1 << l)) == 0 and a[l] % a[j] == 0 and a[l] % a[k] == 0:
                                count[i] += 1
                                break
        max_count = max(max_count, count[i])
    ans = 0
    for i in range(1 << n):
        if count[i] == max_count:
            ans += 1
    return ans % MOD

n = int(input())
a = list(map(int, input().split()))
print(solve(n, a))
