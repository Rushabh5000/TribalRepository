<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEvent.aspx.cs" Inherits="AddEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style>
        .parent {
            height: 650px;
            width: 850px;
            margin-top: -30px;
            margin-left: 100px;
            margin-right: 50px;
            border: 1px solid black;
            background-color: #202040;
        }

        .a {
            color: white;
            font-family: Verdana;
            font-size: 14px;
        }

        hr {
            background-color: black;
            height: 5px;
            margin-left: -20px;
        }

        .form-horizontal {
            padding-left: 20px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="parent">
            <div class="form-horizontal">
                 <h2 style="color:white;">Add Event</h2>
                <hr />
                <div class="form-group" runat="server">
                    <label class="a col-md-2 control-label">Name</label>
                    <div class="col-md-10">
                        <input type="text" name="ename" id="ename" runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="a col-md-2 control-label">Description</label>
                    <div class="col-md-10">
                        <textarea rows="4" cols="50" placeholder="event description" name="descp" id="descp" runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="a col-md-2 control-label">Category</label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="talent" CssClass="form-control" OnSelectedIndexChanged="addTextBox_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            <asp:ListItem Selected="True">Select category</asp:ListItem>
                            <asp:ListItem>Dance</asp:ListItem>
                            <asp:ListItem>Arts</asp:ListItem>
                            <asp:ListItem>Sports</asp:ListItem>
                            <asp:ListItem>Paintaings</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="a col-md-2 control-label">Poster(if any) </label>
                    <div class="col-md-10">
                        <asp:FileUpload ID="poster" accept=".png,.jpg,.jpeg," CssClass="form-control" runat="server" AllowMultiple="True" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="a col-md-2 control-label">Venue</label>
                    <div class="col-md-10">
                        <textarea rows="3" cols="50" placeholder="enter venue name and address" name="venue" id="venue" runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group" runat="server">
                    <label class="a col-md-2 control-label">Start Date</label>
                    <div class="col-md-10">
                        <input type="date" name="sdate" id="sdate" min="@DateTime.Now" runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group" runat="server">
                    <label class="a col-md-2 control-label">End Date</label>
                    <div class="col-md-10">
                        <input type="date" name="edate" id="edate" runat="server" class="form-control" />
                    </div>
                </div>

                <div id="tp" runat="server" class="form-group" style="display: none;">
                    <label class="a col-md-2 control-label">Please Specify </label>
                    <div class="col-md-10">
                        <input type="text" id="txt" name="txt" runat="server" class="form-control" />
                    </div>
                    <br />
                </div>


                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="add_Event" Text="Add" CssClass="btn btn-default" />
                    </div>
                </div>
                <hr/>
            </div>
        </div>
    </form>

</body>
</html>
