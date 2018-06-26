<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <link rel="icon" href="favicon.ico">

            <title>Monsoon Hair Saloon - DashBoard</title>

            <!-- Bootstrap core CSS -->
            <!--Need to fix the issue of bootstrap file not loading-->
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/log.css" rel="stylesheet">
            <!--<<l!--temp link-->
            <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

            <!-- Custom styles for this template -->
            <link href="css/carousel.css" rel="stylesheet">
            <link href="css/NavbarAndFooter.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

            <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
            <script type="text/javascript" src="js/jquery.validate.js"></script>

            
            <style>
                .table-wrapper-2 {
                    display: block;
                    max-height: 300px;
                    overflow-y: auto;
                    -ms-overflow-style: -ms-autohiding-scrollbar;
                }
            </style>
    </head>


    <body>
        
        <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <img src="img/Monsoon Hair Logo (Black).png" id="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="Homepage.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Hair Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Outlets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Tutorials</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">E-store</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Appointment Management</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact Us</a>
            </li>
          </ul>
        </div>

        <div class="admin">
            <div class="dropdown">
            <img src="img/cart.svg" width="30" height="30">
                <div class="dropdown-content">
                  <p>Shopping cart to be displayed</p>
                </div>
            </div>

            <div class="dropdown">
            <img src="img/account.svg" width="30" height="30">
                <div class="dropdown-content">
                  <p>Account cart to be displayed</p>
                </div>
            </div>
        </div>
      </nav>
    </header>

        <div class="container mt-5">
            <div class="row">
                <div class="col-12 mb-5 mt-5">
                    <h2>History of Clients Spending</h2>
                    <div class="card">
                        <div class="card-body">
                            <div class="table-wrapper-2">
                                <table class="table table-responsive-md">
                                    <thead class="mdb-color lighten-4">
                                        <tr>
                                            <th>#</th>
                                            <th class="th-lg">Name</th>
                                            <th class="th-lg">Surname</th>
                                            <th class="th-lg">Country</th>
                                            <th class="th-lg">City</th>
                                            <th class="th-lg">Position</th>
                                            <th class="th-lg">Age</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Kate</td>
                                            <td>Moss</td>
                                            <td>USA</td>
                                            <td>New York City</td>
                                            <td>Web Designer</td>
                                            <td>23</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Anna</td>
                                            <td>Wintour</td>
                                            <td>United Kingdom</td>
                                            <td>London</td>
                                            <td>Frontend Developer</td>
                                            <td>36</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Tom</td>
                                            <td>Bond</td>
                                            <td>Spain</td>
                                            <td>Madrid</td>
                                            <td>Photographer</td>
                                            <td>25</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Jerry</td>
                                            <td>Horwitz</td>
                                            <td>Italy</td>
                                            <td>Bari</td>
                                            <td>Editor-in-chief</td>
                                            <td>41</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Janis</td>
                                            <td>Joplin</td>
                                            <td>Poland</td>
                                            <td>Warsaw</td>
                                            <td>Video Maker</td>
                                            <td>39</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Gary</td>
                                            <td>Winogrand</td>
                                            <td>Germany</td>
                                            <td>Berlin</td>
                                            <td>Photographer</td>
                                            <td>37</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Angie</td>
                                            <td>Smith</td>
                                            <td>USA</td>
                                            <td>San Francisco</td>
                                            <td>Teacher</td>
                                            <td>52</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>John</td>
                                            <td>Mattis</td>
                                            <td>France</td>
                                            <td>Paris</td>
                                            <td>Actor</td>
                                            <td>28</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Otto</td>
                                            <td>Morris</td>
                                            <td>Germany</td>
                                            <td>Munich</td>
                                            <td>Singer</td>
                                            <td>35</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-6">
                    <h2>History of Product Sales</h2>
                    <div class="card">
                        <div class="card-body">
                            <div class="table-wrapper-2">
                                <table class="table table-responsive-md">
                                    <thead class="mdb-color lighten-4">
                                        <tr>
                                            <th>#</th>
                                            <th class="th-lg">Name</th>
                                            <th class="th-lg">Surname</th>
                                            <th class="th-lg">Country</th>
                                            <th class="th-lg">City</th>
                                            <th class="th-lg">Position</th>
                                            <th class="th-lg">Age</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Kate</td>
                                            <td>Moss</td>
                                            <td>USA</td>
                                            <td>New York City</td>
                                            <td>Web Designer</td>
                                            <td>23</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Anna</td>
                                            <td>Wintour</td>
                                            <td>United Kingdom</td>
                                            <td>London</td>
                                            <td>Frontend Developer</td>
                                            <td>36</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Tom</td>
                                            <td>Bond</td>
                                            <td>Spain</td>
                                            <td>Madrid</td>
                                            <td>Photographer</td>
                                            <td>25</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Jerry</td>
                                            <td>Horwitz</td>
                                            <td>Italy</td>
                                            <td>Bari</td>
                                            <td>Editor-in-chief</td>
                                            <td>41</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Janis</td>
                                            <td>Joplin</td>
                                            <td>Poland</td>
                                            <td>Warsaw</td>
                                            <td>Video Maker</td>
                                            <td>39</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Gary</td>
                                            <td>Winogrand</td>
                                            <td>Germany</td>
                                            <td>Berlin</td>
                                            <td>Photographer</td>
                                            <td>37</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Angie</td>
                                            <td>Smith</td>
                                            <td>USA</td>
                                            <td>San Francisco</td>
                                            <td>Teacher</td>
                                            <td>52</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>John</td>
                                            <td>Mattis</td>
                                            <td>France</td>
                                            <td>Paris</td>
                                            <td>Actor</td>
                                            <td>28</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Otto</td>
                                            <td>Morris</td>
                                            <td>Germany</td>
                                            <td>Munich</td>
                                            <td>Singer</td>
                                            <td>35</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-6">
                    <h2>History of Stylist Sales</h2>
                    <div class="card">
                        <div class="card-body">
                            <div class="table-wrapper-2">
                                <table class="table table-responsive-md">
                                    <thead class="mdb-color lighten-4">
                                        <tr>
                                            <th>#</th>
                                            <th class="th-lg">Name</th>
                                            <th class="th-lg">Surname</th>
                                            <th class="th-lg">Country</th>
                                            <th class="th-lg">City</th>
                                            <th class="th-lg">Position</th>
                                            <th class="th-lg">Age</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Kate</td>
                                            <td>Moss</td>
                                            <td>USA</td>
                                            <td>New York City</td>
                                            <td>Web Designer</td>
                                            <td>23</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Anna</td>
                                            <td>Wintour</td>
                                            <td>United Kingdom</td>
                                            <td>London</td>
                                            <td>Frontend Developer</td>
                                            <td>36</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Tom</td>
                                            <td>Bond</td>
                                            <td>Spain</td>
                                            <td>Madrid</td>
                                            <td>Photographer</td>
                                            <td>25</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Jerry</td>
                                            <td>Horwitz</td>
                                            <td>Italy</td>
                                            <td>Bari</td>
                                            <td>Editor-in-chief</td>
                                            <td>41</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Janis</td>
                                            <td>Joplin</td>
                                            <td>Poland</td>
                                            <td>Warsaw</td>
                                            <td>Video Maker</td>
                                            <td>39</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Gary</td>
                                            <td>Winogrand</td>
                                            <td>Germany</td>
                                            <td>Berlin</td>
                                            <td>Photographer</td>
                                            <td>37</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Angie</td>
                                            <td>Smith</td>
                                            <td>USA</td>
                                            <td>San Francisco</td>
                                            <td>Teacher</td>
                                            <td>52</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>John</td>
                                            <td>Mattis</td>
                                            <td>France</td>
                                            <td>Paris</td>
                                            <td>Actor</td>
                                            <td>28</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Otto</td>
                                            <td>Morris</td>
                                            <td>Germany</td>
                                            <td>Munich</td>
                                            <td>Singer</td>
                                            <td>35</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
            </div>   
        </div>
    </body>
</html>
