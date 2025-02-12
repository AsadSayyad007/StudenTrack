<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="itview.dao.StudentDao" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add user form</title>
</head>
<body>

<jsp:useBean id="std" class="itview.model.Student"></jsp:useBean>

	<jsp:setProperty property="*" name="std"/>
	<%
	int n=StudentDao.insertRecord(std);
	if(n>0)
	{
		response.sendRedirect("addStudent-success.jsp");
		
	}
	else
	{
		response.sendRedirect("addStudent-error.jsp");
	}
	%>

</body>
</html>