def max_algorithms(n, x, a):
    a.sort()
    count = 0
    for ai in a:
        if ai <= x:
            x -= ai
            count += 1
        else:
            break
    return count

n, x = map(int, input().split())
a = list(map(int, input().split()))
print(max_algorithms(n, x, a))
