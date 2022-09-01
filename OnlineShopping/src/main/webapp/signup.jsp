<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/NewFile.css">
<title>SignUp</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
   <input type="text" name="name" placeholder="Enter name" required>
    	<input type="email" name="email" placeholder="Enter email" required>
    	<input type="number" name="number" placeholder="Enter Mobile Number" required>
    	<select name="SecurityQuestions" required>
    	
    		<option value="which was your first bike ?">which was your first bike ?</option>
    		<option value="who was your first crush ?">who was your first crush ?</option>
    		<option value="who was your first college friend ?">who was your first college friend ?</option>
    		<option value="who is your favourite sport person ?">who is your favourite sport person ?</option> 
    	
    	</select>
    	<input type="text" name="answer" placeholder="Enter Your Answer" required>
    	<input type="password" name="password" placeholder="Enter Password" required>
    	<input type="submit" value="signUp">	
    </form>
    	
    	 	
      <h3><a href="login.jsp">Login</a></h3>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");

	if("valid".equals(msg))
	{
 %>
<h1>Successfully Updated</h1>
<%
}
%>

<%
if("invalid".equals(msg))
{
%>
<h2>Some thing Went Wrong! Try Again !</h2>
<%} %>

    <h2>Welcome to AnimeHub.com</h2>
  </div>
</div>

</body>
</html>