<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="RaiseQuery.aspx.cs" Inherits="RaiseQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large" Text="Raise Support Ticket"></asp:Label>

    </div>
    <hr />
    <div class="form-group">
        <label class="col-md-2 control-label">Email ID</label>
        <div class="col-md-10">
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="form-group">
        <label class="col-md-2 control-label">Query</label>
        <div class="col-md-10">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <asp:Button runat="server" Text="Submit" CssClass="btn btn-default" OnClick="Button1_Click" />

        </div>
    </div>
</asp:Content>

