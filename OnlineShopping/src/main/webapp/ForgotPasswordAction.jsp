

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("number");
String securityQuestion = request.getParameter("SecurityQuestions");
String answer = request.getParameter("answer");
String newPassword =request.getParameter("newPassword");

int flag = 0;

try{
	Connection connection =ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet rs = statement.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+mobileNumber+"' and SecurityQuestions='"+securityQuestion+"' and answer='"+answer+"'");
	
	while(rs.next()){
		
		flag = 1;
		statement.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	
	if(flag == 0 ){
		
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e ){
	
	System.out.println(e);
}

%>