<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExercisePlan.ascx.cs" Inherits="UserControls_ExercisePlan" %>

<script src="/Script/ckeditor.js"></script>

<script src="/Script/sample.js"></script>

<span class="error">
    <asp:Label ID="lblError" runat="server"></asp:Label></span>
<div>
    <div class="headerLabel">
        Stage:</div>
    <div class="headerLabel">
        <asp:DropDownList ID="ddlStage" runat="server" Width="100px" AutoPostBack="true"
            EnableViewState="true" OnSelectedIndexChanged="ddlStage_SelectedIndexChanged">
            <asp:ListItem Value="1">Rookie</asp:ListItem>
            <asp:ListItem Value="2">Intermediate</asp:ListItem>
            <asp:ListItem Value="3">Expert</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="clear">
    </div>
    <div class="headerLabel">
        Level:</div>
    <div class="headerLabel">
        <asp:DropDownList ID="ddlLevel" runat="server" Width="100px" AutoPostBack="true"
            OnSelectedIndexChanged="ddlLevel_SelectedIndexChanged">
            <asp:ListItem Value="1" Selected="True">Level 1</asp:ListItem>
            <asp:ListItem Value="2">Level 2</asp:ListItem>
            <asp:ListItem Value="3">Level 3</asp:ListItem>
            <asp:ListItem Value="4">Level 4</asp:ListItem>
            <asp:ListItem Value="5">Level 5</asp:ListItem>
            <asp:ListItem Value="6">Level 6</asp:ListItem>
            <asp:ListItem Value="7">Level 7</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="clear">
    </div>
    <div class="headerLabel">
        Week:</div>
    <div class="headerLabel">
        <asp:DropDownList ID="ddlWeek" runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddlWeek_SelectedIndexChanged">
            <asp:ListItem Value="1" Selected="True">Week 1</asp:ListItem>
            <asp:ListItem Value="2">Week 2</asp:ListItem>
            <asp:ListItem Value="3">Week 3</asp:ListItem>
            <asp:ListItem Value="4">Week 4</asp:ListItem>
            <asp:ListItem Value="5">Week 5</asp:ListItem>
            <asp:ListItem Value="6">Week 6</asp:ListItem>
            <asp:ListItem Value="7">Week 7</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="clear">
    </div>
    <div class="headerLabel">
        Food plan:</div>
    <div class="headerLabel">
        <asp:DropDownList ID="ddlFoodPlan" Width="100px" runat="server">
        </asp:DropDownList>
    </div>
    <div class="clear">
    </div>
    <div style="float: left">
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="240px" OnClick="btnSave_Click" />
    </div>
</div>
<div style="padding: 30px 5px">
    <div>
        <div class="clear">
        </div>
        <div>
            Plan description:<br />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="400px"
                Height="100px"></asp:TextBox>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="days-1">
        Monday
        <asp:TextBox ID="txtDay1" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="days-1">
        Tuesday
        <asp:TextBox ID="txtDay2" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="days-1">
        Wednesday
        <asp:TextBox ID="txtDay3" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="days-2">
        Thursday
        <asp:TextBox ID="txtDay4" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="days-2">
        Friday
        <asp:TextBox ID="txtDay5" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="days-2">
        Saturday
        <asp:TextBox ID="txtDay6" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="days-1">
        Sunday
        <asp:TextBox ID="txtDay7" runat="server" CssClass="inputBox" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="clear">
    </div>
</div>
<asp:Button ID="btnSave2" runat="server" Text="Save" OnClick="btnSave_Click" />

<script>
    //Debug code
    initSample('ExercisePlan1_txtDay1');
    initSample('ExercisePlan1_txtDay2');
    initSample('ExercisePlan1_txtDay3');
    initSample('ExercisePlan1_txtDay4');
    initSample('ExercisePlan1_txtDay5');
    initSample('ExercisePlan1_txtDay6');
    initSample('ExercisePlan1_txtDay7');
    /*
    //Live code
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay1');
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay2');
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay3');
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay4');
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay5');
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay6');
    initSample('ctl00$ctl00$ContentPlaceHolderDefault$ctl01$ExercisePlan_1$txtDay7');
    */
</script>