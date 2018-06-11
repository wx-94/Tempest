/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.InventoryDAO;
import com.tempest.entities.Item;
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
@WebServlet(name = "UpdateInventoryDetailsController", urlPatterns = {"/UpdateInventoryDetailsController"})
public class UpdateInventoryDetailsController extends HttpServlet {

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
            ArrayList<String> errorList = new ArrayList<>();
            InventoryDAO inventoryDAO = new InventoryDAO();
            ArrayList<Item> inventoryList = inventoryDAO.retrieveAllProduct();            
            String name[] = request.getParameterValues("name");
            String desc[] = request.getParameterValues("description");
            
            for (int i = 0; i < inventoryList.size(); i++) {
                int itemID = inventoryList.get(i).getId();
                if (name[i] != null || !name[i].isEmpty()) {
                    inventoryDAO.updateName(itemID, name[i]);
                    inventoryDAO.updateProductName(itemID, name[i]);
                } else {
                    errorList.add("Invalid Product Name");
                }
                if (desc[i] != null || !desc[i].isEmpty()) {
                    inventoryDAO.updateDescription(itemID, desc[i]);
                    inventoryDAO.updateProductDescription(itemID, desc[i]);
                } else {
                    errorList.add("Invalid Product Description");
                }
            }

            if (errorList.size() == 0) {
                request.getSession().setAttribute("success", "Item has been successfully created");
                response.sendRedirect("AdminHomepage.jsp");
            } else {
                request.getSession().setAttribute("errorMsg", errorList);
                request.getRequestDispatcher("UpdateInventory.jsp").forward(request, response);
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
