<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="memberReg.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input name="id" type="text" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" type="text" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" type="text" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input name="address" type="text" /></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="가입" /></td>


			</tr>
		</table>
	</form>
</body>
</html>