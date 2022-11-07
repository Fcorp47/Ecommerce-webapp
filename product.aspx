<%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="AUshop.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .button {
    background-color: #b0b435; 
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
    </style>

    
    <!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box  ">
                        <div margin="0"
           padding="0">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sort by </span>
                                    <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
									<option data-display="Select">Nothing</option>
									<option value="1">Popularity</option>
									<option value="2">High Price → High Price</option>
									<option value="3">Low Price → High Price</option>
									<option value="4">Best Selling</option>
								</select>
                                </div>
                                <p>Showing all 4 results</p>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">

                                      
                                        
                                        
                                        
                                     <asp:DataList ID="DataList1" RepeatColumns="3"  runat="server">
                                            <ItemTemplate>


                                        <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                            <div class="products-single fix">
                                                <div class="">
                                                    <div class="type-lb">
                                                        
                                                        <a href="productdesc.aspx?id=<%#Eval("PID")%>" class="sale">view more</a>
                                                    </div>
                                                    <asp:Image ID="Image1" runat="server" class="img-fluid" CssClass="img-fluid" ImageUrl='<%#Eval("image1") %>' />
                        
                                                     <br />
                                                   
                                                
                                                    <a class="button" href="operations.aspx?pid=<%#Eval("PID") %>&operation=addtowish">Wish List</a>
                                                 
                                                     <a class="button" href="operations.aspx?pid=<%#Eval("PID") %>&price=<%#Eval("pprice") %>&operation=addtocart">Add to Cart</a>
                                            <br />
                                                    </div>
                                                </div>
                                              
                                                <div class="why-text">
                                                    <h4><%#Eval("pname") %></h4>
                                                    <h5><%#Eval("pprice") %> /-</h5>
                                                </div>
                                                
                                                <br />

                                            </div>
                                        </div>

                        </ItemTemplate>
                                           </asp:DataList>








                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            <div class="products-single fix">
                                               
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              
                            </div>
                        </div>
                    </div>
                </div></div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="#">
                                <input class="form-control" id="search" onkeyup="display()" placeholder="Search here..." type="text">
                                <div id="suggest"> </div>
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
   
   </div>
        </div>
    </div>

    </div></div>
</asp:Content>
