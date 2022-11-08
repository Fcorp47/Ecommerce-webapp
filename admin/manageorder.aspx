 <%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="manageorder.aspx.cs" Inherits="AUshop.admin.pendingorder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     




        <div class="content pb-0">

            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">

                      
                       
      <div class="card-body">
                        
          

                        
                     
                        </div><div class="card-body">
                           <center><asp:Label ID="labeltodays" Visible="false" runat="server" CssClass="box-title"/></center>
                         
                        </div>
                             <hr color=red>

                         <asp:TextBox ID="txtsearch" Width="30%" runat="server"></asp:TextBox> &nbsp<asp:Button ID="searchbtn" Width="30%" runat="server" onclick="searchbtn_Click" Text="search" />
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                 <thead>
                                    <tr>
                                       <th class="serial">ORDER ID</th>
                                       
                                      <th>Name</th>
                                      <th>Email</th>
                                      <th>Shippping Address</th>
                                      <th>Date</th>
                                      <th>Total</th>
                                     <th>Status</th>
                                      <th></th>
                                        </tr>
                                 </thead>
                                 <tbody>
                                
                                     <asp:Repeater ID="DataList1" runat="server">
                               <ItemTemplate>
                                    <tr>


                                        <td><%#Eval("OID") %></td>
                                        <td><%#Eval("cname") %></td>
                                        <td><%#Eval("cemail") %></td>
                                        <td><%#Eval("caddress") %></td>
                                        <td><%#Eval("order_date") %></td>
                                        <td><%#Eval("order_total") %></td>
                                        <td><%#Eval("order_status") %></td>
                                       
                                        <td> <span class='badge badge-complete'><a href="orderdetail.aspx?oid=<%#Eval("OID") %>">edit</a></span></td>
                                  
                                     
                                     
                        
                                     
                                    </tr>
                                       </ItemTemplate>
                                    </asp:Repeater>
                                      
                                 </tbody>
                              </table>
                           </div>
                        </div>

                      <center> <asp:Label ID="Label1" runat="server" Visible="true" ForeColor="Red" Text="NO ORDERS"></asp:Label></center>
                  
                         </div>
                             <button><a href="orders.aspx">Back</a></button>
                  </div>
               </div>
            </div>
		  </div>
        
</asp:Content>
