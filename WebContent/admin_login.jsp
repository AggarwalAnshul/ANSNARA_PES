
<!--  ---------------------------------- Java Server Page Code --------------------------------------------- -->


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");


Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
Statement st=conn.createStatement();

ResultSet rs= st.executeQuery("select * from admin where username='"+username+"' and password ='"+password+"' ");
if(rs.next()){
%>
<jsp:forward page="admin_index.html"/>
<%
conn.close(); }

else
	{%>
	
	<br><h1>Invalid UserID OR Password !</h1>
	
	<% out.println("Entered Id: "+username+"\n");
	%><br>
	<%
     out.println("Entered Password: "+ password +"\n");
	conn.close();
	}  %>