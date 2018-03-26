<!-- Login Page-->

<!DOCTYPE html>
<html lang="en">
<!-- Here We Go !! -->

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
<body bgcolor="black">


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


	<!-- ---------------------------------------------------------------- -->


	<!-- Starting the main COde -->
	<p class="text">Please Login !</p>

	<div class="bgded overlay"
		style="background-image: url('images/demo/backgrounds/building.jpg')">
		<form action="login.jsp" method="post">

			<br>
			<br> <label for="email">Email ID</label> <input type="email"
				id="email" name="email" placeholder="Emial ID here..."> <label
				for="password">Password</label> <input type="password" id="password"
				name="password" placeholder="password...">

			<center>
			<input type="submit" value="Submit">
			</center>
		</form>


		<center>
			<a class="btn" href="reset_password.html">Forget Password</a>
		</center>
		<br>
		<br>
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