<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");

try {
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement pstmt = connection
	.prepareStatement("update users set address=?,city=?,state=?,country=? where email=?");

	pstmt.setString(1, address);
	pstmt.setString(2, city);
	pstmt.setString(3, state);
	pstmt.setString(4, country);
	pstmt.setString(5, email);

	pstmt.executeUpdate();

	response.sendRedirect("addChangeAddress.jsp?msg=valid");

}

catch (Exception exception) {
	System.out.println(exception);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>