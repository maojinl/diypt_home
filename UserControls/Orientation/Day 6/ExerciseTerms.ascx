<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExerciseTerms.ascx.cs" Inherits="UserControls_Orientation_Day_6_ExerciseTerms" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-6"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 6  - Task 3</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-6/mark-on-your-calendar-diary-any-events">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-6/get-familiar-with-the-twist">Next</a>
    </div>
    <h1 class="section-title text-center">GET FAMILIAR WITH THE EXERCISE TERMS </h1>

<p><strong>NOTE: The prescribed dumbbell weight for the dumbbell exercises is the weight for each dumbbell. Eg. 3kg means use two 3kg dumbbells for the exercise.</strong></p>

<p class="c_y"><strong>Core circuit</strong></p>
<p> Generally there are 3 exercises in the core circuit of your program and will be labelled A1, A2, A3. You do one core exercise for a set period of time and then move onto the next one.</p>

<p class="c_y"><strong>Empty the tank</strong></p>
<p> This is the last exercise for the workout so finish strong and give it everything you’ve got.</p>

<p class="c_y"><strong>HIIT</strong></p>
<p> High Intensity Interval Training. As the name suggests, your exercise effort and intensity is at a high level ie. maximum capacity or close to it. And then you rest completely for an interval time period.</p>

<p class="c_y"><strong>Intervals</strong> </p>
<p> Interval training is a type of training that involves a series of high-intensity workouts interspersed with rest periods. The high-intensity periods are typically at or close to your maximum capacity.</p>

<p class="c_y"><strong>Running intervals</strong> </p>
<p> are short, intense efforts followed by equal or slightly longer recovery time. For example, after a warmup, run two minutes at a hard effort, followed by two to three minutes of easy jogging or walking to catch your breath.</p>

<p class="c_y"><strong>Strength phase</strong> </p>
<p> In your DIYPT program this will require you to lift at maximum capacity for the prescribed amount of reps and sets. Typically the rep range will be low with long rest periods.</p>

<p class="c_y"><strong>Super sets</strong> </p>
<p> A super set is a form of strength training in which the participant moves quickly from one exercise to a separate exercise without taking a break for rest in between the two exercises. In your program it will be expressed in the letter and number sequence as B1 and B2 for instance. </p>

<p class="c_y"><strong>Tabata circuit</strong> </p>
<p> If you've done interval training, you may have heard of Tabata training. It’s a high-intensity workout protocol that has fitness and weight-loss benefits. It is also a very short workout. It’s generally 20 seconds of an exercise at maximum capacity, followed by 10 seconds of rest. This is repeated 8 times.</p>

<p class="c_y"><strong>Time trial</strong> </p>
<p> a test of a competitor's individual speed over a set distance. Reminder to record your time each session so you can track how you’re going.</p>

<p class="c_y"><strong>Tri-set</strong> </p>
<p> Three different exercises performed one after another, without any rest in between. In your program it will be expressed in the letter and number sequence as B1, B2 and B3 for instance.</p>

<p class="c_y"><strong>Unilateral exercise</strong> </p>
<p> Unilateral exercise is an exercise in which you are only working one limb or one side at a time eg. Single arm shoulder press.</p>

<p class="c_y"><strong>Workout Circuit</strong> </p>
<p> Workout circuit is a fast-paced program in which you do one exercise for a set period of time with high intensity and then move on to another exercise. The other way you’ll know it is a circuit in your DIYPT program is through the letter and number sequence, for example, B1, B2, B3, B4 means it’s a circuit and there are 4 exercises in the circuit before you rest.</p>
<br/>
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