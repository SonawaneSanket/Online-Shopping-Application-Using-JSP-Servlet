<%@page import="com.connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
	String email = session.getAttribute("email").toString();
	String subject = request.getParameter("subject");
	String body = request.getParameter("body");
	
	try{
		Connection connection = ConnectionProvider.getConnection();
		PreparedStatement pstmt = connection.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
		
		pstmt.setString(1, email);
		pstmt.setString(2, subject);
		pstmt.setString(3, body);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("messageUs.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("messageUs.jsp?msg=invalid");	
	}
	
%>