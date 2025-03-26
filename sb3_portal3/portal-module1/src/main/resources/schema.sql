-- 테이블 삭제
DROP TABLE IF EXISTS members;

-- 회원 테이블 생성
CREATE TABLE members (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,  -- BCrypt 암호화된 비밀번호를 저장하기 위해 길이 증가
    email VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL
); 