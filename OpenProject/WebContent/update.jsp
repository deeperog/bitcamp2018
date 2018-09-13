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
	<%
		String userId = request.getParameter("userId");

		HashMap map = (HashMap) application.getAttribute("map");
		String temp = "";
		// [*]HashMap은 반복문을 못 돌려서 Iterator를 통해 반복문을 돌리는 것이 아닐까 생각해본다.
		Iterator<String> it = map.keySet().iterator();

		while (it.hasNext()) {
			MemberInfo test = (MemberInfo) map.get(it.next());
			if (test.getUserId().equals(userId)) {
				
				
			}
		}
	%>

	



</body>
</html>