<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

/*Storing userinformation*/
session.setAttribute("email",email);
session.setAttribute("password",password);



Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
Statement st=conn.createStatement();

ResultSet rs= st.executeQuery("select * from student where email='"+email+"' and password ='"+password+"' ");
if(rs.next()){
%>
<jsp:forward page="student_examtype.html"/>
<%
conn.close(); }

else
	{%>
	
	<br><h1>Invalid UserID OR Password !</h1>
	
	<% out.println("Entered Id: "+email+"\n");
	%><br>
	<%
     out.println("Entered Password: "+ password +"\n");
	conn.close();}  %>