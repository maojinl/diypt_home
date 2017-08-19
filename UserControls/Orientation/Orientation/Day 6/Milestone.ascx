<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Milestone.ascx.cs" Inherits="UserControls_Orientation_Day_6_Milestone" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-6"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 6  - Task 4</strong></h1>
       <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-6/mark-on-your-calendar-diary-your-shopping-days">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-6/get-familiar-with-the-twist">Next</a>
    </div>
    <div class="row">
        <div class="col-sm-10 push-sm-1">
            <h1 class="text-center pb-4"> Mark on your calendar/diary your milestone celebrations</h1>
            <p> at the end of week 5,9 and 13.</p>
            <hr/>
            <a href="/orientation/day-6/get-familiar-with-the-twist" class="text-center-sp btn btn-secondary  c_y">TASK COMPLETED ></a>
        </div>
    </div>
</div>