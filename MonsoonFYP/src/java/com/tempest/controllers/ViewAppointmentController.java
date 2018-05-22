/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.AppointmentDAO;
import com.tempest.daos.CustomerDAO;
import com.tempest.daos.HairServicesDAO;
import com.tempest.daos.OutletDAO;
import com.tempest.daos.StaffDAO;
import com.tempest.entities.Appointment;
import com.tempest.entities.Customer;
import com.tempest.entities.HairServices;
import com.tempest.entities.Outlet;
import com.tempest.entities.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Xuan
 */
@WebServlet(name = "ViewAppointmentController", urlPatterns = {"/viewAppointments"})
public class ViewAppointmentController extends HttpServlet {

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

        //to protect this controller
        HttpSession session = request.getSession();

        String customerCheck = (String) session.getAttribute("username");
        if (customerCheck == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            String email = customerCheck;

            AppointmentDAO appointmentDAO = new AppointmentDAO();
            ArrayList<Appointment> appointmentList = appointmentDAO.retrieveAllAppointmentsByCustomer(email);

            session.setAttribute("appointmentList", appointmentList);
            response.sendRedirect("ViewAppointments.jsp");

        } catch (Exception e) {
            e.printStackTrace();
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
