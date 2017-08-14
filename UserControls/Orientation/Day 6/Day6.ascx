<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day6.ascx.cs" Inherits="UserControls_Orientation_Day_6_Day6" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  6 - Overview</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-5">Day 5</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-7">Day 7</a>
    </div>
    <div class="row pb-4">
        <div class="col-lg-10 push-lg-1 ">
            <div class="row">
                <div class="col-sm-7 ">
                    <p>I’m a big believer in the quote “You fail to plan, you plan to fail”. You’ve invested money, itme, effort and most of all have shown bucket loads of courage to do something about your health so spending 9me planning and organising your next 12 weeks is a crucial part of the process.
                    </p>
                </div>
                <div class="col-sm-5">
                    <img class="img-fluid img-round" src="/images/ori/day6/intro.jpg" />
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
                                <h5><a id="action1" class="c_black" href="/orientation/day-6/organise-your-next-12-weeks">Organise your next 12 weeks reminder sheet</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <td scope="row">
                                <h5><a id="action2"  class="c_black" href="/orientation/day-6/mark-on-your-calendar-diary-any-events">Mark on your calendar/diary any events </a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action3"  class="c_black" href="/orientation/day-6/mark-on-your-calendar-diary-your-shopping-days">Mark on your calendar/diary your shopping days </a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action4"  class="c_black" href="/orientation/day-6/mark-on-your-calendar-diary-your-milestone-celebrations">Mark on your calendar/diary your milestone celebrations</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        -->
                        <tr>
                            <td scope="row">
                                <h5><a id="action5" class="c_black" href="/orientation/day-6/get-familiar-with-the-twist">Get familiar with the twist</a></h5>
                            </td>
                            <td>                                 
                                <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
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