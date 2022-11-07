<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="change_pwd.aspx.cs" Inherits="AUshop.change_pwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <b><center><h1>RESET PASSWORD</h1></center></b>
        <center><h4>
        
         <b> <label>Old password:</label></b>
          
    <asp:TextBox ID="oldpwd" required="" type="password" runat="server"  CssClass="col-md-2"></asp:TextBox><br />

          <b><label for="password">New Password:</label></b>
        
       
           <asp:TextBox ID="newpwd"  required="" type="password" CssClass="col-md-2" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 5 or more characters" runat="server"></asp:TextBox><br />
   
       
    <asp:Button ID="change" runat="server" Text="RESET" onclick="change_Click"/><br />
            <br /><br />
            <br />
            <br />

       </h4></center>
     <?php 
 
     if(isset($_POST['change']))
     { 
        
       }
        
        else
        {
           
        }
       
     
         

  }
     
</asp:Content>
