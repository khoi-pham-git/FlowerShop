/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.dao;

import khoipham.dto.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class ProductDAO {

    public static Vector<Product> getProduct() throws SQLException {
        Vector<Product> v = new Vector();
        PreparedStatement pst = null;
        Connection cn = null;
        ResultSet rs = null;
        try {
            cn = dbutils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT  id , name , price , quantity  , img FROM Products ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    v.add(new Product(id, name, price, quantity, img));
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

    public static Vector<Product> searchProduct(String key) throws SQLException {
        Vector<Product> v = new Vector();
        PreparedStatement pst = null;
        Connection cn = null;
        ResultSet rs = null;
        try {
            cn = dbutils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT  id , name , price , quantity  , img FROM Products WHERE name like '%" + key + "%'";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    v.add(new Product(id, name, price, quantity, img));
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

    public static int getQuantity(int id) throws SQLException {
        PreparedStatement pst = null;
        Connection cn = null;
        ResultSet rs = null;
        try {
            cn = dbutils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT  quantity   FROM Products WHERE id =" + id;
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    int quantity = rs.getInt("quantity");
                    return quantity;
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

    public static int getId(String name) throws SQLException {
        PreparedStatement pst = null;
        Connection cn = null;
        ResultSet rs = null;
        int id = 0;
        try {
            cn = dbutils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "select id\n"
                        + "from Products\n"
                        + "where name = '"+name+"'";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    id = rs.getInt("id");
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
        return id;
    }

    public static void buy(int id, int quantity) throws SQLException {
        PreparedStatement pst = null;
        Connection cn = null;
        ResultSet rs = null;
        try {
            cn = dbutils.DBUtils.getConnection();
            int currentQuantity = 0;
            if (cn != null) {
                String sql = "SELECT  quantity   FROM Products WHERE id =" + id;
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    currentQuantity = rs.getInt("quantity");
                }
                currentQuantity = currentQuantity - quantity;
                sql = "UPDATE Products SET quantity = " + currentQuantity + " WHERE id = " + id;
                pst = cn.prepareStatement(sql);
                pst.executeUpdate();
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

    public static void deleteProduct(String id) throws SQLException {
        String sql = "DELETE products WHERE id =" + id;
        doRecord(sql);
    }

    public static void uploadProduct(Product newProduct) throws SQLException {
        String sql = "INSERT INTO Products( name , price , quantity , img) VALUES('" + newProduct.getName() + "'," + newProduct.getPrice() + "," + newProduct.getQuantity() + " , '" + newProduct.getImg() + "')";
        doRecord(sql);

    }

    public static void updateProduct(Product newProduct) throws SQLException {
        String sql = "UPDATE Products set quantity = " + newProduct.getQuantity() + ", name='" + newProduct.getName() + "' ,price=" + newProduct.getPrice() + " WHERE id =" + newProduct.getId();
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

//    public static void main(String args[]) throws SQLException {
//        Product newProduct = new Product("hung", 34, 50, "1.jpg");
//        uploadProduct(newProduct);
////        updateProduct(newProduct);
//
//    }
}
