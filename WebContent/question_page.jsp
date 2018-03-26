

<!DOCTYPE html>
<html lang="en">
<head>


<script language="javascript">
var Timer;
var TotalSeconds;

function CreateTimer(TimerID, Time) 
{
    Timer = document.getElementById(TimerID);
    TotalSeconds = Time;
    UpdateTimer()
    window.setTimeout("Tick()", 1000);
}

function Tick() 
{
    TotalSeconds -= 1;
    if(TotalSeconds ==-1)
      {
    	window.location="mark.jsp";
      }
    
   else
     {
    UpdateTimer()
    window.setTimeout("Tick()", 1000);
     }
}

function UpdateTimer() {
    Timer.innerHTML = TotalSeconds;
}
</script>
    

<!-- Style Template for Top Navigation Bar-------------------------------  -->
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

li a:hover:not(.active) {
    background-color: #4CAF50;
}

.active {
    background-color: #4CAF50;
     }

</style>




<!-- ----------------Style Template for Navigation Bar Ends-------------- -->

<title>ANSNARA Evaluation Systems</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">   <!-- For phone Functionalities and support -->
<link href="layout/styles/question.css" rel="stylesheet" type="text/css" media="all">
<!-- connected the css file -->

</head>
<body id="top" bgcolor="black">



 <!-- ----------------------------------Navigation Bar------------------------------ -->
<ul>	
        <li style="float:left"><a href="index.html">ANSNARA Evaluation System</a></li>
		<li><a href="company_index.html">Company</a></li>
		<li><a href="admin_index.html">Admin</a></li>
		<li><a class="active" href="signup.html">Register</a></li>
		<li><a href="Login.html">Login</a></li>
		<li><a href="index.html">About</a></li>
</ul>


<!-- ------------------------End Of Navigation Bar---------------------------------- -->


<!-- Starting the main COde -->
<br>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="beans.Bean"%>

<%! int count = 0; %>   <!-- Counter for one time only validation -->

<% 

/*Establishing Connectoin with JDBC*/
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/db", "root", "0000");
Statement st = conn.createStatement();
/* --------------------------------------------------------------------------------------- */

String email=(String)session.getAttribute("email"); /*Calliing the primary key*/


/* Validation for One Time Exam*/
ResultSet rs2=st.executeQuery("select * from student where email='"+email+"' ");
if(rs2.next() )
{ int value=rs2.getInt("exam_complete"); 
 	if(value==1)
		{ %> <jsp:forward page="result.jsp"></jsp:forward> <% }
}
/*----------------------------------------------------------------------------------------------*/


/*------------------------Fetching the ArrayList From the Session -------------------------------*/
	ArrayList<Bean> quearray = (ArrayList) session.getAttribute("quearray");
	Bean b = new Bean();
	String exam=(String)session.getAttribute("exam");
	String tablename=exam+"question";
	String value="null";


/* ----------------------------Redirectig to Result Page on Test Completion --------------------- */
 session.setAttribute("max_entry",quearray.size() );
  if ( count == quearray.size() ) 
	{ 	count = 0;
%>
<jsp:forward page="result.jsp" />
<%
	}
/* ----------------------------****----------------------------------------------------------------*/


/*Fetching the BeanBag from the ArrayList based on the count No------------------------------------*/
    b = quearray.get(count);

	String question= b.getQuestion();   /*--------obtaining the question from the bean bag-------*/
	String option1 = b.getOption1();
	String option2 = b.getOption2();
	String option3 = b.getOption3();
	String option4 = b.getOption4();
	String answer  = b.getAnswer();
	String que_no  = b.getQue_no();

	session.setAttribute("question", que_no);
	count = count + 1;
	
/* ------------------------------------------------------------------------------------------------ */
/* Validation for One Time Exam*/
ResultSet rs4=st.executeQuery("select * from student where email='"+email+"' ");
if(rs4.next() )
{ int value2=rs4.getInt("exam_complete"); 
 	if(value2==1)
		{ %> <jsp:forward page="result.jsp"></jsp:forward> <% }
}
/*----------------------------------------------------------------------------------------------*/	
%>

<!-- ------------------------------Displaying The Question ------------------------------------ -->
<form action="mark.jsp" method="post">
<div>	
	<div style:display="inline">
	<br>
	<p font-size="xx-large" >	<%="Que No: " + que_no + ")" %></p>
	<p class="heading"> <%=question%></p>
	
	<p class="option">
	<table><tbody>
	<tr>
	<td><input type="radio" name="response"  class="option" value="A" ><%=option1%></td>
	<td><input type="radio" name="response" class="option" value="B" ><%=option2%></td>
	</tr>
	
	<tr></tr>
	<tr></tr>
	
	<tr>
	<td><input type="radio" name="response" class="option" value="C" ><%=option3%></td>
	<td><input type="radio" name="response" class="option" value="D" ><%=option4%></td>
	</tr>
	</p>
</tbody>
</table>	

<br>
<p>Time Left:</p>
</div>
</div>


	<div id='timer'>
	<script type="text/javascript">window.onload = CreateTimer("timer", 10);</script>
	<br>
	</div>
	
	
	
	
	
	<center><input type="submit" value="NEXT"></center>
</form>


<br/><br/>
    <!-- / main body -->
    
    
    



<!-- ---------------------------------------------------------------- -->



<!-- ----------------------------------------------------------------- -->

<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>