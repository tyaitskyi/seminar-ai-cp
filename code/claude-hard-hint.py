import math
import functools

def count_divisors(n):
    divisors = 0
    for i in range(1, int(math.sqrt(n)) + 1):
        if n % i == 0:
            divisors += 2 if i != n // i else 1
    return divisors

def get_factors(n):
    factors = set()
    for i in range(1, int(math.sqrt(n)) + 1):
        if n % i == 0:
            factors.add(i)
            factors.add(n // i)
    return factors

def solve():
    n = int(input())
    nums = list(map(int, input().split()))

    max_count = 0
    count_divisors_list = [count_divisors(num) for num in nums]
    max_count = max(count_divisors_list)

    max_indices = [i for i, count in enumerate(count_divisors_list) if count == max_count]
    result = 1

    for idx in max_indices:
        factors = get_factors(nums[idx])
        factor_counts = [count_divisors_list[nums.index(factor)] for factor in factors if factor != nums[idx]]

        result = (result * functools.reduce(lambda x, y: x * y, factor_counts, 1)) % (10**9 + 7)

    return result

print(solve())
