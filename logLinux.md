# 리눅스 로그파일 
```
⸻

- 리눅스 주요 로그 파일 목록 및 의미

로그파일	주요 내용	약어 의미 / 유래
/var/log/messages	시스템 전체 메시지, 커널 로그, 일부 서비스 메시지	“messages” = 일반 메시지
/var/log/syslog	(Debian 계열) 시스템 메시지. 부팅, 네트워크 등 포함	“system log”
/var/log/auth.log	인증 관련 로그 (로그인, sudo, ssh 등)	“auth” = authentication
/var/log/secure	(RHEL 계열) 인증 관련 로그	“secure” = 보안 인증 관련
/var/log/kern.log	커널 메시지	“kern” = kernel
/var/log/boot.log	부팅 중 발생한 메시지	“boot”
/var/log/dmesg	커널이 부팅 시 출력한 메시지 (하드웨어 인식 등)	“dmesg” = display message
/var/log/faillog	로그인 실패 기록	“fail log”
/var/log/lastlog	마지막 로그인 정보 기록	“last log”
/var/log/btmp	잘못된 로그인 시도 (binary 포맷)	“bad tmp log”
/var/log/wtmp	로그인/로그아웃 기록 (binary 포맷)	“who tmp log”
/var/log/utmp	현재 로그인한 사용자 정보	“user tmp log”
/var/log/cron	크론 작업 실행 기록	“cron”
/var/log/httpd/access_log	Apache 웹 서버 접근 로그	“access_log” = 접근 기록
/var/log/httpd/error_log	Apache 에러 로그	“error_log”
/var/log/maillog or /var/log/mail.log	메일 서비스 관련 로그	“mail log”

⸻

약자	의미
auth	Authentication (인증)
kern	Kernel
cron	Cron Daemon
syslog	System Logging
wtmp	Who temporary (로그인 정보 저장)
btmp	Bad temporary (실패한 로그인)
utmp	User temporary (현재 로그인 사용자)
maillog	Mail 로그
dmesg	Display message (부팅/커널 메시지 표시)

	•	tmp는 임시 데이터 저장이 아니라, system accounting에서 사용하던 관례적인 명칭
	•	wtmp, btmp, utmp 모두 전통적인 UNIX 시스템에서 이어진 이름

⸻

```
