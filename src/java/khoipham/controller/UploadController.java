package khoipham.controller;

import khoipham.dto.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khoipham.dao.ProductDAO;
import khoipham.dto.ProductError;
import java.sql.SQLException;

public class UploadController extends HttpServlet {

    private final String SUCCESS = "AdminHomeController";
    private final String ERROR = "adminError.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("name");
            float price = Float.parseFloat((String) request.getParameter("price"));
            int quantity = Integer.parseInt((String) request.getParameter("quantity"));
            String img = request.getParameter("img");
            ProductError error = new ProductError("", "", "", "");
            boolean check = false;
            if (name.length() < 3 || name.length() > 10) {
                check = true;
                error.setNameError("Must not be blank and must be greater than 3 characters and less than 10 characters");
            }
            if (price < 0) {
                check = true;
                error.setPriceError("Must not be left blank and must be greater than 0");
            }
            if (quantity < 0) {
                check = true;
                error.setQuantityError("Must not be left blank and must be greater than 0");
            }
            if (img.length() < 3 || img.length() > 10) {
                check = true;
                error.setNameError("Must not be blank and must be greater than 3 characters and less than 10 characters");
            }
            Product newProduct = new Product(name, price, quantity, img);
            ProductDAO.uploadProduct(newProduct);
            url = SUCCESS;
        } catch (SQLException e) {
            log(e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

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
