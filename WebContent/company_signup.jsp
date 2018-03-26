<%@page import="java.sql.*"%>
<%
	String cname=request.getParameter("cname");
	String password=request.getParameter("password");
	String address=request.getParameter("address");
	String type=request.getParameter("type");




	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","0000");
	Statement st=conn.createStatement();
	int nora=st.executeUpdate("insert into corporate values('"+cname+"','"+password+"','"+address+"','"+type+"')");
	if(nora!=0)
	 {response.sendRedirect("company_login.html");}

%>