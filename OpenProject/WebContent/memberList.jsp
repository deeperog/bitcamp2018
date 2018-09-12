<%-- <%if (application.getAttribute("map") != null) { %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.MemberInfo"%>
<%@ page import="java.util.*"%>
<%@ include file="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
	td {
		padding : 10px;
	}
	h2 {
		padding : 25px 0 0 25px;
	}
</style>
</head>

<body>

<h2>회원 리스트</h2>

<c:forEach items="${applicationScope.map}" var="map"> 
<div id="contents">

		<hr>
		<table>
		
			<tr>
				<td>아이디(이메일)</td>
				<td>${map.value.userId}</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>${map.value.userName}</td>
			</tr>
			<tr>
				<td>사진</td>
				<td></td>
			</tr>
		</table>
	</div>
			

	</c:forEach>
</body>


<%-- <body>
<% if (application.getAttribute("map") != null) { %>
<h2>회원 리스트</h2>
	<%
	
		HashMap map = (HashMap) application.getAttribute("map");
		String temp = "";
		// [*]HashMap은 반복문을 못 돌려서 Iterator를 통해 반복문을 돌리는 것이 아닐까 생각해본다.
		Iterator<String> it = map.keySet().iterator();

		while (it.hasNext()) {
		MemberInfo test = (MemberInfo) map.get(it.next());
		%>
<div id="contents">

		<hr>
		<table>
		
			<tr>
				<td>아이디(이메일)</td>
				<td><%= test.getUserName() %></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><%= test.getUserId() %></td>
			</tr>
			<tr>
				<td>사진</td>
				<td></td>
			</tr>
		</table>
	</div>
			<%
		}
	}else{%>
	<br>
	
	<h2>회원정보가 없습니다ㅠㅠ</h2>
	<%} %>
	
</body> --%>
</html>
