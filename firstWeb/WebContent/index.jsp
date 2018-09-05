<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP -1</title>
<style>
	* {
		margin : 0;
		padding: 0;
	}
	
	h1, div {
		text-align: center;
	}
	
	#wrap {
		overflow: hidden;
	}
	.wrap div {
		width : 49%;
		float: left;
		border : 1px solid #444444;
	}
	
	ul {
		list-style: none;
	}
</style>
</head>
<body>

<h1>include Test</h1>
<hr>
<%@ include file="common/nav.jsp" %>
<div class="wrap">
<%@ include file="common/left.jsp" %>
<%@ include file="common/right.jsp" %>
</div>

</body>
</html>






