<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .details-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .info-group {
            margin-bottom: 20px;
        }
        .info-label {
            font-weight: bold;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="details-container">
            <h2 class="text-center mb-4">사용자 상세 정보</h2>
            
            <div class="info-group">
                <div class="info-label">이름</div>
                <div class="info-value">${user.name}</div>
            </div>
            
            <div class="info-group">
                <div class="info-label">이메일</div>
                <div class="info-value">${user.email}</div>
            </div>
            
            <div class="info-group">
                <div class="info-label">직업</div>
                <div class="info-value">${user.occupation}</div>
            </div>
            
            <div class="info-group">
                <div class="info-label">뉴스레터 구독</div>
                <div class="info-value">
                    <c:choose>
                        <c:when test="${user.subscribeNewsletter}">
                            <span class="badge bg-success">구독 중</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">미구독</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <a href="/users/register" class="btn btn-primary">사용자 등록으로 돌아가기</a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 