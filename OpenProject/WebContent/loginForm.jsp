<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	Boolean check = false;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<link rel="stylesheet" href="css/default.css">
<style>
h2, td {
	padding: 10px;
}
</style>
</head>
<body>

	<%@ include file="common/header.jsp"%>


	<div id="contents">
		<h2>로그인</h2>

		<hr>
		<form action="login.jsp" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<%
						if (cookies != null && cookies.length > 0) {
							System.out.println("test");
							for (int i = 0; i < cookies.length; i++) {
								if (cookies[i].getName().equals("id")) {
									check = true;
					%>
					<td><input type="text" name="userId"
						value=<%=cookies[i].getValue()%>></td>
					<%
						} else {
					%>
					<td><input type="text" name="userId"></td>
					<%
						}
								break;
							}
						} else {
					%>
					<td><input type="text" name="userId"></td>
					<%
						}
					%>


				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"></td>
					<%
						if (check) {
					%>
					<td><input type="checkbox" id="check" name="check" checked/><label
						for="check">아이디 기억하기</label></td>
					<%
						} else {
					%>
					<td><input type="checkbox" id="check" name="check"/><label
						for="check">아이디 기억하기</label></td>
					<%
						}
					%>
					
				</tr>
			</table>
		</form>

	</div>
</body>
</html>