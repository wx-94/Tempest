/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.controllers;

import com.tempest.daos.CustomerDAO;
import com.tempest.daos.InventoryDAO;
import com.tempest.entities.Customer;
import com.tempest.entities.Item;
import com.tempest.entities.OrderItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jacky
 */
public class AddItemsToController extends HttpServlet {

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
            String quantity[] = request.getParameterValues("quantity");
            ArrayList<OrderItem> cartList = new ArrayList<>();

            for (int i = 0; i < inventoryList.size(); i++) {
                Item product = inventoryList.get(i);
                if (quantity[i] != null || !quantity[i].isEmpty()) {
                    try {
                        int amount = Integer.parseInt(quantity[i]);
                        if (amount > 0) {
                            OrderItem orderedItem = new OrderItem(product.getId(), product.getName(), product.getDescription(), product.getPrice(), amount);
                            cartList.add(orderedItem);
                        }
                    } catch (Exception e) {
                        errorList.add("Invalid Product Quantity");
                    }
                }
                if (errorList.size() == 0) {
                    request.getSession().setAttribute("cartList", cartList); //shopping cart list
                    request.getSession().setAttribute("success", "Item has been successfully added to cart");
                    response.sendRedirect("Homepage.jsp");
                } else {
                    request.getSession().setAttribute("errorMsg", errorList);
                    request.getRequestDispatcher("AddItemsToCart.jsp").forward(request, response);
                    return;
                }

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
