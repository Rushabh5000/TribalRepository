s<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTalent.aspx.cs" Inherits="AddTalent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style>
        .parent {
            height: 400px;
            width: 850px;
            margin-top: -30px;
            margin-left: 100px;
            margin-right:50px;
            border:1px solid black;
            background-color:#202040;
        }
       
        .a
        {
            color:white;
            font-family:Verdana;
            font-size:14px;
        }

        hr {
            background-color: black;
            height: 5px;
            margin-left:-20px;
        }

        .form-horizontal {
            padding-left:20px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" enableviewstate="true">
        <div class="parent">

            <div class="form-horizontal">
                <h2 style="color:white;">Add Your Talent</h2>
                <hr />
                <div class="form-group">
                    <label class="a col-md-3 control-label">Talent</label>
                    <div class="col-md-6">
                        <asp:DropDownList ID="talent" CssClass="form-control" OnSelectedIndexChanged="addTextBox_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            <asp:ListItem Selected="True">Select Talent</asp:ListItem>
                            <asp:ListItem>Dance</asp:ListItem>
                            <asp:ListItem>Arts</asp:ListItem>
                            <asp:ListItem>Sports</asp:ListItem>
                            <asp:ListItem>Paintaings</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="tp" runat="server" class="form-group" style="display: none;">
                    <label class="a col-md-3 control-label">Please Specify </label>
                    <div class="col-md-6">
                        <input type="text" id="txt" runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="a col-md-3 control-label">Upload Images(if any) </label>
                    <div class="col-md-6">
                        <asp:FileUpload ID="images" accept=".png,.jpg,.jpeg," CssClass="form-control" runat="server" AllowMultiple="True" />

                    </div>
                </div>

                <div class="form-group">
                    <label class="a col-md-3 control-label">Upload Videos(if any) </label>
                    <div class="col-md-6">
                        <asp:FileUpload ID="videos" accept="video/mp4,video/x-m4v,video/*" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-3 col-md-8">
                        <asp:Button runat="server" OnClick="add_Talent" Text="Add" CssClass="btn btn-default" />
                    </div>
                </div>
                <hr/>
            </div>
        </div>
    </form>
   
</body>
</html>
