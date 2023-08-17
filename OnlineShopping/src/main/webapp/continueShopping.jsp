<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String email =session.getAttribute("email").toString();
	String status ="processing";
	
	try{
		Connection connection = ConnectionProvider.getConnection();
		PreparedStatement pstmt = connection.prepareStatement("update cart set status=? where email=? and status='bill'");
		
		pstmt.setString(1, status);
		pstmt.setString(2, email);
		
		pstmt.executeUpdate();
		response.sendRedirect("home.jsp");
	}
	catch(Exception e){
		
		System.out.println(e); 
	}
%>