<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComingUp.ascx.cs" Inherits="UserControls_ComingUp" %>
<!--
<div class="tab-inner-content">
    <table class="coming-table table-responsive">
        <tr>
            <td></td>
            <td>Sunday</td>
            <td>Monday</td>
            <td>Tuesday</td>
            <td>Wednesday</td>
            <td>Thursday</td>
            <td>Friday</td>
            <td>Saturday</td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label runat="server" ID="week1_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week1_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week1_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week1_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week1_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week1_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week1_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 1</td>
            <td colspan="7">Orientation Week</td>
        </tr>
        <tr>
            <td>Week 2</td>
            <td><asp:Label runat="server" ID="week2_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week2_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week2_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week2_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week2_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week2_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week2_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 3</td>
            <td><asp:Label runat="server" ID="week3_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week3_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week3_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week3_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week3_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week3_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week3_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 4</td>
            <td><asp:Label runat="server" ID="week4_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week4_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week4_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week4_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week4_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week4_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week4_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 5</td>
            <td><asp:Label runat="server" ID="week5_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week5_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week5_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week5_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week5_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week5_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week5_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 6</td>
            <td><asp:Label runat="server" ID="week6_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week6_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week6_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week6_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week6_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week6_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week6_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 7</td>
            <td><asp:Label runat="server" ID="week7_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week7_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week7_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week7_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week7_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week7_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week7_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 8</td>
            <td><asp:Label runat="server" ID="week8_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week8_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week8_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week8_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week8_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week8_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week8_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 9</td>
            <td><asp:Label runat="server" ID="week9_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week9_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week9_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week9_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week9_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week9_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week9_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 10</td>
            <td><asp:Label runat="server" ID="week10_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week10_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week10_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week10_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week10_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week10_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week10_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 11</td>
            <td><asp:Label runat="server" ID="week11_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week11_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week11_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week11_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week11_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week11_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week11_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 12</td>
            <td><asp:Label runat="server" ID="week12_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week12_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week12_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week12_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week12_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week12_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week12_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
        <tr>
            <td>Week 13</td>
            <td><asp:Label runat="server" ID="week13_0" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week13_1" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week13_2" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week13_3" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week13_4" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week13_5" CssClass="calendar-date"></asp:Label></td>
            <td><asp:Label runat="server" ID="week13_6" CssClass="calendar-date"></asp:Label></td>
        </tr>
    </table>
