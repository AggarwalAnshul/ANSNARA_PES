<!-- Login Page-->

<!DOCTYPE html>
<html lang="">
<!-- Here We Go !! -->
<head>
<title>ANSNARA Evaluation Systems</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- For phone Fucntionalities and support -->
<link href="layout/styles/search_student.css" rel="stylesheet" type="text/css"
	media="all">
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
<body id="top">


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


	<%@ page import="java.sql.*"%>
	<%
		String name = request.getParameter("search_name");
	%><br><br><br><br><%
		out.println("Search Query: "+name);
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
		Statement st = conn.createStatement();
	%>
	<table>
		<tbody>
		<th>Name</th>
		<th>type</th>
		<th>address</th>
		
			<%
				ResultSet rs = st.executeQuery("select * from corporate where name='" + name + "' ");
				while (rs.next()) {
				     String   cname = rs.getString("name");
					String type = rs.getString("type");
					String address = rs.getString("address");
				%>
			<tr>
				<td><%=cname%></td>
				<td><%=type%></td>
				<td><%=address%></td>
				
			</tr>
		</tbody>
	</table>
	<%
		}
	%>


	<!-- ---------------------------------------------------------------- -->

	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>