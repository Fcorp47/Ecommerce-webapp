<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="AUshop.admin.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content pb-0">
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <center><h1 class="box-title">FEEDBACK</h1></center>
                           
                        </div>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                 <thead>
                                    <tr>
                                       <th class="serial">Sr.NO</th>
                                       
                                       
                                       <th>NAME</th>
                                       <th>EMAIL</th>
                                       <th>REASON</th>
                                       <th>DESCRIPTION</th>
                                       <th></th>
                                   
                                      
                                        </tr>
                                 </thead>
                                 <tbody>
                                     <asp:Repeater ID="Repeater1" runat="server">
                                         <ItemTemplate>
                                             <tr>
                                             <td><%#Eval("FID") %></td>
                                             <td><%#Eval("cname") %></td>
                                       <td><%#Eval("cemail") %></td>
                                       <td><%#Eval("freason") %></td>
                                       <td><%#Eval("fdesc") %></td>
                                               <td> <span class='badge badge-complete'><a href="feededit.aspx?fid=<%#Eval("FID") %>">edit</a></span></td>
                                  
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
