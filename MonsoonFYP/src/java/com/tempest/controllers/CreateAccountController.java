/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.CustomerDAO;
import com.tempest.entities.Customer;
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
@WebServlet(name = "CreateAccountController", urlPatterns = {"/createaccount"})
public class CreateAccountController extends HttpServlet {

    ArrayList<String> errorList = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            double points = 0.0;
            String mobile = request.getParameter("mobile");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            //System.out.println("Check acc");
            CustomerDAO customerDAO = new CustomerDAO();
            //check for mobile
            commonValidation(mobile);
            ArrayList<String> numList = customerDAO.retrieveAllNumbers();
            if(numList.contains(mobile)){
                errorList.add("Number has already been used");
            }
            //check for pw           
            if (!password.equals(confirmPassword)) {
                errorList.add("Passwords do not match");
            }
            
            if (errorList.size() == 0) {                
                // Hash a password for the first time
                String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
                Customer customer = new Customer(name, email, points, hashed, mobile);
                System.out.println(customer);
                customerDAO.createCustomer(customer);
                System.out.println("Account created");
                request.getSession().setAttribute("success", "Account has been successfully created");
                response.sendRedirect("Login.jsp");

            } else {
                request.getSession().setAttribute("errorMsg", errorList);
                request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                return;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void commonValidation(String number) {
        try {
            int numInt = Integer.parseInt(number);
            if (!(number.startsWith("6") || number.startsWith("8") || number.startsWith("9"))) {
                errorList.add("Invalid Number: number must start with either 6, 8, 9");
            }
            if (numInt < 60000000) {
                errorList.add("Invalid Number: must be 8 digits");
            }
        } catch (NumberFormatException e) {
            errorList.add("Invalid Number: only numerical digits allowed");
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
