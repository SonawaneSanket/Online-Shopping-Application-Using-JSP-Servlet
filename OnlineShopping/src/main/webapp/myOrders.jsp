<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
	<div
		style="color: #CCCCFF; text-align: center; font-size: 30px; font-style: normal; font-family: monospace; margin-bottom: 20px;">
		My Orders <i class='fab fa-elementor'></i>
	</div>
	<table>
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Product Name</th>
				<th scope="col">category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th scope="col">Quantity</th>
				<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
				<th scope="col">Order Date</th>
				<th scope="col">Expected Delivery Date</th>
				<th scope="col">Payment Method</th>
				<th scope="col">Status</th>

			</tr>
		</thead>
		<tbody>
			<%
			int serialNumber = 0;
			try {

				Connection connection = ConnectionProvider.getConnection();
				Statement statement = connection.createStatement();

				ResultSet resultSet = statement
				.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"
						+ email + "' and cart.orderDate is not NULL");

				while (resultSet.next()) {

					serialNumber = serialNumber + 1;
			%>
			<tr>
				<td>
					<%
					out.println(serialNumber);
					%>
				</td>
				<td><%=resultSet.getString(17)%></td>
				<td><%=resultSet.getString(18)%></td>
				<td><i class="fa fa-inr"></i><%=resultSet.getString(19)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td><i class="fa fa-inr"></i> <%=resultSet.getString(5)%></td>
				<td><%=resultSet.getString(11)%></td>
				<td><%=resultSet.getString(12)%></td>
				<td><%=resultSet.getString(13)%></td>
				<td><%=resultSet.getString(15)%></td>
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