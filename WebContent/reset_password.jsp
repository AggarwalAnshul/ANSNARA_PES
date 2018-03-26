<%@page import="java.sql.*"%> 
<% String check_email=request.getParameter("verify_email");
String check_mobile=request.getParameter("verify_no");
String new_password=request.getParameter("new_password");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
Statement st=conn.createStatement();
PreparedStatement pst= conn.prepareStatement("update student set password= ? where email=? and  mobile=? ");
pst.setString(1,new_password);
pst.setString(2,check_email);
pst.setString(3,check_mobile);
int result=pst.executeUpdate();
if(result!=0)
{
%>
<b>Password Changed Successfully</b>
<a href="Login.html"><i>click to COntinue</i></a>
<% 
conn.close();} else {
%>
<b>Invalid Phone no. or UserID</b>
<br/>Please Try Again ...
<%  conn.close();} %>
