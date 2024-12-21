def count_maximal_piles(n, a):
    MOD = 10**9 + 7

    # Precompute divisibility
    divides = [[] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if i != j and a[j] % a[i] == 0:
                divides[i].append(j)

    # Function to use backtracking to find all piles starting with a certain top
    def backtrack(curr, visited, max_len):
        if len(curr) == max_len:
            return {tuple(curr)}
        if len(curr) > max_len:
            return set()
        
        piles = set()
        for j in divides[curr[-1]]:
            if j not in visited:
                visited.add(j)
                curr.append(j)
                piles.update(backtrack(curr, visited, max_len))
                curr.pop()
                visited.remove(j)
        return piles

    max_length = 0
    global_piles = set()

    # Try each starting position
    for start in range(n):
        initial_piles = set()
        for first_choice in divides[start]:
            initial_piles.update(backtrack([start, first_choice], {start, first_choice}, n))
        
        for p in initial_piles:
            if len(p) > max_length:
                max_length = len(p)
                global_piles = {p}
            elif len(p) == max_length:
                global_piles.add(p)

    return len(global_piles) % MOD

if __name__ == "__main__":
    import sys
    input = sys.stdin.read
    data = input().split()
    
    n = int(data[0])
    a = list(map(int, data[1:]))
    
    result = count_maximal_piles(n, a)
    print(result)
