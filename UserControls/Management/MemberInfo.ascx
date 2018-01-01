<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberInfo.ascx.cs" Inherits="UserControls_Management_MemberInfo" %>
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
     <asp:TemplateField HeaderText="Date of Birth" >
        <ItemTemplate>
            <asp:Label ID="lbCS" runat="server" Text='<%# Eval("DoB") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCS" runat="server" Text='<%# Eval("DoB") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Gender" >
        <ItemTemplate>
            <asp:Label ID="lbDa" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtDa" runat="server" Text='<%# Eval("Gender") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
      <asp:TemplateField HeaderText="Country"  >
        <ItemTemplate>
            <asp:Label ID="lbDe" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate> 
            <asp:TextBox ID="txtDe" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox>
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
	    <asp:TemplateField HeaderText="Promotional Photo" >
        <ItemTemplate>
            <asp:Label ID="lbPromotional" runat="server" Text='<%# GetAllowedPromotionalPhoto(Eval("UserSettings")) %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPromotional" runat="server" Text='<%# GetAllowedPromotionalPhoto(Eval("UserSettings")) %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Street Address"  >
        <ItemTemplate>
            <asp:Label ID="lbES" runat="server" Text='<%# Eval("StreetAddress") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtES" runat="server" Text='<%# Eval("StreetAddress") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Suburb"  >
        <ItemTemplate>
            <asp:Label ID="lbFI" runat="server" Text='<%# Eval("Suburb") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtFI" runat="server" Text='<%# Eval("Suburb") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="City" >
        <ItemTemplate>
            <asp:Label ID="lbFR" runat="server" Text='<%# Eval("City") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtFR" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Postcode">
        <ItemTemplate>
            <asp:Label ID="lbHu" runat="server" Text='<%# Eval("Postcode") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtHu" runat="server" Text='<%# Eval("Postcode") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="State"  >
        <ItemTemplate>
            <asp:Label ID="lbIT" runat="server" Text='<%# Eval("State") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtIT" runat="server" Text='<%# Eval("State") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

</Columns>
</asp:GridView>

</asp:Content>