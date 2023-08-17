<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String email = session.getAttribute("email").toString();
	String mobileNumber = request.getParameter("mobileNumber");
	String password = request.getParameter("password"); 

	int check = 0;
	try{
		Connection connection =ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
		
		while(resultSet.next()){
			
			check = 1;
			statement.executeUpdate("update users set mobileNumber='"+mobileNumber+"' where email='"+email+"'");
			response.sendRedirect("changeMobileNumber.jsp?msg=done");
		}
		if(check == 0){
			
			response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>