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
import java.util.Arrays;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jacky
 */
@WebServlet(name = "DeleteAndUpdateAppointmentController", urlPatterns = {"/DeleteAndUpdateAppointmentController"})
public class DeleteAndUpdateAppointmentController extends HttpServlet {

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
        //check if cancel button is click, if yes, delete the selected appointments
        if (request.getParameter("update") != null) {
            //check if update button is click, if yes, update the selected appointments
            try {
                String apptID[] = request.getParameterValues("appointment");                
                if (apptID != null && apptID.length != 0) {
                    if (apptID.length > 1) {
                        request.setAttribute("errorMsg", "Please select only one appointment to update");
                        request.getRequestDispatcher("ViewAppointments.jsp").forward(request, response);
                    } else {                    
                        request.getSession().setAttribute("updateApp", apptID[0]);
                        response.sendRedirect("UpdateAppointment.jsp");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("cancel") != null) {
            try {
                String apptID[] = request.getParameterValues("appointment");
                if (apptID != null && apptID.length != 0) {
                    for (int i = 0; i < apptID.length; i++) {
                        Appointment app = appDAO.retrieveAppointment(apptID[i]);
                        appDAO.deleteAppointment(app);
                    }
                    request.getSession().setAttribute("success", "Appointment has been successfully deleted");
                    response.sendRedirect("Homepage.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
