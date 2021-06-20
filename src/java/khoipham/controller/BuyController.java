/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.controller;

import khoipham.dao.OrderDAO;
import khoipham.dao.OrderDetailDAO;
import khoipham.dao.ProductDAO;
import khoipham.dto.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BuyController extends HttpServlet {

    private final String SUCCESS = "bill.jsp";
    private final String ERROR = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int currentQuantity = 0;
            boolean error = false;
            HashMap<String, Product> cart = (HashMap<String, Product>) session.getAttribute("cart");
            List<Product> bill = new ArrayList<>();
            float total = 0;
            
            for (String x : cart.keySet()) {
                currentQuantity = ProductDAO.getQuantity(cart.get(x).getId());
                if (currentQuantity < cart.get(x).getQuantity()) {                  
                    cart.remove(x);
                    request.setAttribute("error", "WE DON'T HAVE ENOUGH!!!");
                    error = true;
                    url = ERROR;                   
                    return;
                } else {
                    ProductDAO.buy(cart.get(x).getId(), cart.get(x).getQuantity());
                    total += cart.get(x).getPrice() * cart.get(x).getQuantity();
                    bill.add(new Product(cart.get(x).getId(), cart.get(x).getName(), cart.get(x).getPrice(), cart.get(x).getQuantity(), cart.get(x).getImg()));
                }
            }
            if (!error) {
                request.setAttribute("bill", bill);
                request.setAttribute("total", total);
                // tạo ra cái order
                OrderDAO.addOrder((String) session.getAttribute("userId"), total);
                int currentOrderId = OrderDAO.getLastOrder((String) session.getAttribute("userId"));
                // tạo ra orderdetail
                for (Product x : bill) {
                    OrderDetailDAO.addOrderDetail(currentOrderId, x.getId(), x.getQuantity());
                }

                session.removeAttribute("cart");
                url = SUCCESS;
            }
        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

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
