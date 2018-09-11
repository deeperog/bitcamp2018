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
서버오류가 발생했습니다.
빠른 시간내에 처리하겠습니다.

<h3>에러타입 : <%= exception.getClass().getName() %></h3>
<h3>에러메시지 : <%= exception.getMessage() %></h3>
</body>
</html>