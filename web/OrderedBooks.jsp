<%-- 
    Document   : OrderedBooks
    Created on : Jan 14, 2021, 10:33:34 AM
    Author     : Owner
--%>


<%@page import="java.sql.*"%>
<%@page import="Model.Payment"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordered Books</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <style>
            body{
                background-image: url(images/library.jpg);
                position: relative;
                font-family: "Goudy Old Style";
            }
            h2{
                color:white;
            }
            .content{
                max-width: 500px;
                margin: auto;
            }
            .content-table {
                border-collapse: collapse;
                width: 500px;
                margin-left: auto;
                margin-right: auto;
                padding: 10px;
                min-width: 400px;
                border-radius: 5px 5px 0 0;
                overflow: hidden;
          }
          .content-table thead tr{
              background-color: #871821;
              color: #ffffff;
              text-align: center;
              vertical-align: middle;
              font-weight: bold;
          }
          .content-table th, .content-table td{
              padding: 12px 15px;
          }
          .content-table tbody tr{
              border-bottom: 1px solid #dddddd;
              background-color: white;
          }
          .content-table tbody tr:nth-of-type(even){
              background-color: #f3f3f3;
          }
          .content-table tbody tr:last-of-type{
              border-bottom: 2px solid #871821;
          }
        </style>
    </head>
    <body>
        <%
            Payment payment = (Payment)session.getAttribute("payment");
            %>  
            <div class="content">
                <br>
                <br>
            <table class="content-table">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookonlinestore", "root", "");
                            String sql = "SELECT * FROM BOOK WHERE ORDERED = 1";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getString("Title") + "</td>");
                                out.print("<td>" + rs.getString("Author") + "</td>");
                                out.print("<td>" + rs.getString("Publisher") + "</td>");
                                out.print("<td>" + rs.getString("price") + "</td>");
                                out.print("</tr>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tbody>
            </table>
            <h3 style="color: white">Total: <%=payment.getTotalPrice()%></h3>
                
         
        <div class="pay">
            <form action="PaymentController">
                <input name="CustomerMoney" placeholder="Enter your money" type="number" step="0.01" required class="validate" autocomplete="off" min="<%=payment.getTotalPrice()%>">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="submit" value="Pay" style="color: black;" /> 
            </form>
            </div>
            </div>
    </body>
</html>
