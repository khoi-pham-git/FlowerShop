/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.controller;

import khoipham.dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khoipham.dto.UserError;


@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private final String SUCCESS = "login.jsp ";
    private final String ERROR = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        UserError errorObject = new UserError("", "", "", "", "");
        try {
            String userID = request.getParameter("txtUserID");
            String fullName = request.getParameter("txtFullName");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            boolean check = true;
            if (userID.isEmpty()) {
                check = false;
                errorObject.setUserIDError("UserID is not empty!");
            }
            if (fullName.isEmpty()) {
                check = false;
                errorObject.setFullNameError("Fullname is not empty !");
            }
            if (!password.equals(confirm)) {
                check = false;
                errorObject.setConfirmError(" The two passwords do not match!");
            }
            if (UserDAO.checkUsername(userID)) {
                check = false;
                errorObject.setUserIDError("UserID is not available !");
            }
            if (check) {
                url = SUCCESS;
                khoipham.dao.UserDAO.register(userID, fullName, password);
            } else {
                request.setAttribute("ERROR", errorObject);
            }

        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                errorObject.setUserIDError("userID is duplicate");
                request.setAttribute("ERROR", errorObject);
            }
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
