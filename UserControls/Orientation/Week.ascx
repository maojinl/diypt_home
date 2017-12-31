<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Week.ascx.cs" Inherits="UserControls_Orientation_Week" %>
    <div class="tab-inner-content">
        <div class="d-flex justify-content-end content-nav-action sec mb-4">
            <!--<a id="dayView1" class="c_grey" href="#" runat="server"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>-->
            <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
        </div>
        <div class="text-center mb-4" runat="server" id="divHeader">
            <h1><strong>Week 0 - Orientation </strong></h1>
            <div class="ori-date">
                <asp:Label ID="lblWeekly" runat="server"></asp:Label>
            </div>
        </div>
        <div id="divTrial" runat="server" visible="false" class="text-center">
            <h2>This function is only available on the full plan</h2></div>
        <div class="row mb-4">
            <div id="divNotStarted" class="text-center" runat="server" Visible="false">
                <h2>Your program will not start until the next Monday</h2></div>
            <div style="margin: 0 auto" id="divOrientation" runat="server">
                <table class="table-week-ori table-sm table-responsive">
                    <tr>
                        <th class="no-border-top no-border-left"></th>
                        <th style="padding-left: 30px;"> ACTION ITEMS</th>
                        <th class="text-center"> STATUS</th>
                    </tr>
                    <tr>
                        <td rowspan="4" class="text-center v-m">
                            <p>DAY 1</p>
                            <p><strong><asp:Label ID="lblDate1" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay1" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="1-1" href="/orientation/day-1/introduce-yourself">Introduce yourself</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest11" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right"><a class="weeklink" data-num="1-2" href="/orientation/day-1/pre-ex-questionnaire">Pre-ex questionnaire</a></td>
                        <td>
                            <p runat="server" id="quest12" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right"><a class="weeklink" data-num="1-3" href="/orientation/day-1/get-familiar-with-the-squat">Get Familiar with the squat</a></td>
                        <td>
                            <p runat="server" id="quest13" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><a class="weeklink c_y" href="/orientation/day-1" data-num="1">View Day 1 detail</a></td>
                    </tr>
                    <tr>
                        <td rowspan="4" class="text-center v-m">
                            <p>DAY 2</p>
                            <p><strong><asp:Label ID="lblDate2" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay2" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="2-1" href="/orientation/day-2/measurements">Measurements</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest21" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="2-2" href="/orientation/day-2/fitness-test">Fitness Test</a>
                        </td>
                        <td>
                            <p runat="server" id="quest22" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="2-3" href="/orientation/day-2/get-familiar-with-the-deadlift">Get familiar with the deadlift</a>
                        </td>
                        <td>
                            <p runat="server" id="quest23" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a class="weeklink c_y" href="/orientation/day-2" data-num="2">View Day 2 detail</a>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="4" class="text-center v-m">
                            <p>DAY 3</p>
                            <p><strong><asp:Label ID="lblDate3" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay3" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="3-1" href="/orientation/day-3/3-day-food-diary">3 day food diary</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest31" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="3-2" href="/orientation/day-3/video-how-to-count-your-macros">Video - How to count your Macros</a>
                        </td>
                        <td>
                            <p runat="server" id="quest32" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="3-3" href="/orientation/day-3/get-familiar-with-a-push-exercise">Get familiar with a push exercise</a>
                        </td>
                        <td>
                            <p runat="server" id="quest33" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a class="weeklink c_y" href="/orientation/day-3" data-num="3">View Day 3 detail</a>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="4" class="text-center v-m">
                            <p>DAY 4</p>
                            <p><strong><asp:Label ID="lblDate4" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay4" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="4-1" href="/orientation/day-4/kitchen-makeover-questionnaire">Kitchen makeover questionnaire</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest41" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="4-2" href="/orientation/day-4/video-5-kitchen-makeover-tips">Video - 5 kitchen makeover tips</a>
                        </td>
                        <td>
                            <p runat="server" id="quest42" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="4-3" href="/orientation/day-4/get-familiar-with-a-pull-exercise">Get familiar with a pull exercise</a>
                        </td>
                        <td>
                            <p runat="server" id="quest43" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a class="weeklink c_y" href="/orientation/day-4" data-num="4">View Day 4 detail</a>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="4" class="text-center v-m">
                            <p>DAY 5</p>
                            <p><strong><asp:Label ID="lblDate5" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay5" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="5-1" href="/orientation/day-5/social-support-questionnaire">Social support questionnaire</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest51" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="5-2" href="/orientation/day-5/video-social-support-crew">Video - Social support crew</a>
                        </td>
                        <td>
                            <p runat="server" id="quest52" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="5-3" href="/orientation/day-5/get-familiar-with-the-lunge">Get familiar with the lunge</a>
                        </td>
                        <td>
                            <p runat="server" id="quest53" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a class="weeklink c_y" href="/orientation/day-5" data-num="5">View Day 5 detail</a>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="5" class="text-center v-m">
                            <p>DAY 6</p>
                            <p><strong><asp:Label ID="lblDate6" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay6" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="6-1" href="/orientation/day-6/organise-your-next-12-weeks">Organise your next 12 weeks reminder sheet</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest61" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="6-2" href="/orientation/day-6/mark-on-your-calendar-diary-any-events">Mark on your calendar/diary any events</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest62" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="6-3" href="/orientation/day-6/get-familiar-with-the-exercise-terms">Get familiar with the exercise terms</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest63" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border-right">
                            <a class="weeklink" data-num="6-4" href="/orientation/day-6/get-familiar-with-the-twist">Get familiar with the twist</a>
                        </td>
                        <td class="text-center">
                            <p runat="server" id="quest64" class="tick-circle">&#10004;</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a class="weeklink c_y" href="/orientation/day-6" data-num="6">View Day 6 detail</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center v-m">
                            <p>DAY 7</p>
                            <p><strong><asp:Label ID="lblDate7" runat="server"></asp:Label></strong></p>
                            <p class="c_grey">
                                <asp:Label ID="lblDay7" runat="server"></asp:Label>
                            </p>
                        </td>
                        <td class="no-border-right border-bottom">
                            <p class="sp-gap">Rest Day</p>
                            <a class="weeklink c_y" href="/orientation/day-7" data-num="7">View Day 7 detail</a>
                        </td>
                        <td class="text-center border-bottom">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row pb-4 pt-4">
            <a id="dayView2" href="#" runat="server" class="c_y btn btn-secondary m-1 col-lg-3 push-lg-3 col-sm-4 push-sm-2">SWITCH TO DAY VIEW ></a>
            <a id="printWeek" runat="server" href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-lg-3 col-sm-4 push-lg-3 push-sm-2">PRINT WEEKLY PLAN ></a>
        </div>
    </div>