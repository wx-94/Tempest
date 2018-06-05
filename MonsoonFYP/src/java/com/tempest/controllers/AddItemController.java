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
import java.util.ArrayList;
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
            ArrayList<String> errorList = new ArrayList<>();

            int productId = Integer.parseInt(request.getParameter("Id"));
            String name = request.getParameter("Name");
            if (name.isEmpty() || name == null) {
                errorList.add("Invalid Product Name");
            }
            String description = request.getParameter("Description");
            if (description.isEmpty() || description == null) {
                errorList.add("Invalid Description for the product");
            }
            double price = Double.parseDouble(request.getParameter("Price"));
            if (price <= 0) {
                errorList.add("Price entered must be more than 0");
            }
            int quantity = Integer.parseInt(request.getParameter("Quantity"));
            if (quantity <= 0) {
                errorList.add("Quantity entered must be more than 0");
            }
            String date = request.getParameter("date");
            String comments = request.getParameter("Comments");
            if (comments.isEmpty() || comments == null) {
                errorList.add("Invalid Comments on the Product");
            }
            String outlet = request.getParameter("outletChosen");

            SimpleDateFormat dateFromUser = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String reformattedDate = myDateFormat.format(dateFromUser.parse(date));

            Date dateAdded = Date.valueOf(reformattedDate);
            int outletId = 0;
            if (comments.isEmpty() || comments == null) {
                errorList.add("Invalid Comments on the Product");
            } else {
                outletId = Integer.parseInt(outletDAO.retrieveOutlet(outlet).getOutletNumber());
            }

            if (errorList.size() == 0) {
                Item item = new Item(productId, name, description, price,
                        quantity, dateAdded, comments, outletId);

                inventoryDAO.addItem(item);
                System.out.println("Item created");
                request.getSession().setAttribute("success", "Item has been successfully created");
                response.sendRedirect("ViewInventory.jsp");
            } else {
                request.getSession().setAttribute("errorMsg", errorList);
                request.getRequestDispatcher("AddNewItem.jsp").forward(request, response);
                return;
            }
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
