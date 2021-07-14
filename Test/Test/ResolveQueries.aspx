<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ResolveQueries.aspx.cs" Inherits="ResolveQueries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:Label ID="Label5" runat="server" Text="Resolve Queries" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large"></asp:Label>

    </div>
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Query ID</label>
                        <div class="col-md-10">
                            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="149px" CssClass="form-control" Height="118px"></asp:ListBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Email ID</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label">Query</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label">Resolution</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Submit" CssClass="btn btn-default" OnClick="Button1_Click" />

                        </div>
                    </div>
                </div>

            </section>
        </div>
    </div>
</asp:Content>

