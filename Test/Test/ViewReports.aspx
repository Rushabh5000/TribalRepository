<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewReports.aspx.cs" Inherits="ViewReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Generate Reports" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large"></asp:Label>
    </div>
    <hr />

    <div class="form-group">
        <label>Generate Report for</label>
        <asp:DropDownList ID="reportFor" CssClass="form-control" runat="server">
            <asp:ListItem Selected="True">Select Role</asp:ListItem>
            <asp:ListItem>Youth</asp:ListItem>
            <asp:ListItem>Agency</asp:ListItem>
            <asp:ListItem>Master</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <div >
            <asp:Button runat="server" OnClick="GenerateReport" Text="Generate Report" CssClass="btn btn-default" />

        </div>
    </div>

</asp:Content>

