<%@ page import="java.sql.*" %>
<%
	String delete =request.getParameter("deleteq");


	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "0000");
	Statement st = conn.createStatement();
	
	st.executeUpdate("delete from javaquestion where question_no='" + delete + "' ");
	/* response.sendRedirect("delete_question.jsp"); */
%>
<jsp:forward page="delete_question.jsp"/>
