<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseDayPreview.ascx.cs" Inherits="UserControls_Management_ExerciseDayPreview" %>
<div class="tab-inner-content">
   
  
    <div class="text-center">
        <div>Program: <asp:DropDownList ID="ddlProgram" runat="server"></asp:DropDownList></div>
        
        <div>Week: <asp:DropDownList ID="ddlWeek" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
                   </asp:DropDownList></div>
        <div>Day: <asp:DropDownList ID="ddlDay" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem></asp:DropDownList></div>
        <asp:Button ID="btnUpdate" runat="server" Text="View exercise day" OnClick="btnUpdate_Click" />
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
        <asp:Repeater ID="DailyTaskRepeater1" runat="server">
            <ItemTemplate>

                <div class="row row-plan">
                    <div class="col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup1_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image")%>' /></a>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan-info plan-name"><%#DataBinder.Eval(Container.DataItem,"Sequence")+"."+DataBinder.Eval(Container.DataItem,"Exercise")%></div>
                        <div class="plan-info">
                            <span class="c_b">Reps & Sets:</span><%#DataBinder.Eval(Container.DataItem,"Reps")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Rest:</span> </span><%#DataBinder.Eval(Container.DataItem,"Rest")%>
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
        <asp:Repeater ID="DailyTaskRepeater2" runat="server">
            <ItemTemplate>

                <div class="row row-plan">
                    <div class="col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup2_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image")%>' /></a>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan-info plan-name"><%#DataBinder.Eval(Container.DataItem,"Exercise")%></div>
                        <div class="plan-info">
                            <span class="c_b">Reps & Sets:</span><%#DataBinder.Eval(Container.DataItem,"Reps")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Rest:</span> </span><%#DataBinder.Eval(Container.DataItem,"Rest")%>
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
        <asp:Repeater ID="DailyTaskRepeater3" runat="server">
            <ItemTemplate>

                <div class="row row-plan">
                    <div class="col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#theModal" id='modalPopup3_<%# Container.ItemIndex %>'>
                            <asp:Image ID="image1" runat="server" class="img-fluid" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image")%>' /></a>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan-info plan-name"><%#DataBinder.Eval(Container.DataItem,"Exercise")%></div>
                        <div class="plan-info">
                            <span class="c_b">Reps & Sets:</span><%#DataBinder.Eval(Container.DataItem,"Reps")%>
                        </div>
                        <div class="plan-info">
                            <span class="c_b">Rest:</span> </span><%#DataBinder.Eval(Container.DataItem,"Rest")%>
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
