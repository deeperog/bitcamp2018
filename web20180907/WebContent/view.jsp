<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1.사용자가 요청한 데이터 받기
	//2.분석
	//3.처리->결과
	//4.응답 페이지 지정
	//5.포워딩

	String code = request.getParameter("code");
	String viewPage = "";

	if (code.equals("A")) {
		Date date = new Date();
		request.setAttribute("result", date);
		viewPage = "view/a.jsp";
	} else if (code.equals("B")) {
		String str = "Hello~!!";
		request.setAttribute("result", str);
		viewPage = "view/b.jsp";
	} else if (code.equals("C")) {
		int age = 12;
		request.setAttribute("result", age);
		viewPage = "view/c.jsp";
	}
%>

<jsp:forward page="<%=viewPage%>"></jsp:forward>