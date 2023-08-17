<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>

			<form action="LoginAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter Email"
					required="required"> <input type="password" name="password"
					placeholder="Enter Password" required="required"> <input
					type="submit" value="Login">
			</form>
			<h2>
				<a href="signup.jsp">SignUp</a>
			</h2>
			<h2>
				<a href="forgotPassword.jsp">Forgot Password?</a>
			</h2>
		</div>
		<div class='whysignLogin'>

			<%
			String msg = request.getParameter("msg");
			if ("notexist".equals(msg)) {
			%>
			<script>
				alert("Incorrect username or password. Please try again.");
				window.location.href = "login.jsp"; // redirect to login page
			</script>
			<%
			}
			%>

			<%
			if ("invalid".equals(msg)) {
			%>
			<script type="text/javascript">
				alert("No user found please Sign Up !");
				window.location.href = "signup.jsp";
			</script>
			<%
			}
			%>
			<h3>DevMart</h3>
			<p class="loginpara">Login to Access Your Dashboard</p>
		</div>
	</div>

</body>
</html>