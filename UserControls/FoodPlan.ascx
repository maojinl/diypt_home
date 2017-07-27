<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FoodPlan.ascx.cs" Inherits="UserControls_FoodPlan" %>

<div>
        <div class="headerLabel">
            Food plan:</div>
        <div class="headerLabel">
            <asp:DropDownList ID="ddlFoodPlan" runat="server" AutoPostBack="true" 
                onselectedindexchanged="ddlFoodPlan_SelectedIndexChanged">
            <asp:ListItem>Gain</asp:ListItem>
            <asp:ListItem>Lose</asp:ListItem>
            <asp:ListItem>Tone up</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="clear">
        </div>
        <div class="headerLabel">
            Week
        </div>
        <div class="headerLabel">
            <asp:DropDownList ID="ddlWeek" runat="server" 
                onselectedindexchanged="ddlWeek_SelectedIndexChanged">
            <asp:ListItem Value="1">Weeks 1-10</asp:ListItem>
            <asp:ListItem Value="2">Weeks 11-12</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="clear">
        </div>
        <div style="padding-top: 10px;">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="240px" onclick="btnSave_Click" />
        </div>
    </div>
    <div style="padding: 30px 5px">
        <div class="days-1">
            Day 1
        </div>
        <div class="days-1">
            Day 2
        </div>
        <div class="days-1">
            Day 3
        </div>
        <div class="clear">
        </div>
        <div class="days-1">
            <asp:TextBox ID="txtDay1" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="days-1">
            <asp:TextBox ID="txtDay2" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="days-1">
            <asp:TextBox ID="txtDay3" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="clear">
        </div>
        <div class="days-2">
            Day 4
        </div>
        <div class="days-2">
            Day 5
        </div>
        <div class="days-2">
            Day 6
        </div>
        <div class="clear">
        </div>
        <div class="days-1">
            <asp:TextBox ID="txtDay4" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="days-1">
            <asp:TextBox ID="txtDay5" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="days-1">
            <asp:TextBox ID="txtDay6" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="clear">
        </div>
        <div class="days-1">
            Day 7
        </div>
        <div class="clear">
        </div>
        <div class="days-2">
            <asp:TextBox ID="txtDay7" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="clear">
        </div>
    </div>
    <asp:Button ID="btnSave2" runat="server" Text="Save" onclick="btnSave_Click"  />