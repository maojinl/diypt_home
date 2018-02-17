<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberResult.ascx.cs" Inherits="UserControls_Management_MemberResult" %>
<style type="text/css">
	.auto-style1 {
		width: 308px;
	}
</style>
<asp:Label ID="lblPlanInfo" runat="server" Text=''/>
<table>
	<tr>
		<td>
			<asp:Label ID="lbsearch" runat="server" Text="Food Plan:" />
		</td>
	</tr>
	 <tr>
		<td>
		  <asp:Label ID="Label1" runat="server" Text="Calories:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood1" runat="server" Width="300px" />

		</td>

	</tr>

	 <tr>
		<td>
		  <asp:Label ID="Label2" runat="server" Text="Protein:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood2" runat="server" Width="300px" />
		</td>
	</tr>
	  <tr>
		<td>
		  <asp:Label ID="Label3" runat="server" Text="Carbohydrate:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood3" runat="server" Width="300px" />
		</td>
	</tr>

   <tr>
		<td>
		  <asp:Label ID="Label4" runat="server" Text="Fats:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood4" runat="server" Width="300px" />
		</td>
   </tr>
	   <tr>
		<td>
		  <asp:Label ID="Label5" runat="server" Text="Protein %:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood5" runat="server" Width="300px" />
		</td>
	</tr>
	   <tr>
		<td>
		  <asp:Label ID="Label6" runat="server" Text="Carb %:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood6" runat="server" Width="300px" />
		</td>
	</tr>
	   <tr>
		<td>
		  <asp:Label ID="Label7" runat="server" Text="Fats %:" />
		</td>
		<td class="auto-style1">
			<asp:TextBox ID="tbFood7" runat="server" Width="300px" />
		</td>
	</tr>
	<tr>
		<td>
		  <asp:Label ID="Label8" runat="server" Text="Week of the plan:" />
		</td>
		<td class="auto-style1">
            <asp:DropDownList ID="ddlWeek" runat="server" OnSelectedIndexChanged = "WeekChanged" AutoPostBack = "true" AppendDataBoundItems = "true">
            <asp:ListItem Text = "ALL" Value = "-1"></asp:ListItem>
            </asp:DropDownList>
		</td>
	</tr>
		  <tr>
		 <td>
			
		</td>
		 <td class="auto-style1">
			  <asp:Button runat="server" ID="btnSave" OnClick="Save" Text="Save" />
		</td>

	</tr>


	<tr>
		 <td>
			
			 Change Level</td>
		 <td class="auto-style1">
			  <asp:DropDownList ID="ddlLevel" runat="server" Height="22px" Width="200px">
			  </asp:DropDownList>
			  <asp:Button ID="btnChangeLevel" runat="server" Text="Change Level" OnClick="btnChangeLevel_Click" />
		</td>

	</tr>

	<tr>
		 <td>Change Program</td>
		 <td class="auto-style1">
			  <asp:DropDownList ID="ddlProgram" runat="server" Height="22px" Width="200px">
			  </asp:DropDownList>
			  <asp:Button ID="btnChangeProgram" runat="server" Text="Change Program" OnClick="btnChangeProgram_Click" />
		</td>

	</tr>

    	<tr>
		 <td>Change to a different plan</td>
		 <td class="auto-style1">
			  <asp:DropDownList ID="ddlPlan" runat="server" Height="22px" Width="350px">
			  </asp:DropDownList>
			  <asp:Button ID="btnChangePlan" runat="server" Text="Change Plan" OnClick="btnChangePlan_Click" />
		</td>

	</tr>

	<tr>
		<td>Pause Plan</td>
		 <td class="auto-style1">
			  <asp:DropDownList ID="ddlPauseResume" runat="server" Height="22px" Width="200px">
				  <asp:ListItem>Pause</asp:ListItem>
				  <asp:ListItem>Resume</asp:ListItem>
			  </asp:DropDownList>
			  <asp:Button ID="Button1" runat="server" Text="Take Action" OnClick="btnPauseResume_Click" />
		</td>

	</tr>

	<tr>
		<td>Registry questions and answers</td>
		 <td class="auto-style1">
			  <asp:TextBox ID="txtQA" runat="server" Height="300px" Width="700px" TextMode="MultiLine">
			  </asp:TextBox>
		</td>

	</tr>


