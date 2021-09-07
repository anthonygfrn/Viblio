<%-- 
    Document   : catalog2
    Created on : Jan 13, 2021, 8:38:18 PM
    Author     : Owner
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>VIBLIO Catalogue</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head> 
	<body class="landing is-preload">
            <%!
            private static final String connectionURL = "jdbc:mysql://localhost:3306/bookonlinestore";
            private static final String driver = "com.mysql.jdbc.Driver";
            private static final String username = "root";
            private static final String password = "";
            private static Connection conn = null;

            private Statement stmt = null;
            private ResultSet rs = null;
            %>
		<div id="page-wrapper">

			<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="index.html">Viblio</a></h1>
				<nav id="nav">
				<ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="catalog.jsp">Catalog</a></li>
                                    <li><a href="login.jsp">Log In</a></li>
                                    <li><a href="register.jsp" class="button">Sign Up</a></li>
				</ul>
				</nav>
			</header>

		
                        <div class="grid-container">
                            <div class="item1" style="background-color: #871821; color: #eeba30; font-size: 40px; padding-bottom: 20px; padding-top: 20px; font-family: Goudy Old Style ">
                                Book Catalogue
                            </div>  
                            
                            <div class="item2">
                                 <div id ="myCarousel" class="carousel slide">
                            
                            <ol class = "carousel-indicators">
                                <li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li>
                                <li data-target = "#myCarousel" data-slide-to = "1"> </li>
                                <li data-target = "#myCarousel" data-slide-to = "2"> </li>
                            </ol>
                            
                            <div class = "carousel-inner">
                                
                                <div class ="item active">
                                    <a href="#div_id">
                                    <img src ="images/SCIFI.jpg" alt="Sci-Fi" class="img-responsive" style="width: 100%; height: auto;" >
                                    </a>
                                    <div class = "carousel-caption" style="background-color: transparent; color: #eeba30; font-size: 72px; padding-bottom: 120px; padding-top: 20px; font-family: Goudy Old Style">
                                        Fantasy
                                    </div>
                                </div>
                                 <div class ="item">
                                    <a href="#div_id2">
                                    <img src ="images/Young.jpg" alt="Sci-Fi" class="img-responsive" style="width: 100%; height: auto;">
                                    </a>
                                     <div class = "carousel-caption" style="background-color: transparent; color: #eeba30; font-size: 72px; padding-bottom: 120px; padding-top: 20px; font-family: Goudy Old Style">
                                        Young Adult
                                    </div>
                                </div>
                                 <div class ="item  ">
                                   <a href="#div_id3">
                                   <img src ="images/mystey.jpg" alt="Sci-Fi" class="img-responsive" style="width: 100%; height: auto;">
                                   </a>
                                   <div class = "carousel-caption" style="background-color: transparent; color: #eeba30; font-size: 72px; padding-bottom: 120px; padding-top: 20px; font-family: Goudy Old Style">
                                        Mystery
                                    </div>
                                </div>
                                
                            </div>
                            <a class ="carousel-control left" href="#myCarousel" data-slide ="prev">
                                <span class = "icon-prev"></span>
                            </a>
                            <a class ="carousel-control right" href="#myCarousel" data-slide ="next">
                                <span class = "icon-next"></span>
                            </a>
                        </div>
                                
                            </div>
                            <div class="item3" style="background-color: transparent;">
                                 <div class="order-container ">
                                     
        <form  action="CatalogController" method="get">
            <br>
                 <div id="div_id"></div>
                <button type="button" class="accordion">Fantasy</button>
                <div class="panel">
                     <div class="carousel-cell">
                  <table class="table" style="" border="0">
                <tr>
                    <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Fantasy'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td> <img src='" + rs.getString("cover") + "' width='340' height='420' alt='" + rs.getString("cover") + "'/> </td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tr>
                
                <tr><div class="checkbox"></div>
                    <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Fantasy'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td><strong><em>" + rs.getString("Title") + "</em></strong> </td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tr>
 
                <tr>
                <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Fantasy'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td><div style='text-align: left;'>");
                                out.print("Author: " + rs.getString("Author") + " <br>");
                                out.print("Publisher: " + rs.getString("Publisher") + " <br>");
                                out.print("Price: " + rs.getDouble("price") + "RM <br></div>");
                                out.print("</td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>

                </tr>

                    <tr> 
                    <td style="text-allign: center; vertical-align: middle">
                            
                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book1">
                     <span class="checkmark"></span>
                    </label>
                        &nbsp&nbsp
                    </td>

                     <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book2">
                     <span class="checkmark"></span>
                    </label>
                         &nbsp&nbsp
                    </td>

                     <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book3">
                     <span class="checkmark"></span>
                    </label>
                         &nbsp&nbsp
                    </td>

                 </tr>
                </table>
                </div>
                </div>

                <div id="div_id2"></div>
                <button type="button" class="accordion">Young Adult</button>
                <div class="panel">
                 <table class="table" style="" border="0">
                <tr>
                    <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Young Adult'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td> <img src='" + rs.getString("cover") + "' width='340' height='420' alt='" + rs.getString("cover") + "'/> </td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tr>
                
                <tr><div class="checkbox"></div>
                    <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Young Adult'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td><strong><em>" + rs.getString("Title") + "</em></strong> </td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tr>

            <tr>
                <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Young Adult'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td><div style='text-align: left;'>");
                                out.print("Author: " + rs.getString("Author") + " <br>");
                                out.print("Publisher: " + rs.getString("Publisher") + " <br>");
                                out.print("Price: " + rs.getDouble("price") + "RM <br></div>");
                                out.print("</td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>

                </tr>
                <tr style="height: 10px;">
                       <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book4">
                     <span class="checkmark"></span>
                    </label>
                           &nbsp&nbsp
                    </td>

                     <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book5">
                     <span class="checkmark"></span>
                    </label>
                         &nbsp&nbsp
                    </td>

                    <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book6">
                     <span class="checkmark"></span>
                    </label>
                        &nbsp&nbsp
                    </td>

                 </tr>
                </table>
                </div>

                <div id="div_id3"></div>
                <button type="button" class="accordion">Mystery</button>
                <div class="panel">
                 <table class="table" style="" border="0">
                <tr>
                    <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Mystery'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td> <img src='" + rs.getString("cover") + "' width='340' height='420' alt='" + rs.getString("cover") + "'/> </td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tr>

            <tr><div class="checkbox"></div>
              <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Mystery'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td><strong><em>" + rs.getString("Title") + "</em></strong> </td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
            </tr>


            <tr>
                <%
                        try {
                            Class.forName(driver);
                            conn = DriverManager.getConnection(connectionURL, username, password);
                            String sql = "SELECT * FROM BOOK WHERE GENRE = 'Mystery'";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.print("<td><div style='text-align: left;'>");
                                out.print("Author: " + rs.getString("Author") + " <br>");
                                out.print("Publisher: " + rs.getString("Publisher") + " <br>");
                                out.print("Price: " + rs.getDouble("price") + "RM <br></div>");
                                out.print("</td>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </tr>   
                <tr>
                    <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book7">
                     <span class="checkmark"></span>
                    </label>
                        &nbsp&nbsp
                    </td>

                     <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book8">
                     <span class="checkmark"></span>
                    </label>
                         &nbsp&nbsp
                    </td>

                    <td style="text-allign: center; vertical-align: middle">

                     <label class="containerc">
                     <input type="checkbox" name="BookCheckbox" value="book9">
                     <span class="checkmark"></span>
                    </label>
                        &nbsp&nbsp
                    </td>
                 </tr>
                </table>
            </div>



            <br>
            <br>
            <input class="btn btn-success"  type="submit" value="Order" name="orderBtn" />
            &nbsp&nbsp&nbsp&nbsp
            <input class="btn btn-success" type="reset" value="Reset" name="resetBtn" />
            <br>

           </form>
           </div>
    
        </div>

        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/browser.min.js"></script>
        <script src="assets/js/breakpoints.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
        <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
            for (i = 0; i < acc.length; i++) {
              acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                  panel.style.display = "none";
                } else {
                  panel.style.display = "block";
                }
                });
        }
        </script>


        </body>
</html>