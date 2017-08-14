<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs.ascx.cs" Inherits="UserControls_ContactUs" %>
<div class="row">
    <div class="col-sm-3 form-group">
        <label for="first_name" class="sr-only">First Name</label>
        <asp:TextBox ID="first_name" class="form-control" runat="server" placeholder="First Name"></asp:TextBox>
    </div>
    <div class="col-sm-3 form-group">
        <label for="last_name" class="sr-only">Last Name</label>
        <asp:TextBox ID="last_name" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
    </div>
    <div class="col-sm-6 form-group">
        <label for="email" class="sr-only">Email</label>
        <asp:TextBox ID="email" class="form-control" runat="server" placeholder="Email"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="col-12  form-group">
        <asp:TextBox ID="message" class="form-control" runat="server" placeholder="Your Message" TextMode="MultiLine" Rows="3"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="col-btn col-lg-2 col-md-4 col-xs-12 form-group">
        <asp:LinkButton ID="btnLink" class="btn btn-p btn-secondary btn-submit" runat="server" OnClick="btnLink_Click">SUBMIT&gt;</asp:LinkButton>
    </div>
</div>

<div class="row" id="confirmation" runat="server">
    Thank you, we will contact you within 48 hours etc.
</div>