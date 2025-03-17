-- 회원 샘플 데이터
INSERT INTO member (username, password, name, email, created_at) VALUES
('admin', 'admin123', '관리자', 'admin@example.com', NOW()),
('hong', 'hong123', '홍길동', 'hong@example.com', NOW()),
('kim', 'kim123', '김철수', 'kim@example.com', NOW()),
('lee', 'lee123', '이영희', 'lee@example.com', NOW()),
('park', 'park123', '박민수', 'park@example.com', NOW());

-- 상품 샘플 데이터
INSERT INTO product (name, price, description, stock, category, image_url, created_at) VALUES
('스마트폰', 1200000, '최신 스마트폰', 10, '전자기기', 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500&h=500&fit=crop', NOW()),
('노트북', 2500000, '고성능 노트북', 5, '전자기기', 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&h=500&fit=crop', NOW()),
('무선이어폰', 220000, '노이즈 캔슬링 기능이 탑재된 프리미엄 무선 이어폰입니다.', 100, '오디오', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&h=500&fit=crop', NOW()),
('스마트워치', 800000, '건강관리 스마트워치', 15, '웨어러블', 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500&h=500&fit=crop', NOW()),
('태블릿PC', 800000, '선명한 디스플레이와 빠른 프로세서를 탑재한 태블릿PC입니다.', 20, '전자기기', 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500&h=500&fit=crop', NOW()),
('블루투스 스피커', 150000, '무선 블루투스 스피커', 20, '오디오', 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500&h=500&fit=crop', NOW()),
('게이밍 마우스', 89000, '정밀한 센서와 인체공학적 디자인의 게이밍 마우스입니다.', 80, '컴퓨터 주변기기', 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500&h=500&fit=crop', NOW()),
('기계식 키보드', 129000, '타이핑 감이 좋은 기계식 키보드입니다.', 40, '컴퓨터 주변기기', 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500&h=500&fit=crop', NOW()),
('이어폰', 300000, '무선 이어폰', 30, '오디오', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&h=500&fit=crop', NOW());

-- 게시판 샘플 데이터
INSERT INTO board (title, content, writer, board_type, view_count, created_at, updated_at) VALUES
('공지사항: 사이트 이용 안내', '안녕하세요. 쇼핑몰을 이용해 주셔서 감사합니다. 이 사이트는 다양한 전자제품을 구매할 수 있는 쇼핑몰입니다.', 'admin', '공지사항', 15, NOW(), NOW()),
('스마트폰 구매 가이드', '최신 스마트폰 구매 시 고려해야 할 사항들을 공유합니다. 카메라 성능, 배터리 용량, 디스플레이 등 주요 스펙을 비교해보세요.', 'hong', '일반', 8, NOW(), NOW()),
('노트북 선택 팁', '노트북을 구매할 때 알아두면 좋은 팁들을 공유합니다. CPU, RAM, 저장장치 등 주요 부품의 특징과 선택 방법을 다룹니다.', 'kim', '일반', 12, NOW(), NOW()),
('이어폰 사용 가이드', '무선 이어폰의 올바른 사용법과 관리 방법에 대해 설명합니다. 배터리 관리와 청소 방법 등을 자세히 알아봅시다.', 'lee', '일반', 5, NOW(), NOW()),
('스마트워치 활용법', '스마트워치의 다양한 기능과 활용 방법을 소개합니다. 건강 관리부터 알림 설정까지 자세히 설명합니다.', 'park', '일반', 20, NOW(), NOW()),
('태블릿PC 활용 가이드', '태블릿PC를 효과적으로 활용하는 방법을 알아봅니다. 업무, 학습, 엔터테인먼트 등 다양한 용도별 활용법을 소개합니다.', 'hong', '일반', 7, NOW(), NOW()),
('블루투스 스피커 비교', '다양한 블루투스 스피커의 특징과 장단점을 비교해봅니다. 음질, 배터리, 연결성 등을 기준으로 분석합니다.', 'kim', '일반', 9, NOW(), NOW()),
('게이밍 기어 선택 가이드', '게이밍 마우스와 키보드 선택 시 고려해야 할 사항들을 소개합니다. 센서, 스위치, 인체공학적 디자인 등을 다룹니다.', 'lee', '일반', 11, NOW(), NOW()),
('전자제품 관리 방법', '전자제품을 오래 사용하기 위한 관리 방법을 알아봅니다. 청소, 보관, 배터리 관리 등 실용적인 팁을 소개합니다.', 'park', '일반', 6, NOW(), NOW()),
('전자제품 구매 시기', '전자제품 구매에 적합한 시기와 가격 변동 패턴에 대해 알아봅니다. 세일 기간과 신제품 출시 시기 등을 설명합니다.', 'admin', '일반', 14, NOW(), NOW()); 