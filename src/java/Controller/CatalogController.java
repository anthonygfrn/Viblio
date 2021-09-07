/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Payment;
import Util.DBConUtil;
import static Util.DBConUtil.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Asus
 */
@WebServlet(name = "CatalogController", urlPatterns = {"/CatalogController"})
public class CatalogController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Payment payment = new Payment();
        ArrayList<Book> bookList = new ArrayList<Book>();
        HttpSession session = request.getSession();
        
        String[] checkbox = request.getParameterValues("BookCheckbox"); 
        
//        String book1 = request.getParameter("Book1Checkbox");
//        String book2 = request.getParameter("Book2Checkbox");
//        String book3 = request.getParameter("Book3Checkbox");
//        String book4 = request.getParameter("Book4Checkbox");
//        String book5 = request.getParameter("Book5Checkbox");
//        String book6 = request.getParameter("Book6Checkbox");
//        String book7 = request.getParameter("Book7Checkbox");
//        String book8 = request.getParameter("Book8Checkbox");
//        String book9 = request.getParameter("Book9Checkbox");
        
        double total = 0;
        
//        Book b1 = new Book("Harry Potter and the Goblet of Fire", "J.K. Rowling", "Bloomsbury", 40, "images/hpt.jpg", "pdf/hpt.pdf");
//        Book b2 = new Book("The Lord of The Rings", "J.R.R Tolkien", "Allen & Unwin", 60, "images/lotr.jpg", "pdf/lotr.pdf");
//        Book b3 = new Book("A Game of Thrones", "George R. R. Martin", "Bantam Spectra", 30, "images/got.jpg", "pdf/got.pdf");
//        Book b4 = new Book("The Perks of Being a Wallflower", "Stephen Chbosk", "Pocket Books", 50, "images/wallflower.jpg", "pdf/wallflower.pdf");
//        Book b5 = new Book("The Absolutely True Diary of a Part-Time Indian", "Sherman Alexie", "Little, Brown and Company", 45, "images/indian.jpg", "pdf/indian.pdf");
//        Book b6 = new Book("Eleanor & Park", "Rainbow Rowell", "Orion Publishing Group", 30, "images/ep.jpg", "pdf/ep.pdf");
//        Book b7 = new Book("The Couple Next Door", "Shari Lapena", "Penguin Books", 45, "images/Thecouple.jpg", "pdf/Thecouple.pdf");
//        Book b8 = new Book("The Woman in White", "Wilkie Collins", "Penguin Books", 30, "images/the_women_in_white.jpg", "pdf/the_women_in_white.pdf");
//        Book b9 = new Book("Gone Girl", "Gillian Flynn", "Phoenix", 30, "images/gone_girl.jpg", "pdf/gone_girl.pdf");
        
        for(int i = 0; i < checkbox.length; i++){
            if(checkbox[i] != null){
                try{
                    Connection conn = DBConUtil.openConnection();
                    String sql = "UPDATE BOOK SET ORDERED = ? WHERE (bookId=?)";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, 1);
                    pstmt.setString(2, checkbox[i]);
                    pstmt.executeUpdate();
                } catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }
        
//        if(book1 != null){
//            bookList.add(b1);
//            total += b1.getPrice();
//        }
//        if(book2 != null){
//            bookList.add(b2);
//            total += b2.getPrice();
//        }
//        if(book3 != null){
//            bookList.add(b3);
//            total += b3.getPrice();
//        }
//        if(book4 != null){
//            bookList.add(b4);
//            total += b4.getPrice();
//        }
//        if(book5 != null){
//            bookList.add(b5);
//            total += b5.getPrice();
//        }
//        if(book6 != null){
//            bookList.add(b6);
//            total += b6.getPrice();
//        }
//        if(book7 != null){
//            bookList.add(b7);
//            total += b7.getPrice();
//        }
//        if(book8 != null){
//            bookList.add(b8);
//            total += b8.getPrice();
//        }
//        if(book9 != null){
//            bookList.add(b9);
//            total += b9.getPrice();
//        }
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookonlinestore", "root", "");
            String sql = "SELECT * FROM BOOK WHERE ORDERED = 1";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                total += rs.getDouble("price");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        payment.setTotalPrice(total);
//        session.setAttribute("bookList", bookList);
        session.setAttribute("payment", payment);
        
        response.sendRedirect("OrderedBooks.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
