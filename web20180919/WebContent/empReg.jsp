<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	int resultCnt = 0;

	//1. 데이터베이스 드라이버 로드
	/* Class.forName("oracle.jdbc.driver.OracleDriver"); */

	Connection conn = null;
	PreparedStatement pstmt = null;

	String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "1111";

	try {
		// 2. 컨넥션 객체		
		conn = DriverManager.getConnection(url, user, pw);

		// 3. PreparedStatement 객체 생성
		String sql = "INSERT INTO EMP(EMPNO, ENAME, JOB)  VALUES(?, ?, ?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, Integer.parseInt(empno));
		pstmt.setString(2, ename);
		pstmt.setString(3, job);

		resultCnt = pstmt.executeUpdate();
	} finally {
		
		pstmt.close();
		conn.close();
	}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>

		<%
			if (resultCnt > 0) {
		%>
		등록완료
		<%
			} else {
		%>
		등록실패
		<%
			}
		%>
		 <a href="emp_list.jsp">emp List</a>
	</h1>
</body>
</html>