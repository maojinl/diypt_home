<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExercisePlanWeeksDays.ascx.cs" Inherits="UserControls_Management_ExercisePlanWeeksDays" %>
<p><a href="/management/add-exercise-plan.aspx">Manage plan (<asp:Label ID="lblPlanName" runat="server" Text=''></asp:Label>)</a>
    -> <a href="/management/exercise-plan-week-detail.aspx">Plan week detail (<asp:Label ID="lblWeekNum" runat="server" Text=''></asp:Label>)</a> 
    -> Week days
</p>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  DataKeyNames="Id"
OnRowDataBound="OnRowDataBound" OnRowDeleting="OnRowDeleting"   EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="table table-hover table-responsive" Width="50%" OnRowCommand="GridView1_RowCommand" 
OnPageIndexChanging = "OnPaging"  >

<Columns>
     <asp:CommandField ButtonType="Link" ShowDeleteButton="true"  />

    <asp:TemplateField  HeaderText="Day" HeaderStyle-Width="50"   >
        <ItemTemplate >
            <asp:Label ID="lbDay" runat="server" Text='<%# Eval("Day") %>'></asp:Label>
        </ItemTemplate>
      <EditItemTemplate>
            <asp:TextBox ID="txtDay" runat="server" Text='<%# Eval("Day") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Day Type" ControlStyle-Width="200" >
        <ItemTemplate>
            <asp:Label ID="lbDayType" runat="server" Text='<%# Eval("DayTypeName") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox Width="840" TextMode="MultiLine" ID="txtDayType" runat="server" Text='<%# Eval("DayTypeName") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
   
     <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" Text="Select" CommandName = "Select" CommandArgument='<%#Eval("ExercisePlanWeekId")+";"+Eval("Day") %>' />
            </ItemTemplate>
    </asp:TemplateField>


</Columns>
</asp:GridView>

<table class="table table-hover table-responsive" style="width:50%;">
<tr>
    <td style="width: 60px">
        Day:<br />
        <asp:textbox ID="txtDay" runat="server" Width="50" />
    </td>
     <td style="width: 150px">
        Day type:<br />
        <asp:DropDownList ID="ddldaytype" runat="server" Width="140" />
    </td>
     <td style="width: 80px">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
    </td>
   
</tr>

 <tr>

</tr>
<tr>

    <td>
        <asp:Button ID="btnReturn" runat="server" Text="Back" OnClick="Return" />

    </td>

</tr>
</table>