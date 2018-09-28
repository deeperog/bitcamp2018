<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
</head>
<body>

<%-- <%@ include file="common/header.jsp" %> --%>
<jsp:include page="common/header.jsp"/>
</body>
</html>

<!-- 
OpenProject를 아래 스펙에 맞게 구현합시다.

서비스클래스와 DAO 클래스 패턴으로 구현
JSP는 요청을 받는 파일과 VIEW 처리 하는 파일로 구분
VIEW 페이지는 EL 과 JSTL로 구현
회원 리스트의 HTML/XML/JSON 형식으로 응답처리 하는 메뉴 추가 구성
구현이 완료된 후 댓글로 깃허브 주소 작성요망
 -->