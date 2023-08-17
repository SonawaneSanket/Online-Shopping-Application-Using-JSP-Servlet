<%@page import="com.connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
	String email = session.getAttribute("email").toString();
	String productId = request.getParameter("id");
	int quantity = 1;
	int productPrice = 0;
	int productTotal = 0;
	int cartTotal = 0;
	
	int flag = 0 ;
	try{
		Connection connection = ConnectionProvider.getConnection();
		 Statement st = connection.createStatement();
		 ResultSet rs = st.executeQuery("select * from product where id='"+productId+"'");
		 
		 while(rs.next()){
			 
			 productPrice = rs.getInt(4);
			 productTotal = productPrice; 
		 }
		 ResultSet rs2 = st.executeQuery("select * from cart where product_id='"+productId+"' and email='"+email+"' and address is NULL");
		 while(rs2.next()){
			 	cartTotal = rs2.getInt(5);
			 	cartTotal = cartTotal + productTotal;
			 	quantity = rs2.getInt(3);
			 	quantity = quantity + 1;
			 	flag = 1;
		 }
		 if(flag == 1){
			 st.executeUpdate("update cart set total='"+cartTotal+"',quantity='"+quantity+"' where product_id='"+productId+"' and email='"+email+"' and address is NULL");
			 response.sendRedirect("home.jsp?msg=exist"); 
		 }
		 
		 if(flag == 0){
			 PreparedStatement ps = connection.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
			 
			 ps.setString(1, email);
			 ps.setString(2, productId);
			 ps.setInt(3, quantity);
			 ps.setInt(4, productPrice);
			 ps.setInt(5, productTotal);
			 
			 ps.execute();
		 	 response.sendRedirect("home.jsp?msg=added");
		 }
	}
	catch(Exception e){
		
		System.out.println(e);
	 	response.sendRedirect("home.jsp?msg=invalid");

	}
%>