﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MealPlan.ascx.cs" Inherits="UserControls_MealPlan" %>
<style>

.nodisplay .wk1,
.nodisplay .wk2,
.nodisplay .wk3,
.nodisplay .wk4,
.nodisplay .wk5 {
    display:none;
}

.wk1 .wk1 {
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

</style>
<div class="tab-inner-content nodisplay wk1">
    <div class="d-flex justify-content-end content-nav-action sec  mb-4">
        <a class="c_grey" href="/meal-plans"> <img src="/images/icon-recipe-g.svg" /><span class="hidden-sm-down">VIEW RECIPE LIBRARY ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Week 1</strong></h1>
        <div class="ori-date"><span class="c_y">MONDAY 10</span> April, 2017</div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre1" class="day-pre c_y" href="#">Back</a>
        <a id="dayNext1" class="day-next c_y" href="#">Next</a>
    </div>
    <div class="plan-container meal-week-view">
        <div class="row">
            <div class="col-sm-10 push-sm-1">
                <h5 class="c_y mb-2">FITNESS GOAL <span class="c_black">TONE UP</span></h5>
                <h5 class="c_y ">FOOD GOAL </h5>
                <p class=" wk1 wk2">Just focus on your training and make one of my video meals </p>
                <p class=" wk1 wk2"><a class="c_y" target="_blank" href="#">DIYPT video meals</a></p>
                <p class=" wk3">Focus on 2 things:</p>
                <p class=" wk3">1. Focus on eating slowly; approximately 15 minutes for a snack and approximately 25 minutes for a main meal. Stop eating when you're about 80% full. 80% full means that after waiting 5 minutes you can still eat more but don't have to because you are satisfied. You don’t feel stomach discomfort, bloating or lethargic.</p>
                <p class=" wk3">2. Make another one of my delicious, quick and easy <a class="c_y" target="_blank" href="#">video meals (link to recipe library).</a></p>
                <p class=" wk4">For one week, play with the My Fitness Pal app by diarising your food and playing with <a class="c_y" href="#" target="_blank">macro counting</a> using the following macronutrient goals. Watch the Macro counting video. This is the key to the success of your program. When I say ‘play’, don’t feel the pressure that you need to diarise everyday, just have a go and get into the habit of diarising your food and have a go at following the macro goals below.
                </p>
                <p class=" wk5">Complete food diary every day and maintain calories for the week using My Fitness Pal</p>
                <h5 class="c_y  mt-4  wk4 wk5">MACRONUTRIENTS GOALS </h5>
                <div class="row week-view-intro mb-3  wk4 wk5">
                    <div class="col-4">
                        <div class="row">
                            <div class="col-md-4 ">
                                <img src="images/icon-protein-y.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Protein</p>
                                <p>35%(+-10g)</p>
                                <p class=" wk5">Calories</p>
                                <p class=" wk5">(+-10g)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="images/icon-carbohydrate.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Carbohydrate</p>
                                <p>35%(+-10g)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="row">
                            <div class="col-md-4">
                                <img class="img-fluid" src="images/icon-fats-y.svg">
                            </div>
                            <div class="col-md-6 pull-md-1 right-0-m-s">
                                <p>Fats</p>
                                <p>30%(+-10g)</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grey-box  mb-5  wk4 wk5">
                    <h5 class="ml-4 mt-2 "><strong>NOTES</strong></h5>
                    <ul>
                        <li class=" wk4 wk5"><strong>VERY IMPORTANT</strong> - Avoid Gluten, wheat, dairy products. If you are unsure, look at the package, google it or ask me.</li>
                        <li class=" wk5">Buy a food scale as weighing your food will make it easier to reach your macronutrient goals.</li>
                        <li class=" wk4 wk5">Make another one of my delicious, quick and easy <a class="c_y" target="_blank" href="#">video meals (link to recipe library)</a>.</li>
                    </ul>
                </div>
                <h5 class="c_y  wk4 wk5">MACRONUTRIENTS LIST </h5>
                <p class=" wk4 wk5">Here are my suggestions of good quality foods to focus your meals on.</p>
                <div class="d-flex  align-self-stretch col-m ">
                    <div class="meal-list  wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/white-meat_1.jpg">
                        <h5>WHITE MEATS</h5>
                        <ul class="macro-list ">
                            <li>Chicken breast</li>
                            <li>Turkey breast</li>
                            <li>Duck breast</li>
                            <li>scallops</li>
                            <li>prawns</li>
                            <li>octopus <span>(less protein so add 50g)</span></li>
                            <li>squid <span>(less protein so add 50g)</span></li>
                            <li>Fish esp barramundi, mackerel, sardines <span>(less protein so add 50g)</span></li>
                        </ul>
                    </div>
                    <div class="meal-list    wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/red-meats_1.jpg">
                        <h5>RED MEATS</h5>
                        <ul class="macro-list ">
                            <li>salmon</li>
                            <li>smoked salmon</li>
                            <li>Beef</li>
                            <li>Kangaroo</li>
                            <li>Pork</li>
                            <li>Lamb</li>
                            <li>Veal</li>
                            <li>Kangaroo sausages</li>
                        </ul>
                    </div>
                    <div class="meal-list   wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/fats_1.jpg">
                        <h5>FATS <span style="font-size: 10px">(1 serve = 1 x tablespoon)</span></h5>
                        <ul class="macro-list ">
                            <li>Coconut oil <span>(preferred)</span></li>
                            <li>Olive oil</li>
                            <li>Avocado</li>
                            <li>Unsalted and unroasted Nuts <span>(preferred nuts - walnuts, almonds, macadamia, brazil, cashew) </span>Dry roasted allowed</li>
                        </ul>
                    </div>
                    <div class="meal-list   wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/carbohydrates_1.jpg">
                        <h5>CARBOHYDRATES <span style="font-size: 10px">(serving size is cooked)</span></h5>
                        <ul class="macro-list ">
                            <li>White basmati rice</li>
                            <li>Brown basmati rice</li>
                            <li>Brown rice</li>
                            <li>Sweet potato</li>
                        </ul>
                    </div>
                </div>
                <div class="d-flex  align-self-stretch col-m">
                    <div class="meal-list  wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/fruits_1.jpg">
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
                    <div class="meal-list   wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/seasoning_1.jpg">
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
                    <div class="meal-list    wk4 wk5">
                        <img class="img-fluid" src="images/login/meal-plan/vegtables_1.jpg">
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
        <a id="weekView" href="/meal-plans" class="c_y btn btn-secondary m-1 col-sm-4 push-sm-2">VIEW RECIPE LIBRARY ></a>
        <a href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-sm-4 push-sm-2">PRINT MEAL PLAN ></a>
    </div>
</div>
