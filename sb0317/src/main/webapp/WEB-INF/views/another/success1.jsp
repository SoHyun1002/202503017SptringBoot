<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>등록 성공</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .success-container {
            max-width: 600px;
            margin: 100px auto;
            text-align: center;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .success-icon {
            color: #198754;
            font-size: 48px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-container">
            <div class="success-icon">
                <i class="bi bi-check-circle-fill"></i>
            </div>
            <h2 class="mb-4">등록 성공123!</h2>
            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    ${message}
                </div>
            </c:if>
            <div class="mt-4">
                <a href="/users/register" class="btn btn-primary">새로운 사용자 등록</a>
            </div>
        </div>
    </div>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 