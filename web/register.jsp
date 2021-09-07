<%-- 
    Document   : Register
    Created on : Dec 29, 2020, 4:07:09 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>Register</title>
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
    <div id="container-register">
        <div id="title">
            <i class="material-icons lock">lock</i> Register
        </div>
        
        <form action="RegisterController">
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">face</i>
                </div>
                <input name="fullname" placeholder="Fullname" type="text" required class="validate" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">face</i>
                </div>
                <input name="username" placeholder="Username" type="text" required class="validate" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>

             <div class="input">
                <div class="input-addon">
                    <i class="material-icons">email</i>
                </div>
                <input name="email" placeholder="Email" type="email" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input name="password" placeholder="Password" type="password" required class="validate" autocomplete="off">
            </div>

              <br>

            <input type="submit" value="Register" />
        </form>

        <div class="register">
            Do you already have an account?
            <a href="login.jsp"><button id="register-link">Log In here</button></a>
        </div>
        
    </div>
    
    
</body>

</html>
