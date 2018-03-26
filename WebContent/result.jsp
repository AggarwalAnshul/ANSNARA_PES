<!-- Login Page-->

<!DOCTYPE html>
<html lang="en">
<!-- Here We Go !! -->

<% String exam="play" ;
Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","0000");
	Statement st=conn.createStatement();
    ResultSet rs3=st.executeQuery("select * from student where email='"+(String)session.getAttribute("email")+"' ");
	while(rs3.next() )
	{ exam=rs3.getString("exam"); }

%>
<head>
<title>ANSNARA Evaluation Systems</title>
<meta charset="utf-8">
<meta name="viewport" 	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- For phone Functionalities and support -->
<link href="layout/styles/login.css" rel="stylesheet" type="text/css" 	media="all">
<!-- connected the css file -->

<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: right;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #4CAF50;
}

.active {
	background-color: #4CAF50;
}
</style>

</head>
<body>


	<!-- ---------------------------------------------------------------- -->
	<ul>
		<li style="float: left"><a href="index.html">ANSNARA
				Evaluation System</a></li>
		<li><a href="company_index.html">Company</a></li>
		<li><a href="admin_login.html">Admin</a></li>
		<li><a href="signup.html">Register</a></li>
		<li><a class="active" href="Login.html">Login</a></li>
		<li><a href="index.html">About</a></li>
	</ul>


	<!-- ---------------------------------------------------------------- -->


	<!-- Starting the main COde -->
<p class="text" >Your Responses </p><br>
<div class="bgded overlay" 	style="background-image: url('images/demo/backgrounds/building.jpg')">
<a class="btn" href=""><%=exam%>Corner</a>

<br><br>
<%@ page import="java.sql.*"%>
<% 
	int result = 0;
String show="null";
String mobile="null";
String username="null";
int max_score=0;
String value="null";
float percentage=0.0f;


	String email=(String)session.getAttribute("email");
	String password=(String)session.getAttribute("password");
	
	ResultSet rs=st.executeQuery("select * from student where email='"+email+"' and password='"+password+"'  ");
	while( rs.next() )
	{ result=rs.getInt("grade");
	  mobile=rs.getString("mobile");
	  username=rs.getString("name");
	  max_score=rs.getInt("max_score");  
	}
	
	percentage=((float)(result*100)/(float)max_score);
	st.executeUpdate("update student set percentage="+percentage+" where email='"+email+"' ");	
	st.executeUpdate("update student set exam_complete=1 where email='"+email+"' ");
	String tablename=username+mobile;
	
	 %>
<a class="btn" href="">Welcome <%=username%></a><br>
	<br><table>
		<tbody>
<tr>
	<td>Question No.</td>
	<td>Question</td>
	<td>Correct Answer</td>
	<td>Your response</td>
<%  
ResultSet rs2=st.executeQuery("select * from "+tablename+" ");
	while(rs2.next())
	{int first=rs2.getInt("question_no");
	String fourth=rs2.getString("question");
	String second=rs2.getString("answer");
	String third=rs2.getString("response");	
	
	
	switch(second)
	{ case "1": value="A";
				break;
		
	case "2": value="B";
	break;

	case "3": value="C";
	break;

	case "4": value="D";
	break;

	}


	
		%>
			<tr>
				<td><%= first %></td>
			    <td><%= fourth %></td>
				<td><%= value %></td>
				<td><%= third %></td>
			</tr>
	<% } %>
			</tbody>
	</table>	
	<center>
<a class="btn" href="">Your score is: <%= result %>/<%=max_score %></a>
	</center>
	<br><br><br>
	</div>
	<!-- / main body -->

	<!-- ---------------------------------------------------------------- -->

	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>