<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_css_js.jsp" %>
</head>
<body>
 <div class="container">
    <%@ include file="navbar.jsp" %>
       <h1>This is Edit page</h1>
       

      <%
      int noteId=Integer.parseInt(request.getParameter("note_id").trim());
      Session s=FactoryProvider.getFactory().openSession();
     
     /*  Create noteId object  */
     Note note=(Note) s.get(Note.class, noteId);
     
   
      %>
      
      <form action="UpdateServlet" method="get">
      <input value="<%=note.getId()%>" name="noteId" type="hidden"/>

			<div class="form-group">
				<label for="title">Note title</label> 
				<input 
				name="title"
				required 
				type="text"
				class="form-control" 
				id="title" 
				aria-describedby="emailHelp"
				placeholder="Enter here" 
				value="<%=note.getTitle()%>"
				/>


			</div>


			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				name="content"
				required 
				id="content"
				placeholder="Enter your content here"				 
				class="form-control" 
				style="height: 300px;"><%=note.getContent()%>	
					
					</textarea>


			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save Note</button>
			</div>

		</form>
      
       
 
    </div>
    

</body>
</html>