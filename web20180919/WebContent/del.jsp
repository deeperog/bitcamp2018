<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String empno = request.getParameter("empno");
	int resultCnt = 0;

	//1. 데이터베이스 드라이버 로드
	/* Class.forName("oracle.jdbc.driver.OracleDriver"); */

	Connection conn = null;
	PreparedStatement pstmt = null;

	/* String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "1111"; */
	
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";

	try {
		// 2. 컨넥션 객체		
		conn = DriverManager.getConnection(jdbcUrl);

		// 3. PreparedStatement 객체 생성
		String sql = "delete from emp where empno =?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(empno));
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
		삭제완료
		<%
			} else {
		%>
		삭제실패
		<%
			}
		%>
		 <a href="emp_list.jsp">emp List</a>
	</h1>
</body>
</html>