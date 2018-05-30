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
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jacky
 */
@WebServlet(name = "AppointmentBookingController", urlPatterns = {"/bookAppointment"})
public class AppointmentBookingController extends HttpServlet {

    AppointmentDAO appDAO = new AppointmentDAO();

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
            String username = request.getParameter("username");
            String outlet = request.getParameter("outletChosen");
            String stylist = request.getParameter("stylistChosen");
            String hairService = request.getParameter("hairService");
            String date = request.getParameter("date");
            String time = request.getParameter("time");

            AppointmentDAO appointmentDAO = new AppointmentDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            HairServicesDAO hairServicesDAO = new HairServicesDAO();
            OutletDAO outletDAO = new OutletDAO();
            StaffDAO staffDAO = new StaffDAO();

            SimpleDateFormat dateFromUser = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String reformattedDate = myDateFormat.format(dateFromUser.parse(date));

            SimpleDateFormat timeFromUser = new SimpleDateFormat("HH:mm");
            SimpleDateFormat myTimeFormat = new SimpleDateFormat("hh:mm:ss");

            String reformattedTime = myTimeFormat.format(timeFromUser.parse(time));

            Date dateOfAppointment = Date.valueOf(reformattedDate);
            Time startTimeOfAppointment = Time.valueOf(reformattedTime);
            Time endTimeOfAppointment = startTimeOfAppointment; //need to find out how to add time

            Outlet o = outletDAO.retrieveOutlet(outlet);
            Customer c = customerDAO.retrieveCustomer(username);
            Staff s = staffDAO.retrieveStaffByName(stylist);
            HairServices h = hairServicesDAO.retrieveHairService(hairService);

            Appointment appointment = new Appointment(o.getOutletName(), c.getCustomerEmail(), s.getStaffName(), dateOfAppointment, startTimeOfAppointment, endTimeOfAppointment, h.getHairService());
            if (validateAppointment(username, appointment)) {
                appointmentDAO.createAppointment(appointment);
                System.out.println("Appointment created");
                request.getSession().setAttribute("success", "Appointment has been successfully booked");
                response.sendRedirect("Homepage.jsp");
            } else{
                request.setAttribute("errorMsg", "Appointment has already been made at that time");
                request.getRequestDispatcher("AppointmentBooking.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean validateAppointment(String username, Appointment appt) {
        ArrayList<Appointment> appByCustomer = appDAO.retrieveAllAppointmentsByCustomer(username);
        for (Appointment app : appByCustomer) {
            Time startTime = app.getStartTimeOfAppointment();
            Time endTime = app.getEndTimeOfAppointment();
            boolean clash = false;

            //check if it falls on the same day
            if (app.getDateOfAppointment() == appt.getDateOfAppointment()) {
                //need to check for which day of the wk it is
                if (startTime.equals(appt.getStartTimeOfAppointment())) {
                    clash = true;
                }
                if (startTime.equals(appt.getEndTimeOfAppointment())) {
                    clash = true;
                }

                if (endTime.equals(appt.getEndTimeOfAppointment())) {
                    clash = true;
                }

                if (appt.getStartTimeOfAppointment().equals(endTime)) {
                    clash = true;
                }
                if (appt.getEndTimeOfAppointment().equals(startTime)) {
                    clash = true;
                }

                if ((startTime.after(appt.getStartTimeOfAppointment())) && (startTime.before(appt.getEndTimeOfAppointment()))) {
                    clash = true;
                }

                if ((endTime.after(appt.getStartTimeOfAppointment())) && (endTime.before(appt.getEndTimeOfAppointment()))) {
                    clash = true;
                }

                if ((endTime.after(appt.getEndTimeOfAppointment())) && (startTime.before(appt.getStartTimeOfAppointment()))) {
                    clash = true;
                }

                if ((startTime.after(appt.getStartTimeOfAppointment())) && (endTime.before(appt.getStartTimeOfAppointment()))) {
                    clash = true;
                }

                if ((startTime.equals(appt.getStartTimeOfAppointment())) && (endTime.equals(appt.getEndTimeOfAppointment()))) {
                    clash = true;
                }

                if (clash) {
                    return false;
                }
            }
        }
        return true;
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
