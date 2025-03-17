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
    <title>상품 목록</title>
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
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: #2c3e50;
            font-size: 2rem;
        }
        
        .nav-links {
            display: flex;
            gap: 15px;
        }
        
        .nav-link {
            color: #2c3e50;
            text-decoration: none;
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s;
        }
        
        .nav-link:hover {
            background-color: #e9ecef;
            color: #3498db;
        }
        
        .nav-link i {
            margin-right: 5px;
        }
        
        .message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .message i {
            font-size: 1.2rem;
        }
        
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
        }
        
        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .product-info {
            padding: 15px;
        }
        
        .product-name {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 10px;
            color: #2c3e50;
        }
        
        .product-price {
            font-size: 1.3rem;
            color: #e74c3c;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .product-category {
            display: inline-block;
            background-color: #f8f9fa;
            color: #6c757d;
            padding: 4px 8px;
            border-radius: 15px;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
        
        .product-stock {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
        
        .product-date {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: #3498db;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
        }
        
        .btn-warning {
            background-color: #f1c40f;
            color: #2c3e50;
        }
        
        .btn-warning:hover {
            background-color: #f39c12;
        }
        
        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #c0392b;
        }
        
        .search-form {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .search-input {
            flex: 1;
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        
        .search-button {
            padding: 8px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .search-button:hover {
            background-color: #2980b9;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>상품 목록</h1>
            <div class="nav-links">
                <a href="/" class="nav-link"><i class="fas fa-home"></i> 홈</a>
                <a href="/boards" class="nav-link"><i class="fas fa-clipboard-list"></i> 게시판</a>
                <a href="/members" class="nav-link"><i class="fas fa-users"></i> 회원 관리</a>
                <a href="/products" class="nav-link"><i class="fas fa-box"></i> 상품 관리</a>
            </div>
        </div>
        
        <c:if test="${not empty message}">
            <div class="message">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>
        
        <div class="search-form">
            <input type="text" name="name" class="search-input" placeholder="상품명으로 검색">
            <button type="button" class="search-button" onclick="searchProducts()">
                <i class="fas fa-search"></i> 검색
            </button>
        </div>
        
        <div class="product-grid">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
                    <div class="product-info">
                        <div class="product-name">${product.name}</div>
                        <div class="product-price">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩" />
                        </div>
                        <div class="product-category">
                            <i class="fas fa-tag"></i> ${product.category}
                        </div>
                        <div class="product-stock">
                            <i class="fas fa-cubes"></i> 재고: ${product.stock}개
                        </div>
                        <div class="product-date">
                            <i class="fas fa-calendar-alt"></i> 
                            <%= formatLocalDateTime((java.time.LocalDateTime)pageContext.getAttribute("product.createdAt"), "yyyy-MM-dd") %>
                        </div>
                        <div class="buttons">
                            <a href="/products/${product.id}" class="btn btn-primary">
                                <i class="fas fa-eye"></i> 상세보기
                            </a>
                            <a href="/products/${product.id}/edit" class="btn btn-warning">
                                <i class="fas fa-edit"></i> 수정
                            </a>
                            <form action="/products/${product.id}/delete" method="post" style="display: inline;" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fas fa-trash-alt"></i> 삭제
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="buttons" style="margin-top: 20px;">
            <a href="/products/register" class="btn btn-primary">
                <i class="fas fa-plus"></i> 상품 등록
            </a>
        </div>
        
        <div class="footer">
            <p>© 2025 쇼핑몰 관리 시스템. All rights reserved.</p>
        </div>
    </div>
    
    <script>
        function searchProducts() {
            const name = document.querySelector('input[name="name"]').value;
            if (name.trim()) {
                window.location.href = '/products/search?name=' + encodeURIComponent(name);
            }
        }
    </script>
</body>
</html> 