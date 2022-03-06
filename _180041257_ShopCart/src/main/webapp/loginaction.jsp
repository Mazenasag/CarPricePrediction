

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    //session.putValue("emailid", username);
    String password = request.getParameter("password");
    //?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from admin where name ='username' + password = 'password' ");
    if (rs.next()) {
        String name = rs.getString(1);
        session.setAttribute("name",name);
//                session.putValue("name", name);
        if (rs.getString(3).equals(password)) {
            // out.println("Welcome: "+email);
            //HttpSession session = request.getSession(true);
            //  String userName = session.getAttribute("username").toString();
            //String password = session.getAttribute("password").toString();

            response.sendRedirect("home1.jsp");
        } else {
            out.println("Invalid password try again");
            // out.println(email+pwd+rs.getString(3));
        }
    } else {
        out.println("This Email is not Register. please Register first!!!");
    }
%>
</body>
</html>
