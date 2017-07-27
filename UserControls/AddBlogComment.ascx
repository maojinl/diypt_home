<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddBlogComment.ascx.cs" Inherits="UserControls_AddBlogComment" %>
<div class="reply-section reply-section-form" id="divReply" runat="server">
    <asp:Image ID="commentImage" class="reply-pic" runat="server" Width="84" Height="84" />
    <div class="reply-info">
        <div class="reply-name">
            <asp:Label ID="commentName" runat="server"></asp:Label>
        </div>
        <div class="reply-level">
            <asp:Label ID="commentPlan" runat="server"></asp:Label>
        </div>
    </div>
    <div class="form-blog-reply">
        <asp:TextBox ID="commentText" runat="server" class="form-control" placeholder="Add your comment"
            TextMode="MultiLine" Rows="5"></asp:TextBox>
        <fieldset>
            <br />
            <asp:Button ID="btnSubmit" class="btn  btn-secondary sec" runat="server" Text="POST COMMENT > " OnClick="btnSubmit_Click" />
        </fieldset>
    </div>
</div>
