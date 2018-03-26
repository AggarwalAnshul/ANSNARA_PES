<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="beans.Bean"%>
<!--Imported Java Bean  -->
<!-- Feeding the arrayList -->

<%

/* Setting up the Java Database Connection */
Class.forName("com.mysql.jdbc.Driver");
Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
Statement st = conn.createStatement();
String email=(String)session.getAttribute("email");

/* Validation for One Time Exam*/
ResultSet rs2=st.executeQuery("select * from student where email='"+email+"' ");
if( rs2.next() )
{ int value=rs2.getInt("exam_complete"); 
 	 if(value==1)
		{ %> <jsp:forward page="result.jsp"></jsp:forward> <% }	
}

String exam=request.getParameter("exam");
session.setAttribute("exam",exam);
st.executeUpdate("update student set exam='"+exam+"' where email='"+email+"' ");


ArrayList<Bean> quearray = new ArrayList<>(); /* Array list declarr*/
/* declaring score Variable */


//creating object of bean

String tablename=exam+"question";
/* Getting the Questions Fetched*/
ResultSet rs=st.executeQuery("select * from "+tablename+"");
while( rs.next() )
	{ Bean b = new Bean();
	  b.setQuestion(rs.getString("question"));
	  b.setOption1(rs.getString("option1"));
	  b.setOption2(rs.getString("option2"));
	  b.setOption3(rs.getString("option3"));
   	  b.setOption4(rs.getString("option4"));
	  b.setAnswer(rs.getString("answer"));
	  b.setQue_no(rs.getString("question_no"));	
	  
      quearray.add(b);
	
 }

session.setAttribute("quearray",quearray);
response.sendRedirect("question_page.jsp");
conn.close();

%>w