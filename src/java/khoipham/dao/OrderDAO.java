/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class OrderDAO {

    public static void addOrder(String userId, float totalPrice) throws SQLException {
        String sql = "INSERT INTO Orders (userId , totalPrice) VALUES ('" + userId + "' ," + totalPrice + ")";
        doRecord(sql);

    }

    public static int getLastOrder(String userId) throws SQLException {
        PreparedStatement pst = null;
        Connection cn = null;
        ResultSet rs = null;
        int currentOrderId = 0;
        try {
            cn = dbutils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT TOP 1 orderId FROM Orders WHERE userId = '" + userId + "'ORDER BY orderId DESC ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    currentOrderId = rs.getInt("orderId");
                    return currentOrderId;
                }
            }

        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return 0;
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
