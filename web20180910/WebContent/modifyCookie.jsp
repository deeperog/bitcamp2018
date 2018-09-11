<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();

	for(int i=0; i<cookies.length; i++){
		/* Cookie c = cookies[i]; */
		
		if(cookies[i].getName().equals("id")){
			Cookie cookie = new Cookie("id", "hot");
			response.addCookie(cookie);
		}
	}
%>
<h1> 쿠키값 변경 </h1>
<a href="viewCookie.jsp">쿠키 확인</a>
</body>
</html>