/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tempest.utility.Authenticate;
import com.tempest.daos.StaffDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author jacky
 */
@WebServlet(name = "LoginController", urlPatterns = {"/authenticate"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    CustomerDAO customerDAO = new CustomerDAO();
    StaffDAO staffDAO = new StaffDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            if (username.equals("admin")) {
                if (password == null || !password.equals("password")) {
                    request.setAttribute("errorMsg", "Invalid username/password");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } else {
                    String token = Authenticate.sign("admin");
                    request.getSession().setAttribute("token", token);
                    response.sendRedirect("Homepage.jsp");
                }
                
            } else if (staffDAO.verifyStaff(username, password)) { //if staff id and pwd is correct
                String token = Authenticate.sign(username);
                request.getSession().setAttribute("token", token);
                response.sendRedirect("Homepage.jsp");
                
            } else if (customerDAO.verifyCustomer(username, password)) { //if customer id and pwd is correct
                String token = Authenticate.sign(username);
                request.getSession().setAttribute("token", token);
                response.sendRedirect("Homepage.jsp");
                
            } else { //if user pwd is wrong, or both fields are not entered
                request.setAttribute("errorMsg", "Invalid username/password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
