<%
    session.invalidate();
%>
<script>
    alert("You are being logged out.");
    window.location.href = "login.jsp";
</script>
	