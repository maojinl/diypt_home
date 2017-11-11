<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WeeklyPaymentManagement.ascx.cs" Inherits="UserControls_Management_WeeklyPaymentManagement" %>
<h5>Start Manually Paid Plans</h5>
<table>
	<caption title="Start Paid Manually Plans" />
		
	<tr>
		<td colspan="8">
			<strong><asp:Label ID="lbsearch" runat="server" Text="Search Condition:" /></strong>
		</td>
	</tr>
	 <tr>
		<td>
		  <asp:Label ID="Label1" runat="server" Text="first name:" />
		</td>
		<td colspan="7">
			<asp:TextBox ID="tbfistname" runat="server" Width="300px" />
		</td>
	</tr>
	<tr>
		<td colspan="8">
			&nbsp;
		</td>
	</tr>
   <tr valign="top">
	  <td>
			<asp:Label ID="LabelDate" runat="server" Text="Date  From:"></asp:Label>
	  </td>
	   <td>
			<asp:TextBox ID="tbFrom" runat="server" Font-Size="Small"
			Height="20"
			ReadOnly="true"
			Width="120px" ></asp:TextBox> 

	   </td>  
	   <td>
			<asp:ImageButton ID="btnCalendarStart1" runat="server"
			ImageUrl="/images/calendar.gif"
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
			<asp:Label ID="Label2" runat="server" Text="To:"></asp:Label>
	   </td>
	   <td>
			<asp:TextBox ID="tbTo" runat="server" Font-Size="Small"
			Height="20"
			ReadOnly="true"
			Width="120px" ></asp:TextBox> 

	   </td>  
	   <td>
			<asp:ImageButton ID="btnCalendarEnd1" runat="server"
			ImageUrl="/images/calendar.gif"
			OnClick="ImageButtonCalendar1_Click" />
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
		<td colspan="8">
			&nbsp;
		</td>
	</tr>
	<tr>
		 <td>
			  <asp:Button runat="server" ID="btnSearch" OnClick="search" Text="Search" />
			 &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnrefresh" OnClick="refresh" Text="Refresh" />
		</td>
	</tr>


</table>
<br/>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="Grid" OnRowCommand="GridView1_RowCommand"
OnPageIndexChanging = "OnPaging" >
	<Columns>
		 <asp:TemplateField>
			<ItemTemplate>
				<asp:Button ID="btnStart" runat="server" Text="Approve" CommandName = "Start" 
					 CommandArgument='<%# Eval("ManualPaymentId")+","+Eval("MemberPlanId")+","+Eval("OrderId")  %>' />
			</ItemTemplate>
		</asp:TemplateField>
				<asp:TemplateField  HeaderText="Transaction">
			<ItemTemplate>
				<asp:TextBox ID="txtTransactionId" runat="server" Text='<%# Eval("Transaction") %>'></asp:TextBox>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="Comment">
			<ItemTemplate>
				<asp:TextBox ID="txtComment" runat="server" Text='<%# Eval("Comment") %>'></asp:TextBox>
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
		<asp:TemplateField HeaderText="Payment Mode"  >
			<ItemTemplate>
				<asp:Label ID="lbPaymentMode" runat="server" Text='<%# Eval("Status").ToString().EndsWith("W")?"Weekly":"One-off" %>'></asp:Label>
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
		<asp:TemplateField HeaderText="Created Date"  >
			<ItemTemplate>
				<asp:Label ID="lbCD" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
				<asp:TemplateField HeaderText="Approved"  >
			<ItemTemplate>
				<asp:Label ID="lbApproved" runat="server" Text='<%# Eval("Status").ToString().StartsWith("0")?"No":"Yes" %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>

<hr/>
<h5>Terminate Unpaid Plans</h5>
<table>
	<caption title="Start Paid Manually Plans" />
		<tr>
		<td colspan="8">
			<strong><asp:Label ID="Label3" runat="server" Text="Search Condition:" /></strong>
		</td>
	</tr>
	 <tr>
		<td>
		  <asp:Label ID="Label4" runat="server" Text="first name:" />
		</td>
		<td colspan="7">
			<asp:TextBox ID="tbFirstName2" runat="server" Width="300px" />
		</td>
	</tr>
		<tr>
		<td colspan="8">
			&nbsp;
		</td></tr>
   <tr valign="top">
	  <td>
			<asp:Label ID="Label5" runat="server" Text="Date  From:"></asp:Label>
	  </td>
	   <td>
			<asp:TextBox ID="tbFrom2" runat="server" Font-Size="Small"
			Height="20"
			ReadOnly="true"
			Width="120px" ></asp:TextBox> 

	   </td>  
	   <td>
			<asp:ImageButton ID="btnCalendarStart2" runat="server"
			ImageUrl="/images/calendar.gif"
			OnClick="ImageButtonCalendar_Click" />

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
			Height="20"
			ReadOnly="true"
			Width="120px" ></asp:TextBox> 

	   </td>  
	   <td>
			<asp:ImageButton ID="btnCalenderEnd2" runat="server"
			ImageUrl="/images/calendar.gif"
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
		<td colspan="8">
			&nbsp;
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
					CommandArgument='<%# Eval("ManualPaymentId")+","+Eval("MemberPlanId")+","+Eval("OrderId")  %>' />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="Transaction"   >
			<ItemTemplate>
				<asp:Label ID="txtTransactionId2" runat="server" Text='<%# Eval("Transaction") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="Comment"   >
			<ItemTemplate>
				<asp:TextBox ID="txtComment2" runat="server" Text='<%# Eval("Comment") %>'></asp:TextBox>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="First name"   >
			<ItemTemplate >
				<asp:Label ID="lbEN2" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Surname" >
			<ItemTemplate>
				<asp:Label ID="lbBG2" runat="server" Text='<%# Eval("Surname") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Payment Mode"  >
			<ItemTemplate>
				<asp:Label ID="lbPaymentMode2" runat="server" Text='<%# Eval("Status").ToString().EndsWith("W")?"Weekly":"One-off" %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Email" >
			<ItemTemplate>
				<asp:Label ID="lbEl2" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Plan Name"  >
			<ItemTemplate>
				<asp:Label ID="lbPN2" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
			<asp:TemplateField HeaderText="TrialOrNot" ItemStyle-Width="150">
			<ItemTemplate>
				<asp:CheckBox ID="lbTrialOrNot2" Enabled="false" runat="server" Checked='<%# Eval("IsTrialPlan")!=null&&!Eval("IsTrialPlan").ToString().Equals("0")?true:false %>'></asp:CheckBox>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Plan Start Date"  >
			<ItemTemplate>
				<asp:Label ID="lbPD2" runat="server" Text='<%# Eval("StartDate") %>' ></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Created Date"  >
			<ItemTemplate>
				<asp:Label ID="lbCD2" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Approved"  >
			<ItemTemplate>
				<asp:Label ID="lbPAID2" runat="server" Text='<%# Eval("Status").ToString().StartsWith("0")?"No":"Yes" %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
</Columns>
</asp:GridView>