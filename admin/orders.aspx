<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="AUshop.admin.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
          <div class="content-wrapper">
            <div class="row" id="proBanner">
              <div class="col-12">
               
       <span>
      
                    <i class="" id="bannerClose">  </i>
                </span>
              </div>
            </div><br><br>
            <div class="d-xl-flex justify-content-between align-items-start">
                <h2 class="text-dark font-weight-bold mb-2"> ORDERS </h2>
              
            </div>
         
                 <div class="row">
              <div class="col-md-12">
                <div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
                  
                  
                </div>
                
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                       <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="">
                          <div class="card text-center">
                              
    <h3 class="mb-2 text-dark font-weight-normal"><a href="manageorder.aspx?ordertype=todays" >
              <font color="blue">Today's Orders</h3>
                            <h2 class="mb-4 text-dark font-weight-bold"><?php echo $x ?></h2>
                         
                        </div>
                      </div>
                      <div style="width:400px">
                        <div class="">
                          <div class="card text-center">
                            
         <h3 class="mb-2 text-dark font-weight-normal"><a href="manageorder.aspx?ordertype=placed"><font color="red">Pending Orders</font></a></h3>
                            <h2 class="mb-4 text-dark font-weight-bold"><?php echo $x ?></h2>
                         
                        </div>
                      </div>
                      <div  style="width:400px">
                        <div class="">
                          <div class="card text-center">
                              <?php $sql=mysqli_query($con,"select * from tblorder where status='delivered'");
                              $x = mysqli_num_rows($sql);
                              ?>
            <h3 class="mb-2 text-dark font-weight-normal"><a href="manageorder.aspx?ordertype=delivered"><font color="green">Delivered Orders</font></a></h3>
                            <h2 class="mb-4 text-dark font-weight-bold"><?php echo $x ?></h2>
                          
                        </div>
                      </div>

                      <div  style="width:400px">
                        <div class="">
                          <div class="card text-center">
                             
             <h3 class="mb-2 text-dark font-weight-normal"><a href="manageorder.aspx?ordertype=cancelled"><font color="green">Cancelled Orders</font></a></h3>
                            <h2 class="mb-4 text-dark font-weight-bold"><?php echo $x ?></h2>
                          
                        </div>
                      </div>

                      <div class="col-xl-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                   <div class=""></div>

                            <div class="col-xl-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="">
                          
                      </div>


                      <div class="col-xl-3  col-lg-6 col-sm-6 grid-margin stretch-card">
                       
                      </div>
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                       
                        </div>
                      </div>
                    </div> 
                        
                  
</asp:Content>
