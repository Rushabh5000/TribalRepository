<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="UserViewEvent.aspx.cs" Inherits="UserViewEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .rptr > table {
            background: #eee;
            font: 14px segoe ui;
            border-collapse: collapse;
            width: 95%;
            margin: 5px;
            float: left;
            margin-top: 60px;
            margin-bottom:20px;
        }

        .rptr table th {
            background: #f90;
            color: #fff;
            padding: 8px 10px;
            text-align: center;
        }

        .rptr table td {
            padding: 5px 10px;
        }

        .parent {
            height: auto;
            width: 950px;
            margin-top: -50px;
            margin-left:10px;
            
            border: 1px solid black;
            background-color: #202040;
        }



        hr {
            background-color: black;
            height: 5px;
            color:black;
            margin-left: -20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="parent">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="rptr">
                        <table>
                            <tr>
                                <th style="border-right: 2px solid white;">Event Details</th>
                                <th style="border-right: 2px solid white;">Event Poster</th>
                                <th>Event Status</th>
                            </tr>
                            <tr>
                                <td style="border-right: 2px solid white;">

                                    <table>
                                         <asp:Label ID="lblID" runat="server" Text='<%#Eval("Id") %>' Style="display:none" />
                                        <tr>
                                            <td>Event Name:</td>
                                            <td><%#Eval("Name") %></td>
                                        </tr>

                                        <tr>
                                            <td>Email:</td>
                                            <td><%#Eval("Email") %></td>
                                        </tr>
                                        <tr>
                                            <td>Start Date :</td>
                                            <td><%#Eval("Startdate") %></td>
                                        </tr>
                                        <tr>
                                            <td>End Date:</td>
                                            <td><%#Eval("Enddate") %></td>
                                        </tr>

                                    </table>
                                </td>
                                <td rowspan="6" style="border-right:2px solid white;">
                                    <asp:Image runat="server" Height="200" Width="400" ImageUrl='<%#GetImage(Eval("Data"))%>' />
                                </td>
                                <td rowspan="6">
                                    <div class="form-group">
                                        <asp:Button ID="b1" runat="server" OnClick="check_interested" BackColor='<%#GetColorIntr(Eval("Id"))%>'  Style="height: 40px;" Text="Interested" CssClass="btn btn-default" />
                                        <asp:Button ID="b2" runat="server" OnClick="check_Going" BackColor='<%#GetColorGoing(Eval("Id"))%>'  Style="height: 40px;" Text="Going" CssClass="btn btn-default" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr/>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
