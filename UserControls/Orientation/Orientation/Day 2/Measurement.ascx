<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Measurement.ascx.cs" Inherits="UserControls_Orientation_Day_2_Measurement" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-2"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
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
 

    <div class="row pb-4 pt-4">
        <a href="/orientation/day-2/fitness-test" id="btn-result" class="c_y btn btn-secondary m-1 col-sm-4 push-sm-4">TASK COMPLETED ></a>
    </div>
</div>