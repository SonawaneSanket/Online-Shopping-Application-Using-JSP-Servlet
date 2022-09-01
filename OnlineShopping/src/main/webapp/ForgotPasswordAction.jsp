<%@page import="db.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestions=request.getParameter("securityQuestions");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");

int check=0;
try{
	
	Connection connection=ConnectionProvider.getConn();
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'and mobilenumber='"+mobilenumber+"' and securityQuestions='"+securityQuestions+"' and answer='"+answer+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
		
	}
}
catch(Exception e){
		System.out.print(e);
}
%>