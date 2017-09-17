<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComingUp.ascx.cs" Inherits="UserControls_ComingUp" %>
<div id="divTrial" runat="server" visible="false" class="mt-5 text-center" ><h2>This function is only available on the full plan</h2></div>
<div class="tab-inner-content table-responsive comingup" id="divComing" runat="server">
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
            <td runat="server" id="w1d1" class="bg-grey">
                <img src="/images/coming/gift.svg">Receive your training pack</td>
            <td runat="server" id="w1d2"></td>
            <td runat="server" id="w1d3"></td>
            <td runat="server" id="w1d4"></td>
            <td runat="server" id="w1d5"></td>
            <td runat="server" id="w1d6"></td>
            <td runat="server" id="w1d7"></td>
        </tr>
        <tr>
            <td>Week 2
                <asp:Label runat="server" ID="week3Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w2d1"></td>
            <td runat="server" id="w2d2"></td>
            <td runat="server" id="w2d3"></td>
            <td runat="server" id="w2d4"></td>
            <td runat="server" id="w2d5" class="bg-y"><img src="/images/coming/meal.svg" />End of fortnight program treat meal</td>
            <td runat="server" id="w2d6">
                </td>
            <td runat="server" id="w2d7"></td>

        </tr>
        <tr>
            <td>Week 3
                <asp:Label runat="server" ID="week4Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w3d1"></td>
            <td runat="server" id="w3d2"></td>
            <td runat="server" id="w3d3"></td>
            <td runat="server" id="w3d4"></td>
            <td runat="server" id="w3d5"></td>
            <td runat="server" id="w3d6"></td>
            <td runat="server" id="w3d7"></td>
        </tr>
        <tr>
            <td>Week 4
                <asp:Label runat="server" ID="week5Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w4d1" class="bg-p"><img src="/images/coming/photo.svg" />Measure yourself and take progress photos</td>
            <td runat="server" id="w4d2">
                </td>
            <td runat="server" id="w4d3"></td>
            <td runat="server" id="w4d4"></td>
            <td runat="server" id="w4d5" class="bg-y"><img src="/images/coming/meal.svg" />End of fortnight program treat meal</td>
            <td runat="server" id="w4d6">
                </td>
            <td runat="server" id="w4d7"></td>
        </tr>
        <tr>
            <td>Week 5
                <asp:Label runat="server" ID="week6Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w5d1"></td>
            <td runat="server" id="w5d2"></td>
            <td runat="server" id="w5d3"></td>
            <td runat="server" id="w5d4"></td>
            <td runat="server" id="w5d5"></td>
            <td runat="server" id="w5d6" class="bg-b"><img src="/images/coming/time.svg" />Milestone workout</td>
            <td runat="server" id="w5d7">
                </td>

        </tr>
        <tr>
            <td>Week 6
                <asp:Label runat="server" ID="week7Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w6d1"></td>
            <td runat="server" id="w6d2"></td>
            <td runat="server" id="w6d3"></td>
            <td runat="server" id="w6d4"></td>
            <td runat="server" id="w6d5" class="bg-y"><img src="/images/coming/meal.svg" />End of fortnight program treat meal</td>
            <td runat="server" id="w6d6">
                </td>
            <td runat="server" id="w6d7"></td>
        </tr>
        <tr>
            <td>Week 7
                <asp:Label runat="server" ID="week8Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w7d1" class="bg-p"><img src="/images/coming/photo.svg" />Measure yourself and take progress photos</td>
            <td runat="server" id="w7d2">
                </td>
            <td runat="server" id="w7d3"></td>
            <td runat="server" id="w7d4"></td>
            <td runat="server" id="w7d5"></td>
            <td runat="server" id="w7d6"></td>
            <td runat="server" id="w7d7"></td>

        </tr>
        <tr>
            <td>Week 8
                <asp:Label runat="server" ID="week9Date" CssClass="coming-date-period"></asp:Label>
            </td>

            <td runat="server" id="w8d1"></td>
            <td runat="server" id="w8d2"></td>
            <td runat="server" id="w8d3"></td>
            <td runat="server" id="w8d4"></td>
            <td runat="server" id="w8d5" class="bg-y"><img src="/images/coming/meal.svg" />End of fortnight program treat meal</td>
            <td runat="server" id="w8d6">
                </td>
            <td runat="server" id="w8d7"></td>
        </tr>
        <tr>
            <td>Week 9
                <asp:Label runat="server" ID="week10Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w9d1"></td>
            <td runat="server" id="w9d2"></td>
            <td runat="server" id="w9d3"></td>
            <td runat="server" id="w9d4"></td>
            <td runat="server" id="w9d5"></td>
            <td runat="server" id="w9d6" class="bg-b"><img src="/images/coming/time.svg" />Milestone workout</td>
            <td runat="server" id="w9d7">
                </td>

        </tr>
        <tr>
            <td>Week 10
                <asp:Label runat="server" ID="week11Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w10d1" class="bg-p"><img src="/images/coming/photo.svg" />Measure yourself and take progress photos</td>
            <td runat="server" id="w10d2">
                </td>
            <td runat="server" id="w10d3"></td>
            <td runat="server" id="w10d4"></td>
            <td runat="server" id="w10d5" class="bg-y"><img src="/images/coming/meal.svg" />End of fortnight program treat meal</td>
            <td runat="server" id="w10d6">
                </td>
            <td runat="server" id="w10d7"></td>

        </tr>
        <tr>
            <td>Week 11
                <asp:Label runat="server" ID="week12Date" CssClass="coming-date-period"></asp:Label>
            </td>


            <td runat="server" id="w11d1"></td>
            <td runat="server" id="w11d2"></td>
            <td runat="server" id="w11d3"></td>
            <td runat="server" id="w11d4"></td>
            <td runat="server" id="w11d5"></td>
            <td runat="server" id="w11d6"></td>
            <td runat="server" id="w11d7"></td>
        </tr>
        <tr>
            <td>Week 12
                <asp:Label runat="server" ID="week13Date" CssClass="coming-date-period"></asp:Label>
            </td>
            <td runat="server" id="w12d1"></td>
            <td runat="server" id="w12d2"></td>
            <td runat="server" id="w12d3"></td>
            <td runat="server" id="w12d4"></td>
            <td runat="server" id="w12d5" class="bg-p"><img src="/images/coming/photo.svg" />Measure yourself and take progress photos</td>
            <td runat="server" id="w12d6" class="bg-y"><img src="/images/coming/celebrate.svg" />End of 12 weeks celebration meal
                </td>
            <td runat="server" id="w12d7">
                </td>

        </tr>
    </table>
    <asp:Label runat="server" ID="test"></asp:Label>
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
                        <p>Remember you're not alone on your fitness journey, even Apollos Hester from the video will support you. So be vocal, share and ask questions on our Facebook community page</p>
                    </div>
                </div>
                <div class="jr">
                    <img class="img-fluid" src="/images/modal/jr.png" />
                </div>
            </div>
        </div>
    </div>