<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseDayView.ascx.cs" Inherits="UserControls_MemberLanding_ExerciseDayView" %>
    <div class="tab-inner-content">
        <div class="d-flex justify-content-end content-nav-action sec">
            <a class="c_grey" href="/exercise#t0">
            <img src="/images/icon-recipe-g.svg" />VIEW EXERCISE LIBRARY ></a>
            <a class="c_grey" href="javascript:window.print()">
            <img src="/images/icon-print-g.svg" />PRINT PLAN ></a>
        </div>
        <div class="text-center">
            <h1><strong>Day
                <asp:Label ID="lblDayNum" runat="server"></asp:Label>
            -
                <asp:Label ID="lblDayTypeName" runat="server"></asp:Label></strong></h1>
            <div class="ori-date">
                <span class="c_b">
                <asp:Label ID="lblDay" runat="server"></asp:Label></span>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
            <asp:HyperLink ID="preDay" runat="server" class="day-pre c_b"></asp:HyperLink>
            <asp:HyperLink ID="nextDay" runat="server" class="day-next c_b"></asp:HyperLink>
        </div>
		<div class="row mb-4" id="divRest" runat="server" Visible="false">
                <div class="col-sm-7 mb-4">
                    <img class="img-fluid" src="/images/rest-day.jpg" />
                </div>
                <div class="col-sm-5">
                    <h5 class="underline">Rest Day <img class="icon-s" src="/images/icon-time-y.svg" /><span class="c_y"> All Day </span></h5>
                    <p>Just a feel good sentence about resting.</p>
                </div>
            </div>
			
		<div class="row mb-4" id="divCelebrate" runat="server" Visible="false">
                <div class="col-sm-7 mb-4">
                    <img class="img-fluid" src="/images/rest-day.jpg" />
                </div>
                <div class="col-sm-5">
                    <h5 class="underline">Celebrate</h5>
                    <p>Blurb about celebration</p>
                </div>
            </div>
        <div runat="server" id="DivAdvanceEquipment" class="plan-container">
            If your home equipment is not enough to increase the difficulty of the workouts, you can increase it at a level of your liking:
            <br /> L1 = Add more powerbands to the exercise e.g. double up or triple your powerband when doing powerband front squat
            <br /> L2 = Buy a dumbbell set. In Australia, K-Mart has it for $60-$80.
            <br /> L3 = Join a gym
        </div>
        <div runat="server" class="plan-container" id="divWarmup">
            <div class="plan-title ">
                Warm up
                <img class="icon-time" src="/images/icon-time-b.svg" />
                <span class="plan-time c_b">10 mins</span>
            </div>
            <div class="row row-plan">
			<p>Warmup is very important and should not be skipped. Because as the name suggests it warms up your body and gets you ready for your workout. There are 3 main sections that all warmups should have.</p>
                <a href="/exercise#t0" target="_blank" class="c_y">Click here for more details</a>
            </div>
        </div>
        <div runat="server" id="Div1" class="plan-container">
            <div class="plan-title ">
                <asp:Label ID="lblDayGroupName1" runat="server"></asp:Label>
                <img class="icon-time" src="/images/icon-time-b.svg" />
                <span class="plan-time c_b">
                <asp:Label ID="lblTimeDuration1" runat="server"></asp:Label>
                mins</span>
            </div>
            <asp:Repeater ID="DailyTaskRepeater1" runat="server" OnItemDataBound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")+"."%>
                                    <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1A_<%# Container.ItemIndex %>'>
                                        <%#DataBinder.Eval(Container.DataItem,"Exercise")%>
                                    </a>
                            </div>
                            <div class="plan-info">or alternatively
                                <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1B_<%# Container.ItemIndex %>'>
                                    <%#DataBinder.Eval(Container.DataItem,"AlternateExercise")%>
                                </a>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Reps & Sets: </span>
                                <%#DataBinder.Eval(Container.DataItem,"Reps")%> x
                                    <%#DataBinder.Eval(Container.DataItem,"Trainning_Set")%> Sets
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Rest (sec):</span> </span>
                                <%#DataBinder.Eval(Container.DataItem,"Rest")%>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Weight:</span>
                                <%#DataBinder.Eval(Container.DataItem,"Weight")%>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Tempo:</span> </span>
                                <%#DataBinder.Eval(Container.DataItem,"Tempo")%>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="c_b plan-info-comments">Comments:</div>
                            <div class="plan-comments  plan-info">
                                </span>
                                <%#DataBinder.Eval(Container.DataItem,"Comments")%>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div runat="server" id="Div2" class="plan-container">
            <div class="plan-title ">
                <asp:Label ID="lblDayGroupName2" runat="server"></asp:Label>
                <img class="icon-time" src="/images/icon-time-b.svg" />
                <span class="plan-time c_b">
                <asp:Label ID="lblTimeDuration2" runat="server"></asp:Label>
                mins</span>
            </div>
            <asp:Repeater ID="DailyTaskRepeater2" runat="server" OnItemDataBound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")+"."%>
                                    <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2A_<%# Container.ItemIndex %>'>
                                        <%#DataBinder.Eval(Container.DataItem,"Exercise")%>
                                    </a>
                            </div>
                            <div class="plan-info">or alternatively
                                <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2B_<%# Container.ItemIndex %>'>
                                    <%#DataBinder.Eval(Container.DataItem,"AlternateExercise")%>
                                </a>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Reps & Sets: </span>
                                <%#DataBinder.Eval(Container.DataItem,"Reps")%> x
                                    <%#DataBinder.Eval(Container.DataItem,"Trainning_Set")%> Sets
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Rest (sec):</span> </span>
                                <%#DataBinder.Eval(Container.DataItem,"Rest")%>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Weight:</span>
                                <%#DataBinder.Eval(Container.DataItem,"Weight")%>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Tempo:</span> </span>
                                <%#DataBinder.Eval(Container.DataItem,"Tempo")%>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="c_b plan-info-comments">Comments:</div>
                            <div class="plan-comments  plan-info">
                                </span>
                                <%#DataBinder.Eval(Container.DataItem,"Comments")%>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div runat="server" id="Div3" class="plan-container">
            <div class="plan-title ">
                <asp:Label ID="lblDayGroupName3" runat="server"></asp:Label>
                <img class="icon-time" src="/images/icon-time-b.svg" />
                <span class="plan-time c_b">
                <asp:Label ID="lblTimeDuration3" runat="server"></asp:Label>
                mins</span>
            </div>
            <asp:Repeater ID="DailyTaskRepeater3" runat="server" OnItemDataBound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")+"."%>
                                    <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3A_<%# Container.ItemIndex %>'>
                                        <%#DataBinder.Eval(Container.DataItem,"Exercise")%>
                                    </a>
                            </div>
                            <div class="plan-info">or alternatively
                                <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3B_<%# Container.ItemIndex %>'>
                                    <%#DataBinder.Eval(Container.DataItem,"AlternateExercise")%>
                                </a>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Reps & Sets: </span>
                                <%#DataBinder.Eval(Container.DataItem,"Reps")%> x
                                    <%#DataBinder.Eval(Container.DataItem,"Trainning_Set")%> Sets
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Rest (sec):</span> </span>
                                <%#DataBinder.Eval(Container.DataItem,"Rest")%>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Weight:</span>
                                <%#DataBinder.Eval(Container.DataItem,"Weight")%>
                            </div>
                            <div class="plan-info">
                                <span class="c_b">Tempo:</span> </span>
                                <%#DataBinder.Eval(Container.DataItem,"Tempo")%>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="c_b plan-info-comments">Comments:</div>
                            <div class="plan-comments  plan-info">
                                </span>
                                <%#DataBinder.Eval(Container.DataItem,"Comments")%>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div runat="server" class="plan-container" id="divCooldown">
            <div class="plan-title ">
                Cooldown and stretch
                <img class="icon-time" src="/images/icon-time-b.svg" />
                <span class="plan-time c_b">5 mins</span>
            </div>
            <div class="row row-plan">
                Great work. Before you go back to your day, spend at least 5 mins cooling down and stretching. I find the after workout stretches a personal preference, so do whatever stretches you prefer, otherwise you can do the same stretches you did in the warmup section.
            </div>
        </div>
        <div class="row-legend row mt-3">
        <div class="col-12">
        <h5 class="pt-3">Legend</h5>
        </div>
            <div class="col-sm-5">
                <p>SG = Supinated Grip (palm facing you)</p>
                <p>PG = Pronated Grip(back of palm facing you)</p>
                <p>NG = Neutral Grip (hammer grip)
            </div>
            <div class="col-sm-2">
                <p>DB = Dumb Bell</p>
                <p>BB = Barbell</p>
                <p>KB = Kettlebell</p>
            </div>
            <div class="col-sm-5 mb-3">
                <p>Cable = Cable Machine</p>
                <p>FE = Feet Elevated</p>
                <p>UBE = Upper Body Elevated</p>
            </div>
        </div>
    </div>
    </div>