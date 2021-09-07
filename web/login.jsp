<%-- 
    Document   : login
    Created on : Dec 31, 2020, 4:03:39 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="description" content="Login - Register Template">
    <meta name="author" content="Lorenzo Angelino aka MrLolok">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="RL.css">
 
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <style>
        body {
            background-image: url(images/library.jpg);
            height: 580px;
        }
    </style>
    
     <nav>
    <ul class="nav-flex-row">
         <li class="nav-item">
          
             
        <a href="index.html">Home</a>
      </li>
    </ul>
  </nav>
    
</head>

<body>
    
    
     <div id="container-login">
        <div id="title">
            <i class="material-icons lock">lock</i> Login
        </div>

        <form action="LoginController">
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">face</i>
                </div>
                <input name="username" placeholder="Username" type="text" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input name="password" placeholder="Password" type="password" required class="validate" autocomplete="off">
            </div>

            <input type="submit" value="Log In" />
        </form>


        <div class="login">
            Don't have an account yet?
            <a href="register.jsp"><button id="register-link">Register here</button></a>
        </div>
    </div>
    
    
</body>

</html>
