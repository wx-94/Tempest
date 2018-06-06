/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.AppointmentDAO;
import com.tempest.entities.Appointment;
import com.tempest.entities.Outlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan
 */
@WebServlet(name = "UpdateAppointmentController", urlPatterns = {"/UpdateAppointmentController"})
public class UpdateAppointmentController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean validateAppointment(String username, Appointment appt, Outlet o) {
        ArrayList<Appointment> appByCustomer = appDAO.retrieveAllAppointmentsByCustomer(username);
        for (Appointment app : appByCustomer) {
            Time startTime = app.getStartTimeOfAppointment();
            Time endTime = app.getEndTimeOfAppointment();
            boolean clash = false;

            //check if it falls on the same day
            if (app.getDateOfAppointment() == appt.getDateOfAppointment()) {
                //need to check for which day of the wk it is
                //check for public hols first
                //check for weekend

                Calendar c1 = Calendar.getInstance();
                c1.setTime(app.getDateOfAppointment());
                if ((c1.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY)
                        || c1.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                    //weekend timing
                    if (appt.getStartTimeOfAppointment().before(o.getWeekendStart())) {
                        clash = true;
                    }
                    if (appt.getStartTimeOfAppointment().after(o.getWeekendEnd())) {
                        clash = true;
                    }
                    if (appt.getEndTimeOfAppointment().before(o.getWeekendStart())) {
                        clash = true;
                    }
                    if (appt.getEndTimeOfAppointment().after(o.getWeekendEnd())) {
                        clash = true;
                    }
                } else {
                    //weekday timing
                    if (appt.getStartTimeOfAppointment().before(o.getWeekdayStart())) {
                        clash = true;
                    }
                    if (appt.getStartTimeOfAppointment().after(o.getWeekdayEnd())) {
                        clash = true;
                    }
                    if (appt.getEndTimeOfAppointment().before(o.getWeekdayStart())) {
                        clash = true;
                    }
                    if (appt.getEndTimeOfAppointment().after(o.getWeekdayEnd())) {
                        clash = true;
                    }
                }

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
