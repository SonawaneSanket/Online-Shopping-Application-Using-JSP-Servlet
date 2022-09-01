<%@page import="db.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");

try{
	Connection conn=ConnectionProvider.getConn();
	PreparedStatement pd=conn.prepareStatement("update users set address=?,city=?,state=?,country=? where email=?");
	pd.setString(1, address);
	pd.setString(2, city);
	pd.setString(3, state);
	pd.setString(4, country);
	pd.setString(5, email);
	pd.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}

%>