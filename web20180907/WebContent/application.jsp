<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String path = "/message/notice/notice.txt";
		/* String path = "/message/notice/test.html"; */
	%>
	<%=application.getRealPath(path)%>

	<%
		BufferedReader br =null;
		char[] buff = new char[512];
		int len = -1;
		
		br = new BufferedReader(new InputStreamReader(application.getResourceAsStream(path)));
		
		while((len=br.read(buff)) != -1){
			out.print(new String(buff,0,len));
		}
	%>

</body>
</html>