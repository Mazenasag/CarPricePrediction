<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>web architecture assignment</title>
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
            <a href="showcart.jsp"> <font class="cart_text">show cart ( <%

                if(session.getAttribute("cart")==null){
                    out.println(0);
                }
                else{
//                    out.println(session.getAttribute(name))
                    out.println(session.getValue("cart"));
                    // out.println(11);
                }
            %>)</font></a>
        </ul>
    </div>

    <div class="center_container">
        <br>
        Welcome To Our store
        <h1> </h1>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","");
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from onlineshop");

            int i=1;
            //ArrayList <String> myname = new ArrayList<>();
            ArrayList <String> myname=new ArrayList();
            myname.add("hello");
            myname.add("Mazen");
            //out.println(myname.get(1));
            session.putValue("mynames", myname);
            ArrayList <String> id =new ArrayList();
            ArrayList <String> name =new ArrayList();
            ArrayList <String> price =new ArrayList();
            ArrayList <String> quantity =new ArrayList();
            ArrayList <String> discerption =new ArrayList();
            ArrayList <String> image =new ArrayList();
            while(rs.next()){

                Blob blob= rs.getBlob("image");
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1 ;

                while ((bytesRead = inputStream.read(buffer)) != -1){
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageByte = outputStream.toByteArray();
                String images = Base64.getEncoder().encodeToString(imageByte);
                outputStream.flush();

                %>

                <div class="mypc container" style="height: 400px;" onmouseover="mOver(this)" onmouseout="mOut(this)" >
                <img src="data:image/jsp;base64, <%=images%>" width="100" height="100" align="left">
                <br><br><br><br>
                <label> Id:  <%=rs.getString(1)%></label>
                <label> Name: <%=rs.getString(2)%></label>
                <label> Price: <%=rs.getString(3)%></label>
                <label> Description: <%=rs.getString(5)%></label>

                <form name="myform container" method="GET" action="product_action">
                <input name="Id" type="hidden" value=" <%=rs.getString(1)%> ">
                <input name="Name" type="hidden" value=" <%=rs.getString(2)%> ">
                <input name="Price" type="hidden" value=" <%=rs.getString(3)%> ">
                <label><input name="Quantity" type="text" value="1"></label>
                <input name="Description" type="hidden" value=" <%=rs.getString(5)%> ">

                <%--<input name="image" type="hidden" value=" <%=images%> ">--%>
                <input type="submit" value="AddToCart" id="AddToCart"></form>
    </div>

                <%}%>

    </div>

    <div class="footer">
        Web Architecture
    </div>

</div>

<script>
    function mOver(obj) {
        obj.style.backgroundColor = '#2f2525';
    }

    function mOut(obj) {
        obj.style.backgroundColor = 'white';
    }
</script>
</body>
</html>