</div>
-->
<div class="tab-inner-content table-responsive comingup">
    <table class="coming-table ">
        <tr>
            <th class="no-border-top no-border-left"></th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
            <th>Saturday</th>
            <th>Sunday</th>
        </tr>
        <tr>
            <td>Week 0
                <asp:Label runat="server" ID="week1Date" CssClass="coming-date-period"></asp:Label>
      
            </td>
            <td class="bg-grey font-1" colspan="7">Orientation Week
                <p>
                    <a href="/orientation/">View Details> </a>
            </td>
        </tr>
        <tr>
            <td>Week 1
                <asp:Label runat="server" ID="week2Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w2d1" class="bg-grey">
                <img src="/images/coming/gift.svg">Receive your training pack</td>
            <td runat="server" id="w2d2"></td>
            <td runat="server" id="w2d3"></td>
            <td runat="server" id="w2d4"></td>
            <td runat="server" id="w2d5"></td>
            <td runat="server" id="w2d6"></td>
            <td runat="server" id="w2d7"></td>
        </tr>
        <tr>
            <td>Week 2
                <asp:Label runat="server" ID="week3Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w3d1"></td>
            <td runat="server" id="w3d2"></td>
            <td runat="server" id="w3d3"></td>
            <td runat="server" id="w3d4"></td>
            <td runat="server" id="w3d5"></td>
            <td runat="server" id="w3d6" class="bg-y">
                <img src="/images/coming/meal.svg">End of fortnight program treat meal</td>
            <td runat="server" id="w3d7"></td>

        </tr>
        <tr>
            <td>Week 3
                <asp:Label runat="server" ID="week4Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w4d1"></td>
            <td runat="server" id="w4d2"></td>
            <td runat="server" id="w4d3"></td>
            <td runat="server" id="w4d4"></td>
            <td runat="server" id="w4d5"></td>
            <td runat="server" id="w4d6"></td>
            <td runat="server" id="w4d7"></td>
        </tr>
        <tr>
            <td>Week 4
                <asp:Label runat="server" ID="week5Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w5d1"></td>
            <td runat="server" id="w5d2" class="bg-p">
                <img src="/images/coming/photo.svg">Measure yourself and take progress photos</td>
            <td runat="server" id="w5d3"></td>
            <td runat="server" id="w5d4"></td>
            <td runat="server" id="w5d5"></td>
            <td runat="server" id="w5d6" class="bg-y">
                <img src="/images/coming/meal.svg">End of fortnight program treat meal</td>
            <td runat="server" id="w5d7"></td>
        </tr>
        <tr>
            <td>Week 5
                <asp:Label runat="server" ID="week6Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w6d1"></td>
            <td runat="server" id="w6d2"></td>
            <td runat="server" id="w6d3"></td>
            <td runat="server" id="w6d4"></td>
            <td runat="server" id="w6d5"></td>
            <td runat="server" id="w6d6"></td>
            <td runat="server" id="w6d7" class="bg-b">
                <img src="/images/coming/time.svg">Milestone workout</td>

        </tr>
        <tr>
            <td>Week 6
                <asp:Label runat="server" ID="week7Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w7d1"></td>
            <td runat="server" id="w7d2"></td>
            <td runat="server" id="w7d3"></td>
            <td runat="server" id="w7d4"></td>
            <td runat="server" id="w7d5"></td>
            <td runat="server" id="w7d6" class="bg-y">
                <img src="/images/coming/meal.svg">End of fortnight program treat meal</td>
            <td runat="server" id="w7d7"></td>
        </tr>
        <tr>
            <td>Week 7
                <asp:Label runat="server" ID="week8Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w8d1"></td>
            <td runat="server" id="w8d2" class="bg-p">
                <img src="/images/coming/photo.svg">Measure yourself and take progress photos</td>
            <td runat="server" id="w8d3"></td>
            <td runat="server" id="w8d4"></td>
            <td runat="server" id="w8d5"></td>
            <td runat="server" id="w8d6"></td>
            <td runat="server" id="w8d7"></td>

        </tr>
        <tr>
            <td>Week 8
                <asp:Label runat="server" ID="week9Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w9d1"></td>
            <td runat="server" id="w9d2"></td>
            <td runat="server" id="w9d3"></td>
            <td runat="server" id="w9d4"></td>
            <td runat="server" id="w9d5"></td>
            <td runat="server" id="w9d6" class="bg-y">
                <img src="/images/coming/meal.svg">End of fortnight program treat meal</td>
            <td runat="server" id="w9d7"></td>
        </tr>
        <tr>
            <td>Week 9
                <asp:Label runat="server" ID="week10Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w10d1"></td>
            <td runat="server" id="w10d2"></td>
            <td runat="server" id="w10d3"></td>
            <td runat="server" id="w10d4"></td>
            <td runat="server" id="w10d5"></td>
            <td runat="server" id="w10d6"></td>
            <td runat="server" id="w10d7" class="bg-b">
                <img src="/images/coming/time.svg">Milestone workout</td>

        </tr>
        <tr>
            <td>Week 10
                <asp:Label runat="server" ID="week11Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w11d1"></td>
            <td runat="server" id="w11d2" class="bg-p">
                <img src="/images/coming/photo.svg">Measure yourself and take progress photos</td>
            <td runat="server" id="w11d3"></td>
            <td runat="server" id="w11d4"></td>
            <td runat="server" id="w11d5"></td>
            <td runat="server" id="w11d6" class="bg-y">
                <img src="/images/coming/meal.svg">End of fortnight program treat meal</td>
            <td runat="server" id="w11d7"></td>

        </tr>
        <tr>
            <td>Week 11
                <asp:Label runat="server" ID="week12Date" CssClass="coming-date-period"></asp:Label>
            </td>


            <td runat="server" id="w12d1"></td>
            <td runat="server" id="w12d2"></td>
            <td runat="server" id="w12d3"></td>
            <td runat="server" id="w12d4"></td>
            <td runat="server" id="w12d5"></td>
            <td runat="server" id="w12d6"></td>
            <td runat="server" id="w12d7"></td>
        </tr>
        <tr>
            <td>Week 12
                <asp:Label runat="server" ID="week13Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w13d1"></td>
            <td runat="server" id="w13d2"></td>
            <td runat="server" id="w13d3"></td>
            <td runat="server" id="w13d4"></td>
            <td runat="server" id="w13d5"></td>
            <td runat="server" id="w13d6" class="bg-p">
                <img src="/images/coming/photo.svg">Measure yourself and take progress photos</td>
            <td runat="server" id="w13d7" class="bg-y">
                <img src="/images/coming/celebrate.svg">End of 12 weeks celebration meal</td>

        </tr>
    </table>
</div>
<div class="modal fade" id="weekModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div style="display: block">
                        <div class="modal-tri">
                            <span class="tri-blue-pg"></span>
                            <div class="start-week icon-blue">START OF<span class="sec">WEEK 1</span></div>
                        </div>
                        <h5 class="mt-5">Congratulations on taking the first step to a healthier and better you.</h5>
                    </div>
                    <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="modal-body-section">
                        <p>If you still feel overwhelmed after Orientation Week, don't worry it’s completely normal.  There are hundreds of others in the same boat. </p>
                        <p>Remember to click on ‘Show my fitness program and/or ‘Show my goal’ in the <strong>My Profile</strong> section so you can stay connected with others doing the same program as you.</p>
                    </div>
                </div>
                <div class="jr">
                    <img class="img-fluid" src="/images/modal/jr.png" />
                </div>
            </div>
        </div>
    </div>