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
    <title>회원 상세 정보</title>
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
            max-width: 800px;
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
            color: #36b9cc;
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
            color: #36b9cc;
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
        
        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .card-header {
            background-color: #36b9cc;
            color: white;
            padding: 15px 20px;
            font-size: 1.2rem;
            font-weight: 500;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-body {
            padding: 30px;
        }
        
        .info-group {
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        
        .info-group:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        
        .info-label {
            font-weight: 500;
            color: #555;
            margin-bottom: 5px;
        }
        
        .info-value {
            font-size: 1.1rem;
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
            background-color: #36b9cc;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2c9faf;
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
            margin-top: 30px;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .delete-form {
            display: inline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>회원 상세 정보</h1>
            <div class="nav-links">
                <a href="/" class="nav-link"><i class="fas fa-home"></i> 홈</a>
                <a href="/members" class="nav-link"><i class="fas fa-users"></i> 회원 목록</a>
                <a href="/products" class="nav-link"><i class="fas fa-box"></i> 상품 관리</a>
                <a href="/boards" class="nav-link"><i class="fas fa-clipboard-list"></i> 게시판</a>
            </div>
        </div>
        
        <c:if test="${not empty message}">
            <div class="message">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>
        
        <div class="card">
            <div class="card-header">
                <span><i class="fas fa-user"></i> ${member.username} 회원 정보</span>
            </div>
            <div class="card-body">
                <div class="info-group">
                    <div class="info-label">ID</div>
                    <div class="info-value">${member.id}</div>
                </div>
                
                <div class="info-group">
                    <div class="info-label">사용자명</div>
                    <div class="info-value">${member.username}</div>
                </div>
                
                <div class="info-group">
                    <div class="info-label">이름</div>
                    <div class="info-value">${member.name}</div>
                </div>
                
                <div class="info-group">
                    <div class="info-label">이메일</div>
                    <div class="info-value">${member.email}</div>
                </div>
                
                <div class="info-group">
                    <div class="info-label">가입일</div>
                    <div class="info-value">
                        <c:choose>
                            <c:when test="${not empty member.createdAt}">
                                <%= formatLocalDateTime((java.time.LocalDateTime)pageContext.getAttribute("member.createdAt"), "yyyy-MM-dd HH:mm") %>
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                
                <div class="buttons">
                    <a href="/members/${member.id}/edit" class="btn btn-warning">
                        <i class="fas fa-edit"></i> 수정
                    </a>
                    <form action="/members/${member.id}/delete" method="post" class="delete-form" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                        <button type="submit" class="btn btn-danger">
                            <i class="fas fa-trash-alt"></i> 삭제
                        </button>
                    </form>
                    <a href="/members" class="btn btn-primary">
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