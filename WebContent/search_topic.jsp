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

</head>
<body id="top">

	<div class="wrapper row0">
		<div id="topbar" class="hoc clear">
			<!-- ---------------------------------------------------------------- -->
			<div class="fl_left">
				<ul class="nospace">
					<li><i class="fa fa-home"></i> ANSNARA Evaluation Sytems</li>
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

	<%@ page import="java.sql.*"%>
	<%
		String topic = request.getParameter("search_topic");
	%><br><br><br><br><%
		out.println("Search Query: "+topic);
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
		Statement st = conn.createStatement();
	%>
	<table>
		<tbody>
		<th>Name</th>
		<th>Mobile</th>
		<th>City</th>
		<th>Gender</th>
		<th>Qualification</th>
		<th>Grade</th>
		<th>Email</th>
		<th>Passout Year</th>
		
			<%
				ResultSet rs = st.executeQuery("select * from student where exam='" +topic+ "' ");
				while (rs.next()) {
					String name = rs.getString("name");
					String mobile = rs.getString("mobile");
					String city = rs.getString("city");
					String gender = rs.getString("gender");
					String qualification = rs.getString("qualification");
					String grade = rs.getString("grade");
					String email = rs.getString("email");
					String passout_year = rs.getString("passout_year");
			%>
			<tr>
				<td><%=name%></td>
				<td><%=mobile%></td>
				<td><%=city%></td>
				<td><%=gender%></td>
				<td><%=qualification%></td>
				<td><%=grade%></td>
				<td><%=email%></td>
				<td><%=passout_year%></td>
			</tr>
	
	<%
		}
	%>
	</tbody>
	</table>

	<!-- ---------------------------------------------------------------- -->

	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>