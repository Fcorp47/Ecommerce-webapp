<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AUshop.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
<div class="cart-box-main">
        <div class="container">
                 <div class="row new-account-login">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3>Account Login</h3>
                    </div>
                    
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Email Address</label>
                                <asp:TextBox TextMode="email"  class="form-control" ID="txtmail" placeholder="Enter Email"  runat="server" />
                                
                                    
                            </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword" class="mb-0">Password</label>
                                <asp:TextBox TextMode="password"  class="form-control" ID="txtpwd" placeholder="Password" runat="server"/>
                                  
                                </div>
                        </div>
                    <asp:Button ID="btn" Text="Login" Class="btn hvr-hover"  runat="server" OnClick="btn_Click" />
                    <font size="3" >
                        <a style="color:black" href="enteremail.aspx">  forgot password</a> </font>
                                      <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                
                       <br><br>
                   <u> <font size="3"><a style="color:black" href="signin.aspx">sign up and create your account</a></font></u>
                </div>
              
                
            </div>
        </div>
    </div>

</asp:Content>
