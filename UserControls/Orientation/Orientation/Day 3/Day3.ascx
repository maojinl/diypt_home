﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Day3.ascx.cs" Inherits="UserControls_Orientation_Day_3_Day3" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="weekView1" class="c_grey" href="/orientation"> <img src="images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO WEEK VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day  3  - Overview</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-2">Day 2</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-4">Day 4</a>
    </div>
    <div class="row pb-4">
        <div class="col-lg-10 push-lg-1 ">
            <div class="row">
                <div class="col-sm-7 ">
                    <p>It is essen(al that you complete your 3 day food diary this week in Orienta(on Week. The purpose of this 3 day diary is twofold:
                    </p>
                    <ul class="list list-number">
                        <li><span class="c_y">1.</span> So you can see how much calories, carbohydrates, protein and fats you are currently intaking, and you'll be able to compare this with how much you should be having when you get your food plan. </li>
                        <li><span class="c_y">2.</span>Get into the good habit of recording and coun(ng your macros because this is the single most important tool for the success of your program as you need sufficient amount of macronutrients throughout your program and the amounts differs depending on a few factors. There is a science behind geHng that banging body you desire.</li>
                    </ul>
                </div>
                <div class="col-sm-5">
                    <img class="img-fluid img-round" src="images/ori/day1/intro.jpg" />
                </div>
            </div>
            <div class="row mt-4 mb-4">
                <div class="col-sm-12 ">
                    <table class="table table-action-items">
                        <tr>
                            <th>
                                <h5 class="c_y">ACTION ITEMS</h5></th>
                            <th class="text-center">
                                <h5 class="c_y">STATUS</h5>
                            </th>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action1" class="c_black" href="/orientation/day-3/3-day-food-diary">3 day food diary</a></h5>
                            </td>
                            <td>
                                <p class="tick-circle">✓</p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action2"  class="c_black" href="/orientation/day-3/video-how-to-count-your-macros">Watch video - How to count your macros</a></h5>
                            </td>
                            <td>
                                <p class="tick-circle">✓</p>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <h5><a id="action3"  class="c_black" href="/orientation/day-3/get-familiar-with-the-chest-press">Get familiar with the chest press</a></h5>
                            </td>
                            <td>
                                <p class="tick-circle">✓</p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <a id="weekView2" href="/orientation" class="c_y btn btn-secondary m-1 col-lg-3 push-lg-3 col-sm-4 push-sm-2">SWITCH TO WEEK VIEW ></a>
            <a href="javascript:window.print()" class="c_y btn btn-secondary m-1 col-lg-3 col-sm-4 push-lg-3 push-sm-2">PRINT WEEKLY PLAN ></a>
        </div>
    </div>
</div>