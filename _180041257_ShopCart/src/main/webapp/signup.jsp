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
            <li> <a href="home.jsp"> Home </a> </li>
        </ul>
    </div>

    <div class="center_container">
        <br><br><br><br><br><br><br>
        <h1> Sign Up</h1>
        <form name="reg" action="signup" method="POST">
            <div class="reg">
                <label> Name: </label>
                <input type="text" name="name" id="idname">
                <label> Email: </label>
                <input type="text" name="email" id="idemail">
                <label> Password</label>
                <input name="password" type="text" id="idpassword">
                <label> Confirm Password</label>
                <input name="cpassword" type="text" id="idcpassword">
                <input type="submit" value="Register" onclick="validation();">
            </div>
        </form>
    </div>

    <script type="text/javascript" >

        function validation () {

            let name = document.getElementById('idname').value;
            let email = document.getElementById('idemail').value;
            let password = document.getElementById('idpassword').value;
            let ConfirmPassword = document.getElementById('idcpassword').value;

            if (name == "") {
                alert("fill the name");
                return false;
            }
            if (email == "") {
                alert("fill the email");
                return false;
            }
            if (password == "") {
                alert("fill the password");
                return false;
            }
            if (ConfirmPassword == "") {
                alert("fill the password");
                return false;
            }
            if ((password.length < 5) || (password.length > 20)) {
                alert("please fill the password between 5 and 20 ");
                return false;
            }
            if(password != ConfirmPassword)
            {
                alert("Passwords did not match");
            }
            if (email.indexOf('@') <= 0) {
                alert("please fill the email id in proper format @");
                return false;
            }
            if ((email.charAt(email.length - 4) != '.') && (email.charAt(email.length - 3) != '.')) {
                alert("please fill the email id in proper format .");
                return false;
            }

        }
    </script>

    <div class="footer">
        Web Architecture
    </div>

</div>

</body>
</html>