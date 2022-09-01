<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString(); %>
            <center><h1>AnimeHub.in</h1></center>           
            <h2><a href=""> <%out.println(email); %><i class='fas fa-user-alt' style='color: rgb(128, 0, 255);'></i></a></h2>
            <a href="home.jsp">Home <i class="fa fa-home" style='color: rgb(128, 0, 255);'></i></a>
            <a href="myCart.jsp">My Bag <i class='fa fa-shopping-bag' style='color: rgb(128, 0, 255);'></i></a>
            <a href="myOrders.jsp">My Orders  <i class='fab fa-elementor' style='color: rgb(128, 0, 255);'></i></a>
            <a href="changeDetails.jsp">Change Details <i class="fa fa-edit" style='color: rgb(128, 0, 255);'></i></a>
            <a href="messageUs.jsp">Message Us <i class='far fa-comment-alt' style='color: rgb(128, 0, 255);'></i></a>
            <a href="about.jsp">About <i class="fa fa-address-book" style='color: rgb(128, 0, 255);'></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square' style='color: rgb(128, 0, 255);'></i></a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
             <input type="text" placeholder="Search" name="search">
               <button type="submit"><i class="fa fa-search"></i></button>
               </form>
               
            </div>
          </div>
           <br>
           <!--table-->
