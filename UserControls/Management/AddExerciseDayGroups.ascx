<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddExerciseDayGroups.ascx.cs" Inherits="UserControls_Management_AddExerciseDayGroups" %>
<style type="text/css">
    .auto-style1 {
        width: 567px;
    }
</style>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
OnRowUpdating="OnRowUpdating" EmptyDataText="No records has been added." 
OnPageIndexChanging = "OnPaging"  OnRowCommand="GridView1_RowCommand" DataKeyNames="DayGroupId"
AlternatingRowStyle-CssClass="alt" CssClass="Grid">

<Columns>

  <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="false" />
        <asp:TemplateField HeaderText="DayGroupId" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblDayGroupId" runat="server" Text='<%# Eval("DayGroupId") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="DayGroupName" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblDayGroupName" runat="server" Text='<%# Eval("DayGroupName") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttDayGroupName" runat="server" Text='<%# Eval("DayGroupName") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
</Columns>
</asp:GridView>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
<tr>
    <td colspan="4" class="auto-style1">
        DayTypeName:<br />
        <asp:textbox ID="txtDayGroupName" runat="server" Width="246px" />
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
    </td>
</tr>

</table>