<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
	<%
	String email = session.getAttribute("email").toString();

	try {

		int total = 0;
		int serialNum = 0;

		Connection connection = ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement
		.executeQuery("select sum(total) from cart where email='" + email + "' and status='bill'");

		while (resultSet.next()) {

			total = resultSet.getInt(1);
		}

		ResultSet resultSet2 = statement
		.executeQuery("select * from users inner join cart where cart.email='" + email + "'and cart.status='bill'");

		while (resultSet2.next()) {
	%>
	<h3>Online shopping Bill DevMarT</h3>
	<hr>
	<div class="left-div">
		<h3>
			Name:
			<%=resultSet2.getNString(1)%>
		</h3>
	</div>
	<div class="right-div-right">
		<h3>
			Email:
			<%
		out.println(email);
		%>
		</h3>
	</div>
	<div class="right-div">
		<h3>
			Mobile Number: <%=resultSet2.getString(20)%>
		</h3>
	</div>

	<div class="left-div">
		<h3>
			Order Date: <%=resultSet2.getString(21)%>
		</h3>
	</div>
	<div class="right-div-right">
		<h3>
			Payment Method: <%=resultSet2.getString(23)%>
		</h3>
	</div>
	<div class="right-div">
		<h3>
			Expected Delivery: <%=resultSet2.getString(22)%></h3>
	</div>

	<div class="left-div">
		<h3>
			Transaction Id: <%=resultSet2.getString(24)%>
		</h3>
	</div>
	<div class="right-div-right">
		<h3>
			City: <%=resultSet2.getString(17)%>
		</h3>
	</div>
	<div class="right-div">
		<h3>
			Address: <%=resultSet2.getString(16)%>
		</h3>
	</div>

	<div class="left-div">
		<h3>
			State: <%=resultSet2.getString(18)%>
		</h3>
	</div>
	<div class="right-div-right">
		<h3>
			Country: <%=resultSet2.getString(19)%>
		</h3>
	</div>

	<hr>
	<%
	break;
	}
	%>


	<br>

	<table id="customers">
		<h3>Product Details</h3>
		<tr>
			<th>Sr. No</th>
			<th>Product Name</th>
			<th>category</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>
		</tr>
		<%
		ResultSet resultSet3 = statement
				.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='" + email
				+ "' and cart.status='bill'");

		while (resultSet3.next()) {
			serialNum = serialNum + 1;
		%>
		<tr>
			<td>
				<%
				out.println(serialNum);
				%>
			</td>
			<td><%=resultSet3.getString(17)%></td>
			<td><%=resultSet3.getString(18)%></td>
			<td><%=resultSet3.getString(19)%></td>
			<td><%=resultSet3.getString(3)%></td>
			<td><%=resultSet3.getString(5)%></td>
		</tr>
		<tr>
	</table>
	<h3>
		Total: 		<%
	out.println(total) ;
	%>&#x20B9;
	</h3>
	<a href="continueShopping.jsp"><button class="button left-button">Continue
			Shopping</button></a>
	<a onclick="window.print();"><button class="button right-button">Print</button></a>
	<br>
	<br>
	<br>
	<br>

	<%
	}
	}

	catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
</html>