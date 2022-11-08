<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="AUshop.admin.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="content pb-0">
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <center><h1 class="box-title">CATEGORIES</h1></center>
                         <button> <a href="addcategory.aspx" >ADD CATEGORY</a> </button>
                        </div>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                 <thead>
                                    <tr>
                                       <th class="serial">Sr.NO</th>
                                       
                                 
                                       <th>CATEGORY</th>
                                      <th>Options</th>
                                      
                                        </tr>
                                 </thead>
                                 <tbody>

                          
                        <asp:Repeater ID="categorydl" runat="server">
          <ItemTemplate>
                                    <tr>
                                       <td class="serial"><%#Eval("CATID") %></td>
                                       
                                       <td><%#Eval("catname") %></td>
                                  
                                  <td>
                                       <span class='badge badge-complete'><a href='operation.aspx?catstatus=<%#Eval("catstatus")%>&CATID=<%#Eval("CATID")%>'>Active</a></span>&nbsp
                                    
                                     <span class='badge badge-edit'><a href="addcategory.aspx?catid=<%#Eval("catid") %>">Edit</a></span>&nbsp;

                                     <span class='badge badge-delete'><a href='operation.aspx?catid=<%#Eval("catid") %>&operation=delete'>Delete</a></span>

                                       

                                   </td>

                                    
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
