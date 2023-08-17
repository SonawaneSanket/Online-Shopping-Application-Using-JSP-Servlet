<%@page import="com.connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%
	}
%>
<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Security Question</h3>
  <select class="input-style" name="securityQuestion">
  		<option value="which was your first bike ?">which was your first bike ?</option>
    	<option value="who was your first crush ?">who was your first crush ?</option>
    	<option value="who was your first college friend ?">who was your first college friend ?</option>
    	<option value="who is your favourite sport person ?">who is your favourite sport person ?</option>   
    </select>
 <hr>
 	<h3>Enter Your New Answer</h3>
 		<input class="input-style" type="text" name="newAnswer" placeholder="Enter Your Updated Answer" required="required" >
<hr>
	<h3>Enter Password (For Security)</h3>
		<input class="input-style" type="password" name="Password" placeholder="Enter Password" required="required" >
<hr>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>