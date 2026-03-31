#!/system/bin/sh
# Wait until booting is complete
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 10
done

# --- TCP CONGESTION CONTROL ---
# Enable Westwood as the default algorithm
if grep -q "westwood" /proc/sys/net/ipv4/tcp_available_congestion_control; then
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
fi

# --- QUEUE MANAGEMENT (Anti Bufferbloat) ---
# Using a very stable fq_codel for Wi-Fi/Mobile Data
sysctl -w net.core.default_qdisc=fq_codel

# --- LATENCY & RESPONSIVENESS TWEAKS ---
# Force the system to prioritize low latency
sysctl -w net.ipv4.tcp_low_latency=1

# Enable Fast Open to speed up repeated requests
sysctl -w net.ipv4.tcp_fastopen=3

# Prevent TCP from storing old connection metrics (to keep them fresh)
sysctl -w net.ipv4.tcp_no_metrics_save=1

# Disable Autocorking to reduce delay on small packets
sysctl -w net.ipv4.tcp_autocorking=0

# --- NETWORK BUFFER OPTIMIZATION ---
# Adjusted the buffer so that it is not too large (prevents lag) but is sufficient for high speeds
sysctl -w net.core.rmem_max=8388608
sysctl -w net.core.wmem_max=8388608
sysctl -w net.ipv4.tcp_rmem="4096 87380 8388608"
sysctl -w net.ipv4.tcp_wmem="4096 65536 8388608"

# --- ECN (Explicit Congestion Notification) ---
# Helps prevent packet loss when the network is congested
sysctl -w net.ipv4.tcp_ecn=1

# --- KEEPALIVE TUNING ---
# Closes unused connections more quickly to free up resources
sysctl -w net.ipv4.tcp_keepalive_time=600
sysctl -w net.ipv4.tcp_fin_timeout=15