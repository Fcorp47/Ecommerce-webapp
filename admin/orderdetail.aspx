<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="orderdetail.aspx.cs" Inherits="AUshop.admin.orderdetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    



<style>
      hr{
        height: 1px;
        background-color: red;
        border: none;
    }
 </style>
        <div class="content pb-0" >
            <div class="orders" style="border:solid">
               <div class="row">
                  <div class="col-xl-12" >
                     <div class="card">
                        <div class="card-body">
                 <asp:DataList ID="DataList2" runat="server">
                     <ItemTemplate>
                      Order ID:  <%#Eval("OID") %><br>
                      At date:  <%#Eval("order_date") %><br>
                      Status:  <%#Eval("order_status") %><br>
                         </ItemTemplate>
                 </asp:DataList>
                     <hr style="width:50%;text-align:left;margin-left:0">
                     <label>status: </label>

                            <asp:DropDownList ID="DropDownList1" runat="server">

                                <asp:ListItem Selected="True" Disabled="true" >--select--</asp:ListItem>
                                <asp:ListItem>PLACED</asp:ListItem>
                                <asp:ListItem>DELIVERED</asp:ListItem>
                                <asp:ListItem>FAILED</asp:ListItem>
                                <asp:ListItem>CANCELLED</asp:ListItem>

                            </asp:DropDownList>

                      <%--<select name="status">
                        <option selected disabled>--select--</option>
                         <option value="placed">Placed</option>
                         <option value="delivered">Delivered</option>
                         <option value="failed">Failed</option>
                      </select>--%>
<br>
                      <label>remarks: </label><br>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:Button ID="SAVE" OnClick ="save_Click" runat="server" Text="SAVE" />
                          
                     
      
<button><a href="orders.aspx">Back</a></button>

                              

                           <center><h1 class="box-title">ORDER DETAILS</h1></center>
                         
                        </div>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                 <thead>
                                    <tr>
                                       <th class="serial">Sr.NO</th>
                                  
                                      <th>product</th>
                                      <th>Qty</th>
                                     <th></th>
                                      
                                      
                                        </tr>
                                 </thead>
                                 <tbody>
                                     <asp:Repeater ID="DataList1" runat="server">
                                         <ItemTemplate><tr>
                                       <td class="serial"><%#Eval("PID") %></td>
                              
                              <td ><%#Eval("pname") %></td>
                              <td ><%#Eval("qty") %></td>
                                             <td></td>
                              
                              
                                     
                                      
                                    </tr>
                                    </ItemTemplate>
                                    
                                      </asp:Repeater>
                                 </tbody>
                              </table>
                           </div>

                        </div>
                     </div>
                  </div>
               </div>
            </div>
		  </div>



</asp:Content>
