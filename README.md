# Project_Message

🔒 **Project_Message**: 전자봉투 및 전자서명 기반 웹 편지 교환 시스템

## 주요 기능 (Features)

* 전자봉투(Digital Envelope) 기술 기반의 안전한 메시지 전송 및 프로세싱 처리
* KeyManager 클래스를 활용한 체계적인 암호화 키 생성 및 관리
* AuthService 기반의 사용자 인증 및 세션 보안 로그인/로그아웃 처리
* 사용자별 독립된 웹 작업 공간(Workspace) 및 메시지 열람 기능 제공

## 기술 스택 (Tech Stack)

* Backend Language: Java
* Frontend & Controller: JSP, CSS
* Internal Libraries: Jakarta Servlet JSP JSTL (3.0.0)
* Development Environment: Eclipse (Build Path & Project Settings 완료)

## 커밋 메시지 컨벤션 (Commit Message Convention)

깃허브 저장소의 일관된 히스토리 관리를 위해 아래 규칙에 맞춰 커밋 메시지를 작성합니다. 제목과 본문 사이에는 한 칸의 빈 줄을 둡니다.

### 제목 양식

{이모지} {작업내용}_{작업자}

### 이모지 종류

* ✨ 기능 추가 (Feature) : 새로운 소스 파일 생성, 백엔드 로직 구현, 웹 화면 UI 개발 등 기능적인 변경이 있을 때 사용합니다.
* 🎨 스타일 작업 (Style) : style.css 수정, JSP 파일의 단순 마크업 구조 변경, 인덴트나 포맷팅 등 코드의 의미적 변경 없이 외관만 수정할 때 사용합니다.
* ♻️ 코드 정리 (Refactor) : 기능의 변화는 없으나 가독성 향상, 패키지 구조 개선, 클래스 및 메소드 재구성 등 코드 구조를 리팩토링할 때 사용합니다.
* 🐛 수정 (Fix / Typo) : 버그 해결, 오탈자 수정, 인증 실패 오류나 암호화 로직 내 예외 처리 수정 등 잘못된 부분을 바로잡을 때 사용합니다.
* 📝 기타 (Docs / Chore) : README.md 등 문서 수정, .classpath 나 .project 같은 이클립스 설정 파일 업데이트, 외부 라이브러리(.jar) 추가 및 빌드 설정 변경 시 사용합니다.

### 커밋 예시

* ✨ 로그인 폼 검증 및 processLogin.jsp 기능 구현
* 🐛 KeyManager 내 암호화 키 생성 오류 수정
* 🎨 style.css 내 메인 작업 공간 레이아웃 스타일 수정