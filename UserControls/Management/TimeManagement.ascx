<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TimeManagement.ascx.cs" Inherits="UserControls_Management_TimeManagement" %>
<div>Date: <asp:TextBox ID="txtDate" runat="server" Width="264px"></asp:TextBox></div>
<div>
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update date" />
</div>
