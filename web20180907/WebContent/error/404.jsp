<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
요청 과정에서 에러가 발생했습니다

<h3>에러타입 : <%= exception.getClass().getName() %></h3>
<h3>에러메시지 : <%= exception.getMessage() %></h3>
</body>
</html>