<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 가입</title>
</head>
<body>
    <h2>회원 정보 입력</h2>
    <form:form action="another/step3" method="post">
    <p>

    <p>
        <label>이메일:<br>
        <input type = "text" name = "email" />
        </label>
    </p>
    <p>
        <label>이름:<br>
            <input type = "text" name = "name" />
        </label>
    </p>
    <p>
        <label>비밀번호:<br>
            <input type = "password" name = "password" />
        </label>
    </p>
    <p>
        <label>비밀번호 확인:<br>
            <input type = "password" name = "confirmpassword" />
        </label>
    </p>
    <input type="submit" value="가입완료">
    </form:form>
</body>
</html>
