<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등록</title>
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
        }
        
        .card-body {
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #36b9cc;
            box-shadow: 0 0 0 3px rgba(54, 185, 204, 0.2);
        }
        
        .btn {
            display: inline-block;
            padding: 12px 24px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            cursor: pointer;
            font-size: 1rem;
            border: none;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: #36b9cc;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2c9faf;
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
        
        .form-icon {
            position: relative;
        }
        
        .form-icon i {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            color: #adb5bd;
        }
        
        .form-icon .form-control {
            padding-left: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>회원 등록</h1>
            <div class="nav-links">
                <a href="/" class="nav-link"><i class="fas fa-home"></i> 홈</a>
                <a href="/members" class="nav-link"><i class="fas fa-users"></i> 회원 목록</a>
                <a href="/products" class="nav-link"><i class="fas fa-box"></i> 상품 관리</a>
                <a href="/boards" class="nav-link"><i class="fas fa-clipboard-list"></i> 게시판</a>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <i class="fas fa-user-plus"></i> 새 회원 정보 입력
            </div>
            <div class="card-body">
                <!-- @ModelAttribute를 사용하여 폼 데이터를 바인딩 -->
                <form:form modelAttribute="memberDTO" action="/members/register" method="post">
                    <div class="form-group">
                        <label for="username">사용자명</label>
                        <div class="form-icon">
                            <i class="fas fa-user"></i>
                            <form:input path="username" id="username" required="true" class="form-control" placeholder="사용자명을 입력하세요" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <div class="form-icon">
                            <i class="fas fa-lock"></i>
                            <form:password path="password" id="password" required="true" class="form-control" placeholder="비밀번호를 입력하세요" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="name">이름</label>
                        <div class="form-icon">
                            <i class="fas fa-id-card"></i>
                            <form:input path="name" id="name" required="true" class="form-control" placeholder="이름을 입력하세요" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <div class="form-icon">
                            <i class="fas fa-envelope"></i>
                            <form:input path="email" id="email" type="email" required="true" class="form-control" placeholder="이메일을 입력하세요" />
                        </div>
                    </div>
                    
                    <div class="buttons">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> 등록
                        </button>
                        <a href="/members" class="btn btn-danger">
                            <i class="fas fa-times"></i> 취소
                        </a>
                    </div>
                </form:form>
            </div>
        </div>
        
        <div class="member-count">
            <span class="count-text">현재 회원 수</span>
            <span class="count-number">${memberCount}명</span>
        </div>
        
        <div class="footer">
            <p>© 2025 ModelAttribute 샘플 프로젝트. 모든 권리 보유.</p>
        </div>
    </div>
</body>
</html> 