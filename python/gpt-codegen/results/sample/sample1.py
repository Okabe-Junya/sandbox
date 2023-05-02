def congestion_control(ssthresh: int, cwnd: int, segment_size: int, rtt: int):
    alpha = 0.8  # tunable parameter
    new_cwnd = cwnd  # start with current window size
    if cwnd >= ssthresh:  # congestion avoidance phase
        new_cwnd = int(cwnd + segment_size * (segment_size / cwnd))
    else:  # slow start phase
        new_cwnd = int(cwnd + segment_size)
        if new_cwnd >= ssthresh:
            new_cwnd = ssthresh
    new_ssthresh = int(
        ssthresh * alpha + (1 - alpha) * (cwnd / segment_size)
    )  # update threshold
    return new_cwnd, new_ssthresh
