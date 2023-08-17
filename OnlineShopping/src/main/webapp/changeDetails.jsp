<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr {
	width: 70%;
}
</style>
</head>
<body>
	<%
	try {

		Connection connection = ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("select * from users where email='" + email + "' ");

		while (resultSet.next()) {
	%>
	<h3>
		Name :
		<%=resultSet.getString(1)%>
	</h3>
	<hr>
	<h3>
		Email :
		<%=resultSet.getString(2)%>
	</h3>
	<hr>
	<h3>
		Mobile Number :
		<%=resultSet.getString(3)%>
	</h3>
	<hr>
	<h3>
		Security Question :
		<%=resultSet.getString(4)%>
	</h3>
	<hr>
	<br>
	<br>
	<br>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
</html>