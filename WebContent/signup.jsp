<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>

<% 
String username=request.getParameter("username");
String lastname=request.getParameter("lastname");
String password=request.getParameter("password");
String c_password = request.getParameter("c_password");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String city=request.getParameter("city");
String qualification=request.getParameter("qualification");
String passout=request.getParameter("passout");


Date date= new Date();


Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","0000");
Statement st=conn.createStatement();
String tablename=username+phone;



/*Validating password and confirm passwords are equal  */
if( !c_password.equals(password) )
{ %> <h4>Passwords do not match ! </h1>
<jsp:forward page="signup.html" />
<%}

/* Validatin the accounts */
ResultSet rs = st.executeQuery("select * from student where email='"+email+"' " );
if(rs.next())
{ %> <h4>Already Signed UP! </h1>
      <jsp:forward page="Login.html" />
      <%} else 
      {
    	  st.executeUpdate("create table "+tablename+"(question_no int, response varchar(30),answer varchar(15),question varchar(500) )");		
    	  int result=st.executeUpdate("insert into student values('"+username+"', '"+password+"', '"+phone+"','"+city+"','"+gender+"', '"+qualification+"',null,null,null,'"+passout+"', '"+email+"',0,0,0,'"+lastname+"')");
			session.setAttribute("saved_mobile",phone);
/*Validating the accounts*/

if(result!=0)
{
%>
<jsp:forward page="Login.html"/>
<% }  conn.close(); }%>