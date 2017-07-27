<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Chest press.ascx.cs" Inherits="UserControls_Orientation_Day_3_Chest_press" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-3"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 3 - Task 3 </strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-3/video-how-to-count-your-macros">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-3">Next</a>
    </div>
    <div class="row">
        <div class="col-lg-10 push-lg-1">
            <h1 class="text-center mb-3">GET FAMILIAR WITH THE CHEST PRESS</h1>
            <div class="row mb-4">
                <div class="col-sm-12">
                    <p>In the next 6 days, in preparation for the start of your 12 week exercise program you will be learning the 6 basic fundamental exercises that form the foundation of the workouts we developed in your DIYPT program.</p>
                    <p>These exercises have been derived from the 7 primal movement patterns made famous by exercise expert and Physiologist, Paul Chek. They are:</p>
                    <ul class="ori-fa-list">
                        <li>Squat</li>
                        <li>Lunge</li>
                        <li>Push</li>
                        <li>Pull</li>
                        <li>Bend</li>
                        <li>Twist</li>
                        <li>Gait i.e. walking, jogging or sprinting.</li>
                    </ul>
                </div>
            </div>
            <p>The only movement pattern you won’t be learning is gait because we naturally do this movement on a daily basis.</p>
            <h5 class="c_y mt-4">Today’s exercise is the Chest press.</h5>
            <p>So that means that you’ll be learning one exercise per day.</p>
            <p>Today’s exercise is the Chest press. However, depending on your program, I want you to focus on a particular variation of the chest press</p>
            <div class="row loc-home pg-t pg-l">
                <div class="col-md-4 ori-1-3-demo mb-4">
                    <a href="#" data-toggle="modal" data-target="#exerciseModal1">
                    <img class="img-fluid" src="/images/ori/day1/demo.jpg" /></a>
                    <h4 class="sec c_y mt-2 mb-2">BEGINNER</h4>
                    <p><strong>Push ups on knees</strong></p>
                    <a href="#" class="c_y">View demo ></a>
                </div>
                <div class="col-md-4 ori-1-3-demo mb-4">
                    <a href="#" data-toggle="modal" data-target="#exerciseModal2">
                    <img class="img-fluid" src="/images/ori/day1/demo.jpg" /></a>
                    <h4 class="sec c_y mt-2 mb-2">INTERMEDIATE</h4>
                    <p><strong>Floor powerband chest press NG</strong></p>
                    <a href="#" class="c_y">View demo ></a>
                </div>
                <div class="col-md-4 ori-1-3-demo mb-4">
                    <a href="#" data-toggle="modal" data-target="#exerciseModal3">
                    <img class="img-fluid" src="/images/ori/day1/demo.jpg" /></a>
                    <h4 class="sec c_y mt-2 mb-2">ADVANCED</h4>
                    <p><strong>Floor powerband and water bottle chest press NG</strong></p>
                    <a href="#" class="c_y">View demo ></a>
                </div>
            </div>
            <hr/>
            <asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/>
        </div>
    </div>
</div>

<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exerciseModal1" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exerciseModalLabel1">Beginner  </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/204969161" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                </div>
                <img class="img-fluid img-center mt-3" src="/images/exercise/week1/1.jpg">
          
                <div class="d-flex align-items-center w94 mb-3">
                    <div class="p-2 ">
                        <h6 class="c_b sec nowrap">STEP 1</h6>
                    </div>
                    <div class="p-2 ">
                        <p>Phasellus tempus diam in urna gravida porttitor. Pells dignissim varius ante, </p>
                    </div>
                </div>
                <img class="img-fluid img-center mt-3" src="/images/exercise/week1/2.jpg">
        
                <div class="d-flex align-items-center w94 mb-3">
                    <div class="p-2 ">
                        <h6 class="c_b sec nowrap">STEP 2</h6>
                    </div>
                    <div class="p-2 ">
                        <p>Phasellus tempus diam in urna gravida porttitor. Pells dignissim varius ante, </p>
                    </div>
                </div>
                <img class="img-fluid img-center mt-3" src="/images/exercise/week1/3.jpg">
        
                <div class="d-flex align-items-center w94 mb-3">
                    <div class="p-2 ">
                        <h6 class="c_b sec nowrap">STEP 3</h6>
                    </div>
                    <div class="p-2 ">
                        <p>Phasellus tempus diam in urna gravida porttitor. Pells dignissim varius ante, </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Button trigger modal -->
<!-- Modal 2-->
<div class="modal fade" id="exerciseModal2" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exerciseModalLabel2">Intermediate  </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/204969161" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                </div>
                
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exerciseModal3" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exerciseModalLabel3">Advanced  </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class='embed-container'>
                    <iframe src="https://player.vimeo.com/video/204969161" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                </div>
                
            </div>
        </div>
    </div>
</div>