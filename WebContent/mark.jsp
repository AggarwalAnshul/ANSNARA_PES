<%@page import="java.sql.*" %>
<%

/*Some PreVariable Declarations to use Global Scope*/
String username="null";
String mobile="null";
String question="null";
String questiond="null";
String answer=null;
String choice="Not Attempted";
int counter=0;
int intvalue=0;
int lintvalue=0;
int score=0;
int percentage=0;
int max_score=0;
int max_entry=0;
int question_no=0;

max_entry=(Integer)session.getAttribute("max_entry");
/*--------------------------------------------------*/

/*Determining the Correct Questoin Table to work on */
String qtablename=session.getAttribute("exam")+"question";

/*-------------Establishing JDBC Connectivity--------*/
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db","root","0000");
Statement st=conn.createStatement();

/*----------Getting the response of the user of question ----*/
choice=request.getParameter("response");
String email=(String)session.getAttribute("email");
if(choice==null){
choice="not attempted";
}

ResultSet rs2=st.executeQuery("select * from student where email='"+email+"' ");
while(rs2.next() )
{ score=rs2.getInt("grade"); 
  out.println("initial grade:"+score);
  mobile=rs2.getString("mobile");
  username=rs2.getString("name");
  max_score=rs2.getInt("max_score");
  }

/*--------------Determining the user response table to work upon -------*/
String questionno=(String)session.getAttribute("question");
String tablename=username+mobile;


/* For fetching the correct answer of the question*/
ResultSet rs=st.executeQuery("select * from "+qtablename+" where question_no='"+questionno+"' ");
while(rs.next() )
{ answer=rs.getString("answer");
  questiond=rs.getString("question");
 question_no=rs.getInt("question_no");
}


switch(choice)
{ case "A": intvalue=1;
			break;
	
case "B": intvalue=2;
break;

case "C": intvalue=3;
break;

case "D": intvalue=4;
break;
default:intvalue=0;

}


switch(answer)
{ case "1": lintvalue=1;
			break;
	
case "2": lintvalue=2;
break;

case "3": lintvalue=3;
break;

case "4": lintvalue=4;
break;
default: lintvalue=0;

}



/*Storing the Response of the Candidate*/
counter+=1;
if (counter>max_entry)
{ %> <jsp:forward page="result.jsp" /> <%}

st.executeUpdate("insert into "+tablename+" values('"+question_no+"','"+choice+"','"+ answer+"','"+questiond+"') ");


 rs2=st.executeQuery("select * from student where email='"+email+"' ");
while(rs2.next() )
{ score=rs2.getInt("grade"); 
 out.println("initial grade:"+score);
  mobile=rs2.getString("mobile");}


/* if the student response matches with the correct answer*/
if( lintvalue == intvalue)
{out.println("intvalue: "+intvalue);
out.println("lintvale: "+ lintvalue);
	score = score+1;
}
st.executeUpdate("update student set grade='"+score+"'  where email='"+email+"' ");
st.executeUpdate("update student set max_score='"+max_entry+"'  where email='"+email+"' ");

/* 
rs2=st.executeQuery("select * from student where email='"+email+"' ");
while(rs2.next() )
{ score=rs2.getInt("grade");
 out.println("after Grade: "+score);}
 */
response.sendRedirect("question_page.jsp");  
conn.close();
%>

