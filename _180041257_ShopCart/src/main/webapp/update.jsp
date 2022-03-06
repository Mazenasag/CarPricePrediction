<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><
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
            <li> <a href="home1.jsp"> Home </a> </li>
            <li> <a href="about.jsp">  About </a> </li>
            <li> <a href="contact.jsp">  Contact</a></li>
            <li> <a href="home.jsp">  Logout</a></li>
            <%
                out.println("Welcome MR. "+session.getValue("user"));
            %>
            <br><br><br><br><br><br>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
               java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop", "root", "");
                Statement st= con.createStatement();
                ResultSet rs=st.executeQuery("select * from cart");

                    while(rs.next()){
            %>

            <br><br><br>
            <label> Id:  <%=rs.getString(1)%></label>
            <br>
            <label> Name: <%=rs.getString(3)%></label>
            <br>
            <label> Price: <%=rs.getString(4)%></label>
            <br><br><br>

            <form name="myform1" method="GET" action="update_action">
                <label><input id= "q" name="Quantity" type="text" value="1"></label>
                <input type="submit" value="Update Cart">
                <input type="hidden" name="ID_to_update" value="<%=rs.getString(1)%>">
            </form>

                <%}%>
            <script>

            </script>
    </div>
</div>
</body>
</html>
