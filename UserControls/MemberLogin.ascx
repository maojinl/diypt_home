<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberLogin.ascx.cs" Inherits="UserControls_MemberLogin" %>
<style type="text/css">
    .auto-style1 {
        height: 34px;
    }
</style>

<div class="row">
        <div class="col-md-6 push-md-3 col-sm-8 push-sm-2">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            
    
            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <asp:TextBox ID="username" runat="server" class="form-control mb-3" placeholder="Email address" required autofocus ></asp:TextBox>
                <asp:TextBox ID="password" runat="server" class="form-control mb-1" TextMode="Password"></asp:TextBox>
                    <div class="error">
        <asp:Label ID="errorLabel" runat="server"></asp:Label>
    </div>
               <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
    <asp:Button ID="btnLogin" runat="server" Text="Sign in" class="btn btn-lg btn-primary btn-block btn-signin" OnClick="btnLogin_Click"  />              
            </form><!-- /form -->
            <a href="/login/reset-password.aspx" class="forgot-password">
                Forgot the password?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->


