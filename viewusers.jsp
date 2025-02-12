<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
<%@ page import="itview.model.Student" %>
<%@ page import="itview.dao.StudentDao" %>
<%@ page import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Students</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
crossorigin="anonymous">

</head>
<body>

<div class="container">
 
	<div class="row">
		<div class="col-lg-12">
			<h1 align="center">View Students</h1>
			<%
			    List<Student>list=StudentDao.getAllRecords();
				request.setAttribute("list", list);
			
			%>
		</div>
	</div>
	<div class="row">
		<div class=col-lg-12>

<table class="table table-striped">
	<thead>
	<tr>
	  <th>ID</th>
	  <th>Name</th>
	  <th>Email</th>	  
	  <th>Gender</th>
	  <th>Country</th>
	  <th>Edit</th>
	  <th>Delete</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="s">
		<tr>
		  <td>${s.getId()}</td>
		  <td>${s.getName()}</td>
		  <td>${s.getEmail()}</td>
		  
		  <td>${s.getGender()}</td>
		  <td>${s.getCountry()}</td>    
		
		<td>		
		
		<a href="editform.jsp?id=${s.getId()}">Edit</a>
		</td>  
		<td>
			<a href="deleteStudent.jsp?id=${s.getId()}">Delete</a>
		</td>
	
	</tr>
	</c:forEach>
	
	</tbody>
	
	<div align="center"> 
	   <a href="studentForm.html" class="text-success text-decoration-none">Add a new record</a>
	</div>


     </table>
</div>
</div>
	</div>
	
</body>
</html>