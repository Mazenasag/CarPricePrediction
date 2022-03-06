<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Cart</title>
    <link rel="stylesheet" href="asa.css" type="text/css" media="all" />
</head>
<body>
<div class="container">
<div class="menu">
    <ul>
        <br><br><br>
        <li> <a href="home1.jsp"> Home </a> </li>
        <li> <a href="about.jsp">  About </a> </li>
        <li> <a href="contact.jsp">  Contact</a></li>
        <li> <a href="home.jsp">  Logout</a></li>

        <br><br><br><br><br><br>
<%
 Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop", "root", "");
    Statement st = con.createStatement();
ResultSet rs=st.executeQuery("select * from cart");

    while(rs.next()){
%>
    <br><br><br>
    <label> Id:  <%=rs.getString(1)%></label>
    <br>
    <label> Name: <%=rs.getString(3)%></label>
    <br>
    <label> Price: <%=rs.getString(4)%></label>
    <br>
    <label> Quantity:  <%=rs.getString(2)%></label>
    <br><br>

    <form name="myform container" method="GET" action="remove">
        <input name="Id" type="hidden" value=" <%=rs.getString(1)%> ">
        <input type="submit" value="Remove"></form>

        <br>
        <form name="myform1" method="GET" action="update.jsp">
            <input type="submit" value="Update Cart"></form>

        <%}%>
</div>
</div>
</body>
</html>
