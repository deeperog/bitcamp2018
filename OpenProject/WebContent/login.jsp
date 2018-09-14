<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.MemberInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%-- <c:forEach var="map" items="${applicationScope.map}">
	<c:if test="${param.id == map.id && param.password == map.password}" var="test">
		<c:redirect url=“myPage.jsp” />
	</c:if>
</c:forEach> --%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userId");
	String pw = request.getParameter("password");
	String check = request.getParameter("check");

	
	
	if (application.getAttribute("map") != null) {
		HashMap map = (HashMap) application.getAttribute("map");

		Iterator<String> it = map.keySet().iterator();

		while (it.hasNext()) {
			MemberInfo test = (MemberInfo) map.get(it.next());
			
			if (id != "" && pw != "" && id.equals(test.getUserId()) && pw.equals(test.getPassword())) {
				request.getSession(false).setAttribute("userId", id);
				request.getSession(false).setAttribute("userName", test.getUserName());
				response.sendRedirect("myPage.jsp");
			}
		}
	}

	if (check != null) {
		Cookie c = new Cookie("id", id);
		response.addCookie(c);
		System.out.println(c.getValue());
	} else {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("id")) {
					Cookie c = new Cookie("id", "");
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
	}
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
		<h2>로그인</h2>

		<hr>
		<h1>아이디 또는 비밀번호가 틀립니다. 확인해주세요.</h1>
		<h1>
			<a href="loginForm.jsp">다시로그인하기</a>
		</h1>


	</div>
</body>
</html>