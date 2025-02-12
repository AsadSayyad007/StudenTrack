<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="itview.model.Student" %>
  <%@ page import="itview.dao.StudentDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
</head>
<body>
	
	
	<jsp:useBean id="s" class="itview.model.Student"></jsp:useBean>
	<jsp:setProperty property="*" name="s"/>
	
	<%
		int i=StudentDao.update(s);
		response.sendRedirect("viewusers.jsp");
	%>
</body>
</html>