def main():
    import sys
    input = sys.stdin.read
    data = input().split()
    
    n = int(data[0])
    t = int(data[1])  # t=1 for this version, handled implicitly
    k = int(data[2])  # since t=1, there's only one k
    
    # Binary search for k-th zero
    left, right = 1, n
    
    while left < right:
        mid = (left + right) // 2
        
        # Query for the number of 1s in the range [left, mid]
        print(f"? {left} {mid}")
        sys.stdout.flush()
        
        num_ones = int(sys.stdin.readline().strip())
        
        # Calculate number of zeros in the range
        num_zeros = (mid - left + 1) - num_ones
        
        if num_zeros >= k:
            right = mid
        else:
            k -= num_zeros  # decrement k by the number of zeros we've bypassed
            left = mid + 1
    
    # Output the position of the k-th zero
    print(f"! {left}")
    sys.stdout.flush()

if __name__ == "__main__":
    main()
