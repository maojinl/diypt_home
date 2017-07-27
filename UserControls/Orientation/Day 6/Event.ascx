<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Event.ascx.cs" Inherits="UserControls_Orientation_Day_6_Calendar" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-6"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 6  - Task 2</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-6/organise-your-next-12-weeks">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-6/mark-on-your-calendar-diary-your-shopping-days">Next</a>
        
    </div>



    <div class="row">
        <div class="col-sm-10 push-sm-1">
            <h1 class="text-center pb-4">Mark on your calendar/diary any events </h1>
            

            <p>eg. birthdays, weddings - that will disrupt your DIYPT program</p>
             <hr/>
            <asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/>
        </div>
    </div>
</div>