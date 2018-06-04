<%-- 
    Document   : AddNewItem
    Created on : Jun 3, 2018, 6:52:07 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.daos.OutletDAO"%>
<%@page import="com.tempest.entities.Outlet"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Monsoon Hair Saloon</title>

    <!-- Bootstrap core CSS -->
    <!--Need to fix the issue of bootstrap file not loading-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--temp link-->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
    
    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/6F7421C3-831C-7744-9837-FFD4276FB677/main.js" charset="UTF-8"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script> 
    <script src="js/moment.min.js"></script> 
    <script src="js/combodate.js"></script> 
    
    <style>
    .carousel-item > img {
        position: absolute;
        top: 0;
        left: 0;
        min-width: 100%;
        height: 47rem;
    }
    
    
    .carousel-item {
        height: 40rem;
        background-color: #777;
    }
   
    </style>
    </head>
    
    <body>
        <div class ="container">
            <div class="row">
                <div class="col-6 offset-3">
                    <div class="card w-10 " id="apptMenu" >
                        <div class="card-body">                           
                            <form role="form" action="addItem" method = "post">                       
                                <div class="row">
                                  <div class="col-12 mb-3">
                                    <input name="Id" type="text" class="form-control" placeholder="Product Id">
                                  </div>
                                    
                                  <div class="col-12 mb-3">
                                    <input name="Name" type="text" class="form-control" placeholder="Product Name">
                                  </div>
                                    
                                  <div class="col-12 mb-3">
                                    <input name="Description" type="text" class="form-control" placeholder="Product Description">
                                  </div>
                                    
                                    <div class="col-12 mb-3">
                                    <input name="Price" type="text" class="form-control" placeholder="Price">
                                  </div>
                                    
                                    <div class="col-12 mb-3">
                                    <input Name="Quantity" type="text" class="form-control" placeholder="Quatity">
                                  </div>
                                    
                                    <div class="col-12 mb-3">
                                    <input name="Name" type="text" class="form-control" placeholder="Date Added">
                                  </div>
                                    
                                    <div class="col-12 mb-3">
                                    <input name="Name" type="text" class="form-control" placeholder="Comments">
                                  </div>
                                 </div>
                                 <input type="submit" value="Add Item" class="btn btn-lg btn-success btn-block mb-2">      
                            </form>
                    <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="" class="btn btn-lg btn-success btn-block"> </a> 
                </div>
            </div>
               
                                
                                
<!--        <form role="form" action="addItem" method = "post">                               
            Select Outlet
            <select id="inputState" name="outletChosen" class="form-control">                                 
        
            </select><br>
            Product Id: <input name="Id" type="text" class="form-control"><br>
            Product Name: <input name="Name" type="text" class="form-control"><br>
            Product Description: <input name="Description" type="text" class="form-control"><br>
            Price: <input name="Price" type="text" class="form-control"><br>
            Quantity: <input name="Quantity" type="text" class="form-control"><br>
            Date Added: <input id="date" type="text" data-format="DD-MM-YYYY" data-template="D MMM YYYY" name="date" value="01-01-2018"><br>
            Comments: <input name="Comments" type="text" class="form-control"><br>

            <input type="submit" value="Add Item" class="btn btn-lg btn-success btn-block mb-2">      
        </form>-->
    </body>
</html>
