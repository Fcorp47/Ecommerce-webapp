<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="AUshop.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 


    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Checkout</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
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

    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
           
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Billing address</h3>
                        </div>
                        <form class="needs-validation" novalidate>
                            <div class="row">
                               
                                
                            </div>
                      
                        

                            
                            <div class="mb-3">
                                <label for="address2">Flat, House no., Building, Company, Apartment*</label>
                                  <asp:TextBox ID="txtshipaddress" CssClass="form-control" required="" runat="server"></asp:TextBox>
                               </div>
                            
                            <div class="mb-3">
                                <label for="address2">Phone *</label>
                               
                             <asp:TextBox ID="txtphone" CssClass="form-control" required="" maxlength="10" onkeypress='return restrictAlphabets(event)' runat="server"></asp:TextBox>
                               </div>
                            <div class="row">
                                
                                

                                <div class="col-md-3 mb-3">
                                    <label for="zip">Pincode <font color="red">*</font></label>
                                    <asp:TextBox ID="txtpin" CssClass="form-control" required="" onkeypress='return restrictAlphabets(event)' maxlength="6" runat="server"></asp:TextBox>
                               
                                    <div class="invalid-feedback"> Pincode required. </div>
                                </div>
                            </div>
                            
                           <script type="text/javascript">
         /*code: 48-57 Numbers*/
         function restrictAlphabets(e) {
             var x = e.which || e.keycode;
             if ((x >= 48 && x <= 57))
                 return true;
             else
                 return false;
         }
                           </script>
                         

           
                            
                
                            <hr class="mb-1"> </form>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>Shopping cart</h3>
                                </div>

                                <div class="rounded p-2 bg-light">
                                
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"><%#Eval("pname") %></a>
                                            <div class="small text-muted">Price: <%#Eval("pprice")%> <span class="mx-2">|</span> Qty: <%#Eval("pqty")%> <span class="mx-2">|</span> Subtotal: <?php echo $row['ptotal'] ?></div>
                                        </div>
                                    
                                    </div>
                                            </ItemTemplate>
                               </asp:Repeater> 
                              
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
                                <div class="title-left">
                                    <h3>Your order</h3>
                                </div>
                                
                             
                                <div class="d-flex">
                                    
                                    <div class="ml-auto font-weight-bold"><?php $sql=mysqli_query($con,"select sum(ptotal) from cart");
                $row=mysqli_fetch_assoc($sql);
    $subtotal=$row['sum(ptotal)'];
    
                     ?> </div>
                                </div>
                                <hr class="my-1">
                                SUB TOTAL - <%= Session["subtotal"].ToString() %>
                                <hr>
                                <hr class="my-1">
                                GST - 18%
                                <hr>
                                <div class="d-flex gr-total">
                                    <h5>Grand Total</h5>
                                    <div class="ml-auto h5"><%= Session["totalcart"].ToString() %> /- </div><br />
                                    
                                                                    </div>
                                <hr> </div>
                        </div>
                       
                            <div class="col-12 d-flex shopping-box"> <a href="" class="ml-auto btn hvr-hover">
                                <asp:Button ID="btn_order" runat="server" OnClick="btn_order_Click" Text="Proceed to pay" /> </a> </div>


                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->



</asp:Content>
