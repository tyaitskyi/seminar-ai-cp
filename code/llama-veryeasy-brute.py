def max_algorithms(n, x, a):
    max_count = 0
    for i in range(1 << n):
        count = 0
        time = 0
        for j in range(n):
            if (i & (1 << j)) > 0:
                count += 1
                time += a[j]
        if time <= x and count > max_count:
            max_count = count
    return max_count

n, x = map(int, input().
