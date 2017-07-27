<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseDayGroups.ascx.cs" Inherits="UserControls_Management_ExerciseDayGroups" %>
<p><a href="/management/add-exercise-plan.aspx">Manage plan (<asp:Label ID="lblPlanName" runat="server" Text=''></asp:Label>)</a>
    -> <a href="/management/exercise-plan-week-detail.aspx">Plan week detail (<asp:Label ID="lblWeekNum" runat="server" Text=''></asp:Label>)</a>  
    -> <a href="/management/exercise-plan-week-day.aspx">Week days (<asp:Label ID="lblWeekDay" runat="server" Text=''></asp:Label>)</a> 
    -> Day group
</p>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  DataKeyNames="Id"
OnRowDataBound="OnRowDataBound" OnRowDeleting="OnRowDeleting"   EmptyDataText="No records has been added."
PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="table table-hover table-responsive" Width="50%" OnRowCommand="GridView1_RowCommand" 
OnPageIndexChanging = "OnPaging"  >

<Columns>
     <asp:CommandField ButtonType="Link" ShowDeleteButton="true"  />

    <asp:TemplateField  HeaderText="Day Gruop Name" HeaderStyle-Width="250"   >
        <ItemTemplate >
            <asp:Label ID="lbdgn" runat="server" Text='<%# Eval("DayGruopName") %>'></asp:Label>
        </ItemTemplate>
      <EditItemTemplate>
            <asp:TextBox ID="txtWeek" runat="server" Text='<%# Eval("DayGruopName") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

     <asp:TemplateField  HeaderText="Unit Set Id" HeaderStyle-Width="150"   >
        <ItemTemplate >
            <asp:Label ID="lgusid" runat="server" Text='<%# Eval("ExerciseUnitSetId") %>'></asp:Label>
        </ItemTemplate>
      <EditItemTemplate>
            <asp:TextBox ID="txtWeek" runat="server" Text='<%# Eval("ExerciseUnitSetId") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
   
     <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" Text="Select" CommandName = "Select" CommandArgument='<%#Eval("ExerciseUnitSetId")+";"+Eval("DayGroupNameId")+";"+Eval("DayGruopName") %>' />
            </ItemTemplate>
    </asp:TemplateField>


</Columns>
</asp:GridView>

<table class="table table-hover table-responsive" style="width:50%;">
<tr>

     <td style="width: 150px">
        Day Group:<br />
        <asp:DropDownList ID="ddldaygroup" runat="server" Width="140" />
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