<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
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
            color: #f6c23e;
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
            color: #f6c23e;
        }
        
        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .card-header {
            background-color: #f6c23e;
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
            border-color: #f6c23e;
            box-shadow: 0 0 0 3px rgba(246, 194, 62, 0.2);
        }
        
        textarea.form-control {
            min-height: 250px;
            resize: vertical;
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
            background-color: #f6c23e;
            color: white;
        }
        
        .btn-primary:hover {
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
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-col {
            flex: 1;
        }
        
        .editor-toolbar {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-bottom: none;
            border-radius: 5px 5px 0 0;
            padding: 10px;
            display: flex;
            gap: 10px;
        }
        
        .editor-btn {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 3px;
            padding: 5px 10px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .editor-btn:hover {
            background-color: #e9ecef;
        }
        
        .editor-container textarea {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
        
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>게시글 작성</h1>
            <div class="nav-links">
                <a href="/" class="nav-link"><i class="fas fa-home"></i> 홈</a>
                <a href="/boards" class="nav-link"><i class="fas fa-clipboard-list"></i> 게시판</a>
                <a href="/members" class="nav-link"><i class="fas fa-users"></i> 회원 관리</a>
                <a href="/products" class="nav-link"><i class="fas fa-box"></i> 상품 관리</a>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <i class="fas fa-pen"></i> 새 게시글 작성
            </div>
            <div class="card-body">
                <!-- @ModelAttribute를 사용하여 폼 데이터를 바인딩 -->
                <form:form modelAttribute="boardDTO" action="/boards/write" method="post">
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="title">제목</label>
                                <div class="form-icon">
                                    <i class="fas fa-heading"></i>
                                    <form:input path="title" id="title" required="true" class="form-control" placeholder="제목을 입력하세요" />
                                </div>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <div class="form-icon">
                                    <i class="fas fa-user"></i>
                                    <form:input path="writer" id="writer" required="true" class="form-control" placeholder="작성자명을 입력하세요" />
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="boardType">게시판 종류</label>
                        <div class="form-icon">
                            <i class="fas fa-list-alt"></i>
                            <select id="boardType" name="boardType" class="form-control">
                                <c:forEach var="boardType" items="${boardTypes}">
                                    <option value="${boardType}">${boardType}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="content">내용</label>
                        <div class="editor-container">
                            <div class="editor-toolbar">
                                <button type="button" class="editor-btn"><i class="fas fa-bold"></i></button>
                                <button type="button" class="editor-btn"><i class="fas fa-italic"></i></button>
                                <button type="button" class="editor-btn"><i class="fas fa-underline"></i></button>
                                <button type="button" class="editor-btn"><i class="fas fa-list-ul"></i></button>
                                <button type="button" class="editor-btn"><i class="fas fa-list-ol"></i></button>
                                <button type="button" class="editor-btn"><i class="fas fa-link"></i></button>
                                <button type="button" class="editor-btn"><i class="fas fa-image"></i></button>
                            </div>
                            <form:textarea path="content" id="content" required="true" class="form-control" placeholder="내용을 입력하세요" />
                        </div>
                    </div>
                    
                    <div class="buttons">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-paper-plane"></i> 등록
                        </button>
                        <a href="/boards" class="btn btn-danger">
                            <i class="fas fa-times"></i> 취소
                        </a>
                    </div>
                </form:form>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 ModelAttribute 샘플 프로젝트. 모든 권리 보유.</p>
        </div>
    </div>
</body>
</html> 