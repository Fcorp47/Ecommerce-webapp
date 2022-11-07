<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="enteremail.aspx.cs" Inherits="AUshop.enteremail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <br><br><br>

  <center><h1>Enter MAIL</h1></center>
      
         <center> 
          <label for="password"></label>
          <asp:TextBox TextMode="Email" ID="txtemail" required="" placeholder="Enter Email" runat="server" CssClass="col-md-2"></asp:TextBox><br>
          
   
             
             <asp:Button ID="getemail" Text="Send OTP"   runat="server" OnClick="getemail_Click" />


   
      </center>
    <br><br><br><br>
    <style>
        
input[type="password"],
input[type="text"],
select{
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  
  margin-bottom: 30px;
}




button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: black;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 25%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
.button:hover{
     border:none;
  
  background:#fff;
  padding:20px 20px;
  color:#1b1b1b;
}



    </style>


</asp:Content>
