def count_maximal_piles(n, a):
    MOD = 10**9 + 7
    
    # Sort the array to help with divisibility checking
    a.sort()
    
    # DP table: dp[i] will store the number of ways to pile starting from i
    dp = [0] * n
    dp_max_len = [0] * n  # Maximum length piles starting from each i
    max_length = 0
    
    # Calculate possible piles:
    for i in range(n):
        # Start a pile from a[i]
        dp[i] = 1  # There's always at least one way starting just with a[i]
        dp_max_len[i] = 1  # Initial length is 1 (just the box itself)
        
        for j in range(i):
            if a[i] % a[j] == 0:  # Can we place a[i] after a[j]?
                if dp_max_len[j] + 1 > dp_max_len[i]:
                    dp[i] = dp[j]
                    dp_max_len[i] = dp_max_len[j] + 1
                elif dp_max_len[j] + 1 == dp_max_len[i]:
                    dp[i] += dp[j]

        dp[i] %= MOD
        max_length = max(max_length, dp_max_len[i])
    
    # Calculate total number of distinct maximum piles
    num_of_max_piles = sum(dp[i] for i in range(n) if dp_max_len[i] == max_length) % MOD
    
    return num_of_max_piles


if __name__ == "__main__":
    import sys
    input = sys.stdin.read
    data = input().split()
    
    n = int(data[0])
    a = list(map(int, data[1:]))
    
    result = count_maximal_piles(n, a)
    print(result)
