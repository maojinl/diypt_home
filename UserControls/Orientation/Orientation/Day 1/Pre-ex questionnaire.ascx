<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pre-ex questionnaire.ascx.cs" Inherits="UserControls_Orientation_Day_1_Pre_ex_questionnaire" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action f-sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-1">
            <img src="images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()">
            <img src="images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
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
    <div class="row pb-4 mb-4">
        <div class="push-sm-1 col-sm-5 pb-2">
            <img class="img-fluid img-round" src="images/ori/day2/test.jpg" />
        </div>
        <div class="push-sm-1 col-sm-5">
            <p>It is mandatory that you complete this fitness test because not only does it determine your 12 week program but every few weeks you'll redo the test to see for yourself how you're progressing.</p>
            <p>If you don't complete this test then you will receive the default program.</p>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card">
                <div class="tri-number f-sec">1</div>
            </div>
            <p>
                How many years have you been exercising consistently minimum 3 times a week?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="0" checked>
                        0 - 1
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="1">
                        1 - 3
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="2" checked>
                        3 - 5
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="3">
                        5+
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card">
                <div class="tri-number f-sec">2</div>
            </div>
            <p>
                Do you smoke?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="3" checked>
                        No
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="0">
                        Yes
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card">
                <div class="tri-number f-sec">3</div>
            </div>
            <p>
                If yes, how many?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="0" checked>
                        1 - 5 per day
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="0">
                        5 +
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="2" checked>
                        1 - 5 per week
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="1">
                        5 + per week
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-10 push-1 col-5">
            <h2>For all goals</h2>
            <p>
                -­‐ Estimated time of completion pre ex = 10 minutes
            </p>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card">
                <div class="tri-number f-sec">4</div>
            </div>
            <p>1km run on treadmill / flat road</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="0" checked>
                        DNF
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="2">
                        8+ min
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="4" checked>
                        6-­8 min
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="6">
                        5-­6 min
                    </label>
                </div>
                <div class="form-check col-sm-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="8">
                        4-­5 min
                    </label>
                </div>
                <div class=" col-sm-12">
                    <p>OR 1km row (resistance 8)</p>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="0" checked>
                        DNF
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="2">
                        9+ min
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="4" checked>
                        7-9 min
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="6">
                        5-­7 min
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="8">
                        5min or less
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card">
                <div class="tri-number f-sec">5</div>
            </div>
            <p>
                Do you smoke?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="3" checked>
                        No
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="0">
                        Yes
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row pb-4 pt-4">
        <a href="/orientation/day-1/get-familiar-with-the-squat" id="btn-result" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-4">TASK COMPLETED ></a>
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
