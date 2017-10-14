<%@  Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseDayView.ascx.cs"
    Inherits="UserControls_MemberLanding_ExerciseDayView" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec">
        <a class="c_grey" href="/exercise#t0">
            <img src="/images/icon-recipe-g.svg" /><span class="hidden-sm-down">VIEW EXERCISE LIBRARY ></span></a> <a class="c_grey"
                href="javascript:window.print()">
                <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1>
            <strong>Day
                <asp:label id="lblDayNum" runat="server"></asp:label>
                -
                <asp:label id="lblDayTypeName" runat="server"></asp:label>
            </strong>
        </h1>
        <div class="ori-date">
            <span class="c_b">
                <asp:label id="lblDay" runat="server"></asp:label>
            </span>
            <asp:label id="lblDate" runat="server"></asp:label>
        </div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <asp:hyperlink id="preDay" runat="server" class="day-pre c_b"></asp:hyperlink>
        <asp:hyperlink id="nextDay" runat="server" class="day-next c_b"></asp:hyperlink>
    </div>
    <div class="row mb-4" id="divRest" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15201/rest-day_455818696.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
                Rest Day
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> All Day </span>
            </h5>
            <p>
                Put your feet up and rest. Recovery is as important as training hard and eating
                right so don't skip it. You deserved it!</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divSquat" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15200/milestone-workout-squats.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
                20x pushups, squats and situps
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> All Day </span>
            </h5>
            <p>
                Pat yourself on the back there is only a few weeks left. So today is more of a celebrate and recover day. You just need to do 20 pushups, 20 body weight squats and 20 situps for just one round and then enjoy the rest of your day.</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divPushup" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15199/milestone-workout-pushup.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
                20 pushups and make your bed 
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> All Day </span>
            </h5>
            <p>
                Congratulations, you've finished the first 5 weeks of the program, today I just want you to do 20 pushups and make your bed.</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divWeekend" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15202/weekend-activity.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
                Active recovery day
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> 30-60 mins </span>
            </h5>
            <p>
                I want you to do one of the following things for 30-60min to use as an active recovery day:
<ul>
<li>Play sports</li>
<li>Play with your kids</li>
<li>Long slow distance jog</li>
<li>Walk</li>
<li>Walk your dog</li>
<li>Gardening</li>
</ul>
</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divCardio" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15203/1-hour-cardio.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
               Cardio
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> 60 mins </span>
            </h5>
            <p>
                 Go for a long slow distance run, jog, bike ride or walk. Your goal is to have a conversational pace ie. be able to have a conversation while you're doing your cardio workout. You can also play sport or anything for that matter that works your cardiovascular system.
</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divMeasurement" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15205/measurement-day.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
               Measurement day and rest
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> All Day</span>
            </h5>
            <p>
                 Use this day to do your measurements and have a rest ready for your next workout.
</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divWalk" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/media/15204/brisk-walk.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
               Brisk walk
                <img class="icon-s" src="/images/icon-time-b.svg" /><span class="c_b"> 30 mins</span>
            </h5>
            <p>
                 Enjoy a brisk walk with others or on your own. This is a great way to start your fitness journey if you have been completely sedentary for a while or a great form of active recovery.
