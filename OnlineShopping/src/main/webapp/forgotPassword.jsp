<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/NewFile.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
	<form action="ForgotPasswordAction.jsp" method="post">
		<input type="email" name="email" placeholder="Enter email id" required>
		<input type="tel" name="mobilenumber" placeholder="Enter mobile number" required>
		<select name="securityQuestions">
	
    		<option value="which was your first bike ?">which was your first bike ?</option>
    		<option value="who was your first crush ?">who was your first crush ?</option>
    		<option value="who was your first college friend ?">who was your first college friend ?</option>
    		<option value="who is your favourite sport person ?">who is your favourite sport person ?</option>
    		
		</select> 
		<input type="text" name="answer" placeholder="Enter Answer" required>
		<input type="password" name="newPassword" placeholder="Enter new password" required>
		<input type="submit" value="save">
	</form>     
      <h2><a href="">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
    <h2>AnimeHub.in</h2>

   <%
   String msg=request.getParameter("msg");
   if("done".equals(msg)){
   %>
<h2>Your Password has been changed!</h2>
<%} %>
<% if("invalid".equals(msg)){ %>
<h2>Some thing Went Wrong! Try Again !</h2>
<%} %>

  </div>
</div>
</body>
</html>