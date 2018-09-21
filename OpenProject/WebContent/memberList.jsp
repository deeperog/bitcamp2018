
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

/* button {
	text-decoration: none;
	color: red;
	padding: 10px;
} */

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
	width: 400px;
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
			<table>

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
					
						<button onclick="update('${map.value.userId}', '${map.value.userName}', '${map.value.password}')">수정하기</button>			
						<button id="myBtn" onclick="location.href='delete.jsp?userId=${map.value.userId}'">삭제</button>
						


						
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
				<form action="update.jsp" method="post">
				<table>

					<tr>
						<td>아이디(이메일)</td>
						<td><p id="userId2"/></p></td>
					</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" id="userName2" name="userName2"/></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><input type="password" id="password2" name="password2"/></td>
					</tr>
					<tr>
						<td>사진</td>
						<td><input type="file" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정하기"/></td>						
					</tr>
					<tr>
					
					<td><input type="hidden" id="beforeUserId" name="beforeUserId" /></td>
					<td><input type="hidden" id="beforeUserName"/></td>
					<td><input type="hidden" id="beforePassword" /></td>
					</tr>
					
					

				</table>
				</form>
			</div>

		</div>

	</div>

	<script>
	
		// Get the modal
		
		var userId2 = document.getElementById("userId2");
		var beforeUserId = document.getElementById("beforeUserId");
		var userName2 = document.getElementById("userName2")
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		function update(userId, userName, password) {
    		modal.style.display = "block";
    		userId2.innerHTML = userId;
    		beforeUserId.value = userId;
    		
    		userName2.value = userName;
    		password2.value = password
    		beforeUserName.value = userName;
    		beforePassword.value = password;
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
