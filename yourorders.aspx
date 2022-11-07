<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="yourorders.aspx.cs" Inherits="AUshop.yourorders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link rel="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" />
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Your orders</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">ORDERS</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

           
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
 <br />
   <b>
    <h1>
        <CENTER>

       <font size="8"> <asp:Label ID="Label1" Visible="true" runat="server" Text="ORDERS"></asp:Label></font></CENTER></h1>
  
    </b>
    <hr />
    <center>
        <font size="4.3">
         <u> <asp:HyperLink ID="HyperLink2" NavigateUrl="yourorders.aspx" runat="server" Text="ORDERS"></asp:HyperLink>
       </u> </font>
        &nbsp &nbsp
        <font size="4.3">
   <u> <asp:HyperLink ID="HyperLink1" NavigateUrl="yourorders.aspx?stat=cancellist" runat="server" Text="CANCELLED ORDERS"></asp:HyperLink>
       </u> </font>

    </center>
     <center> SORT ORDERS BY:  <asp:DropDownList ID="duration" runat="server" AutoPostBack="True">
         <asp:ListItem>last 30 days</asp:ListItem>
         <asp:ListItem>past 3 months</asp:ListItem>
         <asp:ListItem>2022</asp:ListItem>
         <asp:ListItem>2021</asp:ListItem>
         <asp:ListItem>2020</asp:ListItem>
         <asp:ListItem>2019</asp:ListItem>
         <asp:ListItem>2018</asp:ListItem>
      </asp:DropDownList></center>
    
      <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
          <ItemTemplate>


    <!-- Start Wishlist  -->
    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                   
                    <div class="austore">

                    <div class="table-main table-responsive">
                        <table class="table" id="maintable">
                            <thead>
                                <tr>

                                    <th>Order ID</th>
                                    <th>Order placed</th>
                                    <th>TIME </th>
                                    <th>TOTAL</th>                                 
                                    <th>Cancel</th>
                                    <th>invoice</th>
                               
                                </tr>
                            </thead>
                            
                            <tbody>

                                <tr>
                                    
                                    <td class="name-pr">
                                        <a href="#">
                                        	
                                        	  <%#Eval("OID") %>
                                            <asp:HiddenField ID="hiddenOID" Value='<%#Eval("OID") %>' runat="server" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
                                        	
                                        	  <%#Eval("order_date") %>
									
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
                                        	
                                        	 <%#Eval("order_time") %>
									
								</a>
                                    </td>
                                       
                                    <td class="name-pr">
                                        <a href="#">
                                            
                                              <%#Eval("order_total") %> /-
                                    
                                </a>
                                    </td>
                             
                                  
      
                                    <td class="add-pr">
                                   <a href="yourorders.aspx?oid=<%#Eval("OID") %>&operation=cancelorder&status=<%#Eval("order_status")%>">
                                    <asp:Label ID="cancellabel" runat="server" ForeColor="Red" Text="Cancel Order"></asp:Label>
                                       </a>  
                                       </td>
                                 
                                
                                

                                    <td class="add-pr">
                                   <a href="invoice1.aspx?oid=<%#Eval("OID") %>&amount=<%#Eval("order_total") %>"><font color="green"> view invoice</font></a>
                                    </td>
                                  
                                   
                                </tr>





                                                               </tr>
                            </tbody>
                           
                        </table>
                 
                     <h2><p class="thick"> <%#Eval("order_status")%> ON  <%#Eval("order_date") %></p> </h2>
      
<table id="customers" >
  <tr>

  </tr>


    <asp:Repeater ID="Repeater2" runat="server"><ItemTemplate>

    <tr>
   
                <td width=""><a href="productdesc.aspx?id=<%#Eval("PID")%>"> <asp:Image ID="Image1" runat="server" Width="120" Height="120" ImageUrl='<%#Eval("image1") %>' /></a></td>
               
           <td width="30%"> <%#Eval("pname") %></td>
   
            <td width="30%">Qty. <%#Eval("qty") %></td>

  
    
  </tr>
    </ItemTemplate></asp:Repeater>
   
    </table>


        

      

                                                               </tr>
                            </tbody>
                        </table>
                        </div>

                        </div>
                       
        
                    </div>
                    
               
    
         
            </div>
        </div>
    </div>    
    </ItemTemplate>
            </asp:Repeater>
                                       
    <!-- End Wishlist -->
    <style>



#customers {
  font-family: Arial, Helvetica, sans-serif;

   
  width: 50%;
  
}

#customers td, #customers th {
 


}
p.thick {
  font-weight: bold;
}

#customers tr:nth-child(even){background-color: white;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  align-content: center;
  background-color: darkgrey;
  color: white;
 
}

.austore{
    border: 3px solid grey;
    padding: 15px;
     border-radius: 20px;
  
 }

</style>


</asp:Content>
