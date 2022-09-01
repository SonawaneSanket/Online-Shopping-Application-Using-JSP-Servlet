<%@page import="db.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
	try
	{
		Connection conn=ConnectionProvider.getConn();
		Statement st=conn.createStatement();
		String str1="create table users(name varchar(100),email varchar(100)primary key,mobilenumber bigint,SecurityQuestions varchar(200),answer varchar(100),password varchar(50),address varchar(250),city varchar(30),state varchar(30),country varchar(25))";
		String str2="create table product(id int,name varchar(100),category varchar(80),price double,active varchar(100))";
		String str3="create table cart(email varchar(50),product_id int,quantity int,price double,total double,address varchar(200),city varchar(50),state varchar(50),country varchar(50),mobileNumber bigint,orderDate varchar(500),deliveryDate varchar(150),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
		String str4="create table messsage(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(2000),PRIMARY KEY(id))";
		System.out.println(str1);
		System.out.println(str2);
		System.out.println(str3);
		System.out.println(str4);
		
		//st.execute(str1);
		//st.execute(str2);
		//st.execute(str3);
		st.execute(str4);
		System.out.println("Table created");
		conn.close();
	}
		catch(Exception e){
		System.out.print(e);
	}

%>