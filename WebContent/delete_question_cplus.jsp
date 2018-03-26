<!-- Login Page-->
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<!-- Here We Go !! -->

<head>
<title>ANSNARA Evaluation Systems</title>
<meta charset="utf-8">
<meta name="viewport" 	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- For phone Functionalities and support -->
<link href="layout/styles/delete.css" rel="stylesheet" type="text/css" 	media="all">
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
<body >


	<!-- ---------------------------------------------------------------- -->
	<ul>
		<li style="float: left"><a href="index.html">ANSNARA
				Evaluation System</a></li>
		<li><a href="company_index.html">Company</a></li>
		<li><a href="admin_index.html">Admin</a></li>
		<li><a href="signup.html">Register</a></li>
		<li><a class="active" href="Login.html">Login</a></li>
		<li><a href="index.html">About</a></li>
	</ul>


	<!-- --------------------------------JAVA Delete Question-------------------------------- -->


	<!-- Starting the main COde -->
	<p class="text"> Delete Question(C++) </p>
	<!--  Displaying Available Questions -->
<div class="bgded overlay" style="background-image: url('images/demo/backgrounds/question.jpg')">
	
	<!--  Displaying Available Questions -->
	<%@ page import="java.sql.*"%>
	<%
		int i=0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from cplusquestion");
		while (rs.next()) {
			i+=1;
			String queno = rs.getString("question_no");
			String question = rs.getString("question");
	%>
	<p class="delete"><br>
	Que:<%= queno    %>
	<%=   question %>
 </p>
 <%} %>
 <center>
  <form action="process_delete_cplus.jsp" method="get">
     <input type="numbers" id="deleteq" align="center" name="deleteq" placeholder="Enter Question No..">
     <input type="submit" placeholder="Delete" name="delete"><br>
  </center>
 
	
  <!--  ----------------------Displaying Questions FInished------------------------------------- -->
  
 
	<!-- / main body -->

	<!-- ---------------------------------------------------------------- -->

	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>