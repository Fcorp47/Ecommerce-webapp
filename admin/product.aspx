<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="AUshop.admin.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    


        <div class="content pb-0">
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <center><h1 class="box-title">PRODUCT</h1></center>
                           <button><a href="addproduct.aspx" >ADD PRODUCT</a></button> 

                            
                        </div>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                 <thead>
                                    <tr>
                                       <th class="serial">ID</th>
                                       
                                       
                                       <th>IMAGE</th>
                                       <th>NAME</th>
                                       <th>PRICE</th>
                                       <th></th>
                                   
                                      
                                        </tr>
                                 </thead>
                                 <tbody>
                            
                                    
                        <asp:Repeater ID="DataListcat" runat="server">
          <ItemTemplate>
                                    
                                                  <tr>                           
          
                                       <td class="serial"><%#Eval("PID") %></td>
                                       


         
                       
                                       <td>  <asp:Image ID="Image1" runat="server" class="img-fluid" ImageUrl='<%#Eval("image1") %>' /> </td>
                             
                                <td><%#Eval("pname") %></td>
                                       
                                       <td><%#Eval("pprice") %></td>

                        <td>

                          <span class='badge badge-complete'><a href="operation.aspx?pid=<%#Eval("pid") %>&status=<%#Eval("pstatus") %>&operation=status">Active</a></span>&nbsp;
                                     <span class='badge badge-edit'><a href="updateproduct.aspx?pid=<%#Eval("pid") %>&operation=edit">Edit</a></span>&nbsp;
                                     <span class='badge badge-delete'><a href="operation.aspx?pid=<%#Eval("pid") %>&operation=delete">Delete</a></span>
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
        <?php require('footer.php');?>

</asp:Content>
