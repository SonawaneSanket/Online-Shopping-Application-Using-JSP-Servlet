<%@page import="com.connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
	
%>
<h3 class="alert">Product Added Successfully!</h3>
<%
}
%>
<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
}
%>

<%
int count = 1;
try{
	Connection connection = ConnectionProvider.getConnection();
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery("select max(id) from product");
	while(rs.next()){
		count = rs.getInt(1);
		count = count + 1;		
	}
}
catch(Exception e){
	
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: #CCCCFF;  font-style: initial; font-size: xxx-large; font-family: monospace;">Product Id: <%out.println(count+100); %></h3>
<input type="hidden" name="id" value="<%out.println(count); %>"> 

<div class="left-div">
 <h3 style="font-family: monospace; font-style: oblique; font-size: x-large; color:#CCCCFF ">Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name here" required="required"> 
<hr>
</div>

<div class="right-div">
<h3 style="font-family: monospace; font-style: oblique; font-size: x-large; color:#CCCCFF ">Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required="required"> 
 
<hr>
</div>

<div class="left-div">
<h3 style="font-family: monospace; font-style: oblique; font-size: x-large; color:#CCCCFF ">Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required="required"> 
<hr>
</div>
<div class="right-div">
<h3 style="font-family: monospace; font-style: oblique; font-size: x-large; color:#CCCCFF ">Active</h3>
   <select class="input-style" name="active">
   	<option value="Yes">Yes</option>
   	<option value="No">No</option>
   </select>
<hr>
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>