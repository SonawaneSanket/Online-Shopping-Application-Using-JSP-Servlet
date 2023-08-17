
<%@page import="java.sql.*"%>
<%@page import="com.connection.ConnectionProvider"%>
<%

try{
	Connection  connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	String q1 = "create table users(name varchar(100),email varchar(100)primary key,mobilenumber bigint,SecurityQuestions varchar(200),answer varchar(100),password varchar(50),address varchar(250),city varchar(30),state varchar(30),country varchar(25))";
	String q2 = "create table product(id int,name varchar(100),category varchar(80),price double,active varchar(100))";
	String q3="create table cart(email varchar(50),product_id int,quantity int,price double,total double,address varchar(200),city varchar(50),state varchar(50),country varchar(50),mobileNumber bigint,orderDate varchar(500),deliveryDate varchar(150),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),primary key(id))";
	
	//System.out.println(q1);
	//statement.execute(q1);
	
	//System.out.println(q2);
	//statement.execute(q2);
	
	//System.out.println(q3);
	//statement.execute(q3);
	
	System.out.println(q4);
	statement.execute(q4);
	
	System.out.println("Table Created");
	connection.close();
}
catch(Exception e){
	System.out.println(e);
	
}

%>