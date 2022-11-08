<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportgen.aspx.cs" Inherits="AUshop.admin.reportgen" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    



<button onclick="window.print()">download</button>

    <title>AUSHOP | REPORT </title>
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
        
              <asp:DataList ID="DataList2" runat="server">
                                            <ItemTemplate>
            <div class="row">

                <div class="col-6">
                    <h2 class="heading">ORDER ID: </h2>
                  
                 <h2> <p class="sub-heading">Full Name: </p> </h2>
                   
                </div>
            </div>
</ItemTemplate>
                  </asp:DataList>
                  

        </div>

        <div class="body-section">
            <h3 class="heading">REPORT - (<%=Session["date"].ToString() %> )</h3>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>

                        <th class="w-20">OID</th>
                        <th class="w-20">CID</th>
                       
                        <th class="w-20">TOTAL</th>
                        <th class="w-20">STATUS</th>
                       
                       
                    </tr>
                </thead>
                <tbody>
          
              <asp:Repeater ID="DataList1" runat="server">
                                            <ItemTemplate>


                      <tr>
                        
                     
                          <td> <%#Eval("OID") %></td>
                          <td> <%#Eval("CID") %></td>
                        
                          <td> <%#Eval("order_total") %></td>
                          <td> <%#Eval("order_status") %></td>
                         
                       
                    </tr>
 	                 
                     </ItemTemplate>                 
             </asp:Repeater>
                    
                </tbody>
            </table>
            <br>
           
      
           <h3 class="heading">TOTAL AMOUNT:  <%=Session["total"].ToString() %> </h3>
            
        </div>

        <div class="body-section">
            <p>&copy; Copyright 2022 - AUSHOP. All rights reserved. 
                
            </p>
        </div>      
    </div>      

</body>
</html>
