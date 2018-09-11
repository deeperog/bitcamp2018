<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="member.MemberInfo" />  <!-- 객체 선언 -->
<jsp:setProperty property="*" name="member" />	<!-- member객체에 모든 요소(*) 넣음 -->
<jsp:setProperty property="password" name="member" value="<%= member.getId() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
	
		<table>
			<tr>
				<td>아이디</td>
				<td><%= member.getId() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= member.getName() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%= member.getEmail() %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%= member.getAddress() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= member.getPassword() %></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입" /></td>


			</tr>
		</table>
	
</body>
</html>