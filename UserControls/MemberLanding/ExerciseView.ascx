<%@  Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseView.ascx.cs"
    Inherits="UserControls_MemberLanding_ExerciseView" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/exercise#t0">
            <img src="/images/icon-recipe-g.svg" /><span class="hidden-sm-down">VIEW EXERCISE LIBRARY
                ></span></a> <a class="c_grey" href="javascript:window.print()">
                    <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1>
            <strong>
                <asp:label id="lblWeekNum" runat="server"></asp:label>
            </strong>
        </h1>
        <div class="ori-date c_grey">
            <asp:label id="lblDateDuration" runat="server"></asp:label>
        </div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <asp:hyperlink id="dayPre" runat="server" class="day-pre c_b"></asp:hyperlink>
        <asp:hyperlink id="dayNext" runat="server" class="day-next c_b"></asp:hyperlink>
    </div>
    <div class="plan-container week-view row" id="topInfo" runat="server">
        <div class="col-md-10 push-md-1">
            <div class="row week-view-intro">
                <div class="col-4">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/icon-goal.svg">
                        </div>
                        <div class="col-md-6  pull-md-1 right-0-m-s">
                            <p>
                                Goal</p>
                            <p>
                                <asp:label id="lblGoal" runat="server"></asp:label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/icon-phase.svg">
                        </div>
                        <div class="col-md-6  pull-md-1 right-0-m-s">
                            <p>
                                Training Phase</p>
                            <p>
                                <asp:label id="lblTrainingPhase" runat="server"></asp:label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/icon-time-b.svg">
                        </div>
                        <div class="col-md-6  pull-md-1 right-0-m-s">
                            <p>
                                Phase Duration</p>
                            <p>
                                <asp:label id="lblDuration" runat="server"></asp:label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="divNotStarted" class="col" runat="server" visible="false">
        <h2 class="text-center">
            Your program will not start until the next Monday</h2>
    </div>
    <div class="plan-container row no-gutters">
        <div class="table-hint col">
            <div class="col-lg-10 push-lg-1 table-responsive">
                <table class="table-weekly-detail  margin-center ">
                    <tr>
                        <th>
                            <div id="day1" runat="server">
                                Monday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay1" runat="server" />
                            </div>
                        </th>
                        <th>
                            <div id="day2" runat="server">
                                Tuesday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay2" runat="server" />
                            </div>
                        </th>
                        <th>
                            <div id="day3" runat="server">
                                Wednesday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay3" runat="server" />
                            </div>
                        </th>
                        <th>
                            <div id="day4" runat="server">
                                Thursday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay4" runat="server" />
                            </div>
                        </th>
                        <th>
                            <div id="day5" runat="server">
                                Friday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay5" runat="server" />
                            </div>
                        </th>
                        <th>
                            <div id="day6" runat="server">
                                Saturday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay6" runat="server" />
                            </div>
                        </th>
                        <th>
                            <div id="day7" runat="server">
                                Sunday
                            </div>
                            <div class="weekly-th-date">
                                <asp:label id="lblDay7" runat="server" />
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div id="day1e" runat="server">
                                <asp:label id="lblExMon1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay1" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay1" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration1" runat="server" />
                                mins
                            </div>
                        </td>
                        <td>
                            <div id="day2e" runat="server">
                                <asp:label id="lblExTue1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay2" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay2" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration2" runat="server" />
                                mins
                            </div>
                        </td>
                        <td>
                            <div id="day3e" runat="server">
                                <asp:label id="lblExWed1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay3" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay3" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration3" runat="server" />
                                mins
                            </div>
                        </td>
                        <td>
                            <div id="day4e" runat="server">
                                <asp:label id="lblExThu1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay4" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay4" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration4" runat="server" />
                                mins
                            </div>
                        </td>
                        <td>
                            <div id="day5e" runat="server">
                                <asp:label id="lblExFri1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay5" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay5" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration5" runat="server" />
                                mins
                            </div>
                        </td>
                        <td>
                            <div id="day6e" runat="server">
                                <asp:label id="lblExSat1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay6" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay6" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration6" runat="server" />
                                mins
                            </div>
                        </td>
                        <td>
                            <div id="day7e" runat="server">
                                <asp:label id="lblExSun1" runat="server"></asp:label>
                            </div>
                            <asp:hyperlink id="linkDay7" runat="server" class="weekly-view-detail c_b" navigateurl="#"><span class="hidden-sm-down">View</span> Details ></asp:hyperlink>
                            <div class="weekly-td-time" id="timeDay7" runat="server">
                                <img class="icon-time" src="/images/icon-time-b.svg" />
                                <asp:label id="lblTimeDuration7" runat="server" />
                                mins
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clearfix">&nbsp;
        </div>
        <div class="col-12 mt-3">
            <div class="row row-equipment no-gutters" id="equipmentDiv" runat="server" visible="false">
                <div class="col-lg-10 push-lg-1">
                    <div class="row">
                        <div class="col-sm-2 hidden-sm-down">
                            <img class="icon-equip img-center-xs" src="/images/icon-equip.svg">
                        </div>
                        <div class="col-sm-10 hidden-sm-down">
                            <h5 class="pt-3 ">
                                <strong>Equipment Needed</strong></h5>
                            <asp:literal id="equipmentLiteral" runat="server"></asp:literal>
                        </div>
                        <div class="col-12 hidden-md-up" data-toggle="collapse" data-target="#collapseExample"
                            aria-expanded="false" aria-controls="collapseExample">
                            <div class="row">
                                <div class="col-12 col-arrow-blue">
                                    <h5 class="pt-3 ">
                                        <img class="icon-equip" src="/images/icon-equip.svg"><strong>Equipment Needed</strong></h5>
                                </div>
                            </div>
                        </div>
                        <div class="collapse hidden-md-up" id="collapseExample">
                            <div class="col-12">
                                <asp:literal id="equipmentLiteralMobile" runat="server"></asp:literal>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-10 push-xl-1 col-lg-12 hidden-sm-down mt-3" id="timesaverDiv"
            runat="server">
            <table class="timesaver">
                <tr>
                    <td class="timesaver-title">
                        <h4 class="sec">
                            TIMESAVER WORKOUTS</h4>
                        <p>
                            Workouts for those occasional times when you have limited time. For optimum results
                            please stick to your scheduled program.</p>
                    </td>
                    <td class="timesaver-10 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal1">
                            <img src="/images/icon-clock-w.svg" />
                            <p>
                                10 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-20 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal2">
                            <img src="/images/icon-clock-w.svg" />
                            <p>
                                20 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-30 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal3">
                            <img src="/images/icon-clock-w.svg" />
                            <p>
                                30 MIN</p>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-xl-10 push-xl-1 col-lg-12  hidden-md-up" id="timesaverDivMobile"
            runat="server">
            <table class="timesaver">
                <tr>
                    <td class="timesaver-title">
                        <h4 class="sec mb-3">
                            TIMESAVER<br />
                            WORKOUTS</h4>
                        <p>
                            Workouts for those occasional times when you have limited time. For optimum results
                            please stick to your scheduled program.</p>
                    </td>
                </tr>
            </table>
            <table class="timesaver">
                <tr>
                    <td class="timesaver-10 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal1">
                            <img src="/images/icon-clock-w.svg" />
                            <p>
                                10 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-20 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal2">
                            <img src="/images/icon-clock-w.svg" />
                            <p>
                                20 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-30 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal3">
                            <img src="/images/icon-clock-w.svg" />
                            <p>
                                30 MIN</p>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row pb-4 pt-4">
        <a id="dayView" runat="server" href="#" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-2">
            SWITCH TO DAY VIEW ></a> <a id="printDay" runat="server" href="javascript:window.print()"
                class="c_b btn btn-secondary m-1 col-sm-4 push-sm-2">PRINT WEEKLY PLAN ></a>
    </div>
</div>
<div class="modal fade" id="timeModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    10 minutes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/227018029" frameborder="0" webkitallowfullscreen="true"
                        mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="timeModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    20 minutes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/231008976" frameborder="0" webkitallowfullscreen="true"
                        mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="timeModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    30 minutes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/230548973" frameborder="0" webkitallowfullscreen="true"
                        mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
