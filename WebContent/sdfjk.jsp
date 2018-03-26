<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="beans.Bean"%>
<%! int count=0;
int temp=0;%>
<!--Imported Java Bean  -->
<!-- Feeding the arraylist -->

<%
  
ArrayList<Bean> quest=(ArrayList)session.getAttribute("que_array");	
Bean b= new Bean();
		
	
		/*Establishing Connectoin with JDBC Database  */
	b=quest.get(1);
		count++;
    
    String question=b.getQuestion();
    String option1=b.getOption1();
    String option2=b.getOption2();
    String option3=b.getOption3();
    String option4=b.getOption4();
    String answer=b.getAnswer(); 
    
    out.println(question+"<br>");
    out.println(option1+"<br>");
    out.println(option2+"<br>");
    out.println(option3+"<br>");
    out.println(option4+"<br>");
    out.println(answer+"<br>");
    
    temp+=1;
    %>
    <input type="submit" name="submit">
    <% 
	if( temp==quest.size() )
	{ response.sendRedirect("index.html"); }
    %>
    
	
