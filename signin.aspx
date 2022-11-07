<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="AUshop.signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
<div class="cart-box-main">
        <div class="container">
                 <div class="row new-account-login">
         
           
                        <div class="col-sm-6 col-lg-6 mb-3">
                              <div class="title-left">
                                
                                <h3>Create New Account</h3>
                              </div>
                    
                              <div class="form-row">
                                  <div class="form-group col-md-6">
                                      <label for="InputName" class="mb-0">Full Name: </label>
                                      <asp:TextBox ID="txtuser" class="form-control" placeholder="First Name" runat="server" /> 
                                    </div>  
                                   <div class="form-group col-md-6">
                                        <label for="InputEmail" class="mb-0">Email Address</label>
                                        <asp:TextBox ID="txtemail" TextMode="Email" pattern="[A-Za-z0-9._%+-]+@[gmail]+\.[com]{1,63}$" class="form-control" placeholder="enter Email" runat="server"  ></asp:TextBox>
                                   </div> 
                                <div class="form-group col-md-6">
                                       <label for="InputPassword" class="mb-0">Password</label>
                                      <asp:TextBox ID="txtpwd"  TextMode="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" class="form-control" placeholder="enter password" runat="server"></asp:TextBox>
                                 </div>
                                  </div>
                              <div class="text-center bg-danger" style="background-color:#d9534f;">
                                      <asp:Label ID="Error" runat="server" ForeColor="White" Visible="false"></asp:Label>
                                       
                                  </div>
                                       <asp:Button ID="addbtn" Text="Sign Up" Class="btn hvr-hover"  runat="server" OnClick="addbtn_Click" />
                                      <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                
                           
                              
                                  
                                  
                               </div>
                   
                           
                    
                 </div>
            </div>
   
    </div>

</asp:Content>
