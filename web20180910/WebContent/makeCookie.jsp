<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie c = new Cookie("id", "cool");
	
	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=c.getName()%>
		쿠키의 값 =
		<%=c.getValue()%></h1>
	<a href="viewCookie.jsp">쿠키확인</a>

</body>
</html>