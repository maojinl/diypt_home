<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day4.ascx.cs" Inherits="UserControls_Orientation_Day_4_Day4" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  4 - Overview</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-3">Day 3</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-5">Day 5</a>
    </div>
    <div class="row pb-4">
        <div class="col-lg-10 push-lg-1 ">
            <div class="row">
                <div class="col-sm-7 ">
                    <p>Here's a fact for you:</p>
                    <p>More often than not, if a food is in your possession or located in your house, you will eventually eat it.</p>
                    <p>Whether you plan to or not, whether you want to or not, you'll eventually eat it! Trust me.</p>
                    <p>Therefore, according to this fundamental law, if you wish to achieve your goal, you must remove all foods that aren't part of your healthy eating program and replace them with a variety of better, healthier choices.</p>
                    <p>How do you stack up against a healthy kitchen environment? Simply complete the questionnaire below and watch the video - 5 kitchen makeover tips.</p>
                </div>
                <div class="col-sm-5">
                    <img class="img-fluid img-round" src="/images/ori/day4/intro.jpg" />
                </div>
            </div>
            <div class="row mt-4 mb-4">
                <div class="col-sm-12 ">
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
                                <h5><a id="action1" class="c_black" href="/orientation/day-4/kitchen-makeover-questionnaire">Kitchen makeover questionnaire</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action2"  class="c_black" href="/orientation/day-4/video-5-kitchen-makeover-tips">Video - 5 kitchen makeover tips</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action3"  class="c_black" href="/orientation/day-4/get-familiar-with-a-pull-exercise">Get familiar with a pull exercise</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <a id="weekView2" href="/orientation" class="c_y btn btn-secondary m-1 col-lg-3 push-lg-3 col-sm-4 push-sm-2 sec">SWITCH TO WEEK VIEW ></a>
            <a href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-lg-3 col-sm-4 push-lg-3 push-sm-2 sec">PRINT WEEKLY PLAN ></a>
        </div>
    </div>
</div>