/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.AppointmentDAO;
import com.tempest.daos.OutletDAO;
import com.tempest.daos.StaffAvailabilityDAO;
import com.tempest.daos.StaffDAO;
import com.tempest.entities.Appointment;
import com.tempest.entities.Customer;
import com.tempest.entities.HairServices;
import com.tempest.entities.Outlet;
import com.tempest.entities.Staff;
import com.tempest.entities.StaffAvailability;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan
 */
@WebServlet(name = "AddStaffAvailabilityController", urlPatterns = {"/addStaffAvailability"})
public class AddStaffAvailabilityController extends HttpServlet {

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

        StaffAvailabilityDAO staffAvailabilityDAO = new StaffAvailabilityDAO();
        /**
         * Processes requests for both HTTP <code>GET</code> and
         * <code>POST</code> methods.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */

        try {
            String outlet = request.getParameter("outletChosen");
            String stylist = request.getParameter("stylistChosen");
            String date = request.getParameter("date");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");

            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String reformattedDate = myDateFormat.format(myDateFormat.parse(date));

            SimpleDateFormat startTimeFromUser = new SimpleDateFormat("HH:mm");
            SimpleDateFormat myStartTimeFormat = new SimpleDateFormat("HH:mm:ss");

            String reformattedStartTime = myStartTimeFormat.format(startTimeFromUser.parse(startTime));
            
            SimpleDateFormat endTimeFromUser = new SimpleDateFormat("HH:mm");
            SimpleDateFormat myEndTimeFormat = new SimpleDateFormat("HH:mm:ss");

            String reformattedEndTime = myEndTimeFormat.format(endTimeFromUser.parse(endTime));

            Date availableDate = Date.valueOf(reformattedDate);
            Time availableStartTime = Time.valueOf(reformattedStartTime);
            Time availableEndTime = Time.valueOf(reformattedEndTime); //need to find out how to add time
            
            StaffAvailability staffAvailability = new StaffAvailability(stylist, outlet, availableDate, availableStartTime, availableEndTime);

            staffAvailabilityDAO.createStaffAvailability(staffAvailability);
            System.out.println("Availability created");
            request.getSession().setAttribute("success", "Availability has been successfully booked");
            response.sendRedirect("AdminHomepage.jsp");

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
