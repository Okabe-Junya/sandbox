def congestion_control(ssthresh: int, cwnd: int, segment_size: int, rtt: int):
    new_cwnd = cwnd + segment_size
    new_ssthresh = ssthresh + rtt
    return new_cwnd, new_ssthresh
