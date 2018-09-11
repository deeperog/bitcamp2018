<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	
	if(userId != null && password != null){
		if(userId.equals(password)){
			response.sendRedirect("form.jsp");
		}
	}
	
	%>
<h1>로그인 실패 아이디 혹은 비밀번호를 잘못 입력하셨습니다.</h1>

</body>
</html>