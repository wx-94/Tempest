/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.InventoryDAO;
import com.tempest.daos.OutletDAO;
import com.tempest.entities.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "AddItemController", urlPatterns = {"/addItem"})
public class AddItemController extends HttpServlet {

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
            InventoryDAO inventoryDAO = new InventoryDAO();
            OutletDAO outletDAO = new OutletDAO();
            
            int productId = Integer.parseInt(request.getParameter("Id"));
            String name = request.getParameter("Name");
            String description = request.getParameter("Description");
            double price = Double.parseDouble(request.getParameter("Price"));
            int quantity = Integer.parseInt(request.getParameter("Quantity"));
            String date = request.getParameter("date");
            String comments = request.getParameter("Comments");
            String outlet = request.getParameter("outletChosen");
            
            SimpleDateFormat dateFromUser = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String reformattedDate = myDateFormat.format(dateFromUser.parse(date));

            Date dateAdded = Date.valueOf(reformattedDate);
            int outletId = Integer.parseInt(outletDAO.retrieveOutlet(outlet).getOutletNumber());
            
            Item item = new Item(productId, name, description, price, 
                    quantity, dateAdded, comments, outletId);

            inventoryDAO.addItem(item);
            System.out.println("Item created");
            request.getSession().setAttribute("success", "Item has been successfully created");
            response.sendRedirect("ViewInventory.jsp");

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
