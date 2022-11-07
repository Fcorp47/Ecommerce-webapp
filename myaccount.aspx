<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="AUshop.myaccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script src="https://kit.fontawesome.com/c52448205c.js" crossorigin="anonymous"></script>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>My Account</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">My Account</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start My Account  -->
    <div class="my-account-box-main">
        <div class="container">
            <div class="my-account-page">
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="yourorders.aspx"> <i class="fa fa-gift"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Your Orders</h4>
                                    <p>Track or cancel your orders again</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="customer.aspx"><i class="fa fa-lock"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Login &amp; security</h4>
                                    <p>Edit login, name, and mobile number</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="feedback.aspx"> <i class="fa fa-location-arrow"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Give Feedback</h4>
                                    <p>provide feedbacks and complaints </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="change_pwd.aspx"> <i class="fa-regular fa-key"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>RESET PASSWORD</h4>
                                    <p>reset your old password</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="change_pwd.aspx"><i class="fa fa-money" aria-hidden="true"></i></a>
                                </div>
                                <div class="service-desc">
                                    <h4>EXPENSES</h4>
                                    <p>find out reports of money spent on shopping</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                        
                    </div>
                </div>
            </div>
        </div>
    
</asp:Content>
