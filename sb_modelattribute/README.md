# ModelAttribute 샘플 프로젝트

이 프로젝트는 스프링부트 2.7과 JDK 11을 사용하여 ModelAttribute를 활용한 다양한 샘플을 제공합니다.

## 기술 스택

- Java 11
- Spring Boot 2.7.14
- MyBatis 2.2.2
- MySQL 8.0
- JSP
- Gradle

## 프로젝트 구조

- `src/main/java/com/example/modelattribute/controller`: 컨트롤러 클래스
- `src/main/java/com/example/modelattribute/dto`: DTO 클래스
- `src/main/java/com/example/modelattribute/mapper`: MyBatis 매퍼 인터페이스
- `src/main/java/com/example/modelattribute/service`: 서비스 인터페이스
- `src/main/java/com/example/modelattribute/service/impl`: 서비스 구현 클래스
- `src/main/resources/mappers`: MyBatis 매퍼 XML 파일
- `src/main/webapp/WEB-INF/views`: JSP 뷰 파일

## ModelAttribute 사용 예제

이 프로젝트는 다음과 같은 ModelAttribute 사용 예제를 포함합니다:

1. 기본적인 폼 데이터 바인딩 (`@ModelAttribute` 어노테이션 사용)
2. 메서드 레벨 `@ModelAttribute` 사용 (모든 요청에 공통 데이터 제공)
3. `@SessionAttributes`와 함께 사용하는 예제 (세션에 모델 속성 저장)

## 데이터베이스 설정

- 데이터베이스: MySQL
- 포트: 3309
- 데이터베이스명: modelattribute_db
- 사용자명: root
- 비밀번호: root

## 샘플 데이터

애플리케이션 실행 시 자동으로 다음과 같은 샘플 데이터가 로드됩니다:

### 회원 데이터
- 관리자 (admin/admin123)
- 홍길동 (hong/hong123)
- 김철수 (kim/kim123)
- 이영희 (lee/lee123)
- 박민수 (park/park123)

### 상품 데이터
- 스마트폰, 노트북, 무선이어폰, 스마트워치 등 8개의 상품

### 게시판 데이터
- 공지사항, 스프링부트 학습 방법, MyBatis 사용 팁 등 10개의 게시글

## 실행 방법

1. MySQL 데이터베이스 생성:
   ```sql
   CREATE DATABASE modelattribute_db;
   ```

2. 프로젝트 빌드:
   ```bash
   ./gradlew build
   ```

3. 애플리케이션 실행:
   ```bash
   ./gradlew bootRun
   ```

4. 웹 브라우저에서 접속:
   - 메인 페이지: http://localhost:8080/
   - 회원 관리: http://localhost:8080/members
   - 상품 관리: http://localhost:8080/products
   - 게시판: http://localhost:8080/boards

## 데이터베이스 초기화

애플리케이션 실행 시 `schema.sql`과 `data.sql` 파일을 통해 데이터베이스 테이블이 생성되고 샘플 데이터가 자동으로 로드됩니다. 이 기능은 `application.properties` 파일의 다음 설정을 통해 활성화됩니다:

```properties
spring.sql.init.mode=always
spring.sql.init.schema-locations=classpath:schema.sql
spring.sql.init.data-locations=classpath:data.sql
```

데이터베이스 초기화를 비활성화하려면 `application.properties` 파일에서 `spring.sql.init.mode=never`로 설정하세요.

## MyBatis 사용

이 프로젝트는 데이터 액세스 계층으로 MyBatis를 사용합니다. MyBatis는 SQL 매핑 프레임워크로, 자바 객체와 SQL 문 사이의 매핑을 쉽게 할 수 있도록 도와줍니다.

### MyBatis 구성 요소

1. **매퍼 인터페이스**: `src/main/java/com/example/modelattribute/mapper` 디렉토리에 위치한 인터페이스로, 데이터베이스 작업을 정의합니다.
2. **매퍼 XML 파일**: `src/main/resources/mappers` 디렉토리에 위치한 XML 파일로, SQL 쿼리를 정의합니다.
3. **MyBatis 설정**: `application.properties` 파일에서 다음과 같이 설정됩니다:
   ```properties
   mybatis.mapper-locations=classpath:mappers/**/*.xml
   mybatis.type-aliases-package=com.example.modelattribute.dto
   mybatis.configuration.map-underscore-to-camel-case=true
   ```

### 주요 기능

- **동적 SQL**: 조건에 따라 SQL 쿼리를 동적으로 생성할 수 있습니다.
- **결과 매핑**: 쿼리 결과를 자바 객체로 자동 매핑합니다.
- **배치 처리**: 여러 SQL 문을 배치로 실행할 수 있습니다. 