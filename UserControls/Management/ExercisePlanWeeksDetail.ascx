<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExercisePlanWeeksDetail.ascx.cs" Inherits="UserControls_Management_ExercisePlanWeeksDetail" %>
<p><a href="/management/add-exercise-plan.aspx">Manage plan (<asp:Label ID="lblPlanName" runat="server" Text=''></asp:Label>)</a>
    -> Plan week detail
</p>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
OnRowUpdating="OnRowUpdating"   EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="table table-hover table-responsive" OnRowCommand="GridView1_RowCommand"
OnPageIndexChanging = "OnPaging"  >

<Columns>
     <asp:CommandField ButtonType="Link" ShowEditButton="true"  />

    <asp:TemplateField  HeaderText="StartWeek"   >
        <ItemTemplate >
            <asp:Label ID="lbStartWeek" runat="server" Text='<%# Eval("StartWeek") %>'></asp:Label>
        </ItemTemplate>
      <EditItemTemplate>
            <asp:TextBox ID="txtStartWeek" runat="server" Text='<%# Eval("StartWeek") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField  HeaderText="EndWeek"   >
        <ItemTemplate >
            <asp:Label ID="lbEndWeek" runat="server" Text='<%# Eval("EndWeek") %>'></asp:Label>
        </ItemTemplate>
      <EditItemTemplate>
            <asp:TextBox ID="txtEndWeek" runat="server" Text='<%# Eval("EndWeek") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Description" ItemStyle-Width="850">
        <ItemTemplate>
            <asp:TextBox ReadOnly="true" Width="700" Height="200" ID="lbDescription" TextMode="MultiLine" runat="server" Text='<%# Eval("Description") %>'></asp:TextBox>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox Width="700" Height="200" TextMode="MultiLine" ID="txtDescription" runat="server" Text='<%# Eval("Description") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
      
    <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" Text="Select" CommandName = "Select" CommandArgument='<%#Eval("Id")+";"+Eval("StartWeek")+" to "+Eval("EndWeek")%>' />
            </ItemTemplate>
    </asp:TemplateField>

</Columns>
</asp:GridView>

<table class="table table-hover table-responsive">
<tr>
    <td style="width: 100px">
        Start Week:<br />
        <asp:textbox ID="txtStartWeek" runat="server" Width="70" />
    </td>
    <td style="width: 100px">
        End Week:<br />
        <asp:textbox ID="txtEndWeek" runat="server" Width="70" />
    </td>
    <td style="width: 830px">
        Description:<br />
        <asp:textbox ID="txtDescription" TextMode="MultiLine" runat="server" Width="820px" Height="300px" />
    </td>
     <td style="width: 80px">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
    </td>
   
</tr>
<tr>

    <td>
        <asp:Button ID="btnReturn" runat="server" Text="Back" OnClick="Return" />

    </td>

</tr>
</table>