﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testyourorder.aspx.cs" Inherits="AUshop.testyourorder" %>
 
<link rel="stylesheet" href="css/style.css">

<div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
         
                    <div class="our-link">
                        <ul>
                            <li><a href="myaccount.aspx"><i class="fa fa-user s_color"></i>
                                My Account              
                                </a></li>
                        
                            <li><a href="feedback.aspx">Contact Us</a></li>
               <li><a href="login.aspx"><asp:Label ID="labellogin" runat="server"><i class="fa fa-user s_color"></i>  LOGIN</asp:Label> </a></li>
                         
                              <li><a href="signin.aspx"><asp:Label ID="labelsignup" runat="server" ><i class="fa fa-sign-in"></i> SIGNUP</asp:Label></a></li>
                            
                            <li><a href="logout.aspx">
                              
                           <asp:Label ID="labellogout" runat="server"><i class="fa fa-power-off"></i> LOGOUT</asp:Label></a></li> 
                        
</li>
                            <%--<li><a href="login.aspx">login</a></li>--%> 
                                   </ul>
                    </div>
                </div>
                

            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                   <a href="index.aspx"><img src="logo.jpeg" /></a>
   <%--   <a class="navbar-brand" href="index.aspx"><h1>AU SHOP</h1></a>--%>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="index.aspx">Home</a></li>
          <li class="nav-item active"><a class="nav-link" href="wish.aspx">Wish List</a></li>
                        <li class="dropdown">
                            <a href="product.aspx" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">STORE</a>
                            <ul class="dropdown-menu">
                                <asp:DataList ID="DataListcat" runat="server">
                                    <ItemTemplate>
                                <li><a style="color:yellow" href ="product.aspx?catid=<%#Eval("CATID") %>"><%#Eval("catname") %></a></li>

                                   </ItemTemplate>
                              </asp:DataList>
				
                            </ul>
                        </li>
                       
                       
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
 
                <!-- Start Atribute Navigation -->
               
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href=""><i class="fa fa-search"></i></a></li>
                        <li class="side-menu">
							<a href="cart.aspx">
								
								<span class="badge"> 
                            
                        </span>
								<p>My Cart</p>
							</a>
						</li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"></a>
                <li class="cart-box">
                    <ul class="cart-list">
                      
                        <li>
                            <a href="#" class="photo"><img src="images/images/<?php echo $row['image'] ?>" class="cart-thumb" alt="" /></a>
                            <h6><a href="productdesc.php?id=<?php echo $row['PID'] ?>"><?php echo $row['pname'] ?></a></h6>
                            <p>p <?php echo $row['pqty'] ?>x - <span class="price"><?php echo $row['pprice'] ?></span></p>
                            <p> total: <span class="price"><?php echo $row['ptotal'] ?></span></p>
                        </li>
                    <?php }  ?>
                        <?php 
