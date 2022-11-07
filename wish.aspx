<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="wish.aspx.cs" Inherits="AUshop.wish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- End All Title Box -->
<style>
    .all-title-box{
     background: url("intro.jpg") no-repeat center center;
    
     background-size: cover;
     text-align: center;
     background-attachment: fixed;
     padding: 70px 0px;
     position: relative;
}

</style>

 <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>My Account</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Wish List</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                   <th></th>
                                     <th>Remove</th>
                                    <th>Option</th>
                                </tr>
                            </thead>
                           
                            <tbody>
                               
                                 <asp:Repeater ID="DataList1" runat="server">    
                                   <ItemTemplate>
                                       


                                       <tr>

                                  
                                    
                                    <td class="thumbnail-img">
                                        <a href="#">
                                            <asp:Image ID="Image1" CssClass="img-fluid" runat="server" ImageUrl='<%#Eval("image1") %>' />
                                </a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
                                <%#Eval("pname") %>
                                </a>
                                    </td>
                                    <td class="price-pr">
                                        <p> <%#Eval("pprice") %> </p>
                                    </td>
                                    
                                    
                                    
                                    


                                    <td class="remove-pr">

                                        <a style="color:black" href="wish.aspx?cartid=<%#Eval("WID") %>"> remove </a>
                                </a>
                                        </td>

                                    <td class="remove-pr">

                                        <a style="color:black" href="operations.aspx?pid=<%#Eval("PID") %>&price=<%#Eval("pprice") %>&operation=addtocart"> add to cart </a>
                                </a>
                                    </td>
                                </tr>

</ItemTemplate>
                                
             </asp:Repeater>    

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-6 col-sm-6">
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            
                            <div class="input-group-append">
                             <a style="color:black" href="removeall.php">REMOVE ALL</a>
                               
                            </div>
                        </div>
                    </div>
                </div>
            
              
                
            </div>
           
            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                    
                        <hr>
                       
                        <hr> </div>
                </div>
                </div>

        </div>
    </div>
    <!-- End Cart -->




</asp:Content>
