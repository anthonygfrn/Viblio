<%-- 
    Document   : receipt
    Created on : Jan 14, 2021, 2:46:16 PM
    Author     : Asus
--%>

<%@page import="java.sql.*"%>
<%@page import="Model.Payment"%>
<%@page import="Model.Customer"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receipt</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css%22%3E">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                }
            body{
                display: flex;
                justify-content: center;
                min-height: 100vh;
                background-image: url("images/library.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                font-family: "Goudy Old Style";
            }
            h1, h2{
                color: white;
            }
            .container .title{
                width: 100%;
                margin: 20px;
            }
            .container{
                position: relative;
                display: flex;
                justify-content: space-around;
                align-items: center;
                max-width: 1200px;
                flex-wrap: wrap;
            }
            .container .card{
                position: relative;
                width: 280px;
                height: 400px;
                margin: 30px;
                box-shadow: 20px 20px 50px rgba(0, 0, 0, 0.5);
                border-radius: 15px;
                background: rgba(0, 0, 0, 0.3);
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
                border-top: 1px solid rgba(255, 255, 255, 0.7);
                border-left: 1px solid rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(5px);
            }
            .container .card .content{
                padding: 20px;
                text-align: center;
            }
            .container .card .content img{
                width: 150px;
                z-index: -1;
            }
            .container .card .content h2{
                position: absolute;
                top: -10px;
                right: 30px;
                font-size: 8em;
                color: rgba(255, 255, 255, 0.05);
                pointer-events: none;
                z-index: 3;
            }
            .container .card .content h3{
                font-size: 1.8em;
                color: #fff;
                z-index: 1;
            }
            .container .card .content p{
                font-size: 1em;
                color: #fff;
                font-weight: 300;
            }
            .container .card .content a{
                position: relative;
                display: inline-block;
                padding: 8px 20px;
                margin-top: 15px;
                background: #fff;
                color: #000;
                border-radius: 20px;
                text-decoration: none;
                font-weight: 500;
                box-shadow:  0 5px 15px rgba(0, 0, 0, 0.2);
            }
        </style>
    </head>
    <body>
        <%
            Customer customer = (Customer)session.getAttribute("customer");
            Payment payment = (Payment)session.getAttribute("payment");
            %>
                <div class="container">
                    <div class="title">
                    <h1><%=customer.getUsername()%>'s Receipt</h1>
                    <h2>Total: <%=payment.getTotalPrice()%></h2>
                    <h2>Your Money: <%=payment.getCustomerMoney()%></h2>
                    <h2>Balance <%=payment.getBalance()%></h2>
                    </div>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookonlinestore", "root", "");
                            String sql = "SELECT * FROM BOOK WHERE ORDERED = 1";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<div class='card'>");
                                out.print("<div class='content'>");
                                out.print("<img src='" + rs.getString("cover") + "' alt='" + rs.getString("cover") + "'>");
                                out.print("<h3>" + rs.getString("title") + "</h3>");
                                out.print("<a href='" + rs.getString("file") + "' download>Read Book</a>");
                                out.print("</div>");
                                out.print("</div>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </div>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookonlinestore", "root", "");
                            String sql = "UPDATE BOOK SET ORDERED = 0 WHERE ORDERED = 1";
                            Statement stmt = conn.createStatement();
                            stmt.executeUpdate(sql);

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                        %>
                <script type="text/javascript" src="vanilla-tilt.js"></script>
                <script>
                  VanillaTilt.init(document.querySelectorAll(".card"), {
                              max: 15,
                              speed: 400,
                      });
                </script>
    </body>
</html>
