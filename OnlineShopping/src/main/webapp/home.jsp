<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DevMarT : Home Page</title>

<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: #CCCCFF; text-align: center; font-size: 30px; font-style: inherit; margin-bottom: 15px;">
		HOME <i class="fa fa-institution" style="margin-left: 10px";  ></i>
	</div>
	<%
	String msg = request.getParameter("msg");

	if ("added".equals(msg)) {
	%>
	<h3 class="alert">Product added successfully!</h3>

	<%
	}
	%>

	<%
	if ("exist".equals(msg)) {
	%>

	<h3 class="alert">Product already exist in you cart! Quantity
		increased!</h3>
	<%
	}
	%>


	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Something Went Wrong!</h3>

	<%
	}
	%>

	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>

				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				Connection connection = ConnectionProvider.getConnection();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery("select * from product where active='Yes'");

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
				<td><a href="AddToCartAction.jsp?id=<%=rs.getString(1)%>">Add
						to cart <i class='fas fa-cart-plus'></i>
				</a></td>
			</tr>

			<%
			}
			}

			catch (Exception e) {
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