<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 날짜 포맷팅을 위한 커스텀 함수 --%>
<%!
    public String formatLocalDateTime(java.time.LocalDateTime dateTime, String pattern) {
        if (dateTime == null) {
            return "-";
        }
        return dateTime.format(java.time.format.DateTimeFormatter.ofPattern(pattern));
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .header h1 {
            color: #1cc88a;
            font-size: 2rem;
        }
        
        .nav-links {
            display: flex;
            gap: 15px;
        }
        
        .nav-link {
            color: #555;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-link:hover {
            color: #1cc88a;
        }
        
        .message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            border-left: 5px solid #28a745;
            animation: fadeOut 5s forwards;
        }
        
        @keyframes fadeOut {
            0% { opacity: 1; }
            70% { opacity: 1; }
            100% { opacity: 0; }
        }
        
        .product-detail {
            display: flex;
            gap: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .product-image {
            flex: 0 0 300px;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow: hidden;
            border-radius: 5px;
        }
        
        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 5px;
        }
        
        .product-image i {
            color: #adb5bd;
            font-size: 5rem;
        }
        
        .product-info {
            flex: 1;
            padding: 30px;
        }
        
        .product-header {
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .product-name {
            font-size: 1.8rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }
        
        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1cc88a;
            margin-bottom: 10px;
        }
        
        .product-stock {
            display: inline-block;
            background-color: #e8f5e9;
            color: #1cc88a;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        .product-description {
            margin-bottom: 30px;
            color: #555;
            line-height: 1.8;
        }
        
        .product-meta {
            margin-bottom: 30px;
        }
        
        .meta-item {
            display: flex;
            margin-bottom: 10px;
        }
        
        .meta-label {
            flex: 0 0 100px;
            font-weight: 500;
            color: #555;
        }
        
        .meta-value {
            color: #333;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            font-size: 1rem;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .btn-primary {
            background-color: #1cc88a;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #169a6b;
        }
        
        .btn-warning {
            background-color: #f6c23e;
            color: white;
        }
        
        .btn-warning:hover {
            background-color: #dda20a;
        }
        
        .btn-danger {
            background-color: #e74a3b;
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #d52a1a;
        }
        
        .buttons {
            display: flex;
            gap: 10px;
        }
        
        .delete-form {
            display: inline;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>상품 상세 정보</h1>
            <div class="nav-links">
                <a href="/" class="nav-link"><i class="fas fa-home"></i> 홈</a>
                <a href="/products" class="nav-link"><i class="fas fa-box"></i> 상품 목록</a>
                <a href="/members" class="nav-link"><i class="fas fa-users"></i> 회원 관리</a>
                <a href="/boards" class="nav-link"><i class="fas fa-clipboard-list"></i> 게시판</a>
            </div>
        </div>
        
        <c:if test="${not empty message}">
            <div class="message">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>
        
        <div class="product-detail">
            <div class="product-image">
                <c:choose>
                    <c:when test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" alt="${product.name}" onerror="this.src='https://via.placeholder.com/300x300?text=No+Image'">
                    </c:when>
                    <c:otherwise>
                        <i class="fas fa-box"></i>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="product-info">
                <div class="product-header">
                    <div class="product-name">${product.name}</div>
                    <div class="product-price">
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩" />
                    </div>
                    <div class="product-stock">
                        <i class="fas fa-cubes"></i> 재고: ${product.stock}개
                    </div>
                </div>
                
                <div class="product-description">
                    ${product.description}
                </div>
                
                <div class="product-meta">
                    <div class="meta-item">
                        <div class="meta-label">카테고리</div>
                        <div class="meta-value">${product.category != null ? product.category : '일반'}</div>
                    </div>
                    <div class="meta-item">
                        <div class="meta-label">등록일</div>
                        <div class="meta-value">
                            <c:choose>
                                <c:when test="${not empty product.createdAt}">
                                    <%= formatLocalDateTime((java.time.LocalDateTime)pageContext.getAttribute("product.createdAt"), "yyyy-MM-dd HH:mm") %>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                
                <div class="buttons">
                    <a href="/products/${product.id}/edit" class="btn btn-warning">
                        <i class="fas fa-edit"></i> 수정
                    </a>
                    <form action="/products/${product.id}/delete" method="post" class="delete-form" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                        <button type="submit" class="btn btn-danger">
                            <i class="fas fa-trash-alt"></i> 삭제
                        </button>
                    </form>
                    <a href="/products" class="btn btn-primary">
                        <i class="fas fa-list"></i> 목록으로
                    </a>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 ModelAttribute 샘플 프로젝트. 모든 권리 보유.</p>
        </div>
    </div>
</body>
</html> 