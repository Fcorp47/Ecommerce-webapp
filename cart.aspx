<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="AUshop.cart" %>
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
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   <h1> <center><b><font color="red"><asp:Label ID="Label2" runat="server" ></asp:Label></font></b></center></h1>
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
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                           
                            <tbody>
                               
                                
                                      <asp:Repeater ID="DataList1"  runat="server">
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
                                    <td class="quantity-box">
                                  <a href="cartqty.aspx?cartid=<%#Eval("CARTID")%>&op=sub"> <font size="6"><i class="fa fa-minus-square" aria-hidden="true"></i></font></a>
                                      </span>
                                      <span class="num">
                                       <font size="7"><asp:Label ID="Label1" runat="server" Text='<%#Eval("pqty")%>'></asp:Label></font> 
                                      </span>
                                      <span class="inc">
                                    
                                         <a href="cartqty.aspx?cartid=<%#Eval("CARTID")%>&op=add">  <font size="6"> <i class="fa fa-plus-square" aria-hidden="true"></i></font></a>

                                        <%--<a href="cartqty.aspx?cartid=<%#Eval("CARTID")%>&op=sub"><font size="8">-  </font></a>--%>
                                    <%-- <font size="8"><asp:Label ID="Label1" runat="server" Text='<%#Eval("pqty")%>'></asp:Label></font> --%>
                                        <%--<a href="cartqty.aspx?cartid=<%#Eval("CARTID")%>&op=add"><font size="8">  +</font></a>--%>

                                        </td>
                                    


                                    
                                    
                                    <td class="total-pr">
                                        <p id="total"> <%#Eval("ptotal") %> </p>
                                    </td>


                                    <td class="remove-pr">

                                        <a href="cart.aspx?cartid=<%#Eval("CARTID") %>"> remove </a>
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
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                            <div class="ml-auto h5"><%= Session["subtotal"].ToString() %></div>
                        </div>
                        <hr> </div>
                </div>
                <div class="col-12 d-flex shopping-box"><a href="order.aspx" class="ml-auto btn hvr-hover">Proceed to buy</a> </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->




</asp:Content>
