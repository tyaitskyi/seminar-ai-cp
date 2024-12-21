def count_maximal_piles(n, a):
    MOD = 10**9 + 7
    
    # Precompute divisibility
    adj = [[] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if a[i] % a[j] == 0 and i != j:
                adj[j].append(i)  # j -> i if a[j] divides a[i]

    # dp[mask][i] = number of ways to make a pile ending with box a_i using the chosen boxes in `mask`
    dp = [{} for _ in range(1 << n)]

    # Base case
    for i in range(n):
        dp[1 << i][i] = 1  # There's one way to end a pile with only box `i`

    max_length = 0
    max_length_ways = 0

    # Iterate over all masks
    for mask in range(1 << n):
        for i in range(n):
            if mask & (1 << i):
                if len(dp[mask][i]) > 0:
                    length = bin(mask).count('1')
                    if length > max_length:
                        max_length = length
                        max_length_ways = 0
                    
                    if length == max_length:
                        max_length_ways += dp[mask][i]
                        max_length_ways %= MOD
                    
                    # Extend pile at i to any j where i is divisible by j and j is not in mask yet
                    for j in adj[i]:
                        if not mask & (1 << j):
                            new_mask = mask | (1 << j)
                            if j not in dp[new_mask]:
                                dp[new_mask][j] = 0
                            dp[new_mask][j] += dp[mask][i]
                            dp[new_mask][j] %= MOD

    return max_length_ways

if __name__ == "__main__":
    import sys
    # input = sys.stdin.read
    data = input().split()
    
    n = int(data[0])
    a = list(map(int, data[1:]))
    
    result = count_maximal_piles(n, a)
    print(result)
