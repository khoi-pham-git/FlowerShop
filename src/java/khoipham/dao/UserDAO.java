package khoipham.dao;

import khoipham.dto.User;
import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


public class UserDAO {

    public static Vector<User> getUser() throws SQLException {
        Vector<User> v = new Vector();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = dbutils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT userId , name   FROM Users WHERE roleId='U'";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    v.add(new User(id, name));
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

        return v;
    }

    public static void deleteUser(String userId) throws SQLException {
        String sql = "DELETE FROM users WHERE userId ='" + userId + "'";
        doRecord(sql);
    }

    public static String checkLogin(String userID, String password) throws SQLException {
        String result = "";
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT name , roleId FROM Users where userId = ? AND password = ? ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    result = rs.getString("name") + "_" + rs.getString("roleId").charAt(0);
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
        return result;
    }

    public static boolean checkUsername(String userId) throws SQLException {
        boolean result = false;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT name FROM Users where userId = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, userId);
                rs = pst.executeQuery();
                if (rs.next()) {
                    result = true;
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
        return result;

    }

    public static void register(String userId, String name, String password) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "INSERT INTO Users (userId   , password, name , roleId) VALUES (?,?,? , 'U')";
                pst = cn.prepareStatement(sql);
                pst.setString(1, userId);
                pst.setString(2, password);
                pst.setString(3, name);
                rs = pst.executeQuery();
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

        public boolean checkDuplicated(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userId FROM tblUsers WHERE userId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
