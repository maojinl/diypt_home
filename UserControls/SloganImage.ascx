<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SloganImage.ascx.cs" Inherits="UserControls_SloganImage" %>
<div class="container  member-slogan ">
   <div class="row">
      <div class="col-12">
         <!--  <h1 class="log-slogan header-slogan header-slogan-group-md sec block-xs-up hidden-xs-down"><span class="c_b">   </span><span class="c_p"> <b class="c_black">+</b></span>  <span class="c_y"><b class="c_black">=</b> </span></h1>-->
         <!--   <h1 class="log-slogan header-slogan header-slogan-group-md sec block-xs-up hidden-xs-down"><span class="c_b"> MACRO COUNTING   </span><span class="c_p"> <b class="c_black">+</b> </span>  <span class="c_y"><b class="c_black">=</b> < 10% BODY FAT</span></h1> -->
         <h1 class="log-slogan header-slogan header-slogan-group-md sec block-xs-up hidden-xs-down">
             <span class="c_b">
                 <asp:Literal ID="lblTop" runat="server" />
                </span>
             <span class="c_p"><b class="c_black">+</b>                 
                 <asp:Literal ID="lblMiddle" runat="server" />
             </span>  
             <span class="c_y"><b class="c_black">=</b>                 
                 <asp:Literal ID="lblBottom" runat="server" />
             </span>
         </h1>
      </div>
   </div>
</div>