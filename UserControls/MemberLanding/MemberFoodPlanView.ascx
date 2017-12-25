<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberFoodPlanView.ascx.cs" Inherits="UserControls_MemberLanding_MemberFoodPlanView" %>
<style>

.nodisplay .wk1,
.nodisplay .wk2,
.nodisplay .wk3,
.nodisplay .wk4,
.nodisplay .wk5,
.nodisplay .wk6,
.nodisplay .wk7,
.nodisplay .wk8,
.nodisplay .wk9,
.nodisplay .wk10,
.nodisplay .wk11,
.nodisplay .wk12 {
    display:none;
}

.wk1 .wk1 {
display: block;
}
.wk2 .wk2 {
display: block;
}
.wk3 .wk3 {
display: block;
}
.wk4 .wk4 {
display: block;
}
.wk5 .wk5 {
display: block;
}
.wk6 .wk6 {
display: block;
}
.wk7 .wk7 {
display: block;
}
.wk8 .wk8 {
display: block;
}
.wk9 .wk9 {
display: block;
}
.wk10 .wk10 {
display: block;
}
.wk11 .wk11 {
display: block;
}
.wk12 .wk12 {
display: block;
}

</style>
<div class="tab-inner-content nodisplay " id="divMainMealPlan" runat="server">
    <div class="d-flex justify-content-end content-nav-action sec  mb-4">
        <a class="c_grey" href="/meal-plans#t1"><img src="/images/icon-recipe-g.svg" /><span class="hidden-sm-down">VIEW RECIPE LIBRARY ></span></a>
        <a class="c_grey" href="javascript:window.print()"><img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong><asp:Label ID="lblWeekNum" runat="server"></asp:Label></strong></h1>
        <div class="ori-date"><span class="c_y"><asp:Label ID="lblDateDuration" runat="server"></asp:Label></span></div>
    </div>
    <!--div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre1" class="day-pre c_y" href="#">Back</a>
        <a id="dayNext1" class="day-next c_y" href="#">Next</a>
    </!--div-->
	
    <div class="plan-container meal-week-view">
        <div class="row">
            <div id="divNotStarted" class="col" runat="server" Visible="false"><h2 class="text-center">Your program will not start until the next Monday</h2></div>
            <div class="col-sm-10 push-sm-1" id="divMealPlanContent" runat="server">
			
                </p>
                <h5 class="c_y mb-2">FITNESS GOAL <span class="c_black"><asp:Label ID="lblPlanProgram" runat="server" Text=""></asp:Label></span></h5>
                <h5 class="c_y ">FOOD GOAL </h5>
                <p class=" wk1 wk2">Just focus on your training and make one of my <a class="c_y" target="_blank" href="/meal-plans#t1">easy recipes.</a></p>
                <p class=" wk3">Focus on 2 things:</p>
                <p class=" wk3">1. Focus on eating slowly; approximately 15 minutes for a snack and approximately 25 minutes for a main meal. Stop eating when you're about 80% full. 80% full means that after waiting 5 minutes you can still eat more but don't have to because you are satisfied. You don't feel stomach discomfort, bloating or lethargic.</p>
                <p class=" wk3">2. Make another one of my delicious, quick and <a class="c_y" target="_blank" href="/meal-plans#t1">easy recipes.</a></p>
                <p class=" wk4">For one week, play with the My Fitness Pal app by diarising your food and playing with <a href="#" data-toggle="modal" data-target="#timeModal3" class="c_y">macro counting</a> using the following macronutrient goals. Watch the Macro counting video. This is the key to the success of your program. When I say 'play', don't feel the pressure that you need to diarise everyday, just have a go and get into the habit of diarising your food and have a go at following the macro goals below.
                </p>
                <p class=" wk5">Complete food diary every day and maintain calories for the week using My Fitness Pal</p>
                <p class=" wk6">Meet protein goal below and maintain calories for the week using My Fitness Pal.</p>
                <p class=" wk7">Meet carbs goal below plus maintain your protein and calories for the week using My Fitness Pal.</p>
                <p class=" wk8">Meet fats goal plus maintain all other macro goals below.</p>
                <p class=" wk9 wk10">Consistently meet macro goals below.</p>
                <p class=" wk11 wk12">Consistently meet new macro goals below.</p>
                <h5 class="c_y  mt-4  wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">DAILY MACRONUTRIENT GOALS </h5>
                <div class="week-view-intro mb-3  wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12 ">
					<div></div>
					<div></div>
				<p>
				<div class="d-flex justify-content-between align-items-center pb-4 pre-next">
					<asp:hyperlink id="weekPre" runat="server" class="day-pre c_b"></asp:hyperlink>
					<asp:hyperlink id="weekNext" runat="server" class="day-next c_b"></asp:hyperlink>
				</div>
				</p>
                <div class="row">
                 <div class="col-sm-3 col-6" runat="server" ID="colories">
                        <div class="row">
                            <div class="col-md-4 ">
                                <img src="/images/icon-calories-y.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Calories</p>
                                <p><asp:Label ID="lblFood1" runat="server" Text=""></asp:Label> kcal</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-6" runat="server" ID="protein">
                        <div class="row">
                            <div class="col-md-4 ">
                                <img src="/images/icon-protein-y.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Protein</p>
                                <p><asp:Label ID="lblFood2" runat="server" Text=""></asp:Label> g</p>
                                <p><asp:Label ID="lblFood5" runat="server" Text=""></asp:Label> %</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-6" runat="server" ID="carbo">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="/images/icon-carbohydrate.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Carbohydrate</p>
                                <p><asp:Label ID="lblFood3" runat="server" Text=""></asp:Label> g</p>
                                <p><asp:Label ID="lblFood6" runat="server" Text=""></asp:Label> %</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-6" runat="server" ID="fats">
                        <div class="row">
                            <div class="col-md-4">
                                <img  src="/images/icon-fats-y.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Fats</p>
                                <p><asp:Label ID="lblFood4" runat="server" Text=""></asp:Label> g</p>
                                <p><asp:Label ID="lblFood7" runat="server" Text=""></asp:Label> %</p>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="grey-box  mb-5  wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                    <h5 class="ml-4 mt-2 "><strong>NOTES</strong></h5>
                    <ul>
                        <li class=" wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">- If you believe you are following my food plan 100% but feel like you're not achieving your goal, see how your body reacts after food ie. are you bloated, produce excessive gas or are lethargic? If so, I suggest you do a food allergy test. </li>
                        <li class=" wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">- buy a food scale as weighing your food will make it easier to reach your macronutrient goals</li>
                        <li class=" wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">- Make another one of my delicious, quick and easy <a class="c_y" target="_blank" href="/meal-plans#t1">recipes</a>.</li>
                    </ul>
                </div>
                <h5 class="c_y  wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">MACRONUTRIENTS LIST </h5>
                <p class=" wk4 wk5">Here are my suggestions of good quality foods to focus your meals on.</p>
                <div class="d-flex  align-self-stretch col-m ">
                    <div class="meal-list  wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/white-meat_1.jpg">
                        <h5>WHITE MEATS</h5>
                        <ul class="macro-list ">
                            <li>Chicken breast</li>
                            <li>Turkey breast</li>
                            <li>Duck breast</li>
                            <li>Scallops</li>
                            <li>Prawns</li>
                            <li>Octopus <span>(less protein so add 50g)</span></li>
                            <li>Squid <span>(less protein so add 50g)</span></li>
                            <li>Fish esp barramundi, mackerel, sardines <span>(less protein so add 50g)</span></li>
                        </ul>
                    </div>
                    <div class="meal-list    wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/red-meats_1.jpg">
                        <h5>RED MEATS</h5>
                        <ul class="macro-list ">
                            <li>Salmon</li>
                            <li>Smoked salmon</li>
                            <li>Beef</li>
                            <li>Kangaroo</li>
                            <li>Pork</li>
                            <li>Lamb</li>
                            <li>Veal</li>
                            <li>Kangaroo sausages</li>
                        </ul>
                    </div>
                    <div class="meal-list   wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/fats_1.jpg">
                        <h5>FATS 
                        </h5>
                        
                        <ul class="macro-list ">
                            <li>Coconut oil <span>(preferred)</span></li>
                            <li>Olive oil</li>
                            <li>Avocado</li>
                            <li>Unsalted and unroasted nuts <span>(preferred nuts - walnuts, almonds, macadamia, brazil, cashew) </span>Dry roasted allowed</li>
                        </ul>
                    </div>
                    <div class="meal-list   wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/carbohydrates_1.jpg">
                        <h5>CARBOHYDRATES </h5>
                        
                        <ul class="macro-list ">
                            <li>White basmati rice</li>
                            <li>Brown basmati rice</li>
                            <li>Brown rice</li>
                            <li>Sweet potato</li>
                        </ul>
                    </div>
                </div>
                <div class="d-flex  align-self-stretch col-m">
                    <div class="meal-list  wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/fruits_1.jpg">
                        <h5>FRUITS</h5>
                        <ul class="macro-list ">
                            <li>Blueberries</li>
                            <li>Strawberries</li>
                            <li>Raspberries</li>
                            <li>Blackberries</li>
                            <li>Cherries</li>
                            <li>Green apple</li>
                        </ul>
                    </div>
                    <div class="meal-list   wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/seasoning_1.jpg">
                        <h5>SEASONINGS</h5>
                        <ul class="macro-list ">
                            <li>Tumeric</li>
                            <li>Curry powder</li>
                            <li>Coriander</li>
                            <li>Oregano</li>
                            <li>Cinnamon</li>
                            <li>Rosemary</li>
                            <li>Thyme</li>
                            <li>Sage</li>
                            <li>Ginger</li>
                            <li>Sea Salt</li>
                            <li>Pepper</li>
                            <li>Basil</li>
                            <li>Lemon grass</li>
                            <li>Dill</li>
                            <li>Parsley</li>
                            <li>Garlic</li>
                        </ul>
                    </div>
                    <div class="meal-list    wk4 wk5 wk6 wk7 wk8 wk9 wk10 wk11 wk12">
                        <img class="img-fluid" src="/images/login/meal-plan/vegtables_1.jpg">
                        <h5>VEGETABLES</h5>
                        <ul class="macro-list ">
                            <li>Bok Choy</li>
                            <li>Broccoli</li>
                            <li>Brussel sprouts</li>
                            <li>Cabbage</li>
                            <li>Carrots</li>
                            <li>Beetroot</li>
                            <li>Celery</li>
                            <li>Cucumber</li>
                            <li>Cauliflower</li>
                            <li>Water chestnuts</li>
                            <li>Squash</li>
                            <li>Rocket</li>
                            <li>Zucchini</li>
                            <li>Spinach</li>
                            <li>Kale</li>
                            <li>Green beans</li>
                            <li>Yellow beans</li>
                            <li>Asparagus</li>
                            <li>Olives</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row pb-4 pt-4">
        <a id="weekView" href="/meal-plans#t1" class="c_y btn btn-secondary m-1 col-sm-4 push-sm-2">VIEW RECIPE LIBRARY ></a>
        <a href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-sm-4 push-sm-2">PRINT MEAL PLAN ></a>
    </div>
</div>

<div class="modal fade" id="timeModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
             <div class="modal-header">
                <h5 class="modal-title" >30 minutes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
           </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/TxBQD5JlRoc?start=310" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/*
$("#recipe").on("click", function(e) {
    e.preventDefault();
    $.get("data/member-tab-breakfast.html", function(data) {
        $('#member-tab-meal').html(data);
    });
});
*/
</script>



