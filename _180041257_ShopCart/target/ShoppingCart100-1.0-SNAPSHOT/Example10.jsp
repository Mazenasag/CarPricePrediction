<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Base64" %>
<%

    String id = request.getParameter("userid");
    String driver = "com.mysql.cj.jdbc.Driver";
    //String connectionUrl = "jdbc:mysql://localhost:3306/";
    //String connectionUrl = "jdbc:mysql://localhost:3306/test?useSSL=true&serverTimezone=Asia/Jakarta";
    String connectionUrl = "jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String database = "test";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    Blob image = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
    <tr>
        <td>id</td>
        <td>user_id</td>
        <td>password</td>
        <td>name</td>
        <td>email</td>
        <td>image</td>

    </tr>
    <%
        try{

            connection = DriverManager.getConnection(connectionUrl, userid, password);

            statement=connection.createStatement();
            String sql ="select * from record";
            resultSet = statement.executeQuery(sql);

            if(connection != null)
            {
                System.out.println("successful fgfbkjgjgggggggggggggggggggggggggggggggggggggggggggg");
            }

            while(resultSet.next()){ System.out.println("Tareq  ");

    %>
    <tr>
        <td><%=resultSet.getString("id") %></td>
        <td><%=resultSet.getString("user_id") %></td>
        <td><%=resultSet.getString("password") %></td>
        <td><%=resultSet.getString("name") %></td>
        <td><%=resultSet.getString("email") %></td>
        <%
            Blob blob= resultSet.getBlob("image");
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
        <td><img width="100" height="100" src="data:image/jsp;base64,<%=images%>" alt=""></td>
        <%--        <input type="hidden" name="price" value="<%=rs.getString("price")%>">
                <input type="submit" value="Addtocart">--%>

    </tr>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>

