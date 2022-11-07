<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="AUshop.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Start Contact Us  -->
    <form method="post" action="">
    <div class="contact-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>FEEDBACK</h2>
                        <p>give your feedback for our product or our sevice if there is any change or not good </p>
                        <form id="contactForm">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtname" class="form-control" readonly="" runat="server"></asp:TextBox>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                         <asp:TextBox ID="txtemail" class="form-control" readonly="" runat="server"></asp:TextBox>
                                       <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtreson" class="form-control" name="reason" placeholder="Subject" required data-error="Please enter your Subject" runat="server"></asp:TextBox>
                                      <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                    
                                        <asp:TextBox ID="txtadd" class="form-control"  placeholder="Your Message" required data-error="Please enter your message" TextMode="MultiLine" runat="server"></asp:TextBox>
                                      
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="submit-button text-center">
                                        <asp:Button ID="Give_Feedback" class="btn hvr-hover" text="GIVE FEEDBACK" runat="server" onclick="Give_Feedback_Click"></asp:Button>
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                           <center><h1 class="box-title">YOUR REPLY </h1></center>
                         
                        </div>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                
                                    <tr>
                                      
                                       
                                 
                                       <th>feedback reason</th>
                                      <th>feedback discription</th>
                                        <th>feedback reply</th>
                                      
                                        </tr>
                            
                                
                                   
                             <asp:Repeater ID="DataList1" runat="server">
                    <ItemTemplate>
                                    <tr>
                                       <td class="serial"><%#Eval("freason") %></td><td></td><td></td>
                                       
                                       <td><%#Eval("fdesc") %></td><td></td><td></td>

                                                                   
                                  <td><%#Eval("freply") %></td><td></td><td></td>
                                 

                                    
                                    </tr>
                                         </ItemTemplate>
                                 </asp:Repeater>
                        
                             
                              </table>
                        
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                

		  </div>
               
                </form>
               
</asp:Content>
