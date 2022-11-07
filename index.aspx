
 <%@ Page Title="" Language="C#" MasterPageFile="~/masterf.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AUshop.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="imagetuf.png" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br>AU STORE</strong> </h1>
                           <h1> <p class="m-b-40"><%= Session["username"].ToString() %></p> </h1>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>

            <li class="text-center">
                <img src="imagerog.png" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> AU STORE  </strong></h1>
                            
                            <p class="m-b-40"><%= Session["username"].ToString() %></p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->
    
             
    <!-- Start Categories  -->
    <div class="categories-shop">
        <div class="container">
              
            
                <div class="row special-list">
               <asp:DataList ID="DataListcat" runat="server">
                    <ItemTemplate>
                <div class="col-lg-4 col-md-8 special-grid laptops">
                    <div class="shop-cat-box">
                       
                        <asp:Image ID="Image1" runat="server" class="img-fluid" ImageUrl='<%#Eval("catimage") %>' />
                        <a class="btn hvr-hover" href="product.aspx?catid=<%#Eval("CATID")%>"><%#Eval("catname") %></a>
                        




                    </div>
                </div>
       
                        </ItemTemplate>
                    </asp:DataList>
                    </div>
            

        </div>
    </div>
    <!-- End Categories -->
	

    <!-- Start Products  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Newly Added Products</h1>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                  
                </div>
            </div>

            <div class="row special-list">
                




              

          
 
            </div>
        </div>
    </div>
    <!-- End Products  -->

   


</asp:Content>
