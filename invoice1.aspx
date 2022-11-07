<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="invoice1.aspx.cs" Inherits="AUshop.invoice1" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<?php $oid=$_REQUEST['oid']; ?>


<button onclick="window.print()">download</button>

    <title>AUSHOP | invoice</title>
    <style>
        body{
            background-color: #F6F6F6; 
            margin: 0;
            padding: 0;
        }
        h1,h2,h3,h4,h5,h6{
            margin: 0;
            padding: 0;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .container{
            width: 80%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section{
           background-color: #0d1033;
           padding: 10px 40px;
        }
        .logo{
            width: 50%;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
        }
        .col-6{
            width: 50%;
            flex: 0 0 auto;
        }
        .text-white{
            color: #fff;
        }
        .company-details{
            float: right;
            text-align: right;
        }
        .body-section{
            padding: 16px;
            border: 1px solid gray;
        }
        .heading{
            font-size: 20px;
            margin-bottom: 08px;
        }
        .sub-heading{
            color: #262626;
            margin-bottom: 05px;
        }
        table{
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr{
            border: 1px solid #111;
            background-color: #f2f2f2;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered{
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right{
            text-align: end;
        }
        .w-20{
            width: 20%;
        }
        .float-right{
            float: right;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="brand-section">
            <div class="row">
                <div class="col-6">
                    <h1 class="text-white">AUSHOP</h1>
                </div>
                <div class="col-6">
                    <div class="company-details">
                        <p class="text-white"></p>
                        <p class="text-white">aushop47@gmail.com</p>
                        <p class="text-white">+91 888555XXXX</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="body-section">
         <h2 class="heading">ORDER ID:  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> </h2>
                  
              <asp:DataList ID="DataList2" runat="server">
                                            <ItemTemplate>
            <div class="row">

                <div class="col-6">
                   <h3><p class="sub-heading"> Name: <%#Eval("cname") %></p></h3>
                    <p class="sub-heading">Address:  <%#Eval("caddress") %>  </p>
                    
                </div>
                <div class="col-6">
                	
                    
                    <p class="sub-heading">Email Address: <%#Eval("cemail") %> </p>
                   
                    <p class="sub-heading">Phone Number:   <%#Eval("cphone") %></p>
                    
                </div>
            </div>
</ItemTemplate>
                  </asp:DataList>
                  

        </div>

        <div class="body-section">
            <h3 class="heading">Ordered Items</h3>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>

                        <th>Product</th>
                        <th class="w-20">Price</th>
                        <th class="w-20">Quantity</th>
                       
                    </tr>
                </thead>
                <tbody>
          <asp:DataList ID="DataList1" runat="server">
                                            <ItemTemplate>


                      <tr>
                        
                     
                          <td width="50%"> <%#Eval("pname") %></td>
                          <td> <%#Eval("pprice") %></td>
                          <td> <%#Eval("qty") %></td>

                       
                    </tr>
 	                 
                     </ItemTemplate>                 
             </asp:DataList>
                    
                </tbody>
            </table>
            <br>
        
           <center> <h3 class="heading">Total Amount: <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>  /-</h3>
            </center><h3 class="heading">Payment Status: Paid</h3>
           
        </div>

        <div class="body-section">
            <p>&copy; Copyright 2021 - AUSHOP. All rights reserved. 
                
            </p>
        </div>      
    </div>      

</body>
</html>