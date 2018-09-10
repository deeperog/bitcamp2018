<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	String userName=request.getParameter("userName");
	String photoFile=request.getParameter("photoFile");
	
	MemberInfo info = new MemberInfo(userId, password, userName, photoFile);
	
	HashMap<String,MemberInfo> map = null;
	if(application.getAttribute("MapInfo")!=null){
		map=(HashMap)application.getAttribute("MapInfo");
	}else{
		map = new HashMap<>();
	}
	
	map.put(userId, info);		
	application.setAttribute("MapInfo", map);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

		<h2>회원가입 정보</h2>

		<hr>

		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><%=userId %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=password %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=userName %></td>
			</tr>
			<tr>
				<td>사진</td>
				<td></td>
			</tr>
		</table>





	</div>











</body>
</html>