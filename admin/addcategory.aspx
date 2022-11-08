<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="addcategory.aspx.cs" Inherits="AUshop.admin.addcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


          
 <div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Add Category</strong><small></small></div>
                      
                            <div class="card-body card-block">
                           <div class="form-group">
                              <label >Category Name: </label>

                                       <asp:TextBox ID="txtcatname" required="" class="form-control" placeholder="Enter Category" CssClass="form-control" runat="server"></asp:TextBox>
                      
                               <br />
                              <label>Add image :</label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
                           </div>

                           
                          
                              <asp:Button ID="btnaddcat" runat="server" OnClick="btnaddcat_Click" Text="ADD" CssClass="btn btn-lg btn-info btn-block" />
                          
                                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Green" ></asp:Label>       
            
                        </div>
                       
                     </div>
                  </div>
               </div>
            </div>
         </div>


</asp:Content>
