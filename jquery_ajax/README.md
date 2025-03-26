# jQuery 기초 학습 데모

jQuery의 기본적인 기능들을 시각적으로 학습할 수 있는 데모 프로젝트입니다.

## 주요 기능

### 1. 요소 선택과 조작
- 보이기/숨기기: 요소를 슬라이드 효과와 함께 토글
- 색상 변경: 랜덤한 색상으로 배경색 변경
- 텍스트 추가: 기존 텍스트에 새로운 텍스트 추가

### 2. 애니메이션 효과
- 페이드 인/아웃: 요소를 부드럽게 나타내고 사라지게 함
- 슬라이드 토글: 요소를 위아래로 슬라이드
- 커스텀 애니메이션: 요소의 크기와 모양을 순차적으로 변경

### 3. 이벤트 처리
- 마우스 이벤트: 마우스 위치에 따른 좌표 표시
- 키보드 이벤트: 입력된 키를 실시간으로 표시

### 4. AJAX 요청
- JSON Server에서 데이터를 가져와 표시
- 로딩 상태와 에러 처리 포함

## 설치 및 실행 방법

1. 프로젝트 파일 다운로드
   - `jquery_basic.html`
   - `jquery_style.css`
   - `jquery_script.js`

2. JSON Server 설치 (AJAX 기능 사용을 위해)
   ```bash
   npm install -g json-server
   ```

3. JSON Server 실행
   ```bash
   json-server --watch db.json --port 3000
   ```

4. 웹 브라우저에서 `jquery_basic.html` 파일 열기

## 파일 구조

```
project/
├── jquery_basic.html    # 메인 HTML 파일
├── jquery_style.css     # 스타일시트
├── jquery_script.js     # jQuery 스크립트
└── db.json             # JSON Server 데이터 파일
```

## 기술 스택

- HTML5
- CSS3
- jQuery 3.6.0
- JSON Server

## 주의사항

- AJAX 기능을 사용하기 위해서는 JSON Server가 실행 중이어야 합니다.
- CORS 이슈를 방지하기 위해 JSON Server를 사용합니다.
- 모든 기능은 최신 웹 브라우저에서 테스트되었습니다.

## 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다. 