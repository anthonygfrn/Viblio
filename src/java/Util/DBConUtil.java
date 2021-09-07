/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Asus
 */
public class DBConUtil {
    private static final String connectionURL ="jdbc:mysql://localhost:3306/bookonlinestore";
    private static final String driver ="com.mysql.jdbc.Driver";
    private static final String username ="root";
    private static final String password ="";
    private static Connection conn =null;

    public static Connection openConnection(){
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(connectionURL, username, password);
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return conn;
    }
    
        public static void closeConnection(){
        }
}
