<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EMP LIST</title>
<style>
	td{
	padding : 10px;
	text-align: center;
	}
</style>
</head>
<body>
<h1>사원리스트</h1>
<h3><a href="empRegForm.jsp">사원등록</a></h3>
	<table border = "1">
	<tr>
		<td>사원번호</td>
		<td>사원이름</td>		
		<td>사원직급</td>
		<td>관리</td>
	</tr>

		<%
			// 1. 데이터베이스 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";

			try {

				// 2. 컨넥션 객체		
				conn = DriverManager.getConnection(url, user, pw);

				// 3. Statement 객체 생성
				stmt = conn.createStatement();

				String list_sql = "select empno, ename, job from emp order by empno";

				// 4. 쿼리 실행

				rs = stmt.executeQuery(list_sql);

				if (rs.next()) {
					do {
		%>
		<tr>
			<td><%=rs.getInt("empno")%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString("job")%></td>
			<td><a href="editForm.jsp?empno=<%=rs.getInt("empno")%>">수정</a> <a href="del.jsp?empno=<%=rs.getInt("empno")%>">삭제</a></td>
		</tr>
		<%
			} while (rs.next());
				} else {
		%>
		<tr>
			<td colspan="3">등록된 사원 정보가 없습니다.</td>

		</tr>
		<%
			}
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {

					}
				}
				if (stmt != null) {
					try {
						stmt.close();

					} catch (SQLException se) {

					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException se) {

					}
				}
			}
		%>



	</table>



</body>
</html>