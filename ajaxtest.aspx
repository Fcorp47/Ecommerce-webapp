<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="ajaxtest.aspx.cs" Inherits="AUshop.ajaxtest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src="https://code.jquery.com/jquery-1.10.2.js"
        type="text/javascript"></script>


     <script type="text/javascript">
         $(document).ready(function () {
             BindGridview();
             $(document).on('change','#txtProductName',function () {
                 var Product = {};
                 Product.ProductName = $('#txtProductName').val();
                 var url = '';

                


                $.ajax({
                    type: "POST",
                    url: url,
                    data: '{ objProduct:' + JSON.stringify(Product) + '}',
                    dataType: "text",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var msg = $.parseJSON(data);
                        $('#lblMessage').html(msg.d);
                        clearControls();
                        BindGridview();

                    },
                    error: function (data) {
                        alert("Error while inserting/updating data");
                    }

                });
            });
        });

     </script>

     <input type="text" id="txtProductName" />
</asp:Content>
