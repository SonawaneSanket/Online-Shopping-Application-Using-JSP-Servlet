<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String securityQuestion = request.getParameter("securityQuestion");
String newAnswer = request.getParameter("newAnswer");
String passsword = request.getParameter("password");

int check = 0;

try {
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();

	ResultSet resultSet = statement
	.executeQuery("select * from users where email='" + email + "' and password='" + passsword + "'");

	while (resultSet.next()) {

		check = 1;
		statement.executeUpdate("update users set securityQuestion='" + securityQuestion + "',answer='" + newAnswer
		+ "' where email='" + email + "' ");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");

	}

	if (check == 0) {
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}
} catch (Exception e) {
	System.out.println(e);
}
%>