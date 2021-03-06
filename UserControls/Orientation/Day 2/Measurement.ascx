<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Measurement.ascx.cs" Inherits="UserControls_Orientation_Day_2_Measurement" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-2"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 2  - Task 1</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-2">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-2/fitness-test">Next</a>
    </div>
  <h1 class="text-center pb-4">MEASUREMENT</h1>
    <div class="row">
        <div class="col-12 text-center">To know how far you need to go, you need to know where you started. 
<br />Enter your first set of measurements.
        <a href="/my-account/progress-status#tab-bx-progress" target="_blank" style="color:#e69531">Enter Now></a>
        </div>
        </div>
    <div class="row pb-4 pt-4">
		<div class="col">
			<div class="text-center"><asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/></div>
		</div>
	</div>
</div>