$sql=mysqli_query($con,"select sum(ptotal) from cart");
                   while( $row=mysqli_fetch_assoc($sql))
                    {?>
                        
                        <li class="total">
                            <a href="cart.php" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                            <span class="float-right"><strong>Total</strong>: <?php echo $row['sum(ptotal)'] ?></span>
                        </li>
         <?php }        ?>
                    </ul>
                </li>
            </div>
            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container"> <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynav" aria-controls="mynav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button> <a class="navbar-brand" href="#">
            <div class="d-flex">
                <div class="d-flex align-items-center logo bg-purple">
                    <div class="fab fa-joomla h2 text-white"></div>
                </div>
                <div class="ms-3 d-flex flex-column">
                    <div class="h4">Furfection</div>
                    <div class="fs-6">My pet App</div>
                </div>
            </div>
        </a>
        <div class="collapse navbar-collapse" id="mynav">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"> <a class="nav-link active" aria-current="page" href="#">Categories <span class="fas fa-th-large px-1"></span></a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">Exclusive</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">Collections</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">Blogs</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">
                        <div class="cart bg-purple"> <span class="fas fa-shopping-cart text-white"></span> </div>
                    </a> </li>
                <li class="nav-item"> <a class="nav-link" href="#"> <span class="fas fa-user pe-2"></span> Hello Jhon</a> </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-4">
    <div class="row">
        <div class="col-lg-3 my-lg-0 my-md-1">
            <div id="sidebar" class="bg-purple">
                <div class="h4 text-white">Account</div>
                <ul>
                    <li class="active"> <a href="#" class="text-decoration-none d-flex align-items-start">
                            <div class="fas fa-box pt-2 me-3"></div>
                            <div class="d-flex flex-column">
                                <div class="link">My Account</div>
                                <div class="link-desc">View & Manage orders and returns</div>
                            </div>
                        </a> </li>
                    <li> <a href="#" class="text-decoration-none d-flex align-items-start">
                            <div class="fas fa-box-open pt-2 me-3"></div>
                            <div class="d-flex flex-column">
                                <div class="link">My Orders</div>
                                <div class="link-desc">View & Manage orders and returns</div>
                            </div>
                        </a> </li>
                    <li> <a href="#" class="text-decoration-none d-flex align-items-start">
                            <div class="far fa-address-book pt-2 me-3"></div>
                            <div class="d-flex flex-column">
                                <div class="link">Address Book</div>
                                <div class="link-desc">View & Manage Addresses</div>
                            </div>
                        </a> </li>
                    <li> <a href="#" class="text-decoration-none d-flex align-items-start">
                            <div class="far fa-user pt-2 me-3"></div>
                            <div class="d-flex flex-column">
                                <div class="link">My Profile</div>
                                <div class="link-desc">Change your profile details & password</div>
                            </div>
                        </a> </li>
                    <li> <a href="#" class="text-decoration-none d-flex align-items-start">
                            <div class="fas fa-headset pt-2 me-3"></div>
                            <div class="d-flex flex-column">
                                <div class="link">Help & Support</div>
                                <div class="link-desc">Contact Us for help and support</div>
                            </div>
                        </a> </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-9 my-lg-0 my-1">
            <div id="main-content" class="bg-white border">
                <div class="d-flex flex-column">
                    <div class="h5">Hello Jhon,</div>
                    <div>Logged in as: someone@gmail.com</div>
                </div>
                <div class="d-flex my-4 flex-wrap">
                    <div class="box me-4 my-1 bg-light"> <img src="https://www.freepnglogos.com/uploads/box-png/cardboard-box-brown-vector-graphic-pixabay-2.png" alt="">
                        <div class="d-flex align-items-center mt-2">
                            <div class="tag">Orders placed</div>
                            <div class="ms-auto number">10</div>
                        </div>
                    </div>
                    <div class="box me-4 my-1 bg-light"> <img src="https://www.freepnglogos.com/uploads/shopping-cart-png/shopping-cart-campus-recreation-university-nebraska-lincoln-30.png" alt="">
                        <div class="d-flex align-items-center mt-2">
                            <div class="tag">Items in Cart</div>
                            <div class="ms-auto number">10</div>
                        </div>
                    </div>
                    <div class="box me-4 my-1 bg-light"> <img src="https://www.freepnglogos.com/uploads/love-png/love-png-heart-symbol-wikipedia-11.png" alt="">
                        <div class="d-flex align-items-center mt-2">
                            <div class="tag">Wishlist</div>
                            <div class="ms-auto number">10</div>
                        </div>
                    </div>
                </div>
                <div class="text-uppercase">My recent orders</div>
                <div class="order my-3 bg-light">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="d-flex flex-column justify-content-between order-summary">
                                <div class="d-flex align-items-center">
                                    <div class="text-uppercase">Order #fur10001</div>
                                    <div class="blue-label ms-auto text-uppercase">paid</div>
                                </div>
                                <div class="fs-8">Products #03</div>
                                <div class="fs-8">22 August, 2020 | 12:05 PM</div>
                                <div class="rating d-flex align-items-center pt-1"> <img src="https://www.freepnglogos.com/uploads/like-png/like-png-hand-thumb-sign-vector-graphic-pixabay-39.png" alt=""><span class="px-2">Rating:</span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="d-sm-flex align-items-sm-start justify-content-sm-between">
                                <div class="status">Status : Delivered</div>
                                <div class="btn btn-primary text-uppercase">order info</div>
                            </div>
                            <div class="progressbar-track">
                                <ul class="progressbar">
                                    <li id="step-1" class="text-muted green"> <span class="fas fa-gift"></span> </li>
                                    <li id="step-2" class="text-muted green"> <span class="fas fa-check"></span> </li>
                                    <li id="step-3" class="text-muted green"> <span class="fas fa-box"></span> </li>
                                    <li id="step-4" class="text-muted green"> <span class="fas fa-truck"></span> </li>
                                    <li id="step-5" class="text-muted green"> <span class="fas fa-box-open"></span> </li>
                                </ul>
                                <div id="tracker"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="order my-3 bg-light">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="d-flex flex-column justify-content-between order-summary">
                                <div class="d-flex align-items-center">
                                    <div class="text-uppercase">Order #fur10001</div>
                                    <div class="green-label ms-auto text-uppercase">cod</div>
                                </div>
                                <div class="fs-8">Products #03</div>
                                <div class="fs-8">22 August, 2020 | 12:05 PM</div>
                                <div class="rating d-flex align-items-center pt-1"> <img src="https://www.freepnglogos.com/uploads/like-png/like-png-hand-thumb-sign-vector-graphic-pixabay-39.png" alt=""><span class="px-2">Rating:</span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="d-sm-flex align-items-sm-start justify-content-sm-between">
                                <div class="status">Status : Delivered</div>
                                <div class="btn btn-primary text-uppercase">order info</div>
                            </div>
                            <div class="progressbar-track">
                                <ul class="progressbar">
                                    <li id="step-1" class="text-muted green"> <span class="fas fa-gift"></span> </li>
                                    <li id="step-2" class="text-muted"> <span class="fas fa-check"></span> </li>
                                    <li id="step-3" class="text-muted"> <span class="fas fa-box"></span> </li>
                                    <li id="step-4" class="text-muted"> <span class="fas fa-truck"></span> </li>
                                    <li id="step-5" class="text-muted"> <span class="fas fa-box-open"></span> </li>
                                </ul>
                                <div id="tracker"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap');

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif
}

