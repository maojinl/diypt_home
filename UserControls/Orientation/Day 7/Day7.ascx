<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day7.ascx.cs" Inherits="UserControls_Orientation_Day_7_Day7" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  7 - Overview</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-6">Day 6</a>
        <a id="dayNext" class=" c_y" href="#"></a>
    </div>
    <div class="row pb-4">
        <div class="col-lg-10 push-lg-1 ">
            <div class="row mb-4">
                <div class="col-sm-7 mb-4">
                    <img class="img-fluid img-round" src="/images/rest-day.jpg" />
                </div>
                <div class="col-sm-5">
                    <h5 class="underline">Rest Day <img class="icon-s" src="/images/icon-time-y.svg" /><span class="c_y"> All Day </span></h5>
                    <p>It has been a big start to your program, so put your feet up, sit back and relax today. You deserve the reward</p>
                </div>
            </div>
     
            <a id="weekView2" href="/orientation" class="c_y btn btn-secondary m-1 col-lg-3 push-lg-3 col-sm-4 push-sm-2">SWITCH TO WEEK VIEW ></a>
            <a href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-lg-3 col-sm-4 push-lg-3 push-sm-2">PRINT WEEKLY PLAN ></a>
        </div>
    </div>
</div>
