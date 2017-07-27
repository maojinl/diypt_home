<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseUnits.ascx.cs" Inherits="UserControls_Management_ExerciseUnits" %>
<style type="text/css">
    .auto-style1 {
        width: 405px;
    }
</style>
<p>
        <asp:textbox ID="txtFilter" runat="server" Width="190px" />
        <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="OnFilter" />
    </p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added." 
AllowPaging="True" OnPageIndexChanging = "OnPaging" PageSize="50" OnRowCommand="GridView1_RowCommand" DataKeyNames="Id"
AlternatingRowStyle-CssClass="alt" CssClass="Grid">

<Columns>

  <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" />
    <asp:TemplateField HeaderText="Exercise" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblExercise" runat="server" Text='<%# Eval("Exercise") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttExercise" runat="server" Text='<%# Eval("Exercise") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Alternative Exercise" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblAlterExercise" runat="server" Text='<%# Eval("AlternateExercise") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttAlterExercise" runat="server" Text='<%# Eval("AlternateExercise") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Reps" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbReps" runat="server" Text='<%# Eval("Reps") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttReps" runat="server" Text='<%# Eval("Reps") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Rest" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbRest" runat="server" Text='<%# Eval("Rest") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttRest" runat="server" Text='<%# Eval("Rest") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Weight" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbWeight" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttWeight" runat="server" Text='<%# Eval("Weight") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    
     <asp:TemplateField HeaderText="Comments" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttComments" runat="server" Text='<%# Eval("Comments") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Tempo" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTempo" runat="server" Text='<%# Eval("Tempo") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttTempo" runat="server" Text='<%# Eval("Tempo") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Trainning set" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTrainning_Seto" runat="server" Text='<%# Eval("Trainning_Set") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttTrainning_Set" runat="server" Text='<%# Eval("Trainning_Set") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    
    
     <asp:TemplateField HeaderText="Time Duration" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTimeDuration" runat="server" Text='<%# Eval("TimeDuration") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttTimeDuration" runat="server" Text='<%# Eval("TimeDuration") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>


        <asp:TemplateField HeaderText="Image" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbImage" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttImage" runat="server" Text='<%# Eval("Image") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Image Displayed" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:image ID="imgDisplayed" runat="server" imageUrl='<%# Eval("Image") %>'></asp:image>
        </ItemTemplate>
    </asp:TemplateField>
</Columns>
</asp:GridView>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
<tr>
    <td colspan="4">
        Exercise:<br />
        <asp:textbox ID="txtExercise" runat="server" Width="747px" />
    </td>
    <td colspan="4">
        Image:<br />
        <asp:textbox ID="txtImage" runat="server" Width="400" />
    </td>
    </tr>
    <tr>
    <td style="width: 60px">
        Reps:<br />
        <asp:textbox ID="txtReps" runat="server" Width="100" />
    </td>
    <td style="width: 60px">
        Rest:<br />
        <asp:textbox ID="txtRest" runat="server" Width="100" />
    </td>
    <td style="width: 60px">
        Weight:<br />
        <asp:textbox ID="txtWeight" runat="server" Width="100" />
    </td>
    <td class="auto-style1">
        Comments:<br />
        <asp:textbox ID="txtComments" runat="server" Width="100" />
    </td>

    <td style="width: 60px">
        Tempo:<br />
        <asp:textbox ID="txtTempo" runat="server" Width="100" />
    </td>

        <td style="width: 60px">
        Trainning_Set:<br />
        <asp:textbox ID="txtTrainning_Set" runat="server" Width="100" />
    </td>

    <td style="width: 60px">
        TimeDuration:<br />
        <asp:textbox ID="txtTimeDuration" runat="server" Width="100" />
    </td>
    </tr>
    <tr>
     <td colspan="8">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
    </td>
   
</tr>

</table>