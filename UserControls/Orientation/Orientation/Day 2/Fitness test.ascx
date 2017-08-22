﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Fitness test.ascx.cs" Inherits="UserControls_Orientation_Day_2_Fitness_test" %>
<div class="tab-inner-content show-pg-b">
    <div class="d-flex justify-content-end content-nav-action sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-2"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 2  - Task 2</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_b" href="/orientation/day-2/measurements">Back</a>
        <a id="dayNext" class="day-next c_b" href="/orientation/day-2/get-familiar-with-the-deadlift">Next</a>
    </div>
    <h1 class="text-center pb-4"><img src="/images/icon-timer-b.svg" />FITNESS TEST</h1>
    <div class="row pb-4 mb-4">
        <div class="push-sm-1 col-sm-5 pb-2">
            <img class="img-fluid img-round" src="/images/ori/day2/test.jpg" />
        </div>
        <div class="push-sm-1 col-sm-5">
            <p>It is mandatory that you complete this fitness test because not only does it determine your 12 week program but every few weeks you'll redo the test to see for yourself how you're progressing.</p>
            <p>If you don't complete this test then you will receive the default program.</p>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">1</div>
            </div>
            <p>1. How many years have you been exercising consistently minimum 3 times a week?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="0" checked> 0 - 1
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="1"> 1 - 3
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="2"> 3 - 5
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q1" id="" value="3"> 5+
                    </label>
                </div>
            </fieldset>
        </div>
        <div class="push-sm-1 col-sm-5  mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">2</div>
            </div>
            <p>Do you smoke?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="3" checked> No
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q2" id="" value="0"> Yes
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="push-sm-1 col-sm-5 mb-4">
            <div class="tri-card mb-3">
                <div class="tri-number sec">3</div>
            </div>
            <p>If yes, how many?
            </p>
            <fieldset class="form-group row">
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="0" checked> 1 - 5 per day
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="0"> 5 + per day
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="2"> 1 - 5 per week
                    </label>
                </div>
                <div class="form-check col-sm-6">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="q3" id="" value="1"> 5 + per week
                    </label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="pg-l">
        <div class="row">
            <div class="col-10 push-1 col-5 mb-3">
                <h2>I want to lose weight and increase fitness</h2>
                <p class="mb-3">Measurements estimated time to complete = 5-­10 mins</p>
                <p>Fitness test = 10-­15 minutes</p>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">4</div>
                </div>
                <p>1km run on treadmill / flat road</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="0" checked> DNF
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="2"> 8+ min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="4"> 6-­8 min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="6"> 5-­6 min
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="8"> 4-­5 min
                        </label>
                    </div>
                </fieldset>
                <p>OR 1km row (resistance 8)</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="0"> DNF
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="2"> 9+ min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="4"> 7-9 min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="6"> 5-­7 min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q4" id="" value="8"> 5min or less
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5  mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">5</div>
                </div>
                <p>How many pushups in 1 min (chest touch a lying down 600ml water boWle, On your toes)</p>
                <p>Males</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="0" checked> 0-­10 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="2"> 11-20 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="4"> 21-25 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="6"> 26-30 reps
                        </label>f
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="8"> 31+ reps
                        </label>
                    </div>
                </fieldset>
                <p>Females</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="0"> 0-­3 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="2"> 4-8 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="4"> 9-12 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="6"> 13-15 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q5" id="" value="8"> 16+ reps
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">6</div>
                </div>
                <p>How many BW box squats in 1 min (boWom must touch something below knee height eg. 30cm step or box )
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q6" id="" value="0" checked> 0-10 
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q6" id="" value="2"> 11-20 
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q6" id="" value="4"> 21-30 
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q6" id="" value="6"> 31-40 
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q6" id="" value="8"> 41+ 
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5  mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">7</div>
                </div>
                <p>How many sit-ups in 1 min (elbow 2 knee and feet under support)</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q7" id="" value="0" checked> 0-10 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q7" id="" value="2"> 11-20 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q7" id="" value="4"> 21-25 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q7" id="" value="6"> 26-30 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q7" id="" value="8"> 31+ reps
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">8</div>
                </div>
                <p>Plank on toes
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q8" id="" value="0" checked> 0-20 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q8" id="" value="2"> 21-40 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q8" id="" value="4"> 41-60 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q8" id="" value="6"> 61-90 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-l-q8" id="" value="8"> 91+ sec
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="pg-b">
        <div class="row">
            <div class="col-10 push-1 col-5 mb-3">
                <h2>I want to build muscle</h2>
                <p class="mb-3">Measurements estimated time to complete = 5-­10 mins</p>
                <p>Fitness test = 15-­20 minutes</p>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">4</div>
                </div>
                <p>Barbell back squat - How much weight you can lift for 5 reps
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="0" checked> 30% or less of your BW
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="2"> 40% of your BW
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="4"> 50%
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="6"> 60%
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="8"> 70%+
                        </label>
                    </div>
                </fieldset>
                <p>Barbell flat bench press -­‐ How much weight you can lift for 5 reps
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="0"> Less than 20kg bar
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="2"> 20kg bar
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="4"> 20kg bar + 20% of BW
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="6"> 20kg bar + 30% of BW
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q4" id="" value="8"> 20kg bar + 40%+ of BW
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5  mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">5</div>
                </div>
                <p>Barbell deadlift -­‐ How much weight you can lift for 5 reps
                </p>
                <p>Males</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q5" id="" value="0" checked> 30% or less of your BW
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q5" id="" value="2"> 40% of your BW
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q5" id="" value="4"> 50%
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q5" id="" value="6"> 60%
                        </label>f
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q5" id="" value="8"> 70%
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">6</div>
                </div>
                <p>Assisted chin-ups - How much weight you can lift for 5 reps
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q6" id="" value="0" checked> Lifting under 20%
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q6" id="" value="2"> Lifting 20%
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q6" id="" value="4"> Lifting 30%
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q6" id="" value="6"> Lifting 40%
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q6" id="" value="8"> Lifting 50%
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5  mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">7</div>
                </div>
                <p>Plank on toes
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q7" id="" value="0" checked> 0-20 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q7" id="" value="2"> 21-40
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q7" id="" value="4"> 41-60
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q7" id="" value="6"> 61-90
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q7" id="" value="8"> 91+
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">8</div>
                </div>
                <p>How many burpees in 1 min (chest must touch ground and clap your hands above your head when you jump)
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q8" id="" value="0" checked> 0-10
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q8" id="" value="2"> 10-15
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q8" id="" value="4"> 16-20
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q8" id="" value="6"> 21-25
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-b-q8" id="" value="8"> 26+
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="pg-t">
        <div class="row">
            <div class="col-10 push-1 col-5 mb-3">
                <h2>I want to tone up and have a beach body</h2>
                <p class="mb-3">Measurements estimated time to complete = 5-­10 mins</p>
                <p>Fitness test = 15-­20 minutes</p>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">4</div>
                </div>
                <p>1km run on treadmill / flat road</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="0" checked> DNF
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="2"> 8+ min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="4"> 6-­8 min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="6"> 5-­6 min
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="8"> 4-­5 min
                        </label>
                    </div>
                </fieldset>
                <p>OR 1km row (resistance 8)</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="0"> DNF
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="2"> 9+ min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="4"> 7-9 min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="6"> 5-­7 min
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q4" id="" value="8"> 5 min or less
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5  mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">5</div>
                </div>
                <p>How many pushups in 1 min (chest touch a lying down 600ml water boWle, On your toes)</p>
                <p>Males</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="0" checked> 0-­10 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="2"> 11-20 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="4"> 21-25 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="6"> 26-30 reps
                        </label>f
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="8"> 31+ reps
                        </label>
                    </div>
                </fieldset>
                <p>Females</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="0"> 0-­3 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="2"> 4-8 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="4"> 9-12 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="6"> 13-15 reps
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q5" id="" value="8"> 16+ reps
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">6</div>
                </div>
                <p>How many BW box squats in 1 min (boWom must touch something below knee height eg. 30cm step or box )
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q6" id="" value="0" checked> 0-10
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q6" id="" value="2"> 11-20
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q6" id="" value="4"> 21-30
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q6" id="" value="6"> 31-40
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q6" id="" value="8"> 41+
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5  mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">7</div>
                </div>
                <p>How many sit-ups in 1 min (elbow 2 knee and feet under support)</p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q7" id="" value="0" checked> 0-10
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q7" id="" value="2"> 11-20
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q7" id="" value="4"> 21-25
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q7" id="" value="6"> 26-30
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q7" id="" value="8"> 31+
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">8</div>
                </div>
                <p>Plank on toes
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q8" id="" value="0" checked> 0-20 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q8" id="" value="2"> 21-40 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q8" id="" value="4"> 41-60 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q8" id="" value="6"> 61-90 sec
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q8" id="" value="8"> 91+ sec
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="push-sm-1 col-sm-5 mb-4">
                <div class="tri-card mb-3">
                    <div class="tri-number sec">9</div>
                </div>
                <p>How many burpees in 1 min (chest must touch ground and clap your hands above your head when you jump)
                </p>
                <fieldset class="form-group row">
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q9" id="" value="0" checked> 0-10 
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q9" id="" value="2"> 11-15
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q9" id="" value="4"> 16-20
                        </label>
                    </div>
                    <div class="form-check col-sm-6">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q9" id="" value="6"> 21-25
                        </label>
                    </div>
                    <div class="form-check col-sm-12">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="pg-t-q9" id="" value="8"> 26+
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="row pb-4 pt-4">
        <a href="/orientation/day-2/get-familiar-with-the-deadlift" id="btn-result" class="c_b btn btn-secondary m-1 col-sm-4 push-sm-4">TASK COMPLETED ></a>
    </div>
</div>
<style>
.pg-l,
.pg-t,
.pg-b {
    display: none;
}

.show-pg-l .pg-l,
.show-pg-t .pg-t,
.show-pg-b .pg-b {
    display: block;
}
</style>
<script>
$("#btn-result").on("click", function(e) {
    e.preventDefault();
    var arr = [],
        sum = 0;
    $(".form-check-input:checked").each(function() {
        arr.push($(this).val());
    });

    $.each(arr, function() {
        sum += parseFloat(this) || 0;
    });

    if (sum < 25) {
        alert(sum + "Rookie");
    } else if (sum >= 25 && sum <= 39) {
        alert(sum + "Sophomore")
    } else {
        alert(sum + "expert");
    }

});

</script>