<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNavLogin.ascx.cs" Inherits="UserControls_TopNavLogin" %>

<a id="nav-menu-bar" class="hidden-md-up nav-menu-bar" data-toggle="offcanvas"><img src="/images/menu-bar.svg" /></a>


<div runat="server" id="loggedInDiv">
<a id="nav-icon-member" class="hidden-md-up nav-icon-member" data-toggle="offcanvas">
    <img src="/images/icon-member.svg" /></a>
<div id="topNavLinksMember" class="hidden-sm-down">
    <ul class="navbar-nav ">
        <li class="nav-item  dropdown">
            <a class="nav-link dropdown-toggle" href="#"><span class="hidden-md-down">
                <asp:Literal ID="lblMemberName" runat="server"></asp:Literal>
            </span>
                <img src="/images/icon-member.svg" /></a>
            <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/my-account/coming-up/">My Account</a>
                <a class="dropdown-item" href="/my-account/profile/">My Profile</a>
                <asp:LinkButton ID="LinkButtonLogout" class="dropdown-item" runat="server" OnClick="LinkButtonLogout_Click">Log out</asp:LinkButton>

            </div>
        </li>
    </ul>
</div>
    </div>
<a class="nav-login" href="/login" runat="server" id="navLogin" visible="false">LOGIN</a>
<!-- <a class="nav-join" href="#" data-toggle="modal" data-target="#joinModal">JOIN <span class="hidden-md-down">NOW</span></a> -->
<a class="nav-join" href="/signup" runat="server" id="navjoin" visible="false">JOIN <span class="hidden-md-down">NOW</span></a>
