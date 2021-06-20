/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBUtils {
    public static Connection getConnection() throws SQLException{
        Connection conn=null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName= Flower";
            conn=DriverManager.getConnection(url, "sa", "123123");
        } catch (ClassNotFoundException e) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE,null,e);

        }
        return conn;
    }
    public static void main(String args[]) throws SQLException{
        Connection con = getConnection();
                
    }
}
