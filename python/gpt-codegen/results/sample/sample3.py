def congestion_control(ssthresh: int, cwnd: int, segment_size: int, rtt: int):
    alpha = 0.9  # tunable parameter
    beta = 0.4  # tunable parameter
    gamma = 0.25  # tunable parameter
    min_cwnd = 2  # minimum window size allowed
    new_cwnd = cwnd  # start with current window size
    if cwnd >= ssthresh:  # congestion avoidance phase
        new_cwnd = max(
            int(cwnd + (beta * segment_size * cwnd) / (rtt / gamma)), min_cwnd
        )
    else:  # slow start phase
        new_cwnd = int(cwnd + segment_size)
        if new_cwnd >= ssthresh:
            new_cwnd = ssthresh
    new_ssthresh = int(
        alpha * ssthresh + (1 - alpha) * (cwnd / segment_size)
    )  # update threshold
    return new_cwnd, new_ssthresh
