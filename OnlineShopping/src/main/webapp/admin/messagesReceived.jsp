<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div
		style="color: #CCCCFF; text-align: center; font-size: 30px; font-style: normal; font-family: monospace; margin-bottom: 20px">
		Messages Received <i class='fas fa-comment-alt'></i>
	</div>
	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Email</th>
				<th scope="col">Subject</th>
				<th scope="col">Body</th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				Connection connection = ConnectionProvider.getConnection();
				Statement statement = connection.createStatement();

				ResultSet resultSet = statement.executeQuery("select * from message");

				while (resultSet.next()) {
			%>
			<tr>
				<td><%=resultSet.getString(1)%></td>
				<td><%=resultSet.getString(2)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td><%=resultSet.getString(4)%></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>
		</tbody>
	</table>
	<br>
	<br>
	<br>

</body>
</html>