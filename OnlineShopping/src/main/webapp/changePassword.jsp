<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");

	if ("notMatch".equals(msg)) {
	%>
	<script>
		alert("password does not match, please try again");
		window.location.href = "changePassword.jsp"; // redirect to login page
	</script>
	<%
	}
	%>

	<%
	if ("wrong".equals(msg)) {
	%>
	<script>
		alert("Check old password again");
		window.location.href = "changePassword.jsp"; // redirect to login page
	</script>
	<%
	}
	%>

	<%
	if ("done".equals(msg)) {
	%>
	<script>
		alert("Password Updated");
		window.location.href = "changePassword.jsp"; // redirect to login page
	</script>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<script>
		alert("Something went wrong !");
		window.location.href = "changePassword.jsp"; // redirect to login page
	</script>
	<%
	}
	%>
	<form action="ChangePasswordAction.jsp" method="post">
		<h3>Enter Old Password</h3>
		<input class="input-style" type="password" name="oldPassword"
			placeholder="Enter Old Password" required="required">
		<hr>
		<h3>Enter New Password</h3>
		<input class="input-style" type="password" name="newPassword"
			placeholder="Enter New Password" required="required">
		<hr>
		<h3>Enter Confirm Password</h3>
		<input class="input-style" type="password" name="confirmPassword"
			placeholder="Enter Confirmed New Password" required="required">
		<hr>
		<button class="button">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
</body>
<br>
<br>
<br>
</html>