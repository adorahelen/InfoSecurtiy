#!/bin/bash

# 0. 인자 체크 및 입력 받기
if [ -n "$1" ]; then
    TARGET_INPUT="$1"
else
    read -p "Enter the target domain (without http:// or www.): " TARGET_INPUT
fi

# 0-1. 입력값 정제
TARGET=$(echo "$TARGET_INPUT" | sed -e 's#^https\?://##' -e 's#^www\.##')

# 1. 날짜 및 로그 폴더 생성
DATE=$(date +"%Y%m%d_%H%M%S")
LOGDIR="./diagnose_${TARGET}_$DATE"
mkdir -p "$LOGDIR"

echo "[+] Target: $TARGET"
echo "[+] Logging to directory: $LOGDIR"

# 2. 기본 네트워크 진단
echo "[*] Running dig..."
dig $TARGET > "$LOGDIR/dig.txt"

echo "[*] Running traceroute..."
traceroute $TARGET > "$LOGDIR/traceroute.txt"

echo "[*] Running ping..."
ping -c 4 $TARGET > "$LOGDIR/ping.txt"

echo "[*] Running curl with redirection (-L)..."
curl -L -i $TARGET > "$LOGDIR/curl.txt"

echo "[*] Running nmap..."
nmap -A -Pn $TARGET > "$LOGDIR/nmap.txt"

echo "[*] Running netstat..."
netstat -tnp > "$LOGDIR/netstat.txt"

echo "[*] Checking SSL certificate with openssl..."
echo | openssl s_client -connect $TARGET:443 > "$LOGDIR/openssl_cert.txt" 2>/dev/null

# 3. tcpdump 캡처 (10초, 루트 권한 필요)
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] tcpdump requires root privileges, skipping packet capture."
else
    echo "[*] Capturing packets to/from $TARGET for 10 seconds..."
    timeout 10 tcpdump -i any host $TARGET -w "$LOGDIR/tcpdump.pcap"
fi

echo "[✓] Diagnostics completed. Results saved in $LOGDIR"
