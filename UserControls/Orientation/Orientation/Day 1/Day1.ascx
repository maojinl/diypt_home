<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day1.ascx.cs" Inherits="UserControls_Orientation_Day1" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action f-sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation"> <img src="images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  1 - Overview</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="#"></a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-2">Day 2</a>
    </div>
    <div class="row pb-4">
        <div class="col-sm-6 push-sm-1 ">
            <h1>Welcome to DIYPT.</h1>
            <p>You’ve joined a thousand plus strong community of DIYPTers. If you are like me and want to get the biggest bang for your buck and get the best results from your program, then I highly recommend you get involved with our community by completing the “Introduce yourself” actions and actively using your Revitalise Me zone.</p>
            <p>In this section, there are plenty of videos and articles about training, nutrition and mindset plus you get to ask questions, make comments or share something with fellow DIYPTers and I encourage you to do this a lot because you are not alone on this journey!</p>
        </div>
        <div class="col-sm-4 push-sm-1">
            <img class="img-fluid img-round" src="images/ori/day1/intro.jpg" />
        </div>
    </div>
    <div class="row pb-4">
        <div class="col-sm-10 push-sm-1 ">
            <table class="table table-action-items">
                <tr>
                    <th>
                        <h5 class="c_y">ACTION ITEMS</h5></th>
                    <th class="text-center">
                        <h5 class="c_y">STATUS</h5>
                    </th>
                </tr>
                <tr>
                    <td scope="row">
                        <h5><a id="action1" class="c_black" href="/orientation/day-1/introduce-yourself">Introduce yourself</a></h5>
                    </td>
                    <td>
                        <p class="tick-circle">✓</p>
                    </td>
                </tr>
                <tr>
                    <td scope="row">
                       <h5><a id="action2"  class="c_black" href="/orientation/day-1/pre-ex-questionnaire">Pre exercise questionnaire</a></h5>
                    </td>
                    <td>
                        <p class="tick-circle">✓</p>
                    </td>
                </tr>
                <tr>
                    <td scope="row">
                        <h5><a id="action3"  class="c_black" href="/orientation/day-1/get-familiar-with-the-squat">Get familiar with the squat</a></h5>
                    </td>
                    <td>
                        <p class="tick-circle">✓</p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
   <div class="row pb-4 pt-4">
                <a id="weekView2" href="/orientation" class="c_y btn btn-secondary m-1 col-lg-3 push-lg-3 col-sm-4 push-sm-2">SWITCH TO WEEK VIEW ></a>
                <a href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-lg-3 col-sm-4 push-lg-3 push-sm-2">PRINT WEEKLY PLAN ></a>
            </div>

</div>