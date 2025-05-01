
---

# **✅ 포트 스캐닝 기법별 패킷 캡처 예시 및 nmap 결과**

---

## **1. TCP Connect Scan (`nmap -sT target.com`)**

### **패킷 흐름**
```
[Attacker] → SYN → [Target]
[Target] → SYN-ACK → [Attacker]
[Attacker] → ACK → [Target]
```

### **nmap 결과 예**
```
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
443/tcp open  https
```

### **Wireshark 캡처**
- **SYN → SYN-ACK → ACK**: 정상적인 3-way handshake 패킷 캡처.

---

## **2. TCP SYN Scan (`nmap -sS target.com`)**

### **패킷 흐름**
```
[Attacker] → SYN → [Target]
[Target] → SYN-ACK → [Attacker]
[Attacker] → RST → [Target]
```

### **nmap 결과 예**
```
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
```

### **Wireshark 캡처**
- **SYN → SYN-ACK → RST**: 연결이 만들어지지 않고, RST 패킷으로 세션 종료.

---

## **3. TCP FIN Scan (`nmap -sF target.com`)**

### **패킷 흐름**
```
[Attacker] → FIN → [Target]
[Target] → (open: no reply / closed: RST)
```

### **nmap 결과 예**
```
PORT    STATE SERVICE
22/tcp  open|filtered  ssh
80/tcp  open|filtered  http
```

### **Wireshark 캡처**
- **FIN 패킷**과 **RST 응답 여부** 확인 가능.

---

## **4. Xmas Scan (`nmap -sX target.com`)**

### **패킷 흐름**
```
[Attacker] → FIN + PSH + URG → [Target]
[Target] → (open: no reply / closed: RST)
```

### **nmap 결과 예**
```
PORT    STATE SERVICE
22/tcp  open|filtered  ssh
```

### **Wireshark 캡처**
- **특이한 플래그 조합**: FIN, PSH, URG 플래그 확인. 응답 여부로 상태 판단.

---

## **5. Null Scan (`nmap -sN target.com`)**

### **패킷 흐름**
```
[Attacker] → [empty TCP packet] → [Target]
[Target] → (open: no reply / closed: RST)
```

### **nmap 결과 예**
```
PORT    STATE SERVICE
22/tcp  open|filtered  ssh
```

### **Wireshark 캡처**
- 플래그 없는 **TCP 패킷**. RST 응답 여부로 상태 판단.

---

## **6. UDP Scan (`nmap -sU target.com`)**

### **패킷 흐름**
```
[Attacker] → UDP packet → [Target]
[Target] → ICMP Port Unreachable (if closed)
```

### **nmap 결과 예**
```
PORT    STATE         SERVICE
53/udp  open         domain
123/udp open         ntp
```

### **Wireshark 캡처**
- **UDP 패킷** 전송 후 ICMP 메시지가 존재하는지 확인.

---

## **7. TCP ACK Scan (`nmap -sA target.com`)**

### **패킷 흐름**
```
[Attacker] → ACK → [Target]
[Target] → RST (if unfiltered) / no reply (if filtered)
```

### **nmap 결과 예**
```
PORT    STATE    SERVICE
22/tcp  unfiltered ssh
80/tcp  unfiltered http
```

### **Wireshark 캡처**
- **ACK → RST** 또는 **무응답**으로 필터링 여부 확인.

---

## **8. TCP Window Scan (`nmap -sW target.com`)**

### **패킷 흐름**
```
[Attacker] → ACK → [Target]
[Target] → RST with window size (used for inference)
```

### **nmap 결과 예**
```
PORT    STATE SERVICE
22/tcp  open  ssh
```

### **Wireshark 캡처**
- **RST 패킷의 window size** 값을 분석하여 포트 상태 추론.

---

## **💥 보너스: 실습 팁**

1. **nmap + Wireshark 동시 사용**
   ```bash
   sudo nmap -sS target.com &
   sudo wireshark
   ```
   - 실시간으로 nmap 스캔 패킷을 분석 가능.

2. **tcpdump로 기록**
   ```bash
   sudo tcpdump -i eth0 -w scan_capture.pcap
   ```
   - nmap 실행 후, `pcap` 파일을 Wireshark로 열어 상세 분석.

---

