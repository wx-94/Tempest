/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.AppointmentDAO;
import com.tempest.daos.CustomerDAO;
import com.tempest.daos.HairServicesDAO;
import com.tempest.daos.LoyaltyPointsDAO;
import com.tempest.entities.Appointment;
import com.tempest.entities.LoyaltyPoints;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jacky
 */
@WebServlet(name = "ShiftAppointmentWhenCompletedController", urlPatterns = {"/ShiftAppointmentWhenCompletedController"})
public class ShiftAppointmentWhenCompletedController extends HttpServlet {

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
            CustomerDAO customerDAO = new CustomerDAO();
            LoyaltyPointsDAO loyaltyDAO = new LoyaltyPointsDAO();
            AppointmentDAO apptDAO = new AppointmentDAO();
            ArrayList<Appointment> apptList = new ArrayList<>();
            HairServicesDAO hairServiceDAO = new HairServicesDAO();

            String apptID[] = request.getParameterValues("appointment"); //need set at jsp
            if (apptID.length != 0) {
                for (String appID : apptID) {
                    Appointment a = apptDAO.retrieveAppointment(appID);
                    apptList.add(a);
                }
            }

            if (!apptList.isEmpty() && apptList.size() != 0) {
                for (Appointment appointment : apptList) {
                    apptDAO.createAppointmentHistory(appointment);
                    apptDAO.deleteAppointment(appointment);
                    double points = hairServiceDAO.retrieveHairService(appointment.getTreatment()).getLoyaltyPoints();
                    LoyaltyPoints loyalty = new LoyaltyPoints(appointment.getDateOfAppointment(), points, 0.0, "Appointment", appointment.getCustomer(), appointment.getAppointmentID());
                    loyaltyDAO.createLoyaltyPoints(loyalty);
                    double currentPoints = customerDAO.retrieveCustomer(appointment.getCustomer()).getCustomerPoints();
                    double newPoints = currentPoints + points;
                    customerDAO.updateLoyaltyPoints(appointment.getCustomer(), newPoints);
                }
            }
            request.getSession().setAttribute("success", "Appointment has been successfully deleted");
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
