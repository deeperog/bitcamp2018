<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
td {
	padding: 10px;
}
</style>
</head>
<body>
	<form action="empReg.jsp" method="post">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno" /></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="ename" /></td>
			</tr>
			<tr>
				<td>사원직급</td>
				<td><input type="text" name="job" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" /></td>

			</tr>
		</table>
	</form>
</body>
</html>