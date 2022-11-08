 <%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="AUshop.admin.addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             
 <div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Add Product</strong><small></small></div>
                       
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
                            <div class="card-body card-block">
                           <div class="form-group">
                              <label for="categories" class="form-control-label">Select Category</label>
                              
                             
                               <asp:DropDownList ID="category_list" required="" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="category_list_SelectedIndexChanged" >
                                    <asp:ListItem Selected="True" Disabled="true" >--select--</asp:ListItem>
                               </asp:DropDownList>     
                               <br />
                               <asp:HiddenField ID="hdncat" runat="server" />



                                <div class="form-group">
                              <label for="categories" class="form-control-label">Select SubCategory</label>
                             <asp:DropDownList ID="subcategory_list" required="" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="subcategory_list_SelectedIndexChanged">
                                  <asp:ListItem Value="0" Selected="True" Disabled="true" >--select--</asp:ListItem>
                               </asp:DropDownList>   
                                    
                           </div>
                               <asp:HiddenField ID="hdnsub" runat="server" />

                             <div class="form-group">
                              <label class="form-control-label">Brand: </label>
                               <asp:DropDownList ID="brand_list" required="" class="form-control" CssClass="form-control" runat="server" AutoPostBack="True">
                                  <asp:ListItem Selected="True" Disabled="true" >--select--</asp:ListItem>
                               </asp:DropDownList>
                           </div>

                               <asp:HiddenField ID="hdnbrand" runat="server" />

                           <div class="form-group">
                              <label class="form-control-label">Product name: </label>
                              <asp:TextBox ID="txtpname" class="form-control"  required="" placeholder="Enter Product name" CssClass="form-control" runat="server"></asp:TextBox>
                           
                               </div>
     

                           <div class="form-group">
                              <label class="form-control-label">Image: </label><br>
                               <asp:FileUpload ID="FileUpload1"  required="" runat="server" />
                           </div>



                            <div class="form-group">
                              <label class="form-control-label">more image: </label><br>
                                <asp:FileUpload ID="FileUpload2" required=""  runat="server" />
                           </div>
                               

                           <div class="form-group">
                              <label class="form-control-label">more image: </label><br>
                                <asp:FileUpload ID="FileUpload3" required=""   runat="server" />
                           </div>


                           <div class="form-group">
                              <label class="form-control-label">Specifications: </label>
                            <asp:TextBox ID="txtspec"  class="form-control" required="" placeholder="Enter Specifications" CssClass="form-control" runat="server"></asp:TextBox>
                           </div>


                          <div class="form-group">
                              <label class="form-control-label">Detail Description: </label>
                               <asp:TextBox ID="txtdetailspec"  class="form-control" required=""  placeholder="Enter Detail Description" CssClass="form-control" runat="server"></asp:TextBox>
                              </div>



                           <div class="form-group">
                              <label class="form-control-label">Price: </label>
                               <asp:TextBox ID="txtprice" required="" onkeypress='return restrictAlphabets(event)'  class="form-control"  placeholder="Enter Price" CssClass="form-control" runat="server"></asp:TextBox>
                           </div>
                          
                              
                               
                               <asp:Button ID="btnsave" CssClass="btn btn-lg btn-info btn-block" OnClick="btnsave_Click"  runat="server" Text="Save" />
                          

                        </div>
                     
                     </div>
                  </div>
               </div>
            </div>
         </div>

    </div>
</asp:Content>
