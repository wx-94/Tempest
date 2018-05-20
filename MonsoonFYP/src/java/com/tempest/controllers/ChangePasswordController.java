/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.CustomerDAO;
import com.tempest.daos.StaffDAO;
import com.tempest.entities.Customer;
import com.tempest.entities.Staff;
import com.tempest.utility.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/changepassword"})
public class ChangePasswordController extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<String> errorList = new ArrayList<>();

        String username = request.getParameter("username");
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        String confirmNewPassword = request.getParameter("confirmnewpassword");

        //check whether user exist
        try {
            //check whether is it a staff
            if (staffDAO.verifyStaff(username, oldPassword)) { //if staff id and pwd is correct
                // Hash a password for the first time
                String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                // Check that an unencrypted password matches one that has
                // previously been hashed
                if (BCrypt.checkpw(confirmNewPassword, hashed)) {
                    Staff staff = staffDAO.retrieveStaff(username);
                    staff.setPassword(hashed);
                    staffDAO.updatePassword(staff);
                } else {
                    errorList.add("Passwords do not match");
                }
            } //check whether is it a customer 
            else if (customerDAO.verifyCustomer(username, oldPassword)) { //if customer id and pwd is correct
                // Hash a password for the first time
                String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                // Check that an unencrypted password matches one that has
                // previously been hashed
                if (BCrypt.checkpw(confirmNewPassword, hashed)) {
                    Customer customer = customerDAO.retrieveCustomer(username);
                    customer.setCustomerPassword(hashed);
                    customerDAO.updatePassword(customer);
                } else {
                    errorList.add("Passwords do not match");
                }
            } else {
                errorList.add("Invalid username/password");
            }
            
            if (errorList.size() == 0) {
                request.getSession().setAttribute("success", "Password has been successfully changed");
                response.sendRedirect("Login.jsp");
                
            } else {
                request.getSession().setAttribute("errorMsg", errorList);
                request.getRequestDispatcher("ChangePassword.jsp").forward(request,response);
                return;
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
