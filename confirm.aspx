<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="AUshop.confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <script>

                function myFunction() {
                    if (confirm("Are you sure to cancel this order?")) {

                        location.href = "operations.aspx?oid=<%=Session["OIDD"].ToString()%>&operation=cancelorder";




                    }
                    else {
                        location.href = "yourorders.aspx";
                    }
                }
            </script>

        </div>
    </form>
</body>
</html>
