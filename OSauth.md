# Window
```
[사용자 입력]
   ↓
[Winlogon.exe]
   ↓
[GINA.dll (Windows XP 이하) or LogonUI.exe + Credential Provider (Vista 이후)]
   ↓
[LSASS (Local Security Authority Subsystem Service)]
   ↓
[Authentication Packages (e.g., MSV1_0 for local, Kerberos for domain)]
   ↓
[Security Accounts Manager (SAM) or Active Directory]
   ↓
[Access Token 생성]
   ↓
[사용자 세션 시작]
```

```
각 단계 설명:
	1.	사용자 입력: 사용자 ID와 패스워드를 입력
	2.	Winlogon.exe: 로그인 프로세스를 담당
	3.	Credential Provider / GINA: 사용자 인증 UI와 인증 데이터 수집
	4.	LSASS: 인증 보안 주체로서 핵심 역할을 수행하는 프로세스
	5.	Authentication Package:
    * MSV1_0: 로컬 계정 인증
    * Kerberos: 도메인 계정 인증
	6.	SAM / Active Directory:
    * SAM: 로컬 계정 정보 저장소
    * AD: 도메인 계정 정보 저장소
	7.	Access Token 생성: 권한 정보 포함된 토큰 생성 → 사용자 세션에 사용
```

# Linux
```
[사용자 입력]
   ↓
[login / gdm / sshd 등]
   ↓
[PAM (Pluggable Authentication Modules)]
   ↓
[모듈 순서대로 처리: pam_unix.so, pam_tally2.so 등]
   ↓
[/etc/passwd / /etc/shadow or LDAP]
   ↓
[인증 결과 반환 → 셸 실행 or 세션 시작]
```

```
각 단계 설명:
	1.	사용자 입력: 콘솔, SSH, GUI에서 로그인 시도
	2.	login / gdm / sshd: 로그인 프로그램이 사용자 입력 수집
	3.	PAM: 인증 모듈 프레임워크 (다양한 방식 조합 가능)
	4.	모듈 처리:
    * pam_unix.so: /etc/passwd, /etc/shadow 확인
  	* pam_tally2.so: 로그인 시도 횟수 체크
  	* pam_ldap.so: LDAP 기반 인증
	5.	결과 반환:
    * 인증 성공 시: 셸 실행 (bash, zsh 등)
    * 실패 시: 에러 반환
```
