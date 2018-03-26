<%@page import="java.sql.*"%>
<!-- Login Page-->

<!DOCTYPE html>
<html lang="en">
<!-- Here We Go !! -->
<head>
<title>ANSNARA Evaluation Systems</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">   <!-- For phone Fucntionalities and support -->
<link href="layout/styles/login.css" rel="stylesheet" type="text/css" media="all">
<!-- connected the css file -->

</head>
<body id="top">

<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ---------------------------------------------------------------- -->
    <div class="fl_left">
      <ul class="nospace">
        <li><i class="fa fa-home"></i> ANSNARA Evaluation Systems</li>
      </ul>
    </div>
    <div class="fl_right">
      <ul class="nospace">
        <li><a href="index.html"><i class="fa fa-lg fa-home"></i></a></li>
        <li><a href="index.html">About</a></li>
        <li><a href="signup.html">Register</a></li>
		<li><a href="Login.html">Login</a></li>
		<li><a href="result.jsp">Results</a></li>
      </ul>
    </div>
  </div>
</div>

<!-- ---------------------------------------------------------------- -->

    <!-- Starting the main COde -->
<p class="text" >Text Completed ! </p>
<% Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","0000");
	Statement st=conn.createStatement();
	st.executeUpdate("update student set exam_complete=1 where name='"+session.getAttribute("saved_username")+"' ");
	%>
<a class="btn" href="reset_password.html">Proceed to Result</a>

    <!-- / main body -->

<!-- ---------------------------------------------------------------- -->

<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>