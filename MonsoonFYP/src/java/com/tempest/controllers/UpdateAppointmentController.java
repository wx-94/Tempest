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
import java.util.Calendar;
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
        try {
            HttpSession session = request.getSession();
            String apptID = (String) session.getAttribute("updateApp");
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

            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String reformattedDate = myDateFormat.format(myDateFormat.parse(date));

            SimpleDateFormat timeFromUser = new SimpleDateFormat("HH:mm");
            SimpleDateFormat myTimeFormat = new SimpleDateFormat("hh:mm:ss");

            String reformattedTime = myTimeFormat.format(timeFromUser.parse(time));

            Date dateOfAppointment = Date.valueOf(reformattedDate);
            Time startTimeOfAppointment = Time.valueOf(reformattedTime);
            Time endTimeOfAppointment = startTimeOfAppointment; //need to find out how to add time

            Appointment currentApp = appointmentDAO.retrieveAppointment(apptID);
            Outlet o = outletDAO.retrieveOutlet(outlet);
            Staff s = staffDAO.retrieveStaffByName(stylist);
            HairServices h = hairServicesDAO.retrieveHairService(hairService);

            Appointment appointment = new Appointment(o.getOutletName(), currentApp.getCustomer(), s.getStaffName(), dateOfAppointment, startTimeOfAppointment, endTimeOfAppointment, h.getHairService());
            if (validateAppointment(currentApp.getCustomer(), appointment, currentApp, o)) {             
                appointmentDAO.updateAppointment(appointment, apptID);
                request.getSession().setAttribute("success", "Appointment has been successfully updated");
                response.sendRedirect("Homepage.jsp");
            } else {
                request.setAttribute("errorMsg", "Appointment has not been updated");
                request.getRequestDispatcher("UpdateAppointment.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean validateAppointment(String username, Appointment appt, Appointment currentApp, Outlet o) {
        ArrayList<Appointment> appByCustomer = appDAO.retrieveAllAppointmentsByCustomer(username);
        boolean clash = false;
        for (Appointment app : appByCustomer) {
            if (!app.equals(currentApp)) {
                Time startTime = app.getStartTimeOfAppointment();
                Time endTime = app.getEndTimeOfAppointment();

                //check if it falls on the same day
                if (app.getDateOfAppointment().equals(appt.getDateOfAppointment())) {
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
                }
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
                    } else if (appt.getStartTimeOfAppointment().after(o.getWeekendEnd())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().before(o.getWeekendStart())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().after(o.getWeekendEnd())) {
                        clash = true;
                    } else if (appt.getStartTimeOfAppointment().equals(o.getWeekendStart())) {
                        clash = true;
                    } else if (appt.getStartTimeOfAppointment().equals(o.getWeekendEnd())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().equals(o.getWeekendStart())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().equals(o.getWeekendEnd())) {
                        clash = true;
                    }
                } else {
                    //weekday timing
                    if (appt.getStartTimeOfAppointment().before(o.getWeekdayStart())) {
                        clash = true;
                    } else if (appt.getStartTimeOfAppointment().after(o.getWeekdayEnd())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().before(o.getWeekdayStart())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().after(o.getWeekdayEnd())) {
                        clash = true;
                    } else if (appt.getStartTimeOfAppointment().equals(o.getWeekdayStart())) {
                        clash = true;
                    } else if (appt.getStartTimeOfAppointment().equals(o.getWeekdayEnd())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().equals(o.getWeekdayStart())) {
                        clash = true;
                    } else if (appt.getEndTimeOfAppointment().equals(o.getWeekdayEnd())) {
                        clash = true;
                    }
                }
            }
        }
        if (clash) {
            return false;
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
