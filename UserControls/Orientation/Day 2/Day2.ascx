<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day2.ascx.cs" Inherits="UserControls_Orientation_Day_2_Day2" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation">
            <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()">
            <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  2  - Overview</strong></h1>
        <div class="ori-date">
            <span class="c_y">
                <asp:Label ID="lblDay" runat="server"></asp:Label></span>
            <asp:Label ID="lblDate" runat="server"></asp:Label>
        </div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-1">Day 1</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-3">Day 3</a>
    </div>
    <div class="row pb-4">
        <div class="col-lg-10 push-lg-1 ">
            <div class="row">
                <div class="col-sm-7 ">
                    <p>In order for us to see how far you’ve come, we need to see where you started. And we measure this through a series of measurements and a fitness test.</p>
                    <p>The purpose of the fitness test is:</p>
                    <ul class="list">
                        <li>To make sure you're on the best program for your fitness level</li>
                        <li>To track your progress along your 13 week journey</li>
                        <li>Help you with setting goals.</li>
                    </ul>
                    <p>You will do the measurements and fitness test every 4 weeks and will record it in your <strong>Progress Stats.</strong> Your Progress Stats will be on the front page once you log into your account because I want it to be in your face and visual for you to have a daily reminder about your progress and achievements.</p>
                </div>
                <div class="col-sm-5">
                    <img class="img-fluid img-round" src="/images/ori/day2/intro.jpg" />
                </div>
            </div>
            <div class="row mt-4 mb-4">
                <div class="col-sm-12 ">
                    <table class="table table-action-items">
                        <tr>
                            <th>
                                <h5 class="c_y">ACTION ITEMS</h5>
                            </th>
                            <th class="text-center">
                                <h5 class="c_y">STATUS</h5>
                            </th>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action1" class="c_black" href="/orientation/day-2/measurements">Measurements</a></h5>
                            </td>
                            <td>
                                <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action2" class="c_black" href="/orientation/day-2/fitness-test">Fitness test</a></h5>
                            </td>
                            <td>
                                <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action3" class="c_black" href="/orientation/day-2/get-familiar-with-the-deadlift">Get familiar with the powerband deadlift</a></h5>
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
