

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
	
String name = request.getParameter("name");
String email = request.getParameter("email");
String number = request.getParameter("number");
String securityQuestion = request.getParameter("SecurityQuestions");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city	 = "";
String state = "";
String country ="";

try{
	
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement pstmt = connection.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, number);
	pstmt.setString(4, securityQuestion);
	pstmt.setString(5, answer);
	pstmt.setString(6, password);
	pstmt.setString(7, address);
	pstmt.setString(8, city);
	pstmt.setString(9, state);
	pstmt.setString(10, country);

	pstmt.executeUpdate();
	
	response.sendRedirect("signup.jsp?msg=valid");
}

catch(Exception e){

	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>