<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="subcat.aspx.cs" Inherits="AUshop.admin.subcat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
             
 <div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Add Sub-Category</strong><small></small></div>
                      
                            <div class="card-body card-block">
                           <div class="form-group">
                               <div class="form-group">
                              <label class="form-control-label">Category: </label>
                               <asp:DropDownList ID="cat_list" class="form-control" CssClass="form-control" runat="server" AutoPostBack="True">

                               </asp:DropDownList>
                           </div>
                               
                           <div class="form-group">
                              <label class="form-control-label">Sub-Categry name: </label>
                              <asp:TextBox ID="subname" class="form-control" placeholder="Enter Sub-Categry name" CssClass="form-control" runat="server"></asp:TextBox>
                           </div>
                               </div>
                                <asp:Button ID="submit" runat="server" Text="submit" class="btn btn-lg btn-info btn-block" OnClick="submit_Click"/>
                          
                           <span id="payment-button-amount">Submit</span>
                          
                        </div>
                       
                     </div>
                  </div>
               </div>
            </div>
         </div>

    <div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Add Brand</strong><small></small></div>
                      
                            <div class="card-body card-block">
                           <div class="form-group">
                              
                               
                           <div class="form-group">
                              <label class="form-control-label">Brand name: </label>
                              <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter Sub-Categry name" CssClass="form-control" runat="server"></asp:TextBox>
                           </div>
                               </div>
                    
                          <asp:Button ID="btnn" runat="server" Text="submit" class="btn btn-lg btn-info btn-block" onclick="btnn_Click"/>
                           <span id="payment-button-amount">Submit</span>
                          
                        </div>
                       
                     </div>
                  </div>
               </div>
            </div>
         </div>

   
     <div class="content pb-0">
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <center><h1 class="box-title">BRAND</h1></center>
                         
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
                                   
                             <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                                    <tr>
                                       <td class="serial"><%#Eval("BID") %></td>
                                       
                                       <td><%#Eval("bname") %></td>
                                  
                                  <td>
                                       <span class='badge badge-complete'><a href='#'>Active</a></span>&nbsp
                                    
                                     <span class='badge badge-edit'><a href="#">Edit</a></span>&nbsp;

                                     <span class='badge badge-delete'><a href='operation.aspx?bid=<%#Eval("BID") %>&operation=delete'>Delete</a></span>

                                       

                                   </td>

                                    
                                    </tr>
                                         </ItemTemplate>
                                 </asp:DataList>
                        
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
		  </div>


   

     <div class="content pb-0">
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <center><h1 class="box-title">SUB-CATEGORIES</h1></center>
                         
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
                                   
                             <asp:DataList ID="subcatlist" runat="server">
                    <ItemTemplate>
                                    <tr>
                                       <td class="serial"><%#Eval("SUBID") %></td>
                                       
                                       <td><%#Eval("subname") %></td>
                                  
                                  <td>
                                       <span class='badge badge-complete'><a href='#'>Active</a></span>&nbsp
                                    
                                     <span class='badge badge-edit'><a href="addcategory.aspx?catid=<%#Eval("catid") %>">Edit</a></span>&nbsp;

                                     <span class='badge badge-delete'><a href='operation.aspx?subid=<%#Eval("SUBID") %>&operation=delete'>Delete</a></span>

                                       

                                   </td>

                                    
                                    </tr>
                                         </ItemTemplate>
                                 </asp:DataList>
                        
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