</table>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  
EmptyDataText="No records has been added." PageSize="20" PagerSettings-Mode="NumericFirstLast" 
AllowPaging="True" AlternatingRowStyle-CssClass="alt" CssClass="Grid" 
OnPageIndexChanging = "OnPaging" >

<Columns>
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
	 <asp:TemplateField HeaderText="PlanName" >
		<ItemTemplate>
			<asp:Label ID="lbCS" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtCS" runat="server" Text='<%# Eval("PlanName") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	 <asp:TemplateField HeaderText="Week" >
		<ItemTemplate>
			<asp:Label ID="lbDa" runat="server" Text='<%# Eval("Week") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtDa" runat="server" Text='<%# Eval("Week") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	  <asp:TemplateField HeaderText="StartDate"  >
		<ItemTemplate>
			<asp:Label ID="lbDe" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate> 
			<asp:TextBox ID="txtDe" runat="server" Text='<%# Eval("StartDate") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndDate" >
		<ItemTemplate>
			<asp:Label ID="lbEl" runat="server" Text='<%# Eval("EndDate") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtEl" runat="server" Text='<%# Eval("EndDate") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="Status"  >
		<ItemTemplate>
			<asp:Label ID="lbStatus" runat="server" Text='<%# PrizeCommonUtils.GetMemberPlanWeekStatus(Eval("Status").ToString()) %>'></asp:Label>
		</ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndWeight"  >
		<ItemTemplate>
			<asp:Label ID="lbES" runat="server" Text='<%# Eval("EndWeight") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtES" runat="server" Text='<%# Eval("EndWeight") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndWaist"  >
		<ItemTemplate>
			<asp:Label ID="lbFI" runat="server" Text='<%# Eval("EndWaist") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtFI" runat="server" Text='<%# Eval("EndWaist") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndBodyFat" >
		<ItemTemplate>
			<asp:Label ID="lbFR" runat="server" Text='<%# Eval("EndBodyFat") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtFR" runat="server" Text='<%# Eval("EndBodyFat") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndChest">
		<ItemTemplate>
			<asp:Label ID="lbHu" runat="server" Text='<%# Eval("EndChest") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtHu" runat="server" Text='<%# Eval("EndChest") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndHip"  >
		<ItemTemplate>
			<asp:Label ID="lbIT" runat="server" Text='<%# Eval("EndHip") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtIT" runat="server" Text='<%# Eval("EndHip") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="EndHeartRate"  >
		<ItemTemplate>
			<asp:Label ID="lbJA" runat="server" Text='<%# Eval("EndHeartRate") %>'></asp:Label>
		</ItemTemplate>
		<EditItemTemplate>
			<asp:TextBox ID="txtJA" runat="server" Text='<%# Eval("EndHeartRate") %>'></asp:TextBox>
		</EditItemTemplate>
	</asp:TemplateField>
	 <asp:TemplateField HeaderText="Front Photo" ItemStyle-Width="100">
		<ItemTemplate>
			<asp:image style="width:100px;height:100px" ID="front" runat="server" imageUrl='<%# ReplaceWebSiteUrl(Eval("FrontPhoto")) %>'></asp:image>
		</ItemTemplate>
	</asp:TemplateField>
	  <asp:TemplateField HeaderText="Back Photo" ItemStyle-Width="100">
		<ItemTemplate>
			<asp:image style="width:100px;height:100px" ID="front" runat="server" imageUrl='<%# ReplaceWebSiteUrl(Eval("BackPhoto")) %>'></asp:image>
		</ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="Side Photo" ItemStyle-Width="100">
		<ItemTemplate>
			<asp:image style="width:100px;height:100px" ID="front" runat="server" imageUrl='<%# ReplaceWebSiteUrl(Eval("SidePhoto")) %>'></asp:image>
		</ItemTemplate>
	</asp:TemplateField>
   

</Columns>
</asp:GridView>

</asp:Content>
