<%@page import="com.connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: #B0C4DE;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: #CCCCFF; text-align: center; font-size: 30px; font-style: normal;
    font-family: monospace;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%

String msg= request.getParameter("msg");

if("notPossible".equals(msg))
{
%>

<script type="text/javascript">
alert("Click on remove");
window.location.href = "myCart.jsp";</script>
<%
}
%>

<%
if("inc".equals(msg))
{
%>

<h3 class="alert">Quantity  Increased Successfully!</h3>
<%
}
%>

<%
if("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%
	}
%>

<%
if("removed".equals(msg) ){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%
	}	 
%>

<table>
<thead>
<%
	int total=0;
	int serialNumber=0;
	
	try{
		Connection connection = ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
		while(resultSet.next()){
			
			total = resultSet.getInt(1);
			}
		
%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
            <%
            if(total > 0){ 
            %> 
            <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
            
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">Serial Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
    <%
    	ResultSet resultSet1 = statement.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
    	while(resultSet1.next())
    	{
    %>  
    
          <tr>
			<% serialNumber = serialNumber + 1; %>
           <td><%out.println(serialNumber); %></td>
            <td><%=resultSet1.getString(2) %></td>
            <td><%=resultSet1.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%= resultSet1.getString(4) %> </td>
            <td><a href="IncrementDecrementQuantityAction.jsp?id=<%=resultSet1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=resultSet1.getString(8) %> 
            <a href="IncrementDecrementQuantityAction.jsp?id=<%=resultSet1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=resultSet1.getString(10) %> </td>
            <td><a href="RemoveFromCart.jsp?id=<%=resultSet1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>

<%
    		}
    	}	
    	catch(Exception e){
    		
    	}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>