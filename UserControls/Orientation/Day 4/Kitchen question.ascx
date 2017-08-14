<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Kitchen question.ascx.cs" Inherits="UserControls_Orientation_Day_4_Kitchen_question" %>
<div class="tab-inner-content show-pg-b">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-4"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 4 - Task 1 </strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_b" href="/orientation/day-4">Back</a>
        <a id="dayNext" class="day-next c_b" href="/orientation/day-4/video-5-kitchen-makeover-tips">Next</a>
    </div>
    <h1 class="text-center pb-4">KITCHEN MAKEOVER QUESTIONNAIRE</h1>
    <div class="row pb-4 mb-4">
        <div class="push-sm-1 col-sm-5 pb-2">
            <img class="img-fluid img-round" src="/images/ori/day2/test.jpg" />
        </div>
        <div class="push-sm-1 col-sm-5">
            <p>Part of the hard work in achieving your fitness goal is to be completely honest with yourself and knowing which foods have to go and which foods can stay? Simply answer the questions below by selecting the response most appropriate to your situation. Once you’ve completed all the questions, your score will be calculated. And remember, be honest. You’re doing this exercise to find out whether your kitchen is in good shape.</p>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">1</div>
            </div>
            <p>1. Do you have the following items in your kitchen?
            </p>
            <ul class="list">
                <li>Good set of pots and pans</li>
                <li>Good set of knives</li>
                <li>Spatula</li>
                <li>Blender</li>
                <li>Tea kettle</li>
                <li>Scale for weighing foods</li>
                <li>Sealable containers for carrying meals</li>
                <li>Small cooler for taking meals to work</li>
                <li>Shaker bottle for drinks and shakes</li>
                <li>Food processor</li>
            </ul>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="-5"> I have all of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="-2"> I have more than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="2"> I have less than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="5"> I don’t have any of them
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">2</div>
            </div>
            <p>Do you have the following items in your pantry?</p>
            <ul class="list">
                <li>Rolled oats</li>
                <li>Quinoa</li>
                <li>Whole-grain or gluten free pasta</li>
                <li>Natural peanut butter</li>
                <li>Mixed nuts</li>
                <li>Canned or bagged beans</li>
                <li>Extra virgin olive oil</li>
                <li>Vinegar</li>
                <li>Green tea</li>
                <li>Protein supplements</li>
                <li>Fish oil/krill oil supplements</li>
                <li>Green food supplements e.g. powdered greens</li>
            </ul>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="-5"> I have all of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="-2"> I have more than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="2"> I have less than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="5"> I don’t have any of them
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
            <p>Do you have the following items in your fridge or freezer?
            </p>
            <ul class="list">
                <li>Extra-lean beef</li>
                <li>Chicken breasts</li>
                <li>Salmon</li>
                <li>Pork loin</li>
                <li>Omega-3 eggs / free range eggs</li>
                <li>Packaged egg whites</li>
                <li>At least four varieties of fruit</li>
                <li>At least five varieties of vegetables</li>
                <li>Flax seed oil</li>
                <li>Water filter</li>
                <li>Sweet potatoes</li>
                <li>Real cheese</li>
            </ul>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="-5"> I have all of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="-2"> I have more than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="2"> I have less than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="5"> I don’t have any of them
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">4</div>
            </div>
            <p>Do you have the following items in your pantry?</p>
            <ul class="list">
                <li>Potato or corn chips</li>
                <li>Fruit or muesli bars</li>
                <li>Regular or low-fat cookies</li>
                <li>Crackers</li>
                <li>Instant foods like cake mixes and mashed potatoes</li>
                <li>Chocolcates or candy</li>
                <li>Fruit drink or juice</li>
                <li>Soft drinks</li>
                <li>Regular peanut butter</li>
                <li>At least four types of alcohol</li>
                <li>Bread crumbs, croutons, and other dried bread products</li>
                <li>At least two types of bread</li>
            </ul>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="5"> I have all of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="2"> I have more than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="-2"> I have less than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q4" id="" value="-5"> I don’t have any of them
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
            <p>Do you have the following items in your fridge or freezer?
            </p>
            <ul class="list">
                <li>At least four types of sauces</li>
                <li>Juicy steaks or sausage</li>
                <li>Margarine</li>
                <li>Fruit juice</li>
                <li>Soft drinks</li>
                <li>Baked goods</li>
                <li>Frozen dinners</li>
                <li>At least two types of bread</li>
                <li>Take-out or restaurant leftovers</li>
                <li>Big bowl of mashed potatoes or pasta</li>
            </ul>
            <fieldset class="form-group row">
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="5"> I have all of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="2"> I have more than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="-2"> I have less than half of them
                    </label>
                </div>
                <div class="form-check col-12">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q5" id="" value="-5"> I don’t have any of them
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">6</div>
            </div>
            <p>Do you have bowls of candy, chips, crackers or other snacks sitting around at home?</p>
            <fieldset class="form-group row">
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q6" id="" value="5"> Yes
                    </label>
                </div>
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q6" id="" value="-5"> No
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
            <p>When you have parties or dinner guests, do you serve them what you think they'll want or what you think is healthy?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q7" id="" value="3"> What I think is healthy
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q7" id="" value="-3"> What I think they want
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">8</div>
            </div>
            <p>When food shopping, do you buy economy-sized bags, or do you buy smaller portions?</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q8" id="" value="3"> More than half of the time I buy economy-sized bags
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q8" id="" value="-3"> More than half of the time I buy smaller portions
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
            <p>How often do you shop for groceries?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q9" id="" value="5"> Fewer than three times a month
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q9" id="" value="-1"> About once a week
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q9" id="" value="-5"> More than once a week
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">10</div>
            </div>
            <p>Do you keep food in plain view around the house?</p>
            <fieldset class="form-group row">
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q10" id="" value="3"> Yes
                    </label>
                </div>
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q10" id="" value="-3"> No
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
            <p>Do you think healthy eating means low-fat eating?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q11" id="" value="2"> Yes
                    </label>
                </div>
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q11" id="" value="-2"> No
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">12</div>
            </div>
            <p>Do you keep food in plain view around the house?</p>
            <fieldset class="form-group row">
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q12" id="" value="-2"> Yes
                    </label>
                </div>
                <div class="form-check col-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q12" id="" value="+2"> No
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">13</div>
            </div>
            <p>When you prepare meals from recipe books, do you use those that contain healthy recipes?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q13" id="" value="-5"> Most of the time
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q13" id="" value="0"> About half of the time
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q13" id="" value="5"> Almost never
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">14</div>
            </div>
            <p>Do you prepare meals in advance to take with you to work, on day trips, or on vacations</p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q14" id="" value="-5"> Yes, always
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q14" id="" value="-2"> More than half the time
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q14" id="" value="2"> Less than half the time
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q14" id="" value="5"> Almost never
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec double-digi">15</div>
            </div>
            <p>Are you hesitant to throw out unhealthy leftovers or gift foods that don’t fit into your nutritional plan?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q15" id="" value="2"> Yes, I hate throwing food out
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q15" id="" value="0"> No, more than half the time I throw this stuff out
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q15" id="" value="-2"> No, I always throw this stuff out
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
        <a href="/orientation/day-4/video-5-kitchen-makeover-tips" id="btn-result" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-4">VIEW RESULTS ></a>
        
    </div>
    <div class="row">
        <div class="col-lg-10 push-lg-1 ">
            <div class="k-result" id="k-result-1" style="display: none;">
                <h5>32 to 63 points - needs improvement</h5>
                <p>You scored high on the kitchen makeover questionnaire. But this high score means you may need some adjustments to your kitchen set-up or your shopping habits. That’s no problem though. Watch my video, <a href="/orientation/day-4/video-5-kitchen-makeover-tips">5 kitchen makeover tips</a> for some proven strategies you can implement to help get your kitchen into shape.</p>
            </div>
            <div class="k-result" id="k-result-2" style="display: none;">
                <h5>0 to 31 points - average</h5>
                <p>Your kitchen environment could also use some improvements. Watch my video, <a href="/orientation/day-4/video-5-kitchen-makeover-tips">5 kitchen makeover tips</a> for some proven strategies. Just choose 2 of the strategies and your kitchen will be back in tip top shape.</p>
            </div>
            <div class="k-result" id="k-result-3" style="display: none;">
                <h5>-31 to -1 points - above average</h5>
                <p>You’re doing pretty well in the kitchen department. With just a few tweaks, it'll be easier than ever to improve your body composition, energy levels and performance. Watch my video, <a href="/orientation/day-4/video-5-kitchen-makeover-tips">5 kitchen makeover tips</a> to help you with the small tweaks.</p>
            </div>
            <div class="k-result" id="k-result-4" style="display: none;">
                <h5>-32 to -63 points - excellent</h5>
                <p>Don’t let negative scores fool you. In this questionnaire, negative scores means a great kitchen environment. Nice work. In the coming weeks I’ll be happy to share even more strategies for keeping the great kitchen environment going. You can start by watching my video, <a href="/orientation/day-4/video-5-kitchen-makeover-tips">5 kitchen makeover tips</a>.</p>
            </div>
        </div>
    </div>
            <div class="mt-5 text-center" id="k-submit" style="display: none;">
                <asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/>
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


    if (sum >= 32 && sum <= 63) {

        $("#k-submit").css("display", "block");
        $("#k-result-1").css("display", "block");
    } else if (sum >= 0 && sum <= 31) {
        $("#k-submit").css("display", "block");
        $("#k-result-2").css("display", "block");
    } else if (sum <= -1 && sum >= -31) {
        $("#k-submit").css("display", "block");
        $("#k-result-3").css("display", "block");
    } else if (sum <= -32 && sum >= -63) {
        $("#k-submit").css("display", "block");
        $("#k-result-4").css("display", "block");
    } else {
        $("#k-submit").css("display", "none");
        $(".k-result").css("display", "none");
    }

});

</script>
