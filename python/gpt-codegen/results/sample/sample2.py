def congestion_control(ssthresh: int, cwnd: int, segment_size: int, rtt: int):
    alpha = 0.75  # tunable parameter
    beta = 0.25  # tunable parameter
    pi = 3.14159265359  # constant
    new_cwnd = cwnd  # start with current window size
    if cwnd >= ssthresh:  # congestion avoidance phase
        new_cwnd = int(cwnd + (beta * segment_size * cwnd) / (pi * cwnd / segment_size))
    else:  # slow start phase
        new_cwnd = int(cwnd + segment_size)
        if new_cwnd >= ssthresh:
            new_cwnd = ssthresh
    new_ssthresh = int(
        alpha * ssthresh + (1 - alpha) * (cwnd / segment_size)
    )  # update threshold
    return new_cwnd, new_ssthresh
