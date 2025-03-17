<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전자제품 쇼핑몰</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            text-align: center;
            padding: 60px 20px;
            margin-bottom: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }
        
        .subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 30px;
        }
        
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 350px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        
        .card-header {
            padding: 20px;
            background-color: #4e73df;
            color: white;
            font-size: 1.5rem;
            font-weight: 500;
        }
        
        .card-body {
            padding: 20px;
        }
        
        .card-text {
            margin-bottom: 20px;
            color: #666;
        }
        
        .btn {
            display: inline-block;
            background-color: #4e73df;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        
        .btn:hover {
            background-color: #2e59d9;
        }
        
        .member-card .card-header {
            background-color: #36b9cc;
        }
        
        .member-card .btn {
            background-color: #36b9cc;
        }
        
        .member-card .btn:hover {
            background-color: #2c9faf;
        }
        
        .product-card .card-header {
            background-color: #1cc88a;
        }
        
        .product-card .btn {
            background-color: #1cc88a;
        }
        
        .product-card .btn:hover {
            background-color: #169a6b;
        }
        
        .board-card .card-header {
            background-color: #f6c23e;
        }
        
        .board-card .btn {
            background-color: #f6c23e;
        }
        
        .board-card .btn:hover {
            background-color: #dda20a;
        }
        
        .features {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 40px;
        }
        
        .features h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4e73df;
        }
        
        .feature-list {
            list-style-type: none;
        }
        
        .feature-list li {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        
        .feature-list li:last-child {
            border-bottom: none;
        }
        
        .feature-list li::before {
            content: "✓";
            color: #1cc88a;
            font-weight: bold;
            margin-right: 10px;
        }
        
        .sample-data {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 40px;
        }
        
        .sample-data h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4e73df;
        }
        
        .sample-data-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .sample-data-section {
            padding: 20px;
            border-radius: 8px;
            background-color: #f8f9fa;
        }
        
        .sample-data-section h3 {
            margin-bottom: 15px;
            color: #4e73df;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
        }
        
        .sample-data-section h3 i {
            margin-right: 10px;
        }
        
        .sample-data-list {
            list-style-type: none;
        }
        
        .sample-data-list li {
            padding: 8px 0;
            border-bottom: 1px dashed #e0e0e0;
            display: flex;
            align-items: center;
        }
        
        .sample-data-list li:last-child {
            border-bottom: none;
        }
        
        .sample-data-list li i {
            margin-right: 10px;
            color: #1cc88a;
        }
        
        .member-section h3 {
            color: #36b9cc;
        }
        
        .product-section h3 {
            color: #1cc88a;
        }
        
        .board-section h3 {
            color: #f6c23e;
        }
        
        footer {
            text-align: center;
            padding: 20px;
            color: #666;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>전자제품 쇼핑몰</h1>
            <p class="subtitle">최신 전자제품을 합리적인 가격에 만나보세요</p>
        </header>
        
        <div class="card-container">
            <div class="card member-card">
                <div class="card-header">
                    <i class="fas fa-users"></i> 회원 관리
                </div>
                <div class="card-body">
                    <p class="card-text">회원 정보를 관리하고 회원 등급을 설정할 수 있습니다.</p>
                    <a href="/members" class="btn">회원 관리 바로가기</a>
                </div>
            </div>
            
            <div class="card product-card">
                <div class="card-header">
                    <i class="fas fa-box"></i> 상품 관리
                </div>
                <div class="card-body">
                    <p class="card-text">상품 등록, 수정, 삭제 및 재고 관리를 할 수 있습니다.</p>
                    <a href="/products" class="btn">상품 관리 바로가기</a>
                </div>
            </div>
            
            <div class="card board-card">
                <div class="card-header">
                    <i class="fas fa-clipboard-list"></i> 게시판
                </div>
                <div class="card-body">
                    <p class="card-text">공지사항과 상품 관련 정보를 공유할 수 있습니다.</p>
                    <a href="/boards" class="btn">게시판 바로가기</a>
                </div>
            </div>
        </div>
        
        <div class="features">
            <h2>주요 기능</h2>
            <ul class="feature-list">
                <li>다양한 전자제품 카테고리 제공</li>
                <li>실시간 재고 관리 시스템</li>
                <li>회원별 맞춤 상품 추천</li>
                <li>상품 구매 가이드 제공</li>
                <li>전문가의 상품 리뷰</li>
                <li>안전한 결제 시스템</li>
                <li>빠른 배송 서비스</li>
                <li>친절한 고객 상담</li>
            </ul>
        </div>
        
        <div class="sample-data">
            <h2>현재 등록된 정보</h2>
            <div class="sample-data-grid">
                <div class="sample-data-section member-section">
                    <h3><i class="fas fa-users"></i> 회원 정보</h3>
                    <ul class="sample-data-list">
                        <li><i class="fas fa-user"></i> 총 ${fn:length(members)}명의 회원</li>
                        <li><i class="fas fa-user-shield"></i> 관리자 계정 포함</li>
                        <li><i class="fas fa-user-check"></i> 활성 회원 관리</li>
                    </ul>
                </div>
                
                <div class="sample-data-section product-section">
                    <h3><i class="fas fa-box"></i> 상품 정보</h3>
                    <ul class="sample-data-list">
                        <li><i class="fas fa-box"></i> 총 ${fn:length(products)}개의 상품</li>
                        <li><i class="fas fa-tags"></i> 다양한 카테고리</li>
                        <li><i class="fas fa-warehouse"></i> 실시간 재고 관리</li>
                    </ul>
                </div>
                
                <div class="sample-data-section board-section">
                    <h3><i class="fas fa-clipboard-list"></i> 게시판 정보</h3>
                    <ul class="sample-data-list">
                        <li><i class="fas fa-file-alt"></i> 총 ${fn:length(boards)}개의 게시글</li>
                        <li><i class="fas fa-bullhorn"></i> 공지사항 포함</li>
                        <li><i class="fas fa-comments"></i> 상품 관련 정보</li>
                    </ul>
                </div>
            </div>
        </div>
        
        <footer>
            <p>© 2025 전자제품 쇼핑몰. All rights reserved.</p>
        </footer>
    </div>
    
    <script src="https://kit.fontawesome.com/your-font-awesome-kit.js"></script>
</body>
</html> 