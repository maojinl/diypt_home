<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day5.ascx.cs" Inherits="UserControls_Orientation_Day_5_Day5" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  5 - Overview</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-4">Day 4</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-6">Day 6</a>
    </div>
    <div class="row pb-4">
        <div class="col-lg-10 push-lg-1 ">
            <div class="row">
                <div class="col-sm-7 ">
                    <p>Social support is defined as having a network of people that support your goals, contribute positively to your decision, and are there for you when you need help. Scientists have suggested that people with this kind of network around them can transcend even the worst environments and accomplish great things. Unfortunately, people who don't have this type of network have a harder time accomplishing even modest goals. <strong>Remember this: who you are today and who you become in the future has a lot to do with whom you choose to spend your time</strong>.
                    </p>
                </div>
                <div class="col-sm-5">
                    <img class="img-fluid img-round" src="/images/ori/day5/intro.jpg" />
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
                                <h5><a id="action1" class="c_black" href="/orientation/day-5/social-support-questionnaire">Social support questionnaire</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action2"  class="c_black" href="/orientation/day-5/video-social-support-crew">Video - Your social support crew</a></h5>
                            </td>
                            <td>
                                 <p class="tick-circle" style="background-color: transparent;"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                 </p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action3"  class="c_black" href="/orientation/day-5/get-familiar-with-the-lunge">Get familiar with the lunge</a></h5>
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