nav {
    min-height: 70px
}

nav .navbar-brand .logo {
    padding: 10px 15px;
    border-radius: 8px
}

nav .navbar-brand .logo .h2 {
    margin: 0
}

nav .navbar-brand .h4 {
    margin-bottom: 0px;
    font-weight: 900
}

nav .navbar-brand .fs-6 {
    font-size: 0.88rem !important
}

nav ul li {
    padding: 0 20px
}

.navbar-light .navbar-nav .nav-link {
    color: #333
}

.navbar-light .navbar-nav .nav-link:hover {
    color: #4e2296
}

.navbar-light .navbar-nav .nav-link.active {
    color: #451296
}

nav ul li a .cart {
    padding: 4px 6px;
    border-radius: 6px;
    position: relative;
    display: inline
}

nav ul li a .cart::after {
    position: absolute;
    content: "";
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background-color: #ff5252;
    top: -1px
}

.navbar-toggler:focus {
    box-shadow: none
}

#sidebar {
    padding: 15px 0px 15px 0px;
    border-radius: 10px
}

#sidebar .h4 {
    font-weight: 500;
    padding-left: 15px
}

#sidebar ul {
    list-style: none;
    margin: 0;
    padding-left: 0rem
}

#sidebar ul li {
    padding: 10px 0;
    display: block;
    padding-left: 1rem;
    padding-right: 1rem;
    border-left: 5px solid transparent
}

#sidebar ul li.active {
    border-left: 5px solid #ff5252;
    background-color: #44007c
}

#sidebar ul li a {
    display: block
}

#sidebar ul li a .fas,
#sidebar ul li a .far {
    color: #ddd
}

