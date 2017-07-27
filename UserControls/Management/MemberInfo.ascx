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


          <tr>
         <td>
            
              <asp:Button runat="server" ID="btnSend" OnClick="Send" Text="Send" />
            
        </td>
         <td>
              &nbsp;</td>

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
    <asp:TemplateField HeaderText="Height"  >
        <ItemTemplate>
            <asp:Label ID="lbJA" runat="server" Text='<%# Eval("Height") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtJA" runat="server" Text='<%# Eval("Height") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Weight"  >
        <ItemTemplate>
            <asp:Label ID="lbKA" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtKA" runat="server" Text='<%# Eval("Weight") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Password" >
        <ItemTemplate>
            <asp:Label ID="lbKO" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtKO" runat="server" Text='<%# Eval("Password") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
       <asp:TemplateField HeaderText="Waist" >
        <ItemTemplate>
            <asp:Label ID="lbLV" runat="server" Text='<%# Eval("Waist") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtLV" runat="server" Text='<%# Eval("Waist") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="BodyFat" >
        <ItemTemplate>
            <asp:Label ID="lbNL" runat="server" Text='<%# Eval("BodyFat") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtNL" runat="server" Text='<%# Eval("BodyFat") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Goal Description" >
        <ItemTemplate>
            <asp:Label ID="lbNO" runat="server" Text='<%# Eval("GoalDescription") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtNO" runat="server" Text='<%# Eval("GoalDescription") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
      <asp:TemplateField HeaderText="Goal Weight" >
        <ItemTemplate>
            <asp:Label ID="lbPO" runat="server" Text='<%# Eval("GoalWeight") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPO" runat="server" Text='<%# Eval("GoalWeight") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Goal Waist" >
        <ItemTemplate>
            <asp:Label ID="lbPt" runat="server" Text='<%# Eval("GoalWaist") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtPt" runat="server" Text='<%# Eval("GoalWaist") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Goal BodyFat" >
        <ItemTemplate>
            <asp:Label ID="lbRO" runat="server" Text='<%# Eval("GoalBodyFat") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtRO" runat="server" Text='<%# Eval("GoalBodyFat") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
  

</Columns>
</asp:GridView>

</asp:Content>