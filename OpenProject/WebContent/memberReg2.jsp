<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="member.model.MemberDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="member.model.MemberInfo" />
<!-- 객체 선언 -->
<jsp:setProperty property="*" name="member" />
<!-- member객체에 모든 요소(*) 넣음 -->
<%-- <jsp:useBean id="map" class="java.util.HashMap" scope="application"/> --%>
<%
	/* MemberInfo memberInfo = new MemberInfo(); */

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 3. 업로드 요청을 처리하는 ServletFileUpload 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 4. 업로드 요청 파싱해서 FileItem 목록 구함
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = iter.next();
			
			if(item.isFormField()){
				if(item.getFieldName().equals("userId")){
					member.setUserId(item.getString("utf-8"));
				} if(item.getFieldName().equals("password")){
					member.setPassword(item.getString("utf-8"));
				} if(item.getFieldName().equals("userName")){
					member.setUserName(item.getString("utf-8"));
				}
			} else {
				if(item.getFieldName().equals("photoFile") && item.getSize() > 0 && item.getName() != null && item.getName().length() > 0){
					
					// 저장하기 위한 파일의 새로운 이름 생성
					String newFileName = "";
					String fileName = item.getName();
					newFileName = System.currentTimeMillis()+fileName;
					
					String uploadUri = "/uploadFile";
					String dir = request.getSession().getServletContext().getRealPath(uploadUri);
					
					File file = new File(dir,newFileName);
					
					item.write(file);
					
					member.setPhotoFile(newFileName);
						
				}				
			}
		}
	}
%>


<%
	MemberDAO dao = MemberDAO.getInstance();
	dao.insertMember(member);
%>



<%-- <%
	map.put(member.getUserId(), member); 
	/* application.setAttribute("MapInfo", map); */
	System.out.println(map);
%> --%>



<%-- <%
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	String userName=request.getParameter("userName");
	String photoFile=request.getParameter("photoFile");
	
	
	
	MemberInfo info = new MemberInfo(userId, password, userName, photoFile);
	
	HashMap<String,MemberInfo> map = null;
	if(application.getAttribute("MapInfo")!=null){
		map=(HashMap)application.getAttribute("MapInfo");
	}else{
		map = new HashMap<>();
	}
	
	map.put(userId, info);		
	application.setAttribute("MapInfo", map);
%> --%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
h2, td {
	padding: 10px;
}
</style>
</head>
<body>

	<%@ include file="common/header.jsp"%>


	<div id="contents">

		<h2>회원가입 정보</h2>

		<hr>

		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><%= member.getUserId() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= member.getPassword() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= member.getUserName() %></td>
			</tr>
			<tr>
				<td>사진</td>
				
				<td><img src="<%= request.getContextPath()%>/uploadFile/${member.photoFile}" alt="이미지" /></td>
			</tr>
		</table>
	</div>
</body>
</html>