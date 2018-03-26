<%@page import="java.sql.*"%>
<%! int count=0; %>
<!-- Login Page-->

<!DOCTYPE html>
<html lang="en">
<!-- Here We Go !! -->

<head>
<title>ANSNARA Evaluation Systems</title>
<meta charset="utf-8">
<meta name="viewport" 	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- For phone Functionalities and support -->
<link href="layout/styles/search_company.css" rel="stylesheet" type="text/css" 	media="all">
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
		<li style="float: left"><a href="index.html">ANSNARA Evaluation System</a></li>
		<li><a class="active" href="company_index.html">Company</a></li>
		<li><a href="admin_login.html">Admin</a></li>
		<li><a href="signup.html">Register</a></li>
		<li><a  href="Login.html">Login</a></li>
		<li><a href="index.html">About</a></li>
	</ul> 

	<!-- ---------------------------------------------------------------- -->


	<!-- Starting the main COde -->

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
	Statement st = conn.createStatement();
	

	String qualification = request.getParameter("qualification");
	String subject = request.getParameter("subject");
	String grade = request.getParameter("grades");
	String passout = request.getParameter("passout");
	String gender = request.getParameter("gender");

	String gender_query = "null";
	String passout_query = "null";
	String subject_query = "null";
	String qualification_query = "null";
	String grade_query = "null";

	/*Gender Query---------------------------------------------------------  */
	switch (gender) {
	case "male":
		gender_query = ("gender = 'male'");
		break;

	case "female":
		gender_query = ("gender = 'female' ");
		break;

	case "np":
		gender_query = ("gender = 'male' or gender='female'");
		break;
	}
	
	
	/*Qualification Query-------------------------------------------------------  */
   switch (qualification) {
	case "b.tech":
		qualification_query = ( "qualification = 'b.tech'");
		break;

	case "bca":
		qualification_query = ("qualification = 'bca' ");
		break;

	case "mca":
		qualification_query = ("qualification ='mca'");
		break;
		
	case "np":
		qualification_query = ("qualification = 'b.tech' or qualification='bca' or qualification='mca'");
		break;
	}
	
	/* Subject Query --------------------------------------------------------------- */


	   switch (subject) {
	case "java":
		subject_query = ( "exam = 'java'");
		break;

	case "c++":
		subject_query = ("exam = 'cplus' ");
		break;

	case "np":
		subject_query = ("exam ='java' or exam='cplus' ");
		break;

	}
	
	/*Passout Year Query--------------------------------------------------------------  */
	

	
		   switch (passout) {
	case "2014-2015":
		passout_query = ( "passout_year = '2014-2015'");
		break;

	case "2015-2016":
		passout_query = ( "passout_year = '2015-2016'");
		break;

	case "2016-2017":
		passout_query = ( "passout_year = '2016-2017'");
		break;

	case "2017-2018":
		passout_query = ( "passout_year = '2017-2018'");
		break;

	case "2018-2019":
		passout_query = ( "passout_year = '2018-2019'");
		break;

	case "2019-2020":
		passout_query = ( "passout_year = '2019-2020'");
		break;

	case "2020-2021":
		passout_query = ( "passout_year = '2020-2021'");
		break;
	
	case "np":
		passout_query = ( "passout_year = '2020-2021' or passout_year = '2019-2020'or passout_year = '2018-2019' or passout_year = '2017-2018' or passout_year = '2016-2017' or passout_year = '2015-2016' or passout_year = '2014-2015' ");
		break;
	 
	}
	
	

   /*Grades Query--------------------------------------------------------------  */
			

	
		   switch (grade) {
	case "50-60":
		grade_query = ( "percentage >= 50 and percentage<60");
		break;

	case "60-70":
		grade_query = ( "percentage >= 60 and percentage<70");
		break;

	case "70-80":
		grade_query = ( "percentage >= 70 and percentage<80");
		break;

	case "80-90":
		grade_query = ( "percentage >= 80 and percentage<90");
		break;

	case "90-100":
		grade_query = ( "percentage >= 90 and percentage<=100");
		break;

	case "np":
		grade_query = ( "percentage >= 90 and percentage<=100 or percentage >= 80 and percentage<90 or percentage >= 70 and percentage<80 or percentage >= 60 and percentage<70 or percentage >= 50 and percentage<60 or percentage >= 40 and percentage<50 or percentage >= 0  ");
		break;

	}

%>
<center>
<br><hr>
<a class="btn"  href="">Desired Records</a></center>
<hr>
<br>
<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/building.jpg')"><br><br><br>
<center>
	
<table style="width:90%">
	<tbody>
		
			<th>Name</th>
			<th>Mobile</th>
			<th>City</th>
			<th>Gender</th>
			<th>Grades</th>
			<th>Qualification</th>
			<th>Exam</th>
			<th>Passing Year</th>
			<th>Email</th>


			<%
			
		    ResultSet rs=st.executeQuery("select * from (select * from (select * from (select * from (select * from student where "+gender_query+") as first where "+qualification_query+")as second where "+subject_query+" )as third where "+passout_query+" )as fourth where "+grade_query+" ");
			
			while (rs.next()) {
				
				count+=1;
					String name = rs.getString("name");
					String mobile = rs.getString("mobile");
					String city = rs.getString("city");
					String sex = rs.getString("gender");
					String grades = rs.getString("grade");
					String qual = rs.getString("qualification");
					String exam = rs.getString("exam");
					String pyear = rs.getString("passout_year");
					String email = rs.getString("email");
			%>
		
		<tr>
			<td><%=name%></td>
			<td><%=mobile%></td>
			<td><%=city%></td>
			<td><%=sex%></td>
			<td><%=grades%></td>
			<td><%=qual%></td>
			<td><%=exam%></td>
			<td><%=pyear%></td>
			<td><%=email%></td>

		</tr>
		<%
			}
		%>
	</tbody>
</table></center><br><br></div>
<br>
<center><a class="btn" href="" text-align="center">Total Records Found <%=count %></a></center>

</body>
<%
count=0;
%>
</html>