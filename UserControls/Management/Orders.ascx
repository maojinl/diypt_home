<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Orders.ascx.cs" Inherits="UserControls_Management_Orders" %>
<table>
   <tr>
       <td>
          <asp:Label ID="lbsearch" runat="server" Text="Search Condition:" />
       </td>


   
    </tr>
    <tr valign="top">
      <td>
            <asp:Label ID="LabelDate" runat="server" Text="Date  From:"></asp:Label>
      </td>
       <td>
            <asp:TextBox ID="tbFrom" runat="server" Font-Size="Small"
            Height="10"
            ReadOnly="true"
            Width="120px" ></asp:TextBox> 

       </td>  
       <td>
            <asp:ImageButton ID="ImageButtonCalendar" runat="server"
            ImageUrl="~/images/calendar.gif"
            OnClick="ImageButtonCalendar_Click" />

        </td>
        <td>
            <asp:Calendar ID="Calendar" runat="server"
            BackColor="#FFFFCC"
            BorderColor="#FFCC66"
            BorderWidth="1px"
            DayNameFormat="Shortest"
            Font-Names="Verdana"
            Font-Size="8pt"
            ForeColor="#663399"
            Height="200px"
            ShowGridLines="True"
            Visible="false"
            Width="220px"
            OnSelectionChanged="Calendar_SelectionChanged">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar> 
        </td>

        <td>

        </td>

       <td>
            <asp:Label ID="Label1" runat="server" Text="To:"></asp:Label>
      </td>
       <td>
            <asp:TextBox ID="tbTo" runat="server" Font-Size="Small"
            Height="10"
            ReadOnly="true"
            Width="120px" ></asp:TextBox> 

       </td>  
       <td>
            <asp:ImageButton ID="ImageButtonCalendar1" runat="server"
            ImageUrl="~/images/calendar.gif"
            OnClick="ImageButtonCalendar1_Click" />

        </td>
        <td>
            <asp:Calendar ID="Calendar1" runat="server"
            BackColor="#FFFFCC"
            BorderColor="#FFCC66"
            BorderWidth="1px"
            DayNameFormat="Shortest"
            Font-Names="Verdana"
            Font-Size="8pt"
            ForeColor="#663399"
            Height="200px"
            ShowGridLines="True"
            Visible="false"
            Width="220px"
            OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar> 
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
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="Grid"
OnPageIndexChanging = "OnPaging"  >

<Columns>
  

    <asp:TemplateField  HeaderText="First name"   >
        <ItemTemplate >
            <asp:Label ID="lbEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Last Name" >
        <ItemTemplate>
            <asp:Label ID="lbBG" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtBG" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Email" >
        <ItemTemplate>
            <asp:Label ID="lbCS" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCS" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Total" >
        <ItemTemplate>
            <asp:Label ID="lbDa" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtDa" runat="server" Text='<%# Eval("Total") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
      <asp:TemplateField HeaderText="Payment TransactionId"  >
        <ItemTemplate>
            <asp:Label ID="lbDe" runat="server" Text='<%# Eval("PaymentTransactionId") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate> 
            <asp:TextBox ID="txtDe" runat="server" Text='<%# Eval("PaymentTransactionId") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Order Date" >
        <ItemTemplate>
            <asp:Label ID="lbEl" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtEl" runat="server" Text='<%# Eval("OrderDate") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Plan Name"  >
        <ItemTemplate>
            <asp:Label ID="lbES" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtES" runat="server" Text='<%# Eval("PlanName") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
   

</Columns>
</asp:GridView>
