<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: #dc3545;
            font-size: 0.8em;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2 class="text-center mb-4">사용자 등록</h2>
            <form:form modelAttribute="user" method="post" cssClass="needs-validation">
                <div class="form-group">
                    <label for="name" class="form-label">이름</label>
                    <form:input path="name" cssClass="form-control"/>
                    <form:errors path="name" cssClass="error"/>
                </div>
                
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <form:input path="email" cssClass="form-control"/>
                    <form:errors path="email" cssClass="error"/>
                </div>
                
                <div class="form-group">
                    <label for="occupation" class="form-label">직업</label>
                    <form:select path="occupation" cssClass="form-select">
                        <form:option value="">직업을 선택하세요</form:option>
                        <form:options items="${occupations}"/>
                    </form:select>
                    <form:errors path="occupation" cssClass="error"/>
                </div>
                
                <div class="form-group">
                    <div class="form-check">
                        <form:checkbox path="subscribeNewsletter" cssClass="form-check-input"/>
                        <label class="form-check-label" for="subscribeNewsletter">
                            뉴스레터 구독
                        </label>
                    </div>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">등록</button>
                </div>
            </form:form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 