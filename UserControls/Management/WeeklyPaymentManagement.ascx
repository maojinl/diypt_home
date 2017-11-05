<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WeeklyPaymentManagement.ascx.cs" Inherits="UserControls_Management_WeeklyPaymentManagement" %>
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
            <asp:Calendar ID="clWeeklyPaymentStart1" runat="server"
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
            <asp:Label ID="Label2" runat="server" Text="To:"></asp:Label>
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
            <asp:Calendar ID="clWeeklyPaymentStart2" runat="server"
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
              <asp:Button runat="server" ID="btnSearch" OnClick="search" Text="Search" />
             &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnrefresh" OnClick="refresh" Text="Refresh" />
        </td>
    </tr>


</table>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="Grid" OnRowCommand="GridView1_RowCommand"
OnPageIndexChanging = "OnPaging" >

    <Columns>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnStart" runat="server" Text="Start" CommandName = "Start" 
                     CommandArgument='<%# Eval("WeeklyPaymentId")+","+Eval("MemberPlanId")+","+Eval("OrderId")  %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="Transaction"   >
            <ItemTemplate>
                <asp:TextBox ID="txtTransactionId" runat="server" Text='<%# Eval("Transaction") %>'></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="First name"   >
            <ItemTemplate >
                <asp:Label ID="lbEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="First name"   >
            <ItemTemplate >
                <asp:Label ID="lbEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Surname" >
            <ItemTemplate>
                <asp:Label ID="lbBG" runat="server" Text='<%# Eval("Surname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email" >
            <ItemTemplate>
                <asp:Label ID="lbEl" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Plan Name"  >
            <ItemTemplate>
                <asp:Label ID="lbPN" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="TrialOrNot" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:CheckBox ID="lbTrialOrNot" Enabled="false" runat="server" Checked='<%# Eval("IsTrialPlan")!=null&&!Eval("IsTrialPlan").ToString().Equals("0")?true:false %>'></asp:CheckBox>
            </ItemTemplate>
        </asp:TemplateField>
       <asp:TemplateField HeaderText="Plan Start Date"  >
            <ItemTemplate>
                <asp:Label ID="lbPD" runat="server" Text='<%# Eval("Status").Equals("W")?"":Eval("StartDate") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Created Date"  >
            <ItemTemplate>
                <asp:Label ID="lbPD" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Paid or Not"  >
            <ItemTemplate>
                <asp:Label ID="lbPAID" runat="server" Text='<%# Eval("Status").ToString()[0] %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

</Columns>
</asp:GridView>
<div>
</div>
<div>
</div>
<div>
</div>
<div>
</div>
<table>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Search Condition:" />
        </td>
    </tr>
     <tr>
        <td>
          <asp:Label ID="Label4" runat="server" Text="first name:" />
        </td>
        <td>
            <asp:TextBox ID="tbFirstName2" runat="server" Width="300px" />
        </td>
    </tr>
   <tr valign="top">
      <td>
            <asp:Label ID="Label5" runat="server" Text="Date  From:"></asp:Label>
      </td>
       <td>
            <asp:TextBox ID="tbFrom2" runat="server" Font-Size="Small"
            Height="10"
            ReadOnly="true"
            Width="120px" ></asp:TextBox> 

       </td>  
       <td>
            <asp:ImageButton ID="ImageButton1" runat="server"
            ImageUrl="~/images/calendar.gif"
            OnClick="ImageButtonCalendar_Click" />

        </td>
        <td>
            <asp:Calendar ID="clWeeklyPaymentStop1" runat="server"
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
            <asp:Label ID="Label6" runat="server" Text="To:"></asp:Label>
      </td>
       <td>
            <asp:TextBox ID="tbTo2" runat="server" Font-Size="Small"
            Height="10"
            ReadOnly="true"
            Width="120px" ></asp:TextBox> 

       </td>  
       <td>
            <asp:ImageButton ID="ImageButton2" runat="server"
            ImageUrl="~/images/calendar.gif"
            OnClick="ImageButtonCalendar1_Click" />
        </td>
        <td>
            <asp:Calendar ID="clWeeklyPaymentStop2" runat="server"
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
              <asp:Button runat="server" ID="Button1" OnClick="search2" Text="Search" />
             &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="Button2" OnClick="refresh2" Text="Refresh" />
        </td>
    </tr>


</table>


<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="Grid" OnRowCommand="GridView1_RowCommand"
OnPageIndexChanging = "OnPaging" >

    <Columns>
       <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnTerminate" runat="server" Text="Terminate" CommandName = "Terminate" 
                    CommandArgument='<%# Eval("WeeklyPaymentId")+","+Eval("MemberPlanId")+","+Eval("OrderId")  %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="Transaction"   >
            <ItemTemplate>
                <asp:TextBox ID="txtTransactionId" runat="server" Text='<%# Eval("Transaction") %>'></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="First name"   >
            <ItemTemplate >
                <asp:Label ID="lbEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="First name"   >
            <ItemTemplate >
                <asp:Label ID="lbEN" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Surname" >
            <ItemTemplate>
                <asp:Label ID="lbBG" runat="server" Text='<%# Eval("Surname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email" >
            <ItemTemplate>
                <asp:Label ID="lbEl" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Plan Name"  >
            <ItemTemplate>
                <asp:Label ID="lbPN" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="TrialOrNot" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:CheckBox ID="lbTrialOrNot" Enabled="false" runat="server" Checked='<%# Eval("IsTrialPlan")!=null&&!Eval("IsTrialPlan").ToString().Equals("0")?true:false %>'></asp:CheckBox>
            </ItemTemplate>
        </asp:TemplateField>
       <asp:TemplateField HeaderText="Plan Start Date"  >
            <ItemTemplate>
                <asp:Label ID="lbPD" runat="server" Text='<%# Eval("Status").Equals("W")?"":Eval("StartDate") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Created Date"  >
            <ItemTemplate>
                <asp:Label ID="lbPD" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Paid or Not"  >
            <ItemTemplate>
                <asp:Label ID="lbPAID" runat="server" Text='<%# Eval("Status").ToString()[1] %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

</Columns>
</asp:GridView>