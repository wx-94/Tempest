/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.CustomerDAO;
import com.tempest.daos.StaffDAO;
import com.tempest.entities.Customer;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Xuan
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "EditProfileController", urlPatterns = {"/EditProfile"})
public class EditProfileController extends HttpServlet {

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
    ArrayList<String> errorList = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String email = request.getParameter("email");
            String newEmail = request.getParameter("newEmail");
            String newNumber = request.getParameter("newNumber");

            InputStream inputStream = null; // input stream of the upload file

            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("photo");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            } else {
                errorList.add("Invalid Photo");
            }

            Customer customer = customerDAO.retrieveCustomer(email);
            commonValidation(newNumber);
            ArrayList<String> numList = customerDAO.retrieveAllNumbers();
            if(numList.contains(newNumber)){
                errorList.add("Number has already been used");
            }
            if (errorList.isEmpty()) {
                CustomerDAO.updateProfile(customer, newNumber, newEmail, inputStream);
                String username = customerDAO.retrieveCustomer(newEmail).getCustomerEmail();
                request.getSession().setAttribute("success", "Profile has been successfully updated");
                request.getSession().setAttribute("username", username);
                response.sendRedirect("Homepage.jsp");

            } else {
                request.getSession().setAttribute("errorMsg", errorList);
                request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
