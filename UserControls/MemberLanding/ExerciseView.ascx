<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseView.ascx.cs" Inherits="UserControls_MemberLanding_ExerciseView" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="#"> <img src="/images/icon-recipe-g.svg" /><span class="hidden-sm-down">VIEW EXERCISE LIBRARY ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
            <h1><strong><asp:Label ID="lblWeekNum" runat="server"></asp:Label></strong></h1>
            <div class="ori-date c_grey"><asp:Label ID="lblDateDuration" runat="server"></asp:Label></div>
        </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
    <asp:HyperLink ID="dayPre" runat="server" class="day-pre c_b"></asp:HyperLink>
        
    <asp:HyperLink ID="dayNext" runat="server" class="day-next c_b"></asp:HyperLink>
    </div>
    <div class="plan-container week-view row">
      <div class="col-md-10 push-md-1">
        <div class="row week-view-intro">
            <div class="col-4">
                <div class="row">
                    <div class="col-md-4">
                        <img src="/images/icon-goal.svg">
                    </div>
                    <div class="col-md-8">
                        <p>Goal</p>
                        <p><asp:Label ID="lblGoal" runat="server"></asp:Label></p>
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
                        <p><asp:Label ID="lblTrainingPhase" runat="server"></asp:Label></p>
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
                        <p><asp:Label ID="lblDuration" runat="server"></asp:Label></p>
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
                            <asp:Label ID="lblDay1" runat="server"/>
                        </div>
                    </th>
                    <th>
						<div id="day2" runat="server">
							Tuesday
						</div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay2" runat="server"/>
                        </div>
                    </th>
                    <th>
                        <div id="day3" runat="server">
							Wednesday
						</div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay3" runat="server"/>
                        </div>
                    </th>
                    <th>
                        <div id="day4" runat="server">
							Thursday
						</div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay4" runat="server"/>
                        </div>
                    </th>
                    <th>
                        <div id="day5" runat="server">
							Friday
						</div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay5" runat="server"/>
                        </div>
                    </th>
                    <th>
                        <div id="day6" runat="server">
							Saturday
						</div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay6" runat="server"/>
                        </div>
                    </th>
                    <th>
                        <div id="day7" runat="server">
							Sunday
						</div>
                        <div class="weekly-th-date">
                            <asp:Label ID="lblDay7" runat="server"/>
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
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration1" runat="server"/> mins
                        </div>
                    </td>
                    <td>
                        <div id="day2e" runat="server">
							<asp:Label ID="lblExTue1" runat="server"></asp:Label>
						</div>
                        <asp:HyperLink ID="linkDay2" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration2" runat="server"/> mins
                        </div>
                    </td>
                    <td>
                        <div id="day3e" runat="server">
							<asp:Label ID="lblExWed1" runat="server"></asp:Label>
						</div>
                        <asp:HyperLink ID="linkDay3" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration3" runat="server"/> mins
                        </div>
                    </td>
                    <td>
                        <div id="day4e" runat="server">
							<asp:Label ID="lblExThu1" runat="server"></asp:Label>
						</div>
                        <asp:HyperLink ID="linkDay4" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration4" runat="server"/> mins
                        </div>
                    </td>
                    <td>
                        <div id="day5e" runat="server">
							<asp:Label ID="lblExFri1" runat="server"></asp:Label>
						</div>
                        <asp:HyperLink ID="linkDay5" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration5" runat="server"/> mins
                        </div>
                    </td>
                    <td>
                        <div id="day6e" runat="server">
							<asp:Label ID="lblExSat1" runat="server"></asp:Label>
						</div>
                        <asp:HyperLink ID="linkDay6" runat="server" class="weekly-view-detail c_b"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration6" runat="server"/> mins
                        </div>
                    </td>
                    <td>
                        <div id="day7e" runat="server">
							<asp:Label ID="lblExSun1" runat="server"></asp:Label>
						</div>
                        <asp:HyperLink ID="linkDay7" runat="server" class="weekly-view-detail c_b" NavigateUrl="#"><span class="hidden-sm-down">View</span> Details ></asp:HyperLink>
                        <div class="weekly-td-time">
                            <img class="icon-time" src="/images/icon-time-b.svg" /> <asp:Label ID="lblTimeDuration7" runat="server"/> mins
                        </div>
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


