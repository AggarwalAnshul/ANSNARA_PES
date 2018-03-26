<%@ page import="java.sql.*"%>

		
		<%
			String newq = request.getParameter("que");
			String ans = request.getParameter("ans");
			String op1 = request.getParameter("op1");
			String op2 = request.getParameter("op2");
			String op3 = request.getParameter("op3");
			String op4 = request.getParameter("op4");
			String no = request.getParameter("no");

			/* Adding the jdbc connectivity  */
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
			Statement st = conn.createStatement();
			int result = st.executeUpdate("insert into cplusquestion values( '" + newq + "', '" + op1 + "', '" + op2
					+ "', '" + op3 + "', '" + op4 + "', '" + no + "','" + ans + "') ");


if(result!=0)
{  %>
  <jsp:forward page="admin_index.html"/>
  <% } else
  %> <jsp:forward page="add_question.jsp"/>
  
	