<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrialSignUp.ascx.cs" Inherits="UserControls_TrialSignUp" %>
<style>
    .radioButtonList {
        width: 100%;
    }

        .radioButtonList input {
            float: left;
        }

        .radioButtonList label {
            margin-left: 10px;
            text-align: left;
            vertical-align: top;
        }
</style>
<script>
    function changeQ4(owner) {
        if (owner.options[owner.selectedIndex].value == "No")
            q4Detail.style.display = "none";
    }
    function changeQ6(owner) {
        if (owner.options[owner.selectedIndex].value == "No")
            q6Detail.style.display = "none";
    }

</script>
<div class="container-fluid container-fluid-w">
    <div class="container container-registration-form">
        <h1 class="c_y">General Details
                <asp:Label ID="lblMsg" runat="server" ForeColor="#CC3300"></asp:Label>

        </h1>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">First Name</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RfvFirstName" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-2 col-12 col-form-label">Surname</div>
            <div class="col-md-4 col-12">

                <asp:TextBox ID="tbLastName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbLastName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Email</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RfvUserName" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RxvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Invalid E-mail" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>


        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Mobile Number</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="tbMobile" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbMobile"></asp:RequiredFieldValidator>
                &nbsp;<br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                    ValidationExpression="^\d*\.?\d+$" ControlToValidate="tbMobile"
                    ErrorMessage="* Value must be a  number" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-2 col-12 col-form-label">Other Contact</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="tbPhone" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbPhone"></asp:RequiredFieldValidator>
                &nbsp;<br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ValidationExpression="^\d*\.?\d+$" ControlToValidate="tbPhone"
                    ErrorMessage="* Value must be a  number" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Street Address</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="tbStreetAddress" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbStreetAddress"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-2 col-12 col-form-label">Suburb</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="tbSuburb" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbSuburb"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">State</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="tbState" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbState"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-2 col-12 col-form-label">Country</div>
            <div class="col-md-4 col-12">
                <asp:DropDownList class="form-control" ID="ddCountry" runat="server">
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>New Zealand</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-12 col-form-label">Postcode</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="tbPostCode" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="tbPostCode"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-2 col-12 col-form-label"></div>
            <div class="col-md-4 col-12">
            </div>

        </div>
        <div class="row form-group">
            <div runat="server" id="lblPassword" class="col-md-2 col-12 col-form-label">Password</div>
            <div class="col-md-4 col-12">
                <asp:TextBox class="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div runat="server" id="lblPassword1" class="col-md-2 col-12 col-form-label">Confirm password</div>
            <div class="col-md-4 col-12">
                <asp:TextBox ID="txtConfirmPwd" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CvCnfmPwd" runat="server" ErrorMessage="Password and Confirm Password didnt matched"
                    ForeColor="#FF3300" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>
            </div>
        </div>
        <hr />

        <h1 class="c_y">Program Specific Details</h1>
        <h6>1. What is your training goal?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Lose Weight" Selected="True">Lose weight and increase fitness</asp:ListItem>
                    <asp:ListItem Value="Build Muscle">Build muscle and get bigger</asp:ListItem>
                    <asp:ListItem Value="Tone Up">Tone up and have beach body</asp:ListItem>
                </asp:DropDownList>


            </div>
        </fieldset>
        <h6>2. Where would you prefer to exercise for your DIYPT grogram?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Gym" Selected="True">Gym</asp:ListItem>
                    <asp:ListItem Value="Home">Home</asp:ListItem>

                </asp:DropDownList>


            </div>
        </fieldset>
        <h6>3. What difficulty level of the program do you want to trial?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Beginner" Selected="True">Beginner</asp:ListItem>
                    <asp:ListItem Value="Intermediate">Intermediate</asp:ListItem>
                    <asp:ListItem Value="Advanced">Advanced</asp:ListItem>
                </asp:DropDownList>


            </div>
        </fieldset>

        <hr class="mt-5 mb-2" />
        <asp:Button ID="btnSubmit" runat="server" class="btn btn-secondary c_y mt-5 sec" Text="Register Now" OnClick="btnSubmit_Click" />
    </div>
</div>



&nbsp;
                              
</div>