<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Food diary.ascx.cs" Inherits="UserControls_Orientation_Day_3_Food_diary" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-3"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 3  - Task 1</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-3">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-3/video-how-to-count-your-macros">Next</a>
    </div>



    <div class="row">
        <div class="col-sm-10 push-sm-1">
            <h1 class="text-center pb-4">3 DAY FOOD DIARY</h1>
            <p>It is essential that you complete your 3 day food diary this week in Orientation Week. The purpose of this 3 day diary is twofold:
            </p>
            <div class="row mb-4">
                <div class="col-sm-6">
                    <img class="img-fluid mb-4 img-round" src="/images/ori/day3/1.jpg">
                    <p><strong><span class="c_y">1. </span> So you can see how much calories, carbohydrates, protein and fats you are currently intaking,</strong> and you’ll be able to compare this with how much you should be having when we give you your macros in the first couple of weeks of your program.</p>
                </div>
                <div class="col-sm-6">
                    <img class="img-fluid mb-4 img-round" src="/images/ori/day3/2.jpg">
                    <p><strong><span class="c_y">2.</span> Get into the good habit of recording and counting your macros</strong> because this is the single most important tool for the success of your program as you need sufficient amount of macronutrients thorughout your program and the amounts differs depending on a few factors. There is a science behind getting that banging body you desire.</p>
                </div>
            </div>
            <h2 class="text-center pb-4">STEPS TO RECORD YOUR MACROS</h2>
            <div class="row mb-4">
                <table class="table">
                    <tr>
                        <td>
                            <h5 class="c_y" style="min-width: 100px;">STEP 1</h5></td>
                        <td>
                            <p>
                                Download App, <strong>My Fitness Pal</strong>, from your phone or the website and record your food diary in this app. It's not necessary to record your water intake and exercise.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <h5 class="c_y">STEP 2</h5></td>
                        <td>
                            <p><strong>Record 3 days that are representative of your normal intake. </strong>Generally, members pick two weekdays and one weekend because their weekdays are different from their weekends. Otherwise choose one day to represent each unique eating schedule.</p>
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <h5 class="c_y">STEP 3</h5></td>
                        <td>
                            <p><strong>Record what you eat the night before because it will allow you to plan what you're going to eat the next day ie. For Fridays meals, record them on Thursday night.</p>
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <h5 class="c_y">STEP 4</h5></td>
                        <td>
                            <p><strong>Record combination foods separately</strong> (eg. hotdog, bun and condiments) and include brand names of food items.</p>
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <h5 class="c_y">STEP 5</h5></td>
                        <td>
                            <p><strong>For packaged items,</strong> you can simply scan the barcode to make your life much easier. See Video - <strong><a href="https://www.youtube.com/watch?v=TxBQD5JlRoc" class="c_y" target="_blank">Counting macros the DIYPT way  </a></strong>for more details.</p>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="text-center"><asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/></div>
        </div>
    </div>
</div>