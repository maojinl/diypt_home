﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Deadlift.ascx.cs" Inherits="UserControls_Orientation_Day_2_Deadlift" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-2"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 2 - Task 3</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-2/fitness-test">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-2">Next</a>
    </div>
    <div class="row">
        <div class="col-lg-10 push-lg-1">
            <h1 class="text-center mb-3">GET FAMILIAR WITH THE DEADLIFT</h1>
            <div class="row mb-4">
                <div class="col-sm-12">
                    
                    
                </div>
            </div>
            <p>Today’s exercise from the 7 primal movement patterns is the deadlift (bend pattern). However, depending on your program, I want you to focus on a particular variation of the deadlift.</p>
            <div class="row loc-home pg-t pg-l">
                <div class="col-md-4 ori-1-3-demo mb-4">
                    <a href="#" data-toggle="modal" data-target="#exerciseModal1">
                        <asp:Image runat="server" ID="imgExercise1" CssClass="img-fluid" /></a>
                    <h4 class="sec c_y mt-2 text-center">BEGINNER</h4>
                    <p class="text-center"><strong><asp:Label ID="lblExercise1" runat="server"></asp:Label></strong></p>
                     <p class="text-center"><a class="c_y " href="#" data-toggle="modal" data-target="#exerciseModal1">view demo > </a></p>
                </div>
                <div class="col-md-4 ori-1-3-demo mb-4">
                    <a href="#" data-toggle="modal" data-target="#exerciseModal2">
                        <asp:Image runat="server" ID="imgExercise2" CssClass="img-fluid" /></a>
                    <h4 class="sec c_y mt-2 text-center">INTERMEDIATE</h4>
                    <p class="text-center"><strong><asp:Label ID="lblExercise2" runat="server"></asp:Label></strong></p>
                    <p class="text-center"><a class="c_y " href="#" data-toggle="modal" data-target="#exerciseModal2">view demo > </a></p>
                </div>
                <div class="col-md-4 ori-1-3-demo mb-4">
                    <a href="#" data-toggle="modal" data-target="#exerciseModal3">
                        <asp:Image runat="server" ID="imgExercise3" CssClass="img-fluid" /></a>
                    <h4 class="sec c_y mt-2 text-center">ADVANCED</h4>
                    <p class="text-center"><strong><asp:Label ID="lblExercise3" runat="server"></asp:Label></strong></p>
                    <p class="text-center"><a class="c_y " href="#" data-toggle="modal" data-target="#exerciseModal3">view demo > </a></p>
                </div>
            </div>


            <hr />
            <div class="text-center"><asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary  c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click" /></div>
        </div>
    </div>
</div>

<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exerciseModal1" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        </div>
    </div>
</div>
<!-- Button trigger modal -->
<!-- Modal 2-->
<div class="modal fade" id="exerciseModal2" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exerciseModal3" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        </div>
    </div>
</div>
