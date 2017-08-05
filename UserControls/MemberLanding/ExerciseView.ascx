<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseView.ascx.cs" Inherits="UserControls_MemberLanding_ExerciseView" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/exercise?#tab-bx-warm-up">
            <img src="/images/icon-recipe-g.svg" /><span class="hidden-sm-down">VIEW EXERCISE LIBRARY ></span></a>
        <a class="c_grey" href="javascript:window.print()">
            <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>
            <asp:Label ID="lblWeekNum" runat="server"></asp:Label></strong></h1>
        <div class="ori-date c_grey">
            <asp:Label ID="lblDateDuration" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <asp:HyperLink ID="dayPre" runat="server" class="day-pre c_b"></asp:HyperLink>

        <asp:HyperLink ID="dayNext" runat="server" class="day-next c_b"></asp:HyperLink>
    </div>
    <div class="plan-container week-view row" id="topInfo" runat="server">
        <div class="col-md-10 push-md-1">
            <div class="row week-view-intro">
                <div class="col-4">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/icon-goal.svg">
                        </div>
                        <div class="col-md-8">
                            <p>Goal</p>
                            <p>
                                <asp:Label ID="lblGoal" runat="server"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/icon-phase.svg">
                        </div>
                        <div class="col-md-6  pull-md-1 right-0-m-s">
                            <p>Training Phase</p>
                            <p>
                                <asp:Label ID="lblTrainingPhase" runat="server"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="/images/icon-time-b.svg">
                        </div>
                        <div class="col-md-6  pull-md-1 right-0-m-s">
                            <p>Phase Duration</p>
                            <p>
                                <asp:Label ID="lblDuration" runat="server"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="plan-container row no-gutters">
        <div class="col-md-12 table-responsive">

            <table class="table-weekly-detail  margin-center ">
                <tr>
                    <th>
                        <div id="day1" runat="server">
                            Monday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay1" runat="server" />
                        </div>
                    </th>
                    <th>
                        <div id="day2" runat="server">
                            Tuesday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay2" runat="server" />
                        </div>
                    </th>
                    <th>
                        <div id="day3" runat="server">
                            Wednesday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay3" runat="server" />
                        </div>
                    </th>
                    <th>
                        <div id="day4" runat="server">
                            Thursday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay4" runat="server" />
                        </div>
                    </th>
                    <th>
                        <div id="day5" runat="server">
                            Friday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay5" runat="server" />
                        </div>
                    </th>
                    <th>
                        <div id="day6" runat="server">
                            Saturday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay6" runat="server" />
                        </div>
                    </th>
                    <th>
                        <div id="day7" runat="server">
                            Sunday
                        </div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay7" runat="server" />
                        </div>
                    </th>
                </tr>
                <tr>
                    <td>
                        <div id="day1e" runat="server">
                            <asp:Label ID="lblExMon1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay1" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>

                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration1" runat="server" />
                            mins
                        </div>
                    </td>
                    <td>
                        <div id="day2e" runat="server">
                            <asp:Label ID="lblExTue1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay2" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration2" runat="server" />
                            mins
                        </div>
                    </td>
                    <td>
                        <div id="day3e" runat="server">
                            <asp:Label ID="lblExWed1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay3" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration3" runat="server" />
                            mins
                        </div>
                    </td>
                    <td>
                        <div id="day4e" runat="server">
                            <asp:Label ID="lblExThu1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay4" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration4" runat="server" />
                            mins
                        </div>
                    </td>
                    <td>
                        <div id="day5e" runat="server">
                            <asp:Label ID="lblExFri1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay5" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration5" runat="server" />
                            mins
                        </div>
                    </td>
                    <td>
                        <div id="day6e" runat="server">
                            <asp:Label ID="lblExSat1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay6" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration6" runat="server" />
                            mins
                        </div>
                    </td>
                    <td>
                        <div id="day7e" runat="server">
                            <asp:Label ID="lblExSun1" runat="server"></asp:Label>
                        </div>
                        <asp:HyperLink ID="linkDay7" runat="server" class="weekly-view-detail c_b" NavigateUrl="#"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" />
                            <asp:Label ID="lblTimeDuration7" runat="server" />
                            mins
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="row row-equipment no-gutters" id="equipmentDiv" runat="server" visible="false">
            <div class="col-sm-2 hidden-sm-down">
                <img class="icon-equip img-center-xs" src="/images/icon-equip.svg">
            </div>
            <div class="col-sm-10 hidden-sm-down">
                <h5 class="pt-3 text-center-xs"><strong>Equipment Needed</strong></h5>
                <asp:Literal ID="equipmentLiteral" runat="server"></asp:Literal>
            </div>
            <div class="col-12 hidden-md-up" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                <div class="row">
                    <div class="col-4 ">
                        <img class="icon-equip img-center-xs" src="/images/icon-equip.svg">
                    </div>
                    <div class="col-8">
                        <h5 class="pt-3 text-center-xs"><strong>Equipment Needed</strong></h5>
                    </div>
                </div>
            </div>
            <div class="collapse hidden-md-up" id="collapseExample">
                <asp:Literal ID="equipmentLiteralMobile" runat="server"></asp:Literal>
            </div>
        </div>




        <div class="col-xl-10 push-xl-1 col-lg-12 hidden-sm-down mt-3 ">
            <table class="timesaver">
                <tr>
                    <td class="timesaver-title">
                        <h4 class="sec">TIMESAVER WORKOUTS</h4>
                        <p>Workouts for those occasional times when you have limited time. For optimum results please stick to your scheduled program.</p>
                    </td>
                    <td class="timesaver-10 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal1">
                            <img src="/images/icon-clock-w.svg" />
                            <p>10 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-20 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal2">
                            <img src="/images/icon-clock-w.svg" />
                            <p>20 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-30 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal3">
                            <img src="/images/icon-clock-w.svg" />
                            <p>30 MIN</p>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-xl-10 push-xl-1 col-lg-12  hidden-md-up ">
            <table class="timesaver">
                <tr>
                    <td class="timesaver-title">
                        <h4 class="sec">TIMESAVER<br />
                            WORKOUTS</h4>
                        <p>Workouts for those occasional times when you have limited time. For optimum results please stick to your scheduled program.</p>
                    </td>
                </tr>
            </table>
            <table class="timesaver">
                <tr>
                    <td class="timesaver-10 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal1">
                            <img src="/images/icon-clock-w.svg" />
                            <p>10 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-20 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal2">
                            <img src="/images/icon-clock-w.svg" />
                            <p>20 MIN</p>
                        </a>
                    </td>
                    <td class="timesaver-30 sec">
                        <a href="#" data-toggle="modal" data-target="#timeModal3">
                            <img src="/images/icon-clock-w.svg" />
                            <p>30 MIN</p>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row pb-4 pt-4">
        <a id="dayView" href="#" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-2">SWITCH TO DAY VIEW ></a>
        <a href="#" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-2">PRINT WEEKLY PLAN ></a>
    </div>
</div>
<div class="modal fade" id="timeModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">10 minutes</div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/external/219773052.hd.mp4?s=8ef31aac3d6b7dfd906b36a49839d6df5f2f44fb&profile_id=174" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="timeModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">20 minutes</div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/external/219773052.hd.mp4?s=8ef31aac3d6b7dfd906b36a49839d6df5f2f44fb&profile_id=174" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="timeModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">30 minutes</div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/external/219773052.hd.mp4?s=8ef31aac3d6b7dfd906b36a49839d6df5f2f44fb&profile_id=174" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
