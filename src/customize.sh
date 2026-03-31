#!/system/bin/sh

ui_print "--------------------------------------"
ui_print "    TCP Turbo: Westwood Optimizer     "
ui_print "--------------------------------------"

# Check Westwood availability
ui_print "- Checking kernel support..."
if grep -q "westwood" /proc/sys/net/ipv4/tcp_available_congestion_control; then
    ui_print "[+] Kernel supports Westwood. Nice!"
else
    ui_print "[!] Warning: Westwood not found in kernel."
    ui_print "    Make sure CONFIG_TCP_CONG_WESTWOOD is active."
fi

# Check fq_codel
if [ -d "/sys/class/net/eth0/queues" ] || [ -d "/sys/class/net/wlan0/queues" ]; then
    ui_print "[+] Network queues detected."
fi

ui_print "- Setting script permissions..."
set_perm $MODPATH/service.sh 0 0 0755
ui_print "- Installation complete. Please reboot."
