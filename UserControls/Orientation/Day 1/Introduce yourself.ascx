<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Introduce yourself.ascx.cs" Inherits="UserControls_Orientation_Day_1_Introduce_yourself" %>
<div class="tab-inner-content">
    <div class="d-flex justify-content-end content-nav-action f-sec mb-4">
        <a id="dayView2" class="c_grey" href="/orientation/day-1"> <img src="/images/icon-back-g.svg" /><span class="hidden-sm-down sec">BACK TO DAY VIEW ></span></a>
        <a class="c_grey" href="javascript:window.print()"> <img src="/images/icon-print-g.svg" /><span class="hidden-sm-down sec">PRINT PLAN ></span></a>
    </div>
    <div class="text-center">
        <h1><strong>Day 1</strong></h1>
        <div class="ori-date"><span class="c_y">
            <asp:Label ID="lblDay" runat="server"></asp:Label></span> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
    </div>
    <div class="d-flex justify-content-between align-items-center pb-4 pre-next">
        <a id="dayPre" class="day-pre c_y" href="/orientation/day-1">Back</a>
        <a id="dayNext" class="day-next c_y" href="/orientation/day-1/pre-ex-questionnaire">Next</a>
    </div>
    <h1 class="text-center pb-4">INTRODUCE YOURSELF</h1>
    <div class="row">
        <div class="col-10 push-sm-1">
            <div class="row mb-4">
                <div class="col-12">
                    <p> Welcome to DIYPT. You’ve joined a thousand plus strong community of DIYPTers. If you are like me and want to get the biggest bang for your buck and get the best results from your program, then I highly recommend you get involved with our community by completing the <strong>“Introduce yourself” </strong>actions and actively using your <strong>Revitalise Me</strong> zone.</p>
                    <p>I would like you to do 3 ACTIONS to allow you to get the most out of your program:</p>
                </div>
            </div>
            <hr/>
            <div class="row mb-4">
                <div class="col-sm-7">
                    <h5 class="f-sec c_y sec">ACTION 1</h5>
                    <h4 class="mb-3">Create a profile</h4>
                    <p>Important note: when you click on ‘Show my Fitness program’ and ‘Show my goal’ in My Profile, you will be connected with other DIYPTers who have ticked the same boxes so you can ask, answer questions and share things with others on the same journey.</p>
                    <div class="row">
                        <div class="col-md-6 mb-2"><a href="/my-account/profile.aspx" class="btn btn-secondary btn-block c_y" target="_blank">UPDATE MY PROFILE ></a></div>
                        <div class="col-md-6 mb-2">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <asp:CheckBox id="CheckBox1" type="checkbox" class="form-check-input" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChangedMethod"/> ACTION COMPLETED
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <asp:Image ID="imgProfile" runat="server" class="my-profile-intro-icon" />
                </div>
            </div>
            <hr/>
            <div class="row mb-4">
                <div class="col-sm-7">
                    <h5 class="f-sec c_y sec">ACTION 2</h5>
                     <h4 class="mb-3">Check out your Revitalise Me zone</h4>
                    <p>Revitalise me is a library of information where there are plenty of videos and articles about training, nutrition and mindset plus you get to ask questions, make comments or share something with fellow DIYPTers to help you through your program.</p>
                    <div class="row">
                        <div class="col-md-6 mb-2"><a href="/revitalise-me" class="btn btn-secondary btn-block c_y" target="_blank">SEE REVITALISE ME ></a></div>
                        <div class="col-md-6 mb-2">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <asp:CheckBox id="CheckBox2" type="checkbox" class="form-check-input" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChangedMethod"/> ACTION COMPLETED
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5"><img class="my-profile-intro-icon" src="/images/ori/day1/act2.jpg" />
                </div>
            </div>
 <hr/>
            <div class="row mb-4">
                <div class="col-sm-7">
                    <h5 class="f-sec c_y sec">ACTION 3</h5>
                     <h4 class="mb-3">Post something</h4>
                    <p>This is one of the most valuable things you can do to get the most out of your program. You may feel embarrassed or hesitant to post something. That’s completely normal. So i suggest you start with a question or reply to someone else’s question.</p>
                    
                    <h5><strong>Guidelines for your post:</strong></h5>
                    
                    <p>1. Post an update, question, comment or reply. Absolutely no bullying as I won’t hesitate to kick you off our team.</p>
                    
                    <p>2. End with a question to encourage more responses</p>
                    <div class="row">
                        <div class="col-md-6 mb-2"><a href="/community" target="_blank" class="btn btn-secondary btn-block c_y">WRITE A POST ></a></div>
                        <div class="col-md-6 mb-2">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <asp:CheckBox id="CheckBox3" type="checkbox" class="form-check-input" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChangedMethod"/> ACTION COMPLETED
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5"><img class="my-profile-intro-icon" src="/images/ori/day1/act3.jpg" />
                </div>
            </div>
 <hr/>
            <asp:Button ID="btnTaskDone" class="text-center-sp btn btn-secondary c_y sec" runat="server" Text="TASK COMPLETED >" OnClick="btnTaskDone_Click"/>
        </div>
    </div>
</div>