<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String empno = request.getParameter("empno");

	// 1. 데이터베이스 드라이버 로드
	/* Class.forName("oracle.jdbc.driver.OracleDriver"); */

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	/* String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "1111"; */

	String jdbcUrl = "jdbc:apache:commons:dbcp:open";

	// 2. 컨넥션 객체		
	conn = DriverManager.getConnection(jdbcUrl);

	// 3. Statement 객체 생성
	stmt = conn.createStatement();

	String list_sql = "select empno, ename, job from emp where empno=" + empno;

	// 4. 쿼리 실행

	rs = stmt.executeQuery(list_sql);

	String ename = "";
	String job = "";

	if (rs.next()) {
		ename = rs.getString("ename");
		job = rs.getString("job");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>



	<form action="edit.jsp" method="post">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" value="<%=empno%>" name="empno"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" value="<%=ename%>" name="ename" /></td>
			</tr>
			<tr>
				<td>사원직급</td>
				<td><input type="text" value="<%=job%>" name="job" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" /></td>
			</tr>
		</table>
	</form>


</body>
</html>