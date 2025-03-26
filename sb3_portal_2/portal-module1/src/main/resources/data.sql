-- 테스트 사용자 데이터 (비밀번호는 BCrypt로 암호화된 값)
INSERT INTO members (username, password, email, name, created_at) VALUES
('admin', '$2a$10$qrlXzu7CaQ1qhLt60fzwQu2.XmROFmoBPK9prgmgh1hOFlYpmrex.', 'admin@example.com', '관리자', NOW()),
('user1', '$2a$10$87ztmHpeHd4o3G1w82C6dup4w0Mku4sCRYbEN./uQjtXpsI7dL2OW', 'user1@example.com', '홍길동', NOW()),
('user2', '$2a$10$87ztmHpeHd4o3G1w82C6dup4w0Mku4sCRYbEN./uQjtXpsI7dL2OW', 'user2@example.com', '김철수', NOW());