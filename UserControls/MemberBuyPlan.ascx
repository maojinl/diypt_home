<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberBuyPlan.ascx.cs" Inherits="UserControls_MemberBuyPlan" %>
<style type="text/css">
    .auto-style1 {
        height: 34px;
    }
</style>

<div class="container-fluid container-fluid-w">
    <div class="container container-registration-form">
        <h1 class="c_y"><asp:Label ID="lblBuyHeader" runat="server">Review and pay</asp:Label>

        </h1>
                <div><asp:Label ID="lblMsg" runat="server" ForeColor="#CC3300" class="row form-group ml-4"></asp:Label></div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">First Name</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="txtFirstName" runat="server"></asp:Label>
            </div>
            <div class="col-md-2 col-12 col-form-label">Surname</div>
            <div class="col-md-4 col-12">

                <asp:Label ID="tbLastName" runat="server"></asp:Label>

            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Email</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="txtEmail" runat="server"></asp:Label>
            </div>


        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Mobile Number</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="tbMobile" runat="server"></asp:Label>
            </div>
            <div class="col-md-2 col-12 col-form-label">Other Contact</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="tbPhone" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Street Address</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="tbStreetAddress" runat="server"></asp:Label>
            </div>
            <div class="col-md-2 col-12 col-form-label">Suburb</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="tbSuburb" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">State</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="tbState" runat="server"></asp:Label>
            </div>
            <div class="col-md-2 col-12 col-form-label">Country</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="ddCountry" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Postcode</div>
            <div class="col-md-4 col-12">
                <asp:Label ID="tbPostCode" runat="server"></asp:Label>
            </div>
            <div class="col-md-2 col-12 col-form-label"></div>
            <div class="col-md-4 col-12">
            </div>

        </div>
        <hr />

        <h1 class="c_y">Program Specific Details</h1>
        <h6>1. What is your training goal?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                
                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Lose Weight">Lose weight and increase fitness</asp:ListItem>
                    <asp:ListItem Value="Build Muscle">Build muscle and get bigger</asp:ListItem>
                    <asp:ListItem Value="Tone Up">Tone up and be body confident</asp:ListItem>
                </asp:DropDownList>


            </div>
        </fieldset>
        <h6>2. Where would you prefer to exercise for your DIYPT grogram?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">

                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem Value="Gym">Gym</asp:ListItem>
                    <asp:ListItem Value="Home">Home</asp:ListItem>
                </asp:DropDownList>


            </div>
        </fieldset>

		<!--
        <h6 runat="server" id="Q3">3. Do you have any dietary requirements?</h6>

        <fieldset class="form-group row">
            <div class="col-md-8">

                <asp:Label ID="ddlQ3" runat="server"></asp:Label>


            </div>
        </fieldset>


        <h6 runat="server" id="Q4">4. Do you have any medical conditions that will prevent/disrupt you from training?</h6>


        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:Label ID="ddlQ4" runat="server"></asp:Label>


                <div id="q4Detail" name="q4Detail">
                    <p>Please specify:</p>
                    <asp:Label ID="regQ4" runat="server"></asp:Label>
                </div>
            </div>
        </fieldset>




        <h6 runat="server" id="Q5">5. If you believe you can still exercise, please write an explanation below.</h6>

        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:Label ID="regQ5" runat="server"></asp:Label>

            </div>
        </fieldset>

        <h6>6. Are you currently on any medication ?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:Label ID="ddlQ6" runat="server"></asp:Label>
                <div id="q6Detail">
                    <p>Please specify:</p>
                    <asp:Label ID="regQ6" runat="server"></asp:Label>
                </div>
            </div>
        </fieldset>
-->

        <hr class="mt-5 mb-2" />
        <%--Plan:&nbsp;
                       <asp:Label ID="lblPlan" runat="server"></asp:Label>--%>
        <asp:Button ID="btnSubmit" runat="server" class="btn btn-secondary c_y mt-5 sec" Text="Pay with PayPal" OnClick="btnSubmit_Click" Visible="false" />
        <%--<asp:ImageButton ID="CheckoutImageBtn" runat="server" 
                      ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" 
                      Width="145" AlternateText="Check out with PayPal" 
                      OnClick="CheckoutBtn_Click" 
                      BackColor="Transparent" BorderWidth="0" />--%>
        <asp:Button ID="btnPayWeekly" runat="server" class="btn btn-secondary c_y mt-5 sec" Text="Pay Weekly Ezidebit" OnClick="btnSubmitPayWeekly_Click" />
        <asp:Button ID="btnPayFully" runat="server" class="btn btn-secondary c_y mt-5 sec" Text="Pay Fully Ezidebit" OnClick="btnSubmitPayFully_Click" />
    </div>
</div>

    <div class="error">
        <asp:Label ID="errorLabel" runat="server"></asp:Label>
    </div>