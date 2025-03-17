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
    <title>회원 목록</title>
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
            max-width: 1200px;
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
            padding: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: #f8f9fa;
            font-weight: 500;
            color: #555;
        }
        
        tr:hover {
            background-color: #f8f9fa;
        }
        
        .empty-message {
            text-align: center;
            padding: 30px;
            color: #6c757d;
            font-style: italic;
        }
        
        .btn {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: #36b9cc;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2c9faf;
        }
        
        .btn-sm {
            padding: 5px 10px;
            font-size: 0.9rem;
        }
        
        .btn-info {
            background-color: #4e73df;
            color: white;
        }
        
        .btn-info:hover {
            background-color: #2e59d9;
        }
        
        .btn-warning {
            background-color: #f6c23e;
            color: white;
        }
        
        .btn-warning:hover {
            background-color: #dda20a;
        }
        
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        
        .member-count {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .count-text {
            font-size: 1.1rem;
            color: #555;
        }
        
        .count-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #36b9cc;
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
            <h1>회원 관리</h1>
            <div class="nav-links">
                <a href="/" class="nav-link"><i class="fas fa-home"></i> 홈</a>
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
                <span>회원 목록</span>
                <a href="/members/register" class="btn btn-primary btn-sm">
                    <i class="fas fa-user-plus"></i> 회원 등록
                </a>
            </div>
            <div class="card-body">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>사용자명</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="member" items="${members}">
                            <tr>
                                <td>${member.id}</td>
                                <td>${member.username}</td>
                                <td>${member.name}</td>
                                <td>${member.email}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty member.createdAt}">
                                            <%= formatLocalDateTime((java.time.LocalDateTime)pageContext.getAttribute("member.createdAt"), "yyyy-MM-dd HH:mm") %>
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="/members/${member.id}" class="btn btn-info btn-sm">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="/members/${member.id}/edit" class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty members}">
                            <tr>
                                <td colspan="6" class="empty-message">
                                    <i class="fas fa-info-circle"></i> 등록된 회원이 없습니다.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="member-count">
            <span class="count-text">총 회원 수</span>
            <span class="count-number">${memberCount}명</span>
        </div>
        
        <div class="footer">
            <p>© 2025 ModelAttribute 샘플 프로젝트. 모든 권리 보유.</p>
        </div>
    </div>
</body>
</html>