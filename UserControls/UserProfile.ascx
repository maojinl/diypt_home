<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserProfile.ascx.cs" Inherits="UserControls_UserProfile" %>


<div class="row-offcanvas row-offcanvas-right left-content no-padding">
    <!-- HEADER -->
    <div class="container-fluid container-fluid-header no-padding">


        <div class="container container-profile">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img-section">
                        <asp:Image runat="server" ID="profilePhoto" class="profile-img img-fluid" />
                        <h4 class="profile-img-name sec c_y">
                            <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></h4>
                    </div>

                </div>
                <div class="col-md-8">
				<div>
                <asp:Label ID="lblMsgTop" runat="server" ForeColor="#CC3300"></asp:Label>
				</div>
                    <h1 class="c_y">Public Profile</h1>
                    <div id="divViewProfile" runat="server">
                        <p class="text-right">
							<asp:LinkButton ID="lbEditProfile" runat="server" Text="Edit >" OnClick="lbEditProfile_Click"></asp:LinkButton>
						</p>
                        <div class="form-group row">
                            <label for="profile-text-input" class="col-3 col-form-label"><b>Screen Name</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblFirstName" runat="server"></asp:Label>

                                <asp:Label ID="lblLastName" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-search-input" class="col-3 col-form-label"><b>My Goal</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblGoalDec" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-url-input" class="col-3 col-form-label"><b>Facebook</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblFacebook" runat="server"></asp:Label>
                            </div>
                            <label for="profile-url-input" class="col-3 col-form-label"><b>Instagram</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblInstagram" runat="server"></asp:Label>
                            </div>
                            <label for="profile-url-input" class="col-3 col-form-label"><b>Twitter</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblTwitter" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-why" class="col-3 col-form-label"><b>Why I've joined DIYPT</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblWhyDiypt" runat="server" TextMode="MultiLine"></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="form-check col-sm-6">
                                <b>Show My Goal:</b>
                                <asp:Label ID="lblShowProgram" runat="server" />
                            </div>
                            <div class="form-check col-sm-6">
                                <b>Show My Level:</b>
                                <asp:Label ID="lblShowLevel" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div id="divEditProfile" runat="server" visible="false">
                        <p class="text-right">
                        <asp:LinkButton ID="lbCancelEditProfile" runat="server" Text="Cancel >" OnClick="lbCancelEditProfile_Click" CausesValidation="false"></asp:LinkButton>
						</p>
                        <div class="form-group row">
                            <label for="profile-text-input" class="col-3 col-form-label">Screen Name</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbFirstName" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvFirstName" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbFirstName"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="tbLastName" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbLastName"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="photoUpload" class="col-3 col-form-label">Upload new photo</label>
                            <div class="col-9">
                                <asp:FileUpload ID="photoUpload" runat="server" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-search-input" class="col-3 col-form-label">My Goal</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbGoalDec" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-url-input" class="col-3 col-form-label">Facebook</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbFacebook" runat="server" class="form-control mb-1"></asp:TextBox>
                            </div>
                            <label for="profile-url-input" class="col-3 col-form-label">Instagram</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbInstagram" runat="server" class="form-control mb-1"></asp:TextBox>
                            </div>
                            <label for="profile-url-input" class="col-3 col-form-label">Twitter</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbTwitter" runat="server" class="form-control mb-1"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-why" class="col-3 col-form-label">Why DIYPT</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbWhyDiypt" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="form-check col-sm-6">
                                <label class="form-check-label"></label>
                                <asp:CheckBox ID="cbShowProgram" runat="server" class="form-check-input" Text=" Show My Goal" />

                            </div>
                            <div class="form-check col-sm-6">
                                <label class="form-check-label"></label>
                                <asp:CheckBox ID="cbShowLevel" runat="server" class="form-check-input" Text=" Show My Level" />
                            </div>
                        </div>
                    <asp:Button ID="Button3" runat="server" class="btn btn-secondary c_y mt-5" Text="Save changes" OnClick="btnSubmitProfile_Click" />
                    </div>
                    <a name="account"></a>
                </div>
            </div>
        </div>

    </div>
    <!-- end HEADER -->
    <div class="container-fluid container-fluid-w">
        <div class="container container-account no-padding">
            <div class="row">
                <div class="col-md-8 push-md-4">
                    <h1 class="c_y">Account</h1>
                    <div id="divViewAccount" runat="server">
                        <p class="text-right">
                        <asp:LinkButton ID="lbEditAccount" runat="server" Text="Edit >" OnClick="lbEditAccount_Click"></asp:LinkButton>
                        </p>
						<div class="form-group row">
                            <label for="profile-email-input" class="col-3 col-form-label"><b>Email</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </div>
                            <label for="profile-email-input" class="col-3 col-form-label"><b>Password</b></label>
                            <div class="col-9 mb-2">
                                <asp:Label ID="lblPassword" runat="server" Text="********"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div id="divEditAccount" runat="server" visible="false">
                        <p class="text-right">
                        <asp:LinkButton ID="lbCancelEditAccount" runat="server" Text="Cancel >" OnClick="lbCancelEditAccount_Click" CausesValidation="false"></asp:LinkButton>
                        </p>
						<div class="form-group row">
                            <label for="profile-email-input" class="col-3 col-form-label">Email</label>
                            <div class="col-9">
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvUserName" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            </div>
                            <label for="profile-email-input" class="col-3 col-form-label">Password</label>
                            <div class="col-9 mb-2">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                            </div>
                            <label for="profile-email-input" class="col-3 col-form-label">Confirm Password</label>
                            <div class="col-9">
                                <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                            </div>
                    <asp:Button ID="Button2" runat="server" class="btn btn-secondary c_y mt-5" Text="Save changes" OnClick="btnSubmitAccount_Click" />
                        </div>

                    </div>

                    <hr />

                    <a name="personal"></a>
                    <h1 class="c_y">Personal Information</h1>
                    <div id="divViewPersonal" runat="server">
                        <p class="text-right">
                        <asp:LinkButton ID="lbEditPersonal" runat="server" Text="Edit >" OnClick="lbEditPersonal_Click"></asp:LinkButton>
                        </p>
						<div class="form-group row">
                            <label for="profile-search-input" class="col-3 col-form-label"><b>Gender</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblGender" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-email-input" class="col-3 col-form-label"><b>Birthday</b></label>
                            <div class="col-9">

                                <asp:Label ID="lblDoB" runat="server"></asp:Label>



                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-text-input" class="col-3 col-form-label"><b>Mobile</b></label>
                            <div class="col-9">
                                <asp:Label ID="lblMobile" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-url-input" class="col-3 col-form-label"><b>Other</b></label>
                            <div class="col-md-4 col-12">
                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label"><b>Street Address</b></div>
                            <div class="col-md-4 col-12">
                                <asp:Label ID="lblStreetAddress" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label"><b>Suburb</b></div>
                            <div class="col-md-4 col-12">
                                <asp:Label ID="lblSuburb" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label"><b>State</b></div>
                            <div class="col-md-4 col-12">
                                <asp:Label ID="lblState" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label"><b>Country</b></div>
                            <div class="col-md-4 col-12">
                                <asp:Label ID="lblCountry" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label"><b>Postcode</b></div>
                            <div class="col-md-4 col-12">
                                <asp:Label ID="lblPostCode" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div id="divEditPersonal" runat="server" visible="false">
                        <p class="text-right">
                        <asp:LinkButton ID="lbCancelEditPersonal" runat="server" Text="Cancel >" OnClick="lbCancelEditPersonal_Click" CausesValidation="false"></asp:LinkButton>
                        </p>
						<div class="form-group row">
                            <label for="profile-search-input" class="col-3 col-form-label">Gender</label>
                            <div class="col-9">
                                <asp:RadioButtonList ID="RdoGender" runat="server" RepeatDirection="Horizontal" Width="176px">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RfvGender" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="RdoGender"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-email-input" class="col-3 col-form-label">Birthday</label>
                            <div class="col-9">
                                <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label1" runat="server" Text="(mm/dd/yyyy)"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-text-input" class="col-3 col-form-label">Mobile</label>
                            <div class="col-9">
                                <asp:TextBox ID="tbMobile" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbMobile"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                                    ValidationExpression="^\d*\.?\d+$" ControlToValidate="tbMobile"
                                    ErrorMessage="* Value must be a  number" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="profile-url-input" class="col-3 col-form-label">Phone</label>
                            <div class="col-md-4 col-12">
                                <asp:TextBox ID="tbPhone" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label">Street Address</div>
                            <div class="col-md-4 col-12">
                                <asp:TextBox ID="tbStreetAddress" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbStreetAddress"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label">Suburb</div>
                            <div class="col-md-4 col-12">
                                <asp:TextBox ID="tbSuburb" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbSuburb"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label">State</div>
                            <div class="col-md-4 col-12">
                                <asp:TextBox ID="tbState" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbState"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label">Country</div>
                            <div class="col-md-4 col-12">
                                <asp:TextBox ID="tbCountry" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbCountry"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-3 col-form-label">Postcode</div>
                            <div class="col-md-4 col-12">
                                <asp:TextBox ID="tbPostCode" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="* Required"
                                    ForeColor="#FF3300" ControlToValidate="tbPostCode"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    <asp:Button ID="Button1" runat="server" class="btn btn-secondary c_y mt-5" Text="Save changes" OnClick="btnSubmitPersonal_Click" />
                    </div>

                <asp:Label ID="lblMsg" runat="server" ForeColor="#CC3300"></asp:Label>


                </div>
            </div>
        </div>
    </div>
</div>
