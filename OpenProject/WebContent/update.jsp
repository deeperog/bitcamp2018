<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.MemberInfo"%>
<%@ page import="java.util.*"%>
<%@ include file="common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="map" class="java.util.HashMap" scope="application"/>
<jsp:useBean id="member" class="member.model.MemberInfo"/>

	<%
		String userId = request.getParameter("beforeUserId");
		String userName = request.getParameter("userName2");
		String password = request.getParameter("password2");		
		String photoFile = "";		
		
		MemberInfo info = new MemberInfo(userId, password, userName, photoFile);
		
		map.replace(userId, info);
		response.sendRedirect("memberList.jsp");
	%>

	



</body>
</html>