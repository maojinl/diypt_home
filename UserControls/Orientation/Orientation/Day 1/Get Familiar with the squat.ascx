<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Get Familiar with the squat.ascx.cs" Inherits="UserControls_Orientation_Day_1_Get_Familiar_with_the_squat" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action f-sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-1">
            <img src="images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()">
            <img src="images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="d-flex justify-content-between align-items-end pb-4">
        <div></div>
        <div class="text-center">
            <h1><strong>Day 1 </strong></h1>
            <div class="ori-date">
                <span class="c_y">
                    <asp:Label ID="lblDay" runat="server"></asp:Label></span>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
            <a id="dayPre" class="day-pre c_y" href="/orientation/day-1/pre-ex-questionnaire">Back</a>
            <a id="dayNext" class="day-next c_y" href="/orientation/day-1">Next</a>
        </div>
    </div>
    <h1 class="text-center pb-4">GET FAMILIAR WITH THE SQUAT</h1>
    <div class="row mb-4">
        <div class="col-sm-12">
            <p>In the next 6 days, in preparation for the start of your 12 week exercise program you will be learning the 6 basic fundamental exercises that form the foundation of the workouts we developed in your DIYPT program. </p>
            <p>These exercises have been derived from the 7 primal movement patterns made famous by exercise expert and Physiologist, <strong>Paul Chek</strong>. They are:</p>
            <table class="table table-ori-1-3">
                <tr>
                    <td>Squat</td>
                    <td>Squat</td>
                    <td>Squat</td>
                    <td>Squat</td>
                </tr>
                <tr>
                    <td>Squat</td>
                    <td>Squat</td>
                    <td colspan="2">Squat Squat</td>
                </tr>
            </table>
        </div>
    </div>
    <p>The only movement pattern you won’t be learning is gait because we naturally do this movement on a daily basis. So that means that you’ll be learning one exercise per day.</p>
    <h5 class="c_y">Today’s exercise is the ‘squat’.</h5>
    <p>However, depending on your program, I want you to focus on a particular variation of the exercise.</p>
    <div class="row">
        <div class="col-md-4 ori-1-3-demo mb-4">
            <img class="img-fluid" src="images/ori/day1/demo.jpg" />
            <h4 class="f-sec c_y mt-2">BEGINNERS</h4>
            <p>Body Weight Squat</p>
            <a href="#" class="c_y">View demo ></a>
        </div>
        <div class="col-md-4 ori-1-3-demo mb-4">
            <img class="img-fluid" src="images/ori/day1/demo.jpg" />
            <h4 class="f-sec c_y mt-2">BEGINNERS</h4>
            <p>Body Weight Squat</p>
            <a href="#" class="c_y">View demo ></a>
        </div>
        <div class="col-md-4 ori-1-3-demo mb-4">
            <img class="img-fluid" src="images/ori/day1/demo.jpg" />
            <h4 class="f-sec c_y mt-2">BEGINNERS</h4>
            <p>Body Weight Squat</p>
            <a href="#" class="c_y">View demo ></a>
        </div>
    </div>
    <a href="/orientation/day-1" class="text-center btn btn-secondary  c_y tex">TASK COMPLETED ></a>
</div>
