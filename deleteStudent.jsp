<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="itview.model.Student" %>
  <%@ page import="itview.dao.StudentDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student</title>
</head>
<body>
	
	
	<jsp:useBean id="s" class="itview.model.Student"></jsp:useBean>
	<jsp:setProperty property="*" name="s"/>
	
	<%
		StudentDao.delete(s);
		response.sendRedirect("viewusers.jsp");
	%>
</body>
</html>