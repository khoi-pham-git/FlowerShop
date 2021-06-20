/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class OrderDetailDAO {

    public static void addOrderDetail(int orderId, int productId, int quantity) throws SQLException {
        String sql = "INSERT INTO OrderDetail(orderId ,productId  , quantity) VALUES(" + orderId + "," + productId + "," + quantity + ")";
        doRecord(sql);
    }

    public static void doRecord(String sql) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = dbutils.DBUtils.getConnection();
            pst = cn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (SQLException e) {
        } finally {

            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }

    }
}
