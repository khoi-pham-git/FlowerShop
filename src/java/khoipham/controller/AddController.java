/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.controller;

import khoipham.dto.Product;
import java.io.IOException;

import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddController extends HttpServlet {

    private static final String SUCCESS = "HomeController";
    private static final String ERROR = "error.html";
    private static final String ADDERROR = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            HashMap<String, Product> cart = (HashMap<String, Product>) session.getAttribute("cart");

            int id = Integer.parseInt((String) request.getParameter("productId"));
            String name = (String) request.getParameter("name");
            float price = Float.parseFloat((String) request.getParameter("price"));
            String img = (String) request.getParameter("img");
            Product newProdcut = new Product(id, name, price, 1, img);

            if (cart == null) {
                cart = new HashMap<>();
            }
            String productId = request.getParameter("productId");
            if (cart.get(productId) == null) {
                cart.put(productId, newProdcut);
            } else {
                int currentCount = cart.get(productId).getQuantity();
                newProdcut.setQuantity(currentCount + 1);
                cart.remove(productId);
                cart.put(productId, newProdcut);
                if (currentCount > cart.get(productId).getQuantity()) {
                    request.setAttribute("mess", "Add error!!!");
                    url = ADDERROR;
                    return;
                }
            }
            request.setAttribute("mess", "Add succesfully");
            url = SUCCESS;
            session.setAttribute("cart", cart);

        } catch (NumberFormatException e) {
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
