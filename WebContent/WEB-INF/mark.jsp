<%@page import="java.sql.*" %>

<%  
int answer=0;
int intvalue=0;
int score=0;

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db","root","0000");
Statement st=conn.createStatement();
int question=Integer.parseInt(request.getParameter("question"));
String choice=request.getParameter("response");
String username=request.getParameter("saved_username");
String password=request.getParameter("saved_password");
String tablename=username+password;

/*Storing the Response of the Candidate*/
st.executeUpdate("insert into "+tablename+" values('"+question+"','"+choice+"') ");


/* For fetching the correct answer of the question*/
ResultSet rs=st.executeQuery("select * from question where question_no='"+question+"' ");
while(rs.next() )
{ answer=rs.getInt("answer"); 
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

}

ResultSet rs2=st.executeQuery("select * from student where name='"+username+"' ");
while(rs2.next() )
{ score=rs2.getInt("grade"); }

if( answer == intvalue)
	{ score = score+1; }
st.executeQuery("update table student set grade='"+score+"' ");


%>
