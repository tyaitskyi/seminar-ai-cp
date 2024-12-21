def main():
    import sys
    input = sys.stdin.read

    # Read initial inputs
    data = input().strip().split()
    n = int(data[0])
    t = int(data[1])  # t is always 1 in this easy version

    # Iterate over each request for k
    for i in range(t):
        k = int(data[2 + i])

        # Brute force to find the kth zero
        zero_count = 0
        for pos in range(1, n + 1):
            # Query the same position to check if it's a zero or one
            print(f"? {pos} {pos}")
            sys.stdout.flush()

            num_ones = int(sys.stdin.readline().strip())

            # Check if the position is zero
            if num_ones == 0:
                zero_count += 1
            
            # When the kth zero is found
            if zero_count == k:
                print(f"! {pos}")
                sys.stdout.flush()
                break

if __name__ == "__main__":
    main()
