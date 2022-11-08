<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="AUshop.admin.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    


        <div class="content pb-0">
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <center><h1 class="box-title">REPORTS <br /> TOTAL =  <%=Session["count"].ToString() %> </h1></center>
                          <center> TOTAL AMOUNT:  <%=Session["total"].ToString() %>  </center>
                            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged">


                            </asp:Calendar>

                             

                            
                            
                           <a href="reportgen.aspx?date=<%=Session["date"].ToString() %>">GENERATE REPORT</a>

                            
                        </div>

                        <center><h2> <asp:Label ID="Label1" runat="server"><font color="red">- NO DATA AVAILABLE -</font></asp:Label></h2></center>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">

                                 <thead>
                                    <tr>
                                       <th class="serial">OID</th>
                                       
                                       
                                       <th>Customer ID</th>
                                       <th>DATE</th>
                                       <th>TOTAL</th>
                                       <th>STATUS</th>
                                   
                                      
                                        </tr>
                                 </thead>
                                 <tbody>
                            
                                     
                                         <asp:Repeater ID="Repeater1"  runat="server">
                    <ItemTemplate>
                                    
                                                  <tr>                           
          
                                       <td class="serial"><%#Eval("OID") %></td>
                                       


         
                       
                               
                                <td><%#Eval("CID") %></td>
                                       
                                       <td><%#Eval("order_date") %></td>
                                                      <td><%#Eval("order_total") %></td>
  <td> <%#Eval("order_status") %></td>
                             
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
        <?php require('footer.php');?>
</asp:Content>
