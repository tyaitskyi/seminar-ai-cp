def flush():
    import sys
    sys.stdout.flush()

def query(l, r):
    # Print the query
    print(f"? {l} {r}")
    flush()
    # Read the answer from the input
    resp = int(input().strip())
    if resp == -1:  # If this happens, we must exit
        exit(0)
    return resp

def report_answer(x):
    print(f"! {x}")
    flush()
    exit(0)

def solve():
    # Read n and t (for this easy version, t=1)
    n, t = map(int, input().split())
    # Read the single k
    k = int(input().strip())

    # We'll perform a binary search for the k-th zero
    left, right = 1, n
    while left < right:
        mid = (left + right) // 2
        ones_in_first_mid = query(1, mid)
        zeros_in_first_mid = mid - ones_in_first_mid
        
        if zeros_in_first_mid >= k:
            # k-th zero is in the left half (including mid)
            right = mid
        else:
            # k-th zero is in the right half
            left = mid + 1
    
    # After binary searching, 'left' should be the position of the k-th zero
    report_answer(left)

if __name__ == "__main__":
    solve()
