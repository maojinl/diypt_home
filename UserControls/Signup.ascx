<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Signup.ascx.cs" Inherits="UserControls_Signup" %>
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
        if (owner.options[owner.selectedIndex].value == "No") {
            q4Detail.style.display = "none";
            q5Detail.style.display = "none";
        }
        else {
            q4Detail.style.display = "";
            q5Detail.style.display = "";
        }
    }
    function changeQ6(owner) {
        if (owner.options[owner.selectedIndex].value == "No")
            q6Detail.style.display = "none";
        else
            q6Detail.style.display = "";
    }

</script>
<div class="container-fluid container-fluid-w">
    <div class="container container-registration-form">
        <h1 class="c_y">General Details - Full program
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
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>New Zealand</asp:ListItem>
					<asp:ListItem>Afghanistan</asp:ListItem>
<asp:ListItem>Albania</asp:ListItem>
<asp:ListItem>Algeria</asp:ListItem>
<asp:ListItem>American Samoa</asp:ListItem>
<asp:ListItem>Andorra</asp:ListItem>
<asp:ListItem>Angola</asp:ListItem>
<asp:ListItem>Anguilla</asp:ListItem>
<asp:ListItem>Antigua and Barbuda</asp:ListItem>
<asp:ListItem>Argentina</asp:ListItem>
<asp:ListItem>Armenia</asp:ListItem>
<asp:ListItem>Aruba</asp:ListItem>
<asp:ListItem>Austria</asp:ListItem>
<asp:ListItem>Azerbaijan</asp:ListItem>
<asp:ListItem>The Bahamas</asp:ListItem>
<asp:ListItem>Bahrain</asp:ListItem>
<asp:ListItem>Bangladesh</asp:ListItem>
<asp:ListItem>Barbados</asp:ListItem>
<asp:ListItem>Belarus</asp:ListItem>
<asp:ListItem>Belgium</asp:ListItem>
<asp:ListItem>Belize</asp:ListItem>
<asp:ListItem>Benin</asp:ListItem>
<asp:ListItem>Bermuda</asp:ListItem>
<asp:ListItem>Bhutan</asp:ListItem>
<asp:ListItem>Bolivia</asp:ListItem>
<asp:ListItem>Bosnia and Herzegovina</asp:ListItem>
<asp:ListItem>Botswana</asp:ListItem>
<asp:ListItem>Brazil</asp:ListItem>
<asp:ListItem>Brunei</asp:ListItem>
<asp:ListItem>Bulgaria</asp:ListItem>
<asp:ListItem>Burkina Faso</asp:ListItem>
<asp:ListItem>Burundi</asp:ListItem>
<asp:ListItem>Cambodia</asp:ListItem>
<asp:ListItem>Cameroon</asp:ListItem>
<asp:ListItem>Canada</asp:ListItem>
<asp:ListItem>Cape Verde</asp:ListItem>
<asp:ListItem>Cayman Islands</asp:ListItem>
<asp:ListItem>Central African Republic</asp:ListItem>
<asp:ListItem>Chad</asp:ListItem>
<asp:ListItem>Chile</asp:ListItem>
<asp:ListItem>People 's Republic of China</asp:ListItem>
<asp:ListItem>Republic of China</asp:ListItem>
<asp:ListItem>Christmas Island</asp:ListItem>
<asp:ListItem>Cocos(Keeling) Islands</asp:ListItem>
<asp:ListItem>Colombia</asp:ListItem>
<asp:ListItem>Comoros</asp:ListItem>
<asp:ListItem>Congo</asp:ListItem>
<asp:ListItem>Cook Islands</asp:ListItem>
<asp:ListItem>Costa Rica</asp:ListItem>
<asp:ListItem>Cote d'Ivoire</asp:ListItem>
<asp:ListItem>Croatia</asp:ListItem>
<asp:ListItem>Cuba</asp:ListItem>
<asp:ListItem>Cyprus</asp:ListItem>
<asp:ListItem>Czech Republic</asp:ListItem>
<asp:ListItem>Denmark</asp:ListItem>
<asp:ListItem>Djibouti</asp:ListItem>
<asp:ListItem>Dominica</asp:ListItem>
<asp:ListItem>Dominican Republic</asp:ListItem>
<asp:ListItem>Ecuador</asp:ListItem>
<asp:ListItem>Egypt</asp:ListItem>
<asp:ListItem>El Salvador</asp:ListItem>
<asp:ListItem>Equatorial Guinea</asp:ListItem>
<asp:ListItem>Eritrea</asp:ListItem>
<asp:ListItem>Estonia</asp:ListItem>
<asp:ListItem>Ethiopia</asp:ListItem>
<asp:ListItem>Falkland Islands</asp:ListItem>
<asp:ListItem>Faroe Islands</asp:ListItem>
<asp:ListItem>Fiji</asp:ListItem>
<asp:ListItem>Finland</asp:ListItem>
<asp:ListItem>France</asp:ListItem>
<asp:ListItem>French Polynesia</asp:ListItem>
<asp:ListItem>Gabon</asp:ListItem>
<asp:ListItem>The Gambia</asp:ListItem>
<asp:ListItem>Georgia</asp:ListItem>
<asp:ListItem>Germany</asp:ListItem>
<asp:ListItem>Ghana</asp:ListItem>
<asp:ListItem>Gibraltar</asp:ListItem>
<asp:ListItem>Greece</asp:ListItem>
<asp:ListItem>Greenland</asp:ListItem>
<asp:ListItem>Grenada</asp:ListItem>
<asp:ListItem>Guadeloupe</asp:ListItem>
<asp:ListItem>Guam</asp:ListItem>
<asp:ListItem>Guatemala</asp:ListItem>
<asp:ListItem>Guernsey</asp:ListItem>
<asp:ListItem>Guinea</asp:ListItem>
<asp:ListItem>Guinea - Bissau</asp:ListItem>
<asp:ListItem>Guyana</asp:ListItem>
<asp:ListItem>Haiti</asp:ListItem>
<asp:ListItem>Honduras</asp:ListItem>
<asp:ListItem>Hong Kong</asp:ListItem>
<asp:ListItem>Hungary</asp:ListItem>
<asp:ListItem>Iceland</asp:ListItem>
<asp:ListItem>India</asp:ListItem>
<asp:ListItem>Indonesia</asp:ListItem>
<asp:ListItem>Iran</asp:ListItem>
<asp:ListItem>Iraq</asp:ListItem>
<asp:ListItem>Ireland</asp:ListItem>
<asp:ListItem>Israel</asp:ListItem>
<asp:ListItem>Italy</asp:ListItem>
<asp:ListItem>Jamaica</asp:ListItem>
<asp:ListItem>Japan</asp:ListItem>
<asp:ListItem>Jersey</asp:ListItem>
<asp:ListItem>Jordan</asp:ListItem>
<asp:ListItem>Kazakhstan</asp:ListItem>
<asp:ListItem>Kenya</asp:ListItem>
<asp:ListItem>Kiribati</asp:ListItem>
<asp:ListItem>North Korea</asp:ListItem>
<asp:ListItem>South Korea</asp:ListItem>
<asp:ListItem>Kosovo</asp:ListItem>
<asp:ListItem>Kuwait</asp:ListItem>
<asp:ListItem>Kyrgyzstan</asp:ListItem>
<asp:ListItem>Laos</asp:ListItem>
<asp:ListItem>Latvia</asp:ListItem>
<asp:ListItem>Lebanon</asp:ListItem>
<asp:ListItem>Lesotho</asp:ListItem>
<asp:ListItem>Liberia</asp:ListItem>
<asp:ListItem>Libya</asp:ListItem>
<asp:ListItem>Liechtenstein</asp:ListItem>
<asp:ListItem>Lithuania</asp:ListItem>
<asp:ListItem>Luxembourg</asp:ListItem>
<asp:ListItem>Macau</asp:ListItem>
<asp:ListItem>Macedonia</asp:ListItem>
<asp:ListItem>Madagascar</asp:ListItem>
<asp:ListItem>Malawi</asp:ListItem>
<asp:ListItem>Malaysia</asp:ListItem>
<asp:ListItem>Maldives</asp:ListItem>
<asp:ListItem>Mali</asp:ListItem>
<asp:ListItem>Malta</asp:ListItem>
<asp:ListItem>Marshall Islands</asp:ListItem>
<asp:ListItem>Martinique</asp:ListItem>
<asp:ListItem>Mauritania</asp:ListItem>
<asp:ListItem>Mauritius</asp:ListItem>
<asp:ListItem>Mayotte</asp:ListItem>
<asp:ListItem>Mexico</asp:ListItem>
<asp:ListItem>Micronesia</asp:ListItem>
<asp:ListItem>Moldova</asp:ListItem>
<asp:ListItem>Monaco</asp:ListItem>
<asp:ListItem>Mongolia</asp:ListItem>
<asp:ListItem>Montenegro</asp:ListItem>
<asp:ListItem>Montserrat</asp:ListItem>
<asp:ListItem>Morocco</asp:ListItem>
<asp:ListItem>Mozambique</asp:ListItem>
<asp:ListItem>Myanmar</asp:ListItem>
<asp:ListItem>Nagorno - Karabakh</asp:ListItem>
<asp:ListItem>Namibia</asp:ListItem>
<asp:ListItem>Nauru</asp:ListItem>
<asp:ListItem>Nepal</asp:ListItem>
<asp:ListItem>Netherlands</asp:ListItem>
<asp:ListItem>Netherlands Antilles</asp:ListItem>
<asp:ListItem>New Caledonia</asp:ListItem>
<asp:ListItem>Nicaragua</asp:ListItem>
<asp:ListItem>Niger</asp:ListItem>
<asp:ListItem>Nigeria</asp:ListItem>
<asp:ListItem>Niue</asp:ListItem>
<asp:ListItem>Norfolk Island</asp:ListItem>
<asp:ListItem>Turkish Republic of Northern Cyprus</asp:ListItem>
<asp:ListItem>Northern Mariana</asp:ListItem>
<asp:ListItem>Norway</asp:ListItem>
<asp:ListItem>Oman</asp:ListItem>
<asp:ListItem>Pakistan</asp:ListItem>
<asp:ListItem>Palau</asp:ListItem>
<asp:ListItem>Palestine</asp:ListItem>
<asp:ListItem>Panama</asp:ListItem>
<asp:ListItem>Papua New Guinea</asp:ListItem>
<asp:ListItem>Paraguay</asp:ListItem>
<asp:ListItem>Peru</asp:ListItem>
<asp:ListItem>Philippines</asp:ListItem>
<asp:ListItem>Pitcairn Islands</asp:ListItem>
<asp:ListItem>Poland</asp:ListItem>
<asp:ListItem>Portugal</asp:ListItem>
<asp:ListItem>Puerto Rico</asp:ListItem>
<asp:ListItem>Qatar</asp:ListItem>
<asp:ListItem>Romania</asp:ListItem>
<asp:ListItem>Russia</asp:ListItem>
<asp:ListItem>Rwanda</asp:ListItem>
<asp:ListItem>Saint Barthelemy</asp:ListItem>
<asp:ListItem>Saint Helena</asp:ListItem>
<asp:ListItem>Saint Kitts and Nevis</asp:ListItem>
<asp:ListItem>Saint Lucia</asp:ListItem>
<asp:ListItem>Saint Martin</asp:ListItem>
<asp:ListItem>Saint Pierre and Miquelon</asp:ListItem>
<asp:ListItem>Saint Vincent and the Grenadines</asp:ListItem>
<asp:ListItem>Samoa</asp:ListItem>
<asp:ListItem>San Marino</asp:ListItem>
<asp:ListItem>Sao Tome and Principe</asp:ListItem>
<asp:ListItem>Saudi Arabia</asp:ListItem>
<asp:ListItem>Senegal</asp:ListItem>
<asp:ListItem>Serbia</asp:ListItem>
<asp:ListItem>Seychelles</asp:ListItem>
<asp:ListItem>Sierra Leone</asp:ListItem>
<asp:ListItem>Singapore</asp:ListItem>
<asp:ListItem>Slovakia</asp:ListItem>
<asp:ListItem>Slovenia</asp:ListItem>
<asp:ListItem>Solomon Islands</asp:ListItem>
<asp:ListItem>Somalia</asp:ListItem>
<asp:ListItem>Somaliland</asp:ListItem>
<asp:ListItem>South Africa</asp:ListItem>
<asp:ListItem>South Ossetia</asp:ListItem>
<asp:ListItem>Spain</asp:ListItem>
<asp:ListItem>Sri Lanka</asp:ListItem>
<asp:ListItem>Sudan</asp:ListItem>
<asp:ListItem>Suriname</asp:ListItem>
<asp:ListItem>Svalbard</asp:ListItem>
<asp:ListItem>Swaziland</asp:ListItem>
<asp:ListItem>Sweden</asp:ListItem>
<asp:ListItem>Switzerland</asp:ListItem>
<asp:ListItem>Syria</asp:ListItem>
<asp:ListItem>Taiwan</asp:ListItem>
<asp:ListItem>Tajikistan</asp:ListItem>
<asp:ListItem>Tanzania</asp:ListItem>
<asp:ListItem>Thailand</asp:ListItem>
<asp:ListItem>Timor - Leste</asp:ListItem>
<asp:ListItem>Togo</asp:ListItem>
<asp:ListItem>Tokelau</asp:ListItem>
<asp:ListItem>Tonga</asp:ListItem>
<asp:ListItem>Transnistria Pridnestrovie</asp:ListItem>
<asp:ListItem>Trinidad and Tobago</asp:ListItem>
<asp:ListItem>Tristan da Cunha</asp:ListItem>
<asp:ListItem>Tunisia</asp:ListItem>
<asp:ListItem>Turkey</asp:ListItem>
<asp:ListItem>Turkmenistan</asp:ListItem>
<asp:ListItem>Turks and Caicos Islands</asp:ListItem>
<asp:ListItem>Tuvalu</asp:ListItem>
<asp:ListItem>Uganda</asp:ListItem>
<asp:ListItem>Ukraine</asp:ListItem>
<asp:ListItem>United Arab Emirates</asp:ListItem>
<asp:ListItem>United Kingdom</asp:ListItem>
<asp:ListItem>United States</asp:ListItem>
<asp:ListItem>Uruguay</asp:ListItem>
<asp:ListItem>Uzbekistan</asp:ListItem>
<asp:ListItem>Vanuatu</asp:ListItem>
<asp:ListItem>Vatican City</asp:ListItem>
<asp:ListItem>Venezuela</asp:ListItem>
<asp:ListItem>Vietnam</asp:ListItem>
<asp:ListItem>British Virgin Islands</asp:ListItem>
<asp:ListItem>Isle of Man</asp:ListItem>
<asp:ListItem>US Virgin Islands</asp:ListItem>
<asp:ListItem>Wallis and Futuna</asp:ListItem>
<asp:ListItem>Western Sahara</asp:ListItem>
<asp:ListItem>Yemen</asp:ListItem>
<asp:ListItem>Zambia</asp:ListItem>
<asp:ListItem>Zimbabwe</asp:ListItem>
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
            <div class="col-md-2 col-12 col-form-label">Password</div>
            <div class="col-md-4 col-12">
                <asp:TextBox class="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-md-2 col-12 col-form-label">Confirm password</div>
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
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem Value="Lose Weight">Lose weight and increase fitness</asp:ListItem>
                    <asp:ListItem Value="Build Muscle">Build muscle and get bigger</asp:ListItem>
                    <asp:ListItem Value="Tone Up">Tone up and be body confident</asp:ListItem>
                </asp:DropDownList>


            </div>
        </fieldset>
        <h6>2. Where would you prefer to exercise for your DIYPT program?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem Value="Gym">Gym</asp:ListItem>
                    <asp:ListItem Value="Home">Home</asp:ListItem>
                </asp:DropDownList>


            </div>
        </fieldset>

        <h6 runat="server" id="Q3">3. Do you have any dietary requirements?</h6>

        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlQ3" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem Value="No">No</asp:ListItem>
                    <asp:ListItem Value="Vegetarian">Vegetarian</asp:ListItem>
                    <asp:ListItem Value="Vegan">Vegan</asp:ListItem>
                    <asp:ListItem Value="Gluten intolerant">Gluten intolerant</asp:ListItem>
                    <asp:ListItem Value="Nut allergy">Nut allergy</asp:ListItem>

                </asp:DropDownList>


            </div>
        </fieldset>


        <h6 runat="server" id="Q4">4. Do you have any medical conditions that will prevent/disrupt you from training?</h6>


        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlQ4" runat="server" CssClass="form-control" onchange="changeQ4(this)">
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                    <asp:ListItem Value="No">No</asp:ListItem>

                </asp:DropDownList>

                <div id="q4Detail" name="q4Detail" style="display: none;">
                    <br />
                    <p>Please specify:</p>
                    <textarea class="form-control" runat="server" id="regQ4" rows="3 "></textarea>
                </div>
            </div>
        </fieldset>




        <div id="q5Detail" name="q5Detail" style="display: none;">
            <h6 runat="server" id="Q5">If you believe you can still exercise, please write an explanation below.</h6>

            <fieldset class="form-group row">
                <div class="col-md-8">
                    <textarea class="form-control " id="regQ5" runat="server" rows="3 "></textarea>


                </div>
            </fieldset>
        </div>
        <h6>5. Are you currently on any medication ?</h6>
        <fieldset class="form-group row">
            <div class="col-md-8">
                <asp:DropDownList ID="ddlQ6" runat="server" CssClass="form-control" onchange="changeQ6(this)">
                    <asp:ListItem Value="">Please select</asp:ListItem>
                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                    <asp:ListItem Value="No">No</asp:ListItem>
                </asp:DropDownList>

                <div id="q6Detail" style="display: none;">
                    <br />
                    <p>Please specify:</p>
                    <textarea class="form-control " runat="server" id="regQ6" rows="3 "></textarea>
                </div>
            </div>
        </fieldset>


        <hr class="mt-5 mb-2" />
        <asp:Button ID="btnSubmit" runat="server" class="btn btn-secondary c_y mt-5 sec" Text="Register Now" OnClick="btnSubmit_Click" />
    </div>
</div>



&nbsp;
                              
</div>


              
