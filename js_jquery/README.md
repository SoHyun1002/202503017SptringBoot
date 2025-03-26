# CRUD 게시판 애플리케이션

이 프로젝트는 json-server를 사용한 간단한 CRUD(Create, Read, Update, Delete) 게시판 애플리케이션입니다.

## 기능

- 게시글 목록 보기
- 새 게시글 작성
- 기존 게시글 수정
- 게시글 삭제

## 기술 스택

- HTML5
- CSS3
- JavaScript (Vanilla)
- Bootstrap 5
- json-server
- live-server

## 설치 방법

1. 프로젝트 클론 또는 다운로드

2. 필요한 패키지 설치
```bash
npm install
```

## 실행 방법

1. json-server 실행 (첫 번째 터미널)
```bash
npm start
```
- 3000번 포트에서 API 서버 실행
- `db.json` 파일을 기반으로 데이터 관리

2. live-server 실행 (두 번째 터미널)
```bash
npm run dev
```
- 5500번 포트에서 웹 서버 실행
- 자동으로 브라우저가 열림

3. 브라우저에서 확인
- 자동으로 열리지 않는 경우 `http://localhost:5500` 접속

## 서버 종료 방법

각 터미널에서 `Ctrl + C`를 눌러 서버를 종료할 수 있습니다.

## 프로젝트 구조

```
├── index.html          # 메인 HTML 파일
├── style.css          # 스타일시트
├── script.js          # JavaScript 코드
├── db.json           # json-server 데이터 파일
└── package.json      # 프로젝트 설정 및 의존성
```

## API 엔드포인트

- GET /posts - 모든 게시글 조회
- POST /posts - 새 게시글 작성
- PUT /posts/:id - 게시글 수정
- DELETE /posts/:id - 게시글 삭제

## 주의사항

- json-server와 live-server가 모두 실행 중이어야 정상적으로 작동합니다.
- json-server는 3000번 포트를, live-server는 5500번 포트를 사용합니다.
- 데이터는 `db.json` 파일에 저장됩니다. 