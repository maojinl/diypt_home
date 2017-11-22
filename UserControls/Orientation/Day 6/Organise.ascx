<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Organise.ascx.cs" Inherits="UserControls_Orientation_Day_6_Organise" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-6"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 6  - Task 1</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-6">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-6/get-familiar-with-the-twist">Next</a>
    </div>
    <h1 class="text-center pb-4">ORGANISE YOUR NEXT 12 WEEKS </h1>
    <div class="row">
        <div class="col-sm-10 push-sm-1">
            <div class="row mb-4">
                <div class="col-12">
                    <p><strong>How exciting!!! We are days away from the start of your program. </strong>Like I said earlier, I’m a big fan of the saying “You fail to plan, you plan to fail”, so take today and tomorrow, to plan the next 12 weeks to guarantee you’ll get your workouts, meals and shopping done.
                    </p>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-sm-5">
                    <div class="card-icon-group">
                        <span class="tri-blue-pg"></span>
                        <img class="icon-pg icon-blue" src="/images/ori/day6/icon-workout.svg" />
                    </div>
                    <img class="img-fluid img-round card-icon-img mb-3" src="/images/ori/day6/12-1.jpg" />
                    <img class="img-fluid img-round card-icon-img" src="/images/ori/day6/12-2.jpg" />
                </div>
                <div class="col-sm-7">
                    <h5 class="mb-3 sec c_b">Plan for your workouts</h5>
                    <ul class="list list-left">
                        <li>Early morning training is best because you can get it out of the way and you’ll be less likely be interrupted by a phone call or event that requires your urgent attention.</li>
                        <li>Prepare your workout times by checking your schedule regularly.</li>
						<li>Fill your sandbag with sand or pool salt ($7.90 for 25kg from Bunnings). You should have three bags, 5kg, 10kg and 15kg. Make sure you gaffa tape them to increase durability. Click here for instructions on <a href="#" data-toggle="modal" data-target="#timeModal3" class="c_y">How to make a sandbag</a>.</li>
                    </ul>
                    <div class="bg_grey d-flex justify-content-start bd-highlight mb-3">
                        <div class="p-2 bd-highlight">
                            <img src="/images/ori/day6/icon-gym.svg" />
                        </div>
                        <div class="p-2 bd-highlight">
                            <h6><strong>Gym clothes to wear:</strong></h6>
                            <ul class="list list-grey list-left">
                                <li>Good quality training shoes </li>
                                <li>A fresh training outfit for every day of your weekly workouts and don't forget a hat, sunglasses and sunscreen if you're training outside</li>
                            </ul>
                        </div>
                    </div>
                    <div class="bg_grey d-flex justify-content-start bd-highlight mb-3">
                        <div class="p-2 bd-highlight">
                            <img src="/images/ori/day6/icon-equip.svg" />
                        </div>
                        <div class="p-2 bd-highlight">
                            <h6><strong>Check you have all the equipment I’ve supplied you with:</strong></h6>
                            <ul class="list list-grey list-left">
                                <li>3 Powerbands</li>
                                <li>Training mat</li>
                                <li>Swissball </li>
                                <li>Skipping rope </li>
                                <li>A pair of gym gloves</li>
                                <li>3 x Sandbags</li>
                            </ul>
                            <h6><strong>Extra things you will need:</strong></h6>
                            <ul class="list list-grey list-left">
                                <li>Water bottle for drinking</li>
                                <li>Towel</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card-icon-group">
                        <span class="tri-yellow-pg"></span>
                        <img class="icon-pg icon-yellow" src="/images/ori/day6/icon-meal.svg" />
                    </div>
                    <img class="img-fluid img-round card-icon-img mb-3" src="/images/ori/day6/12-3.jpg" />
                    <h5 class="mb-3 sec c_y">Plan for your meals</h5>
                    <ul class="list list-left">
                        <li>During your 12 week program, ensure you plan your meals the night before in My Fitness Pal to ensure compliance to your macronutrients.</li>
                        <li>Today, mark on your calendar any events that will disrupt your training and eating routine such as birthdays, weddings and other celebrations.</li>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <div class=" card-icon-group">
                        <span class="tri-pink-pg"></span>
                        <img class="icon-pg icon-pink " src="/images/ori/day6/icon-shopping.svg " />
                    </div>
                    <img class="img-fluid img-round card-icon-img mb-3" src="/images/ori/day6/12-4.jpg" />
                    <h5 class="mb-3 sec c_p ">Plan for your Shopping</h5>
                    <ul class="list list-left">
                        <li>Do a big grocery shop on the weekend and do another 1 or 2 smaller shops during the week for your fresh fruit and vegetables and anything else you may need.</li>
                        <li>Amongst all your hard work and dedication, don't forget to celebrate your successes no matter how big or small they are.</li>
                        <li>I demand you to have a milestone celebration after every 4 week block because rewards are very important part of creating good habits.</li>
                    </ul>
                </div>
            </div>
            <hr/>
            <div class="text-center"><asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/></div>
        </div>
    </div>
</div>
<div class="modal fade" id="timeModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
             <div class="modal-header">
                <h5 class="modal-title" >How to make a sandbag</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
           </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/219772449" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>