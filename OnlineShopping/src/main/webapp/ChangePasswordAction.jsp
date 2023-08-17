<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%

String email = session.getAttribute("email").toString();

String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmedPassword = request.getParameter("confirmPassword");

if(!confirmedPassword.equals(newPassword)){
	
	response.sendRedirect("changePassword.jsp?msg=notMatch");
	
}
else{
	
	int check = 0; 
	try{
		Connection connection  =ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();
		
		ResultSet resultSet = statement.executeQuery("select *from users where email='"+email+"' and password='"+oldPassword+"'"); 
	
		while(resultSet.next()){
			
			check = 1;
			statement.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
			
		}
		
		if(check == 0){
			response.sendRedirect("changePassword.jsp?msg=wrong"); 
		}
	} 
	catch(Exception e){
		System.out.println(e);
	}
}
%>