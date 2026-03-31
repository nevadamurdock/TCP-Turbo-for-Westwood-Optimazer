#🚀 TCP Turbo: Westwood+ Optimizer

TCP Turbo is a Magisk/KernelSU module specifically designed to optimize network performance on Android devices. Focusing on the TCP Westwood+ algorithm and the fq_codel scheduler, this module aims to reduce latency (ping) and improve connection stability, especially on wireless networks (Wi-Fi & Mobile Data).

# ✨ Main Features:

- TCP Westwood+: A smarter congestion control algorithm for handling packet loss on wireless connections than Cubic or Reno.

- fq_codel (Fair Queuing Controlled Delay): Minimizes buffer bloat so that heavy activity (such as downloading) doesn't disrupt game or VoIP latency.

- TCP Fast Open (TFO): Speeds up the data handshake process for more responsive loading.

- Low Latency Tweak: Optimizes sysctl parameters to prioritize data packet response speed.

- Systemless: Doesn't directly affect the /system partition, safe for Magisk and KernelSU.
 


# 🛠️ Requirements:

1. The device must be rooted using Magisk or KernelSU.

2. The device kernel must support TCP Westwood (CONFIG_TCP_CONG_WESTWOOD=y).
   Check via Termux: cat /proc/sys/net/ipv4/tcp_available_congestion_control

# 📥 Instalation:

1. Download the .zip file from the Releases folder.

2. Open the Magisk or KernelSU Manager app.

3. Select Install from storage and select the downloaded file.

4. Reboot your device.

🔍 How to Verify:

# Check the active algorithm (Must be present: westwood)
sysctl net.ipv4.tcp_congestion_control

# Check the scheduler (Must be present: fq_codel)
sysctl net.core.default_qdisc


# 📜 Credit & Disclaimer
Author: NevadaMurdock/ GusKernel

Inspiration: Linux Networking Stack & Android Kernel Development.

Note: Any risks (even minor) that occur to your device are the user's responsibility. Use wisely!
