# Read input
N, X = map(int, input().split())
algorithms = list(map(int, input().split()))

# Function to generate all possible combinations
def generate_combinations(n):
    if n == 0:
        return [[]]
    
    smaller_combinations = generate_combinations(n - 1)
    return smaller_combinations + [combo + [1] for combo in smaller_combinations]

# Generate all possible combinations
all_combinations = generate_combinations(N)

max_algorithms = 0

# Check each combination
for combination in all_combinations:
    total_time = 0
    count = 0
    
    for i in range(N):
        if combination[i] == 1:
            total_time += algorithms[i]
            count += 1
    
    # Update max_algorithms if this combination is valid and better
    if total_time <= X and count > max_algorithms:
        max_algorithms = count

# Print the result
print(max_algorithms)
