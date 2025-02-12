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
<title>edit form</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body bgcolor="pink">

<div class="container">
	<div class="row">
		<div class="offset-lg-3 col-lg-6">	
		<h1 align="center">Edit Student</h1> 
		
		<%
			String id=request.getParameter("id");
			Student s=StudentDao.getRecordById(Integer.parseInt(id));
		%> 
		<form action="editStudent.jsp" method="post">  
		
		<input type="hidden" name="id" value="<%=s.getId()%>"/>
		
		<div class="form-group">
			<label>Name:</label>
			<input type="text" name="name"  value="<%=s.getName()%>" class="form-control"/>
		</div>
		
		
		<div class="form-group">
				<label>Email:</label>
		        <input type="email" name="email"  value="<%=s.getEmail()%>" class="form-control"/>
		</div>
		
		
		<div class="form-group">	
                <label>Gender:</label>
                <div class="form-check">
                    <input type="radio" id="male" name="gender" value="male" class="form-check-input" 
                    
                        <%= "male".equals(s.getGender()) ? "checked" : "" %> />
                        
                    <label class="form-check-label" for="male">Male</label>
                </div>
                
                  
                <div class="form-check">
                    <input type="radio" id="female" name="gender" value="female" class="form-check-input"
                     
                        <%= "female".equals(s.getGender()) ? "checked" : "" %> />
                        
                    <label class="form-check-label" for="female">Female</label>
                </div>
         </div>
         
			   <div class="form-group">
                <label for="country">Country:</label>
                <select id="country" name="country" class="form-control">  
                    <option value="India" <%= "India".equals(s.getCountry()) ? "selected" : "" %>> India</option>  
                    <option value="USA" <%= "USA".equals(s.getCountry()) ? "selected" : "" %>> USA</option>  
                    <option value="Canada" <%= "Canada".equals(s.getCountry()) ? "selected" : "" %>> Canada</option>  
                </select>  
            </div>   
            
            <input type="submit" class="btn btn-danger" value="Update"/>
 
</form>  
 <div align="center">
	 <a   href="viewusers.jsp">View All Records</a><br/> 
  <a href="studentForm.html">Add a new Record</a>

 </div>
 		</div>
 	</div>
 </div>
 </body>
</html>