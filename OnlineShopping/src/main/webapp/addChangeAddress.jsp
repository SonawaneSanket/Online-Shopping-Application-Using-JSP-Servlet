<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add and Edit Address Details</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");

	if ("valid".equals(msg)) {
	%>

	<script>

		alert("Address Updated");
		window.location.href = "addChangeAddress.jsp"; // redirect to login page
	</script>

	<%
	}
	%>

	<%
	if ("invalid".equals(msg)) {
	%>

	<script>

		alert("Something Went Wrong !");
		window.location.href = "addChangeAddress.jsp"; // redirect to login page
	</script>
	<%
	}
	%>

	<%
	try {
		Connection connection = ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery("select * from users where email='" + email + "'");

		while (resultSet.next()) {
	%>

	<form action="addChangeAddressAction.jsp" method="post">
		<h3>Enter Address</h3>
		<input class="input-style" type="text" name="address"
			value="<%=resultSet.getString(7)%>" placeholder="Enter Address"
			required="required">
		<hr>
		<h3>Enter City</h3>
		<input class="input-style" type="text" name="city"
			value="<%=resultSet.getString(8)%>" placeholder="Enter City"
			required="required">
		<hr>
		<h3>Enter State</h3>
		<input class="input-style" type="text" name="state"
			value="<%=resultSet.getString(9)%>" placeholder="Enter State"
			required="required">
		<hr>
		<h3>Enter Country</h3>
		<input class="input-style" type="text" name="country"
			value="<%=resultSet.getString(10)%>" placeholder="Enter Country"
			required="required">
		<hr>
		<button class="button" type="submit">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
<br>
<br>
<br>
</html>