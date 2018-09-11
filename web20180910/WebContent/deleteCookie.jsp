<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null && cookies.length > 0){
		for(int i = 0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				Cookie c = new Cookie("id", "");
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>쿠키 삭제</h1>

<a href="viewCookie.jsp">쿠키 확인</a>

</body>
</html>