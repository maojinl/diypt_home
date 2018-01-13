<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberPlanInfo.ascx.cs" Inherits="UserControls_Management_MemberPlanInfo" %>
<table>
    <tr>
        <td>
            <asp:Label ID="lbsearch" runat="server" Text="Search Condition:" />
        </td>
    </tr>
     <tr>
        <td>
          <asp:Label ID="Label1" runat="server" Text="first name:" />
        </td>
        <td>
            <asp:TextBox ID="tbfistname" runat="server" Width="300px" />

        </td>

    </tr>

     <tr>
        <td>
          <asp:Label ID="Label2" runat="server" Text="email:" />
        </td>
        <td>
            <asp:TextBox ID="tbemail" runat="server" Width="300px" />
        </td>
    </tr>
          <tr>
         <td>
            
        </td>
         <td>
              <asp:Button runat="server" ID="btnSearch" OnClick="search" Text="Search" />
             &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnrefresh" OnClick="refresh" Text="Refresh" />
        </td>

    </tr>


</table>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  
OnRowDataBound="OnRowDataBound"   EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="Grid" OnRowCommand="GridView1_RowCommand"
OnPageIndexChanging = "OnPaging"  >

<Columns>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" Text="Select" CommandName = "Select" CommandArgument='<%#Eval("Id")%>' />
            </ItemTemplate>
    </asp:TemplateField>
  
    <asp:TemplateField  HeaderText="First name"   >
        <ItemTemplate >
            <asp:Label ID="lbEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Surname" >
        <ItemTemplate>
            <asp:Label ID="lbBG" runat="server" Text='<%# Eval("Surname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtBG" runat="server" Text='<%# Eval("Surname") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Email" >
        <ItemTemplate>
            <asp:Label ID="lbEl" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtEl" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Plan Name"  >
        <ItemTemplate>
            <asp:Label ID="lbPN" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPN" runat="server" Text='<%# Eval("PlanName") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="TrialOrNot" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:CheckBox ID="lbTrialOrNot" Enabled="false" runat="server" Checked='<%# Eval("IsTrialPlan")!=null&&!Eval("IsTrialPlan").ToString().Equals("0")?true:false %>'></asp:CheckBox>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:CheckBox ID="txtTrialOrNot" runat="server" Checked='<%# Eval("IsTrialPlan")!=null&&!Eval("IsTrialPlan").ToString().Equals("0")?true:false %>'></asp:CheckBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Start Date"  >
        <ItemTemplate>
            <asp:Label ID="lbSD" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtSD" runat="server" Text='<%# Eval("StartDate") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="End Date"  >
        <ItemTemplate>
            <asp:Label ID="lbED" runat="server" Text='<%# Eval("EndDate") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtED" runat="server" Text='<%# Eval("EndDate") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Paid Date"  >
        <ItemTemplate>
            <asp:Label ID="lbPD" runat="server" Text='<%# Eval("PaidDate") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPD" runat="server" Text='<%# Eval("PaidDate") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Started or Not"  >
        <ItemTemplate>
            <asp:Label ID="lbSTART" runat="server" Text='<%# GetStartStatus(Eval("Status").ToString()[0]) %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtSTART" runat="server" Text='<%# Eval("Status").ToString()[0] %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Paid or Not"  >
        <ItemTemplate>
            <asp:Label ID="lbPAID" runat="server" Text='<%# Eval("Status").ToString()[1] %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPAID" runat="server" Text='<%# Eval("Status").ToString()[1] %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

</Columns>
</asp:GridView>

</asp:Content>