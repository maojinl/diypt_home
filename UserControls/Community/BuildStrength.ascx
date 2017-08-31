<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuildStrength.ascx.cs" Inherits="UserControls_Community_BuildStrength" %>

<div id="dvMain" runat="server" class="col-lg-8 chat-group chat-group-y">
    <div class="chat-reply-number float-right">
        <asp:Literal ID="lblPostCount" runat="server"></asp:Literal></div>
    <h2 class="chat-group-title">
        <asp:Image ID="imgGroup" runat="server" class="chat-group-title-icon" /><asp:Literal ID="lblGroup" runat="server"></asp:Literal>
        Chat <asp:Label ID="lblLevel" runat="server"></asp:Label> </h2>
    <div class="reply-section reply-section-form">
        <asp:Image ID="commentImage" class="reply-pic" runat="server" Width="84" Height="84" />
        <div class="reply-info">
            <div class="reply-name">
                <asp:Label ID="commentName" runat="server"></asp:Label></div>
            <div class="reply-level">
                <asp:Label ID="commentPlan" runat="server"></asp:Label></div>
        </div>
        <div class="chat-reply-form">
            <asp:TextBox ID="txtComment" runat="server" class="form-control" placeholder="Add your comment" TextMode="MultiLine" Rows="5"></asp:TextBox>
            <fieldset>
                <asp:LinkButton ID="lbSubmit" runat="server" class="btn  btn-secondary btn-y" OnClick="lbSubmit_Click">POST COMMENT > </asp:LinkButton>
            </fieldset>
        </div>

    </div>

    <asp:Repeater ID="rpComments" runat="server">
        <ItemTemplate>
            <div class="reply-section">
                <asp:Image ID="rpImage" runat="server" class="reply-pic" ImageUrl='<%# Eval("ImageURL") %>' style="height:84px;width:84px;"/>
                <div class="reply-info">
                    <div class="reply-name"><%# Eval("Name") %></div>
                    <div class="reply-level"><%# Eval("Program") %></div>
                    <div class="reply-time"><%# FormatDate(Eval("Time")) %></div>
                </div>
                <p style="margin-left: 130px;"><%# Eval("Comment") %></p>
            </div>


        </ItemTemplate>
    </asp:Repeater>


</div>
<div class="col-lg-4 text-center">
    <div class=" my-group">
        <h2>MY GROUP</h2>
        <div class="relative">
            <asp:Image ID="imgCard" runat="server" class="img-fluid card-icon-img" />
            <div class="card-icon-group">
                <span class="tri-yellow-pg"></span>
                <asp:Image ID="imgIcon" runat="server" />
            </div>
        </div>
        <h4 class="community-chat-title sec">
            <asp:Literal ID="lblGroup2" runat="server"></asp:Literal>
            GROUP</h4>
        <div class="chat-level chat-level-y" runat="server" id="divChatLevel">
            <a class="chat-level-1" runat="server" id="linkBeginner">
                <h5 class="c_y" id="h5Beginner" runat="server">Join Beginner ></h5>

            </a>
            <a class="chat-level-2" runat="server" id="linkIntermediate">
                <h5 class="c_y" id="h5Intermediate" runat="server">Join Intermediates ></h5>

            </a>
            <a class="chat-level-3" runat="server" id="linkAdvance">
                <h5 class="c_w" id="h5Advance" runat="server">Join Advanced ></h5>

            </a>
            <a href="/community">See all groups ></a>
        </div>
    </div>
</div>
