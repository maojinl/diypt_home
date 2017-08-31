<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pre-ex questionnaire.ascx.cs" Inherits="UserControls_Orientation_Day_1_Pre_ex_questionnaire" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action f-sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-1">
            <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()">
            <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 1 - Task 2</strong></h1>
        <div class="ori-date">
            <span class="c_y">
                <asp:Label ID="lblDay" runat="server"></asp:Label></span>
            <asp:Label ID="lblDate" runat="server"></asp:Label>
        </div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-1/introduce-yourself">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-1/get-familiar-with-the-squat">Next</a>
    </div>
    <h1 class="text-center pb-4">PRE EXERCISE QUESTIONNAIRE</h1>
    <div runat="server" class="row row-form-check" id="div1">
        <div class="col-lg-10 push-lg-1">
            <div class="row">
                <div class="col-sm-6 mb-4 mt-4">
                    <div class="tri-card c_y_tri">
                        <div class="tri-number sec c_y_b">1</div>
                    </div>
                    <p class="mt-3">What is your training goal and when do you want to achieve it by?</p>
                    <asp:TextBox runat="server" class="form-control" id="oriTextarea1" rows="3"></asp:TextBox>
                </div>
                <div class="col-sm-6  mb-4 mt-4">
                    <div class="tri-card c_y_tri">
                        <div class="tri-number sec c_y_b">2</div>
                    </div>
                    <p class="mt-3">Have you tried to achieve this goal before and didn't succeed?
                    </p>
                    <fieldset class="form-group">
                        <div class="form-check">
                        <asp:RadioButtonList class="form-check-input" ID="radioButtonListGoalBefore" runat="server">
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Yes</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                    <p class="mt-3">If yes, explain why you didn't succeed.
                    </p>
                    <asp:TextBox runat="server" class="form-control" id="oriTextarea2" rows="3"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 mb-4 mt-4">
                    <div class="tri-card c_y_tri">
                        <div class="tri-number sec c_y_b">3</div>
                    </div>
                    <p class="mt-3"> Why is this goal important to you.
                    </p>
                    <asp:TextBox runat="server" class="form-control" id="oriTextarea3" rows="3"></asp:TextBox>
                </div>
                <div class="col-sm-6 mb-4 mt-4">
                    <div class="tri-card c_y_tri">
                        <div class="tri-number sec c_y_b">4</div>
                    </div>
                    <p class="mt-3">Have you ever exercised previously?
                    </p>
                    <fieldset class="form-group">
                        <asp:RadioButtonList class="form-check-input" ID="radioButtonListEverExercise" runat="server">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                    <p>If no, move on to question 7.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 mb-4 mt-4">
                    <div class="tri-card c_y_tri">
                        <div class="tri-number sec c_y_b">5</div>
                    </div>
                    <p class="mt-3">What type of exercise have you been doing in the last 3 months until today? Choose the answer which reflects the predominant part of your weekly routine.
                    </p>
                    <fieldset class="form-group">
                        <asp:RadioButtonList class="form-check-input" ID="radioButtonListExerciseType" runat="server">
                            <asp:ListItem>Low intensity cardioLow intensity cardio</asp:ListItem>
                            <asp:ListItem>High intensity cardio</asp:ListItem>
                            <asp:ListItem>Light resistance training</asp:ListItem>
                            <asp:ListItem>Medium resistance training</asp:ListItem>
                            <asp:ListItem>Heavy resistance training</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </div>
                <div class="col-sm-6 mb-4 mt-4">
                    <div class="tri-card c_y_tri">
                        <div class="tri-number sec c_y_b">6</div>
                    </div>
                    <p class="mt-3">Where do you exercise majority of the time?</p>
                    <fieldset class="form-group">
                        <asp:RadioButtonList class="form-check-input" ID="radioButtonListLocation" runat="server">
                            <asp:ListItem>Gym</asp:ListItem>
                            <asp:ListItem>Gym classes</asp:ListItem>
                            <asp:ListItem>Home</asp:ListItem>
                            <asp:ListItem>Park</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 mb-4 mt-4">
                    <p class="mt-3">What obstacles do you foresee stopping you from achieving your goals?</p>
                    <asp:TextBox runat="server" class="form-control" id="oriTextarea7" rows="3"></asp:TextBox>
                </div>
            </div>
            <hr>
            <div class="text-center"><asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/></div>
        </div>
    </div>
</div>
<script>
    $("#btn-result").on("click", function (e) {
        e.preventDefault();
        var arr = [],
            sum = 0;
        $(".form-check-input:checked").each(function () {
            arr.push($(this).val());
        });
        $.each(arr, function () {
            sum += parseFloat(this) || 0;
        });
        alert(sum);
    });

</script>