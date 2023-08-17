

<%@page import="java.sql.*"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
	
String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@gmail.com".equals(email) && "admin".equals(password)){
	
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}

else{
	
	int flag = 0 ;
	try{
		Connection connection = ConnectionProvider.getConnection();
		Statement  statement = connection.createStatement();
		 
		ResultSet rs = statement.executeQuery("select * from users where email='"+email+"' and password='"+password+"' ");
		
		while(rs.next()){
			
			flag = 1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(flag == 0){			
			response.sendRedirect("login.jsp?msg=notexist");
		}
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
		
	}
	
}
%>
