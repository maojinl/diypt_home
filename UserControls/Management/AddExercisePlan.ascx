<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddExercisePlan.ascx.cs" Inherits="UserControls_Management_AddExercisePlan" %>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowUpdating="OnRowUpdating" 
OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" DataKeyNames="Id"
OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added." AllowPaging="True"
OnPageIndexChanging = "OnPaging"  OnRowCommand="GridView1_RowCommand"
AlternatingRowStyle-CssClass="alt" CssClass="table table-hover table-responsive">

<Columns>
  <asp:CommandField ButtonType="Link" ShowDeleteButton="false" ShowEditButton="true"  />
    <asp:TemplateField  ItemStyle-Width="150">
           <HeaderTemplate>
            Program:
            <asp:DropDownList ID="ddlhdprg" runat="server"
            OnSelectedIndexChanged = "ProgramChanged" AutoPostBack = "true"
            AppendDataBoundItems = "true">
            <asp:ListItem Text = "ALL" Value = "ALL"></asp:ListItem>
            </asp:DropDownList>
        </HeaderTemplate>

        <ItemTemplate>
            <asp:Label ID="lblName" runat="server" Text='<%# Eval("programename") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("programename") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Location" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("locationname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("locationname") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Level" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblevel" runat="server" Text='<%# Eval("levelname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtlevel" runat="server" Text='<%# Eval("levelname") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Semester" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lbExperience" runat="server" Text='<%# Eval("experiencename") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtExperience" runat="server" Text='<%# Eval("experiencename") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Price" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lbPrice" runat="server" Text='<%# Eval("Price")==null?"0":Eval("Price").ToString() %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("Price")==null?"0":Eval("Price").ToString() %>'></asp:TextBox>
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
     <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" Text="Select" CommandName = "Select" CommandArgument='<%#Eval("Id")+";"+Eval("planname") %>' />
            </ItemTemplate>
        </asp:TemplateField>
</Columns>
</asp:GridView>
<table class="table table-hover table-responsive" style="width:94%;">
<tr>
    <td style="width: 150px">
        Program:<br />
        <asp:DropDownList ID="ddlProgram" runat="server" Width="140" />
    </td>
    <td style="width: 150px">
        Location:<br />
        <asp:DropDownList ID="ddlLocation" runat="server" Width="140" />
    </td>
     <td style="width: 150px">
        Level:<br />
        <asp:DropDownList ID="ddlLevel" runat="server" Width="140" />
    </td>
     <td style="width: 150px">
         Semester:<br />
        <asp:DropDownList ID="ddlExperience" runat="server" Width="140" />
    </td>
    <td style="width: 150px; margin-left: 80px;">
        Trial Plan:<br />
        <asp:CheckBox ID="cbTrialFlag" runat="server" Width="99px" />
    </td>
    <td style="width: 80px">
        Price:<br />
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
    </td>
</tr>
<tr>
    <td style="width: 150px">
        &nbsp;</td>
    <td style="width: 150px">
        &nbsp;</td>
     <td style="width: 150px">
         &nbsp;</td>
     <td style="width: 150px">
         &nbsp;</td>
    <td style="width: 150px; margin-left: 80px;">
        &nbsp;</td>
    <td style="width: 80px">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
    </td>
</tr>
</table>