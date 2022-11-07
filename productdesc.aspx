<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="productdesc.aspx.cs" Inherits="AUshop.productdesc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- Start All Title Box -->
    <div class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop Detail</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Store</a></li>
                        <li class="breadcrumb-item active">Shop Detail </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->

    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">
                
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <asp:DataList ID="DataList2" runat="server">
                                <ItemTemplate>
                            <div class="carousel-item active"> <asp:Image class="d-block w-100" runat="server" ImageUrl='<%#Eval("image1") %>' /> </div>
                            <div class="carousel-item"> <asp:Image class="d-block w-100" runat="server"  ImageUrl='<%#Eval("image2") %>' /> </div>
                            <div class="carousel-item"> <asp:Image class="d-block w-100" runat="server"  ImageUrl='<%#Eval("image3") %>' /> </div>
                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                        <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
						<i class="fa fa-angle-left" aria-hidden="true"></i>
						<span class="sr-only">Previous</span> 
					</a>
                        <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
						<i class="fa fa-angle-right" aria-hidden="true"></i> 
						<span class="sr-only">Next</span> 
					</a>
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                
                                <asp:Image  class="d-block w-100 img-fluid" runat="server"  ImageUrl='<%#Eval("image1") %>' />
                        
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="1">
                               <asp:Image  class="d-block w-100 img-fluid" runat="server"  ImageUrl='<%#Eval("image2") %>' />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="2">
                                <asp:Image  class="d-block w-100 img-fluid" runat="server"  ImageUrl='<%#Eval("image3") %>' />
                            </li>
                        </ol>
                    </div>
                </div>

                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>
                                <h2><%#Eval("pname") %> </h2>
                                 <h5><%#Eval("pprice") %> </h5>
                        
						            <h4>Short Description:</h4>
						            <p><%#Eval("pdetail_spec") %> </p>
						    <ul>
							
						    </ul>
                          
                        

						<div class="price-box-bar">
							<div class="cart-and-bay-btn">
								
								<a class="btn hvr-hover" data-fancybox-close="" href="operations.aspx?pid=<%#Eval("PID") %>&price=<%#Eval("pprice") %>&operation=addtocart">Add to cart</a>
							</div>
						</div>
                          </ItemTemplate>
                        </asp:DataList>
						<div class="add-to-btn">
							<div class="add-comp">
								<a class="btn hvr-hover" href="#"><i class="fas fa-heart"></i> Add to wishlist</a>
								<a class="btn hvr-hover" href="#"><i class="fas fa-sync-alt"></i> Add to Compare</a>
							</div>
							<div class="share-bar">
								<a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>
							</div>
						</div>
                    </div>
                </div>
            </div>
			<?php   } ?>
			<div class="row my-5">
				

            

        </div>
    </div>
</asp:Content>
