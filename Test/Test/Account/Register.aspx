<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h2>Create a new account.</h2>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <label class="col-md-2 control-label">Name</label>
            <div class="col-md-10">
                <div class="col-md-3">
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
            <label class="col-md-2 control-label">Phone Number</label>
            <div class="col-md-10">
                <input type="tel" id="phn" name="dob" runat="server" class="form-control" pattern="^\d{10}$" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">Role</label>
            <div class="col-md-10">
                <asp:DropDownList ID="role" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="role_SelectedIndexChanged" runat="server">
                    <asp:ListItem Selected="True">Select Role</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                    <asp:ListItem>Agency</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group" runat="server" id="dobdiv" style="display: none;">
            <label class="col-md-2 control-label">Age</label>
            <div class="col-md-10">
                <input type="text" name="age" id="age" runat="server" class="form-control" />
            </div>
        </div>
        
        <div id="agn" runat="server" class="form-group" style="display: none;">
            <label class="col-md-2 control-label">Agency Name</label>
            <div class="col-md-10">
                <input type="text" id="an" name="an" runat="server" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">Address</label>
            <div class="col-md-10">
                <textarea rows="2" cols="50" placeholder="street No ,Area" name="addr" id="addr" runat="server" class="form-control" />
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-md-2 control-label">State</label>
            <div class="col-md-10">
                <asp:DropDownList ID="state" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="state_SelectedIndexChanged" runat="server">
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-2 control-label">City</label>
            <div class="col-md-10">
                <asp:DropDownList ID="city" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True">Select City</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">Postal Code</label>
            <div class="col-md-10">
                <input type="text" id="pcd" name="pcd" runat="server" class="form-control" pattern="^\d{6}$" required />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email Id</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="email" CssClass="form-control" Width="263px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                    CssClass="text-danger" ErrorMessage="The email id field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
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
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>

