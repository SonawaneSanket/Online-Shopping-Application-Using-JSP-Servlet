<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="ForgotPasswordAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter Email"
					required="required"> <input type="number" name="number"
					placeholder="Enter Mobile Number" required="required"> <select
					name="SecurityQuestions">
					<option value="which was your first bike ?">which was your
						first bike ?</option>
					<option value="who was your first crush ?">who was your
						first crush ?</option>
					<option value="who was your first college friend ?">who
						was your first college friend ?</option>
					<option value="who is your favourite sport person ?">who
						is your favorite sport person ?</option>
				</select> <input type="text" name="answer" placeholder="Enter Answer"
					required="required"> <input type="password"
					name="newPassword" placeholder="Enter Password" required="required">
				<input type="submit" value="Save">
			</form>
			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		<div class='whyforgotPassword'>
			<%
			String msg = request.getParameter("msg");
			if ("done".equals(msg)) {
			%>
			<script type="text/javascript">
				alert("Password Changed !");
				window.location.href = "forgotpassword.jsp"
			</script>
			<%
			}
			%>

			<%
			if ("invalid".equals(msg)) {
			%><script type="text/javascript">
				alert("Something Went Wrong !");
				window.location.href = "forgotpassword.jsp"
			</script>
			<%
			}
			%>
			<h3>DevMarT</h3>
			<p>Forgot Your Password? Let's Get You Back In!</p>
		</div>
	</div>
</body>
</html>