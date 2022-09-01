<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/NewFile.css">
<title>Login Page</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
	<form action="LoginAction.jsp" method="post">
		<input type="email" name="email" placeholder="enter email Id" required>
		<input type="password" name="password" placeholder="enter password" required>
		<input type="submit" value="Login">
	</form>
     
      <h3><a href="signup.jsp">SignUp</a></h3>
       <h3><a href="forgotPassword.jsp">Forgot Password?</a></h3>

  </div>
  <div class='whysignLogin'>
    <h2>Welcome to AnimeHub.in</h2>

  <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg)){
	  %>
	  <h3>Incorrect UserName or Password</h3>
  <%}%>
  <%
  	if("invalid".equals(msg)){
  %>
<h3>Some thing Went Wrong! Try Again !</h3>
<%} %>

  </div>	
</div>

</body>
</html>