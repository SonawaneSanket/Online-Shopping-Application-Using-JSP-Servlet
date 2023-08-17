<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    
        <form action="SignUpAction.jsp" method="post">
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
    	<input type="submit" value="Sign Up">	
    </form>
      <h2>Already Have Account?</h2> <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg = request.getParameter("msg");
if("valid".equals(msg)){
%>
<script >
	alert('Thank you for signing up');
	window.location.href = "login.jsp";
</script>
<%
} %>
<%
if("invalid".equals(msg)){
%>
<script> 
alert('Something Went Wrong!');
</script>
<%}

%>
    <h3>DevMarT</h3>
    <p>Discover a wide range of products from top brands and trusted sellers on. Enjoy a seamless shopping experience with fast and reliable shipping and dedicated customer service.</p>
  </div>
</div>

</body>
</html>