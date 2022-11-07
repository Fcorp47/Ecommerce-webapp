<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="AUshop.customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<style>
    .all-title-box{
     background: url("intro.jpg") no-repeat center center;
     -webkit-background-size: cover;
     -moz-background-size: cover;
     -ms-background-size: cover;
     -o-background-size: cover;
     background-size: cover;
     text-align: center;
     background-attachment: fixed;
     padding: 70px 0px;
     position: relative;
}

</style>

   
       
        <!-- End Navigation -->

    <!-- End Main Top -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

 <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Contact Us</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active"> Customer Panel</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Contact Us  -->
    
    <div class="contact-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>CUSTOMER PANEL</h2>
                        <p>you can update and view your detail over here </p>
                        
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtname" class="form-control" name="name" placeholder="Your Name" runat="server" /> 
                       <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                 

                                </div>
                         <div class="col-md-12">
                                    <div class="form-group">
                                         <asp:TextBox ID="txtemail" class="form-control" name="email" readonly="" runat="server" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                         <asp:TextBox ID="txtadd" class="form-control" name="address" placeholder="Your address" required data-error="Please enter your address" runat="server" ></asp:TextBox>
                                       <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtph" class="form-control" name="phone number" placeholder="Your phone number" required data-error="Please enter your phone number" runat="server" /> 
                                       
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                 <div class="col-md-12">
                                    <div class="form-group">
                                         <asp:TextBox ID="txtzip" class="form-control" name="zip" placeholder=" zip code" required data-error="Please enter your zip code/ Pin code" runat="server" /> 
                                     <div class="help-block with-errors"></div>
                                    </div>
                                
                                    <div class="submit-button text-center">
                                        <asp:Button class="btn hvr-hover" id="btnsubmit" name="submit" runat="server" Text="UPDATE DETAILS" onclick="btnsubmit_Click1"/>
                                        
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                      
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12">
                    
                        <h2>OPTIONS</h2>
                        <p>AUshop </p>
                         
                        <p><a href="yourorders.aspx">Your Order</a> </p>
                      <p><a href="change_pwd.php">Change password</a> </p>
                      <p><a href="#">Your Invoice</a> </p>
                      <p><a href="#">Delete Account</a></p>
     
                  
                </div>
            
 

                
                

</asp:Content>
