<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="feededit.aspx.cs" Inherits="AUshop.admin.feededit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<style>
      hr{
        height: 1px;
        background-color: red;
        border: none;
    }
 </style>
        <div class="content pb-0" >
            <div class="orders" style="border:solid">
               <div class="row">
                  <div class="col-xl-12" >
                     <div class="card">
                        <div class="card-body">
                 <asp:DataList ID="DataList2" runat="server">
                     <ItemTemplate>
                     Feedback ID:  <%#Eval("FID") %><br>
                     
                         </ItemTemplate>
                 </asp:DataList>
                     <hr style="width:50%;text-align:left;margin-left:0">
                    

                           

                      <%--<select name="status">
                        <option selected disabled>--select--</option>
                         <option value="placed">Placed</option>
                         <option value="delivered">Delivered</option>
                         <option value="failed">Failed</option>
                      </select>--%>
<br>
                      <label>remarks: </label><br>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:Button ID="SAVE" OnClick ="save_Click" runat="server" Text="SAVE" />
                          
                     
      
<button><a href="orders.aspx">Back</a></button>

                              

                         
                     </div>
                  </div>
               </div>
            </div>
		  </div>

</asp:Content>