</p>
        </div>
    </div>
	
    <div class="row mb-4" id="divCelebrate" runat="server" visible="false">
        <div class="col-sm-7 mb-4">
            <img class="img-fluid" src="/images/rest-day.jpg" />
        </div>
        <div class="col-sm-5">
            <h5 class="underline">
                Celebrate</h5>
            <p>
                Blurb about celebration</p>
        </div>
    </div>
    <div runat="server" id="DivAdvanceEquipment" class="plan-container">
        If your home equipment is not enough to increase the difficulty of the workouts, you can increase it at a level of your liking:
        <br />
        Level 1 = Add more powerbands to the exercise e.g. double up or triple your powerband when doing powerband front squat
        <br />
        Level 2 = Buy a barbell and dumbbell set currently for $199 from Rebel sport. You can buy just a dumbbell set currently for $50 from Kmart.
        <br />
        Level 3 = Join a gym
    </div>
    <div runat="server" class="plan-container" id="divWarmup">
        <div class="plan-title ">
            WARM UP
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">10 mins</span>
        </div>
        <div class="row row-plan">
            <p>
                Warmup is very important and should not be skipped. Because as the name suggests
                it warms up your body and gets you ready for your workout. There are 3 main sections
                that all warmups should have.</p>
            <a href="/exercise#t0" target="_blank" class="c_b" >Click here for more details ></a>
        </div>
    </div>
    <div runat="server" id="Div1" class="plan-container">
        <div class="plan-title ">
            <asp:label id="lblDayGroupName1" runat="server"></asp:label>
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">
                <asp:label id="lblTimeDuration1" runat="server"></asp:label>
                mins</span>
        </div>
        <asp:repeater id="DailyTaskRepeater1" runat="server" onitemdatabound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")%>
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
            </asp:repeater>
    </div>
    <div runat="server" id="Div2" class="plan-container">
        <div class="plan-title ">
            <asp:label id="lblDayGroupName2" runat="server"></asp:label>
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">
                <asp:label id="lblTimeDuration2" runat="server"></asp:label>
                mins</span>
        </div>
        <asp:repeater id="DailyTaskRepeater2" runat="server" onitemdatabound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")%>
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
            </asp:repeater>
    </div>
    <div runat="server" id="Div3" class="plan-container">
        <div class="plan-title ">
            <asp:label id="lblDayGroupName3" runat="server"></asp:label>
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">
                <asp:label id="lblTimeDuration3" runat="server"></asp:label>
                mins</span>
        </div>
        <asp:repeater id="DailyTaskRepeater3" runat="server" onitemdatabound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")%>
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
            </asp:repeater>
    </div>
    <div runat="server" id="Div4" class="plan-container">
        <div class="plan-title ">
            <asp:label id="lblDayGroupName4" runat="server"></asp:label>
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">
                <asp:label id="lblTimeDuration4" runat="server"></asp:label>
                mins</span>
        </div>
        <asp:repeater id="DailyTaskRepeater4" runat="server" onitemdatabound="DailyTaskRepeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="row row-plan">
                        <div class="col-sm-4">
                            <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup4_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan-name">
                                <%#DataBinder.Eval(Container.DataItem,"Sequence")%>
                                    <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup4A_<%# Container.ItemIndex %>'>
                                        <%#DataBinder.Eval(Container.DataItem,"Exercise")%>
                                    </a>
                            </div>
                            <div class="plan-info">or alternatively
                                <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup4B_<%# Container.ItemIndex %>'>
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
            </asp:repeater>
    </div>
    <div runat="server" class="plan-container" id="divCooldown">
        <div class="plan-title ">
            COOL DOWN & STRETCH
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">5 mins</span>
        </div>
        <div class="row row-plan">
            Great work. Before you go back to your day, spend at least 5 mins cooling down and
            stretching. I find the after workout stretches a personal preference, so do whatever
            stretches you prefer, otherwise you can do the same stretches you did in the warmup
            section.
        </div>
    </div>
    <div class="row-legend row mt-3" runat="server" id="divLegend">
        <div class="col-12">
            <h5 class="pt-3">
                Legend</h5>
        </div>
        <div class="col-sm-5">
            <!--<p><a class="c_b" href="#" data-toggle="modal" data-target="#tempo" id="modalPopupTempo">Tempo explained ></a></p>-->
            <p>SG = Supinated Grip (palm facing you)</p>
            <p>PG = Pronated Grip (back of palm facing you)</p>
            <p>NG = Neutral Grip (hammer grip)</p>
			
        </div>
        <div class="col-sm-2">
            <p>DB = Dumb Bell</p>
            <p>BB = Barbell</p>
            <p>KB = Kettlebell</p>
			<p>BW = Bodyweight</p>
        </div>
        <div class="col-sm-5 mb-3">
            <p>Cable = Cable Machine</p>
            <p>FE = Feet Elevated</p>
            <p>UBE = Upper Body Elevated</p>
            <p>PB = Powerband</p>
        </div>
    </div>
</div>

                    
        <!-- Modal -->

<div class="modal fade" id="tempo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tempo explained</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                <iframe src="https://player.vimeo.com/video/227216567" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true"></iframe>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
