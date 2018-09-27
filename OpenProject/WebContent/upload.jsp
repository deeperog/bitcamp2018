<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String sno = "";
	String fileName = "";
	String dir = "";
	// 1. multipart/form-data 여부확인
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if (isMultipart) {
		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> items = upload.parseRequest(request);
		
		Iterator<FileItem> iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = iter.next();
			// 5. FileItem이 폼 입력 항목인지 여부에 따라 알맞은 처리
			if (item.isFormField()) { // 텍스트 입력인 경우
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				sno = value;
			} else { // 파일 업로드인 경우
				String name = item.getFieldName();
				String fName = item.getName();
				
				String contentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				long sizeInBytes = item.getSize();
				
				fileName = fName + " : " +contentType + " : " + sizeInBytes;
				
				String uploadUri = "/file";
				dir = request.getSession().getServletContext().getRealPath(uploadUri);
				
				item.write(new File(dir,fName));
				
				request.setAttribute("fileName", fName);
				
			}
		}

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>학번 : <%= sno %></h1>
<h1>file : <%= fileName %></h1>


<h1><%= dir %></h1>

<img src="<%= request.getContextPath() %>/file/${fileName}" alt="이미지" />
</body>
</html>