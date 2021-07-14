<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgencyUpdatInfo.aspx.cs" Inherits="AgencyUpdatInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style>
        .parent {
            height: 750px;
            width: 900px;
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

    <form id="form1" runat="server" method="post">
        <div class="parent">

            <div class="form-horizontal">
                <h2 style="color: white;">Update Personal Info</h2>
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="email" CssClass="a col-md-2 control-label">Email Id</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="email" CssClass="form-control" Width="263px" Enabled="False" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                            CssClass="text-danger" ErrorMessage="The email id field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <label class="a col-md-2 control-label">Name</label>
                    <div class="col-md-10">
                        <div class="col-md-4">
                            <input type="text" class="form-control" placeholder="First Name" name="fnm" id="fnm" runat="server" />
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" placeholder="Middle Name" name="mnm" id="mnm" runat="server" />
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" placeholder="Last Name" name="lnm" id="lnm" runat="server" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="a col-md-2 control-label">Phone Number</label>
                    <div class="col-md-10">
                        <input type="tel" id="phn" name="phn" runat="server" class="form-control" pattern="^\d{10}$" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="a col-md-2 control-label">Agency Name</label>
                    <div class="col-md-10">
                        <input type="text" name="agn" id="agn" runat="server" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="a col-md-2 control-label">Address</label>
                    <div class="col-md-10">
                        <textarea rows="3" cols="60" placeholder="street No ,Area" name="addr" id="addr" runat="server" class="form-control" />
                    </div>
                </div>
                <br />

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="a col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="a col-md-2 control-label">Confirm password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="update_Info" Text="Update" CssClass="btn btn-default" />
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
