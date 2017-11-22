<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Mailchimp.ascx.cs" Inherits="UserControls_Mailchimp" %>
<span class="pop-e">Email:</span> <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
<br />
<span class="pop-e">First name: </span><asp:TextBox ID="txtFirst" runat="server" class="form-control"></asp:TextBox>
<br />
<span class="pop-e">Last name: </span><asp:TextBox ID="txtLast" runat="server"  class="form-control"></asp:TextBox>
<br />
<asp:LinkButton  ID="LinkButton1" runat="server" class="input-group-addon btn btn-secondary btn-y pop-e-btn" OnClick="LinkButton1_Click">SUBSCRIBE</asp:LinkButton>
