﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Social video.ascx.cs" Inherits="UserControls_Orientation_Day_5_Social_video" %>
    <div class="tab-inner-content">
        <div class="d-flex justify-content-end content-nav-action sec mb-4">
            <a id="dayView2" class="c_grey" href="/orientation/day-5"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
            <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
        </div>
        <div class="text-center">
            <h1><strong>Day 5 - Task 2</strong></h1>
            <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
            <a id="dayPre" class="day-pre c_y" href="/orientation/day-5/social-support-questionnaire">Back</a>
            <a id="dayNext" class="day-next c_y" href="/orientation/day-5/get-familiar-with-the-lunge.aspx">Next</a>
        </div>
        <div class="row">
            <div class="col-sm-10 push-sm-1">
                <h1 class="text-center pb-4">Watch video - Your social support crew</h1>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://player.vimeo.com/video/225782837" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                </div>
            </div>
            <div class="col-sm-10 push-sm-1 text-center mt-3">
                <div class="text-center">
                    <asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click" />
                </div>
            </div>
        </div>
    </div>