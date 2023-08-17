<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style {
	width: 25%;
}
</style>
</head>
<body>
	<div
		style="color: #CCCCFF; text-align: center; font-size: 30px; font-style: normal; font-family: monospace; margin-bottom: 20px">
		Orders Received <i class="fas fa-archive"></i>
	</div>
	<%
	String msg = request.getParameter("msg");

	if ("cancel".equals(msg)) {
	%>
	<h3 class="alert">Order Cancel Successfully!</h3>
	<%
	}
	%>
	<%
	if ("delivered".equals(msg)) {
	%>
	<h3 class="alert">Successfully Updated!</h3>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<%
	}
	%>

	<table id="customers">
		<tr>
			<th>Mobile Number</th>
			<th scope="col">Product Name</th>
			<th scope="col">Quantity</th>
			<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Country</th>
			<th scope="col">Order Date</th>
			<th scope="col">Expected Delivery Date</th>
			<th scope="col">Payment Method</th>
			<th scope="col">T-ID</th>
			<th scope="col">Status</th>
			<th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
			<th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
		</tr>
		<%
		int serialNum = 0;
		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery(
			"select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing'");

			while (resultSet.next()) {
				serialNum = serialNum + 1;
		%>

		<tr>
			<td><%=resultSet.getString(10)%></td>
			<td><%=resultSet.getString(17)%></td>
			<td><%=resultSet.getString(3)%></td>
			<td><i class="fa fa-inr"></i><%=resultSet.getString(5)%></td>
			<td><%=resultSet.getString(6)%></td>
			<td><%=resultSet.getString(7)%></td>
			<td><%=resultSet.getString(8)%></td>
			<td><%=resultSet.getString(9)%></td>
			<td><%=resultSet.getString(11)%></td>
			<td><%=resultSet.getString(12)%></td>
			<td><%=resultSet.getString(13)%></td>
			<td><%=resultSet.getString(14)%></td>
			<td><%=resultSet.getString(15)%></td>
			<td><a
				href="cancelOrderAction.jsp?id=<%=resultSet.getString(2)%>&email=<%=resultSet.getString(1)%>">Cancel
					<i class='fas fa-window-close'></i>
			</a></td>
			<td><a
				href="deliveredOrderAction.jsp?id=<%=resultSet.getString(2)%>&email=<%=resultSet.getString(1)%>">Delivered
					<i class='fas fa-dolly'></i></i>
			</a></td>
		</tr>
		<%
		}
		} catch (Exception e) {

		}
		%>
	</table>
	<br>
	<br>
	<br>

</body>
</html>