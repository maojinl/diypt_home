<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberBuyPlan.ascx.cs" Inherits="UserControls_MemberBuyPlan" %>
<style type="text/css">
    .auto-style1 {
        height: 34px;
    }
</style>
<table width="100%">
    <tr>
        <td>
            Plan:&nbsp;
                       <asp:Label ID="lblPlan" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td >
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" class="auto-style1">
                    <asp:ImageButton ID="CheckoutImageBtn" runat="server" 
                      ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" 
                      Width="145" AlternateText="Check out with PayPal" 
                      OnClick="CheckoutBtn_Click" 
                      BackColor="Transparent" BorderWidth="0" />
            <br />
            <br />
        </td>

    </tr>

</table>
    <div class="error">
        <asp:Label ID="errorLabel" runat="server"></asp:Label>
    </div>