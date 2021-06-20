package khoipham.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainController extends HttpServlet {

    private final String LOGIN = "LoginController";
    private final String REGISTER = "RegisterController";
    private final String HOME = "HomeController";
    private final String LOGOUT = "LogoutController";
    private final String ADD = "AddController";
    private final String BUY = "BuyController";
    private final String SEARCH = "SearchController";
    private final String DELETE= "DeleteController";
    private final String ADMIN= "AdminHomeController";
    private final String UPLOAD= "UploadController";
    private final String UPDATE= "UpdateController";
    private final String ERROR = "error.html";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("Action");
            if ("Login".equalsIgnoreCase(action)) {
                url = LOGIN;
            } else if ("Register".equalsIgnoreCase(action)) {
                url = REGISTER;
            } else if ("Home".equalsIgnoreCase(action)) {
                url = HOME;
            } else if ("Logout".equalsIgnoreCase(action)) {
                url = LOGOUT;
            }else if ("Add".equalsIgnoreCase(action)) {
                url = ADD;
            }else if ("Buy".equalsIgnoreCase(action)) {
                url = BUY;
            }else if ("Search".equalsIgnoreCase(action)) {
                url = SEARCH;
            }else if ("Upload".equalsIgnoreCase(action)) {
                url = UPLOAD;
            }else if ("Delete".equalsIgnoreCase(action)) {
                url = DELETE;
            }else if ("Admin".equalsIgnoreCase(action)) {
                url = ADMIN;
            }else if ("Update".equalsIgnoreCase(action)) {
                url = UPDATE;
            }
        } catch (Exception e) {
            log("Error at maincontrller"+e.toString());
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
