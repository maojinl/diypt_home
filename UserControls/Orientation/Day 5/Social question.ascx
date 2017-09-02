<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Social question.ascx.cs" Inherits="UserControls_Orientation_Day_5_Social_question" %>
<div class="tab-inner-content show-pg-b">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-5"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 5 - Task 1</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_b" href="/orientation/day-5">Back</a>
        <a id="dayNext" class="day-next c_b" href="/orientation/day-5/video-social-support-crew">Next</a>
    </div>
    <h1 class="text-center pb-4">SOCIAL SUPPORT  QUESTIONNAIRE</h1>
    <div class="row pb-4 mb-4">
        <div class="push-sm-1 col-sm-5 pb-2">
            <img class="img-fluid img-round" src="/images/ori/day2/test.jpg" />
        </div>
        <div class="push-sm-1 col-sm-5">
            <p>The following questions are designed to assess your level of social support, which strongly influences how well you follow any nutrition or exercise program. Simply answer the questions below by selecting the response most appropriate to your situation. Once you’ve completed all the questions, your score will be calculated. And remember, be honest, You’re doing this exercise to find the areas of your life that might present challenges to your progress.
            </p>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">1</div>
            </div>
            <p>1. Do the people with whom you spend every day at work or at home, follow healthy lifestyle habits such as exercising regularly, watching what they eat, and taking nutritional supplements?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="3"> Yes, most of them do
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="0"> About half do and half don't
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="-3"> No, most of them don't
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">2</div>
            </div>
            <p>Does your spouse or partner follow healthy lifestyle habits such as exercising regularly, watching what s/he eats, and taking nutritional supplements?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="5"> Yes, my spouse/partner does
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="-5"> No, my spouse/partner doesn't
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="0"> I don’t have a spouse or partner
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">3</div>
            </div>
            <p>When you want to perform some physical activity such as going for a workout or taking a hike, is it easy for you to find a partner to go with you?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="2"> Yes, its easy to find a partner
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="0"> Yes, but very infrequently
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="-4"> No, they never do
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">4</div>
            </div>
            <p>At your workplace, do your coworkers regularly bring in treats like cakes, biscuits, donuts and other unhealthy snacks?</p>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="-4">Yes, they often do
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="0"> Yes, but I typically don't indulge
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="5"> No, they don't
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">5</div>
            </div>
            <p>If you go out to eat more than once per week, do the people you dine with order healthy selections?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="2"> Yes, they always do
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="0"> Only about half of the time
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="-2"> No, they never do
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">6</div>
            </div>
            <p>Do you belong to any clubs, groups, or teams that meet at least twice per week and do some physical exercise (this does not include a gym membership)?</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q6" id="" value="5"> Yes, I’ve been a member for years
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q6" id="" value="2"> Yes, I’ve just started
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q6" id="" value="0"> No, I dont
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">7</div>
            </div>
            <p>Do you belong to a gym and attend on average at least three times per week?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q7" id="" value="2">Yes, I’ve been doing this for at least 1 year
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q7" id="" value="1">Yes, I’ve just joined
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q7" id="" value="0">No, I don’t
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">8</div>
            </div>
            <p>When discussing your nutrition and exercise goals with friends, do they seem interested in getting on board or do they think you’re crazy?</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q8" id="" value="2"> They're very interested
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q8" id="" value="0"> They're not interested
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q8" id="" value="-2"> They think I’m crazy
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">9</div>
            </div>
            <p>Do the people you live with bring home foods that aren't considered healthy or good for you?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q9" id="" value="-5"> Always
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q9" id="" value="-3"> Sometimes
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q9" id="" value="0"> Never
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">10</div>
            </div>
            <p>Do the people you live with bring home foods that are considered healthy or good for you?</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q10" id="" value="5"> Always
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q10" id="" value="0"> Sometimes
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q10" id="" value="-5"> Never
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">11</div>
            </div>
            <p>Do the people you live or work with schedule activities that interfere with your pre-established exercise time?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q11" id="" value="-3"> Always; they say fun/work first, exercise last
                    </label>
                </div>
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q11" id="" value="-1"> Sometimes; they don't think about it
                    </label>
                </div>
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q11" id="" value="3"> Never; they respect this time
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">12</div>
            </div>
            <p>Do those around you actively seek nutrition, exercise or supplement information and/or bring your attention to it so that you can stay informed about these topics?</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q12" id="" value="5"> Always
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q12" id="" value="2"> Sometimes
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q12" id="" value="0"> Never
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 push-lg-1 ">
            <hr/>
        </div>
    </div>
    <div class="row pb-4 pt-4">
        <a href="#" id="btn-result" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-4">VIEW RESULTS ></a>
        
    </div>
    <div class="row">
        <div class="col-lg-10 push-lg-1 ">
            <div class="k-result" id="k-result-1" style="display: none;">
			<div class="rating">
                <span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span class="star">☆</span>
                </div>
                <h5>28 to 38 total points - Excellent:</h5>
                <p>Congratulations, it looks like you've got a great social support network around you, a group of people that'll help support your desire to change some of your daily practices. Of course, thats not all you'll need to be successful. But it’s a great start. Check out our video - <a href="/orientation/day-5/video-social-support-crew">Your Social Support crew</a>
                </p>
            </div>
            <div class="k-result" id="k-result-2" style="display: none;">
			<div class="rating">
                <span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span>☆</span>
                </div>
                <h5>5 to 27 total points - average:</h5>
                <p>It looks like you’ve got some social support around you but there may be a few areas that will present challenges. Being aware of your social temptations, as indicated above, is a great place to begin. Also check out our video - <a href="/orientation/day-5/video-social-support-crew">Your Social Support crew</a>, and together with other DIYPTers, we can work on strategies for being successful in the face of your challenges.
                </p>
            </div>
            <div class="k-result" id="k-result-3" style="display: none;">
			<div class="rating">
                <span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span>☆</span><span>☆</span>
                </div>
                <h5>4 to -14 total points - needs improvement:</h5>
                <p>Your social support is lacking and may need a makeover. However, you’re not alone here. Many people struggle with social support. And that’s why I encourage you to be vocal in your Community Chat because there are many more like you so I want us all to be in each others social support crew. Also, check out our video - <a href="/orientation/day-5/video-social-support-crew">Your Social Support crew</a> for more ideas on how you can improve your social support crew.
                </p>
            </div>
            <div class="k-result" id="k-result-4" style="display: none;"><div class="rating">
                <span class="star">☆</span><span class="star">☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <h5>-15 to -31 total points - poor:</h5>
                <p>This score is quite low and may signal some definite challenges in your work and at - home environments, as well as in your relationships. These can lead to old habits surfacing as many food related problems are really relationship and environment problems. Watch our video - <a href="/orientation/day-5/video-social-support-crew">Your Social Support crew</a> for tips on how to improve your social support crew and be vocal in your Community Chat. Make comments and ask as many questions as you want because together we’ll work on overcoming your challenges. 
                </p>
            </div>
        </div>
    </div>
            <div class="mt-5 text-center" id="k-submit" style="display: none;">
                <div class="text-center"><asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/></div>
            </div>
</div>
<script>
$("#btn-result").on("click", function(e) {

    $(".k-result").css("display", "none");
    e.preventDefault();
    var arr = [],
        sum = 0;
    $(".form-check-input:checked").each(function() {
        arr.push($(this).val());
    });

    $.each(arr, function() {
        sum += parseFloat(this) || 0;
    });


    if (sum >= 28 && sum <= 38) {
        $("#k-submit").css("display", "block");
        $("#k-result-1").css("display", "block");
    } else if (sum >= 5 && sum <= 27) {
        $("#k-submit").css("display", "block");
        $("#k-result-2").css("display", "block");
    } else if (sum <= 4 && sum >= -14) {
        $("#k-submit").css("display", "block");
        $("#k-result-3").css("display", "block");
    } else if (sum <= -15 && sum >= -31) {
        $("#k-submit").css("display", "block");
        $("#k-result-4").css("display", "block");
    } else {
        $("#k-submit").css("display", "none");
        $(".k-result").css("display", "none");
    }

});


</script>
