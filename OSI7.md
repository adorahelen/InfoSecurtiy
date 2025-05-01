


# **📊 OSI 7계층별 리눅스 명령어 정리 및 실습 예제**

| **OSI 계층**       | **역할 설명**                             | **대표 리눅스 명령어**                                       |
|-------------------|---------------------------------------|-------------------------------------------------------|
| **7. 응용 계층**    | 사용자 앱, 네트워크 서비스                       | `curl`, `wget`, `ftp`, `ssh`, `telnet`, `dig`, `nslookup` |
| **6. 표현 계층**    | 데이터 변환, 암호화, 인코딩                       | `openssl`                                              |
| **5. 세션 계층**    | 연결 세션 관리 (로그인, 세션 복구)                | `ssh`, `screen`, `tmux`, `telnet`                     |
| **4. 전송 계층**    | 신뢰성 있는 전송, 포트 관리                       | `ss`, `netstat`, `nmap`, `hping3`, `iptables` (포트 차단) |
| **3. 네트워크 계층** | 라우팅, IP 주소, 경로 결정                       | `ping`, `traceroute`, `mtr`, `ip route`, `tcpdump`       |
| **2. 데이터링크 계층** | MAC 주소, ARP, 프레임 전송                      | `ip link`, `ifconfig`, `arp`, `ethtool`, `brctl`         |
| **1. 물리 계층**    | 전기 신호, 케이블, NIC 상태                       | `ethtool`, `mii-tool`, `lspci`, `dmesg`                |

---

## **🛠️ 명령어 간단 설명 및 실습 예제**

### **✅ 7. 응용 계층**
- **HTTP 요청**:
  ```bash
  curl http://example.com
  wget http://example.com/index.html
  ```
- **원격 접속 및 파일 전송**:
  ```bash
  ssh user@host
  ftp host
  telnet host 80
  ```
- **DNS 조회**:
  ```bash
  dig example.com
  nslookup example.com
  ```

---

### **✅ 6. 표현 계층**
- **암호화 및 복호화, SSL 테스트**:
  ```bash
  openssl enc -aes-256-cbc -in file.txt -out file.enc
  openssl s_client -connect example.com:443
  ```

---

### **✅ 5. 세션 계층**
- **세션 유지 및 멀티창 관리**:
  ```bash
  ssh user@host
  screen
  tmux
  ```

---

### **✅ 4. 전송 계층**
- **소켓 상태 확인**:
  ```bash
  ss -tulnp
  netstat -anp
  ```
- **포트 스캔**:
  ```bash
  nmap -p 1-65535 target
  ```
- **TCP/UDP/ICMP 테스트**:
  ```bash
  hping3 -S -p 80 target
  ```
- **포트 차단**:
  ```bash
  iptables -A INPUT -p tcp --dport 22 -j DROP
  ```

---

### **✅ 3. 네트워크 계층**
- **네트워크 진단**:
  ```bash
  ping 8.8.8.8
  traceroute google.com
  mtr google.com
  ```
- **라우팅 테이블 확인**:
  ```bash
  ip route show
  ```
- **네트워크 패킷 캡처**:
  ```bash
  tcpdump icmp
  ```

---

### **✅ 2. 데이터링크 계층**
- **인터페이스 상태 확인**:
  ```bash
  ip link show
  ifconfig -a
  ```
- **ARP 테이블 확인**:
  ```bash
  arp -n
  ```
- **NIC 상태 확인**:
  ```bash
  ethtool eth0
  ```
- **브리지 관리**:
  ```bash
  brctl show
  ```
- **링크 계층 패킷 캡처**:
  ```bash
  tcpdump ether
  ```

---

### **✅ 1. 물리 계층**
- **링크 상태 확인**:
  ```bash
  ethtool eth0
  mii-tool eth0
  ```
- **NIC 장치 정보 확인**:
  ```bash
  lspci | grep Ethernet
  ```
- **디바이스 메시 로그 확인**:
  ```bash
  dmesg | grep eth
  ```

---

## **🌟 추가 팁**
- **tcpdump 계층별 필터링**:
  ```bash
  tcpdump icmp
  tcpdump ether
  ```
- **운영체제 탐지**:
  ```bash
  nmap -O target
  ```
- **열려 있는 포트 및 실행 중인 프로그램 확인**:
  ```bash
  ss -tulnp
  ```

---

