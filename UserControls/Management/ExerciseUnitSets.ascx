<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseUnitSets.ascx.cs" Inherits="UserControls_Management_ExerciseUnitSets" %>
<p><a href="/management/add-exercise-plan.aspx">Manage plan (<asp:Label ID="lblPlanName" runat="server" Text=''></asp:Label>)</a>
    -> <a href="/management/exercise-plan-week-detail.aspx">Plan week detail (<asp:Label ID="lblWeekNum" runat="server" Text=''></asp:Label>)</a>  
    -> <a href="/management/exercise-plan-week-day.aspx">Week days (<asp:Label ID="lblWeekDay" runat="server" Text=''></asp:Label>)</a>  
    -> <a href="/management/exercise-day-group.aspx">Day group (<asp:Label ID="lblDayGroup" runat="server" Text=''></asp:Label>)</a>  
    -> Exercise unit sets
</p>
<br />
<p>Exercise Unit Sets</p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowDeleting="OnRowDeleting"
OnRowUpdating="OnRowUpdating"  OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added." DataKeyNames="Id"
OnPageIndexChanging = "OnPaging"  OnRowCommand="GridView1_RowCommand"
AlternatingRowStyle-CssClass="alt" CssClass="Grid">

<Columns>
    
  <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" />
   
    <asp:TemplateField HeaderText="Sequence" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblSequence" runat="server" Text='<%# Eval("Sequence") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttSequence" runat="server" Text='<%# Eval("Sequence") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

        <asp:TemplateField HeaderText="ExerciseUnitId" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblExerciseUnitId" runat="server" Text='<%# Eval("ExerciseUnitId") %>'></asp:Label>
            
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="ttExerciseUnitId" runat="server" Text='<%# Eval("ExerciseUnitId") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField HeaderText="Exercise" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblExercise" runat="server" Text='<%# Eval("Exercise") %>'></asp:Label>
        </ItemTemplate>
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
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Rest" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbRest" runat="server" Text='<%# Eval("Rest") %>'></asp:Label>
        </ItemTemplate>       
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Weight" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbWeight" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
        </ItemTemplate>      
    </asp:TemplateField>

    
     <asp:TemplateField HeaderText="Comments" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
        </ItemTemplate>     
    </asp:TemplateField>

        
     <asp:TemplateField HeaderText="Unit Order" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbUnitOrder" runat="server" Text='<%# Eval("UnitOrder") %>'></asp:Label>
        </ItemTemplate>       
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Tempo" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTempo" runat="server" Text='<%# Eval("Tempo") %>'></asp:Label>
        </ItemTemplate>      
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Trainning set" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTrainning_Seto" runat="server" Text='<%# Eval("Trainning_Set") %>'></asp:Label>
        </ItemTemplate>      
    </asp:TemplateField>

    
     <asp:TemplateField HeaderText="Time Duration" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTimeDuration" runat="server" Text='<%# Eval("TimeDuration") %>'></asp:Label>
        </ItemTemplate>  
    </asp:TemplateField>


        <asp:TemplateField HeaderText="Image" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbImage" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
        </ItemTemplate>     
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
    <td style="width: 60px">
        Sequence:<br />
        <asp:textbox ID="txtSequence" runat="server" Width="100" />
    </td>
    <td style="width: 60px">
        ExerciseUnitId:<br />
        <asp:textbox ID="txtExerciseUnitId" runat="server" Width="100" />
    </td>
  
     <td style="width: 80px">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
    </td>
   
</tr>

</table>
<br />
<p>All your Exercise Units</p>
<p>
        <asp:textbox ID="txtFilter" runat="server" Width="190px" />
        <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="OnFilter" />
    </p>
<script>
    function clickFunction(owner)
    {
        var temp = document.getElementById('<%= txtExerciseUnitId.ClientID %>');

        if(temp != null)
        {
            temp.value = owner;
        }
    }
</script>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" 
EmptyDataText="No records has been added." AllowPaging="True" 
OnPageIndexChanging = "OnPaging2" PageSize="50"
AlternatingRowStyle-CssClass="alt" CssClass="Grid">

<Columns>


    <asp:TemplateField HeaderText="Action" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblExerciseUnitId2" runat="server" Text='<%# Eval("ExerciseUnitId2") %>'></asp:Label>
            <a href="#" onclick='clickFunction("<%# Eval("ExerciseUnitId2") %>"); return false;'>Add exercise</a>
        </ItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField HeaderText="Exercise" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblExercise" runat="server" Text='<%# Eval("Exercise2") %>'></asp:Label>
        </ItemTemplate>
       
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Alter Exercise" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lblAlterExercise2" runat="server" Text='<%# Eval("AlternateExercise2") %>'></asp:Label>
        </ItemTemplate>
       
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Reps" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbReps" runat="server" Text='<%# Eval("Reps2") %>'></asp:Label>
        </ItemTemplate>       
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Rest" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbRest" runat="server" Text='<%# Eval("Rest2") %>'></asp:Label>
        </ItemTemplate>       
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Weight" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbWeight" runat="server" Text='<%# Eval("Weight2") %>'></asp:Label>
        </ItemTemplate>      
    </asp:TemplateField>

    
     <asp:TemplateField HeaderText="Comments" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbComments" runat="server" Text='<%# Eval("Comments2") %>'></asp:Label>
        </ItemTemplate>     
    </asp:TemplateField>

        
     <asp:TemplateField HeaderText="Unit Order" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbUnitOrder" runat="server" Text='<%# Eval("UnitOrder2") %>'></asp:Label>
        </ItemTemplate>       
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Tempo" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTempo" runat="server" Text='<%# Eval("Tempo2") %>'></asp:Label>
        </ItemTemplate>      
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Trainning set" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTrainning_Seto" runat="server" Text='<%# Eval("Trainning_Set2") %>'></asp:Label>
        </ItemTemplate>      
    </asp:TemplateField>

    
     <asp:TemplateField HeaderText="Time Duration" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbTimeDuration" runat="server" Text='<%# Eval("TimeDuration2") %>'></asp:Label>
        </ItemTemplate>  
    </asp:TemplateField>


        <asp:TemplateField HeaderText="Image" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:Label ID="lbImage" runat="server" Text='<%# Eval("Image2") %>'></asp:Label>
        </ItemTemplate>     
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Image Displayed" ItemStyle-Width="100">
        <ItemTemplate>
            <asp:image ID="imgDisplayed" runat="server" imageUrl='<%# Eval("Image2") %>'></asp:image>
        </ItemTemplate>
    </asp:TemplateField>
</Columns>
</asp:GridView>

<div>

     <asp:Button ID="btnReturn" runat="server" Text="Back" OnClick="Return" />

</div>