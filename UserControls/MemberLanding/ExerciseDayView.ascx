<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseDayView.ascx.cs" Inherits="UserControls_MemberLanding_ExerciseDayView" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec">
        <a class="c_grey" href="#">
            <img src="/images/icon-recipe-g.svg" />VIEW EXERCISE LIBRARY ></a>
        <a class="c_grey" href="#">
            <img src="/images/icon-print-g.svg" />PRINT PLAN ></a>
    </div>
    <div class="text-center">
            <h1><strong>Day
                <asp:Label ID="lblDayNum" runat="server"></asp:Label>
                -
                <asp:Label ID="lblDayTypeName" runat="server"></asp:Label></strong></h1>
            <div class="ori-date"><span class="c_b">
                <asp:Label ID="lblDay" runat="server"></asp:Label></span><asp:Label ID="lblDate" runat="server"></asp:Label></div>
        </div>

    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <asp:HyperLink ID="preDay" runat="server" class="day-pre c_b"></asp:HyperLink>
        
        <asp:HyperLink ID="nextDay" runat="server" class="day-next c_b"></asp:HyperLink>

    </div>


    <div runat="server" id="Div1" class="plan-container">
        <div class="plan-title ">
            <asp:Label ID="lblDayGroupName1" runat="server"></asp:Label>
            <img class="icon-time" src="/images/icon-time-b.svg" />
            <span class="plan-time c_b">
                <asp:Label ID="lblTimeDuration1" runat="server"></asp:Label>
                mins</span></div>
        <asp:Repeater ID="DailyTaskRepeater1" runat="server" OnItemDataBound="DailyTaskRepeater1_ItemDataBound" >
            <ItemTemplate>

                <div class="row row-plan">
                    <div class="col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan-name"><%#DataBinder.Eval(Container.DataItem,"Sequence")+"."%><a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1A_<%# Container.ItemIndex %>'><%#DataBinder.Eval(Container.DataItem,"Exercise")%></a></div>
                        <div class="plan-info">or alternatively <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1B_<%# Container.ItemIndex %>'><%#DataBinder.Eval(Container.DataItem,"AlternateExercise")%></a></div>
                        <div class="plan-info">
                            <span class="c_b">Reps & Sets: </span><%#DataBinder.Eval(Container.DataItem,"Reps")%> x <%#DataBinder.Eval(Container.DataItem,"Trainning_Set")%> Sets
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Rest (sec):</span> </span><%#DataBinder.Eval(Container.DataItem,"Rest")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Weights:</span> <%#DataBinder.Eval(Container.DataItem,"Weight")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Tempo:</span> </span><%#DataBinder.Eval(Container.DataItem,"Tempo")%>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="c_b plan-info-comments">Comments:</div>
                        <div class="plan-comments  plan-info">
                            </span><%#DataBinder.Eval(Container.DataItem,"Comments")%>
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
                mins</span></div>
        <asp:Repeater ID="DailyTaskRepeater2" runat="server" OnItemDataBound="DailyTaskRepeater1_ItemDataBound" >
            <ItemTemplate>

                <div class="row row-plan">
                    <div class="col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan-name"><%#DataBinder.Eval(Container.DataItem,"Sequence")+"."%><a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2A_<%# Container.ItemIndex %>'><%#DataBinder.Eval(Container.DataItem,"Exercise")%></a></div>
                        <div class="plan-info">or alternatively <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2B_<%# Container.ItemIndex %>'><%#DataBinder.Eval(Container.DataItem,"AlternateExercise")%></a></div>
                        <div class="plan-info">
                            <span class="c_b">Reps & Sets:</span><%#DataBinder.Eval(Container.DataItem,"Reps")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Rest (sec):</span> </span><%#DataBinder.Eval(Container.DataItem,"Rest")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Weights:</span> <%#DataBinder.Eval(Container.DataItem,"Weight")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Tempo:</span> </span><%#DataBinder.Eval(Container.DataItem,"Tempo")%>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="c_b plan-info-comments">Comments:</div>
                        <div class="plan-comments  plan-info">
                            </span><%#DataBinder.Eval(Container.DataItem,"Comments")%>
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
                mins</span></div>
        <asp:Repeater ID="DailyTaskRepeater3" runat="server" OnItemDataBound="DailyTaskRepeater1_ItemDataBound" >
            <ItemTemplate>

                <div class="row row-plan">
                    <div class="col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Exercise")%>' /></a>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan-name"><%#DataBinder.Eval(Container.DataItem,"Sequence")+"."%><a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3A_<%# Container.ItemIndex %>'><%#DataBinder.Eval(Container.DataItem,"Exercise")%></a></div>
                        <div class="plan-info">or alternatively <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3B_<%# Container.ItemIndex %>'><%#DataBinder.Eval(Container.DataItem,"AlternateExercise")%></a></div>
                        <div class="plan-info">
                            <span class="c_b">Reps & Sets:</span><%#DataBinder.Eval(Container.DataItem,"Reps")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Rest (sec):</span> </span><%#DataBinder.Eval(Container.DataItem,"Rest")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Weights:</span> <%#DataBinder.Eval(Container.DataItem,"Weight")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Tempo:</span> </span><%#DataBinder.Eval(Container.DataItem,"Tempo")%>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="c_b plan-info-comments">Comments:</div>
                        <div class="plan-comments  plan-info">
                            </span><%#DataBinder.Eval(Container.DataItem,"Comments")%>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
