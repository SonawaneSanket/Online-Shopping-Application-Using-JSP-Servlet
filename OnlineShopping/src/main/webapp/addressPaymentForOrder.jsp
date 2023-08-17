<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
	if (history.go(1) != null) {
		history.go(1);
	}
</script>
</head>
<body>
	<br>
	<table>
		<thead>
			<%
			String email = session.getAttribute("email").toString();
			int total = 0;
			int serialNumber = 0;

			try {
				Connection connection = ConnectionProvider.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement
				.executeQuery("select sum(total) from cart where email='" + email + "' and address is NULL");

				while (resultSet.next()) {

					total = resultSet.getInt(1);
				}
			%>
			<tr>
				<th scope="col"><a href="myCart.jsp"><i
						class='fas fa-arrow-circle-left'> Back</i></a></th>
				<th scope="col" style="background-color: yellow;">Total: <i
					class="fa fa-inr"></i> <%
 out.println(total);
 %></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th scope="col">Sr .No</th>
				<th scope="col">Product Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Sub Total</th>
			</tr>
		</thead>
		<tbody>

			<%
			ResultSet resultSet1 = statement
					.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='" + email
					+ "' and cart.address is NULL");
			while (resultSet1.next()) {
			%>
			<tr>
				<%
				serialNumber = serialNumber + 1;
				%>
				<td>
					<%
					out.println(serialNumber);
					%>
				</td>
				<td><%=resultSet1.getString(2)%></td>
				<td><%=resultSet1.getString(3)%></td>
				<td><i class="fa fa-inr"></i><%=resultSet1.getString(4)%></td>
				<td><%=resultSet1.getString(8)%></td>
				<td><i class="fa fa-inr"></i> <%=resultSet1.getString(10)%></td>
			</tr>
			<%
			}
			ResultSet resultSet2 = statement.executeQuery("select * from users where email='" + email + "'");
			while (resultSet2.next()) {
			%>
		</tbody>
	</table>

	<hr style="width: 100%">

	<form action="AddressPaymentForOrderAction.jsp" method="post">



		<div class="left-div">
			<h3>Enter Address</h3>
			<input class="input-style" type="text"
				placeholder="Enter Delivery Address" name="address"
				value="<%=resultSet2.getString(7)%>" required>
		</div>

		<div class="right-div">
			<h3>Enter City</h3>
			<input class="input-style" type="text" placeholder="Enter City Name"
				name="city" value="<%=resultSet2.getString(8)%>" required>
		</div>

		<div class="left-div">
			<h3>Enter State</h3>
			<input class="input-style" type="text" placeholder="Enter State Name"
				name="state" value="<%=resultSet2.getString(9)%>" required>
		</div>

		<div class="right-div">
			<h3>Enter Country</h3>
			<input class="input-style" type="text"
				placeholder="Enter Country Name" name="country"
				value="<%=resultSet2.getString(10)%>" required>
		</div>

		<hr style="width: 100%">
		<div class="left-div">

			<h3>Select way of Payment</h3>

			<select class="input-style" name="paymentMethod">
				<option value="Cash On Delivery">Cash On Delivery</option>
				<option value="Online Payment">Online Payment</option>
			</select>
		</div>

		<div class="right-div">
			<h3>Pay online on this DevMarT</h3>
			<input class="input-style" type="text"
				placeholder="Enter transaction ID" name="transactionId" >
			<h3 style="color: #B0C4DE">*Enter transaction Id here after
				payment</h3>
		</div>
		<hr style="width: 100%">

		<div class="left-div">
			<h3>Mobile Number</h3>
			<input class="input-style" type="text"
				placeholder="Enter Mobile Number" name="mobileNumber"
				value="<%=resultSet2.getString(3)%>" required>

		</div>
		<div class="right-div">
			<h3 style="color: #B0C4DE">*If you enter the wrong transaction
				id then your order will be Canceled!</h3>
			<button class="button" type="submit">
				Proceed to Payment Page <i class='far fa-arrow-alt-circle-right'></i>
			</button>

		</div>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
	<br>
	<br>
	<br>

</body>
</html>