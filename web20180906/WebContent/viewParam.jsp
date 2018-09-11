<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Map"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String userName = request.getParameter("userName");
		String address = request.getParameter("address");
	%>

	userName 파라미터 :
	<%=userName%><br> address 파라미터 :
	<%=address%><br>

	<%
		String[] pets = request.getParameterValues("pet");
		if (pets != null) {
			for (int i = 0; i < pets.length; i++) {
	%>

	<%=pets[i]%>

	<%
		}
		}
	%>


	<hr />
	<b>request.getParameterNames() 메서드 사용</b>
	<br>
	<%
		Enumeration paramEnum = request.getParameterNames();
		while (paramEnum.hasMoreElements()) {
			String name = (String) paramEnum.nextElement();
	%>

	<%=name%>
	<%=request.getParameter(name)%>

	<%
		}
	%>
	<hr />

	<b>request.getParameterMap() 메서드 사용</b>
	<br>
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[]) parameterMap.get("name");
		if (nameParam != null) {
	%>
	name =
	<%=nameParam[0]%>
	<%
		}
	%>
</body>
</html>