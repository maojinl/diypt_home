<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.ascx.cs" Inherits="UserControls_ResetPassword" %>
<asp:TextBox ID="txtEmail" runat="server" placeholder="email" ></asp:TextBox>
<p><asp:Label ID="lblReset" runat="server"></asp:Label></p>
<br />

<asp:Button ID="btnReset" runat="server" Text="Reset password" OnClick="btnReset_Click" />