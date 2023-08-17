<%@page import="com.connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%

String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country =request.getParameter("country");
String mobileNumber= request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId =request.getParameter("transactionId");
String status = "bill";

try{
	
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement pstmt = connection.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	
	pstmt.setString(1,address);
	pstmt.setString(2, city);
	pstmt.setString(3, state);
	pstmt.setString(4, country);
	pstmt.setString(5, mobileNumber);
	pstmt.setString(6, email);
	pstmt.executeUpdate();
	
	PreparedStatement preparedStatement = connection.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
	preparedStatement.setString(1, address);
	preparedStatement.setString(2, city);
	preparedStatement.setString(3, state);
	preparedStatement.setString(4, country);
	preparedStatement.setString(5, mobileNumber);
	preparedStatement.setString(6, paymentMethod);
	preparedStatement.setString(7, transactionId);
	preparedStatement.setString(8, status);
	preparedStatement.setString(9, email);
	
	preparedStatement.executeUpdate();
	response.sendRedirect("bill.jsp");
	
}
catch(Exception e){
	System.out.println(e);  
}
%>