#sidebar ul li a .link {
    color: #fff;
    font-weight: 500
}

#sidebar ul li a .link-desc {
    font-size: 0.8rem;
    color: #ddd
}

#main-content {
    padding: 30px;
    border-radius: 15px
}

#main-content .h5,
#main-content .text-uppercase {
    font-weight: 600;
    margin-bottom: 0
}

#main-content .h5+div {
    font-size: 0.9rem
}

#main-content .box {
    padding: 10px;
    border-radius: 6px;
    width: 170px;
    height: 90px
}

#main-content .box img {
    width: 40px;
    height: 40px;
    object-fit: contain
}

#main-content .box .tag {
    font-size: 0.9rem;
    color: #000;
    font-weight: 500
}

#main-content .box .number {
    font-size: 1.5rem;
    font-weight: 600
}

.order {
    padding: 10px 30px;
    min-height: 150px
}

.order .order-summary {
    height: 100%
}

.order .blue-label {
    background-color: #aeaeeb;
    color: #0046dd;
    font-size: 0.9rem;
    padding: 0px 3px
}

.order .green-label {
    background-color: #a8e9d0;
    color: #008357;
    font-size: 0.9rem;
    padding: 0px 3px
}

.order .fs-8 {
    font-size: 0.85rem
}

.order .rating img {
    width: 20px;
    height: 20px;
    object-fit: contain
}

.order .rating .fas,
.order .rating .far {
    font-size: 0.9rem
}

.order .rating .fas {
    color: #daa520
}

.order .status {
    font-weight: 600
}

.order .btn.btn-primary {
    background-color: #fff;
    color: #4e2296;
    border: 1px solid #4e2296
}

.order .btn.btn-primary:hover {
    background-color: #4e2296;
    color: #fff
}

.order .progressbar-track {
    margin-top: 20px;
    margin-bottom: 20px;
    position: relative
}

.order .progressbar-track .progressbar {
    list-style: none;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-left: 0rem
}

.order .progressbar-track .progressbar li {
    font-size: 1.5rem;
    border: 1px solid #333;
    padding: 5px 10px;
    border-radius: 50%;
    background-color: #dddddd;
    z-index: 100;
    position: relative
}

.order .progressbar-track .progressbar li.green {
    border: 1px solid #007965;
    background-color: #d5e6e2
}

.order .progressbar-track .progressbar li::after {
    position: absolute;
    font-size: 0.9rem;
    top: 50px;
    left: 0px
}

#tracker {
    position: absolute;
    border-top: 1px solid #bbb;
    width: 100%;
    top: 25px
}

#step-1::after {
    content: 'Placed'
}

#step-2::after {
    content: 'Accepted';
    left: -10px
}

#step-3::after {
    content: 'Packed'
}

#step-4::after {
    content: 'Shipped'
}

#step-5::after {
    content: 'Delivered';
    left: -10px
}

.bg-purple {
    background-color: #55009b
}

.bg-light {
    background-color: #f0ecec !important
}

.green {
    color: #007965 !important
}

@media(max-width: 1199.5px) {
    nav ul li {
        padding: 0 10px
    }
}

@media(max-width: 500px) {
    .order .progressbar-track .progressbar li {
        font-size: 1rem
    }

    .order .progressbar-track .progressbar li::after {
        font-size: 0.8rem;
        top: 35px
    }

    #tracker {
        top: 20px
    }
}

@media(max-width: 440px) {
    #main-content {
        padding: 20px
    }

    .order {
        padding: 20px
    }

    #step-4::after {
        left: -5px
    }
}

@media(max-width: 395px) {
    .order .progressbar-track .progressbar li {
        font-size: 0.8rem
    }

    .order .progressbar-track .progressbar li::after {
        font-size: 0.7rem;
        top: 35px
    }

    #tracker {
        top: 15px
    }

    .order .btn.btn-primary {
        font-size: 0.85rem
    }
}

@media(max-width: 355px) {
    #main-content {
        padding: 15px
    }

    .order {
        padding: 10px
    }
}
    </style>