<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Organise.ascx.cs" Inherits="UserControls_Orientation_Day_6_Organise" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-6"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 6  - Task 1</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-6">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-6/mark-on-your-calendar-diary-any-events">Next</a>
    </div>
    <h1 class="text-center pb-4">ORGANISE YOUR NEXT 12 WEEKS </h1>
    <div class="row">
        <div class="col-sm-10 push-sm-1">
            <div class="row mb-4">
                <div class="col-12">
                    <p>How exciting!!! We are days away from the start of your program. Like I said earlier, I’m a big fan of the saying “You fail to plan, you plan to fail”, so take today and tomorrow, to plan the next 12 weeks to guarantee you’ll get your workouts, meals and shopping done.
                    </p>
                </div>
            </div>
            <hr/>
            <div class="row mb-4">
                <div class="col-sm-7">
                    <h5 class="c_y sec">ACTION 1</h5>
                    <h4 class="mb-3">Plan for your workoutse</h4>
                    <ul class="list">
                        <li>Early morning training is best because you can get it out of the way and you’ll be less likely be interrupted by a phone call or event that requires your urgent attention.</li>
                        <li>Prepare your workout times by checking your schedule regularly.</li>
                        <li>Fill your sandbags with sand. Two bags should weigh 20kg and another two bags should weigh 10kg. Make sure you gopher tape them to increase durability.</li>
                    </ul>
                    <h6><strong>Gym clothes to wear:</strong></h6>
                    <ul class="list">
                        <li>Good quality training shoes </li>
                        <li>A fresh training ouSit for every day of your weekly workouts and don't forget a hat, sunglasses and sunscreen if you're training outside</li>
                    </ul>
                    <h6><strong>Check you have all the equipment I’ve supplied you with:</strong></h6>
                    <ul class="list">
                        <li>3 Powerbands (colours)</li>
                        <li>Training mat</li>
                        <li>Swiss ball </li>
                        <li>Skipping rope </li>
                        <li>A pair of Gym gloves</li>
                        <li>Sandbag bags</li>
                    </ul>
                    <h6><strong>Extra things you will need:</strong></h6>
                    <ul class="list">
                        <li>Broom s)ck (for some exercises, stretches and muscle releasing)</li>
                        <li>Water boJle for drinking</li>
                        <li>Towel</li>
                    </ul>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"> ACTION COMPLETED
                        </label>
                    </div>
                </div>
                <div class="col-sm-5"><img class="my-profile-intro-icon" src="/images/icon-member.svg" />
                </div>
            </div>
            <hr/>
            <div class="row mb-4">
                <div class="col-sm-7">
                    <h5 class="c_y sec">ACTION 2</h5>
                    <h4 class="mb-3">Plan for your meals</h4>
                    <ul class="list">
                        <li>During your 12 week program, ensure you plan your meals the night before in My Fitness Pal to ensure compliance to your macronutrients.</li>
                        <li>Today, mark on your calendar any events that will disrupt your training and eating routine such as birthdays, weddings and other celebra)ons where your likely to eat out or there will be unhealthy food served. Go onto the restaurant’s website and check out the menu or ask your friend/family member what foods will be served so you can plan your meals in My Fitness Pal the night before.</li>
                    </ul>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"> ACTION COMPLETED
                        </label>
                    </div>
                </div>
                <div class="col-sm-5"><img src="/images/ori/day1/act2.jpg" />
                </div>
            </div>
            <hr/>
            <div class="row mb-4">
                <div class="col-sm-7">
                    <h5 class="c_y sec">ACTION 3</h5>
                    <h4 class="mb-3">Plan for your Shopping</h4>
                    <ul class="list">
                        <li>Do a big grocery shop on the weekend when you have more time and do another 1 or 2 smaller shops during the week for your fresh fruit and vegetables and anything else you may need. For example I do my main grocery shop on Sunday and then do 1 more on Wednesday. </li>
                        <li> Amongst all your hard work and dedica)on, don't forget to celebrate your successes no maJer how big or small they are. </li>
                        <li> I encourage you to have a milestone celebra)on a]er every 4 week block ie. on the weekend of week 5, week 9 and the massive milestone, week 13. This is a very important part of your journey, so make sure you do celebrate your progress a]er every 4 week block.</li>
                    </ul>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"> ACTION COMPLETED
                        </label>
                    </div>
                </div>
                <div class="col-sm-5"><img src="/images/ori/day1/act3.jpg" />
                </div>
            </div>
            <hr/>
            <a href="/orientation/day-6/mark-on-your-calendar-diary-any-events" class="text-center-sp btn btn-secondary  c_y">TASK COMPLETED ></a>
        </div>
    </div>
</div>