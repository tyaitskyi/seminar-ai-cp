# Read input
N, X = map(int, input().split())
algorithms = list(map(int, input().split()))

# Sort the algorithms based on time required (ascending order)
algorithms.sort()

count = 0
total_time = 0

# Iterate through sorted algorithms
for time in algorithms:
    if total_time + time <= X:
        total_time += time
        count += 1
    else:
        break  # Stop if adding next algorithm exceeds time limit

# Print the result
print(count)
