
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.MemberInfo"%>
<%@ page import="java.util.*"%>
<%@ include file="common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
td {
	padding: 10px;
}

h2 {
	padding: 25px 0 0 25px;
}

#myBtn {
	text-decoration: none;
	color: red;
	padding: 10px;
}

div {
	text-align: center;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>

	<h2>회원 리스트</h2>

	<c:forEach items="${applicationScope.map}" var="map">
		<div id="contents">

			<hr>
			<table border="1">

				<tr>
					<td>아이디(이메일)</td>
					<td>${map.value.userId}</td>
				</tr>

				<tr>
					<td>이름</td>
					<td>${map.value.userName}</td>
				</tr>
				<tr>
					<td>사진</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><div>
							<button id="myBtn" onclick="abc(${map.value.userId})">수정하기</button>
							<a id="myBtn" href="delete.jsp?userId=${map.value.userId}">삭제하기</a>
						</div></td>
				</tr>
			</table>
		</div>


	</c:forEach>



	

	<!-- Trigger/Open The Modal -->
	

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="contents">

			<hr>
			<table border="1">

				<tr>
					<td>아이디(이메일)</td>
					<td>
					
					</td>
				</tr>

				<tr>
					<td>이름</td>
					<td>${map.value.userName}</td>
				</tr>
				<tr>
					<td>사진</td>
					<td></td>
				</tr>
				
			</table>
		</div>
			
		</div>

	</div>

	<script>
	var update
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		/* var btn = document.getElementById("myBtn"); */

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		function abc(userId) {
			modal.style.display = "block";
			String qwe = userId;
			System
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>


<%-- <body>
<% if (application.getAttribute("map") != null) { %>
<h2>회원 리스트</h2>
	<%
	
		HashMap map = (HashMap) application.getAttribute("map");
		String temp = "";
		// [*]HashMap은 반복문을 못 돌려서 Iterator를 통해 반복문을 돌리는 것이 아닐까 생각해본다.
		Iterator<String> it = map.keySet().iterator();

		while (it.hasNext()) {
		MemberInfo test = (MemberInfo) map.get(it.next());
		%>
<div id="contents">

		<hr>
		<table>
		
			<tr>
				<td>아이디(이메일)</td>
				<td><%= test.getUserName() %></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><%= test.getUserId() %></td>
			</tr>
			<tr>
				<td>사진</td>
				<td></td>
			</tr>
		</table>
	</div>
			<%
		}
	}else{%>
	<br>
	
	<h2>회원정보가 없습니다ㅠㅠ</h2>
	<%} %>
	
</body> --%>
</html>
