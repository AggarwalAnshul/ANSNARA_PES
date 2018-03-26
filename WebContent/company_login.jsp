<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
String cname=request.getParameter("cname");
String password=request.getParameter("password");

/*Storing userinformation*/
session.setAttribute("cname",cname);
session.setAttribute("password",password);



Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
Statement st=conn.createStatement();

ResultSet rs= st.executeQuery("select * from corporate where name='"+cname+"' and password ='"+password+"' ");
if(rs.next()){
%>
<jsp:forward page="company_dashboard.html"/>
<%
conn.close(); }

else
	{%>
	
	<br><h1>Invalid CompanyName OR Password !</h1>
	
	<% out.println("Entered Id: "+cname+"\n");
	%><br>
	<%
     out.println("Entered Password: "+ password +"\n");
	conn.close();}  %>