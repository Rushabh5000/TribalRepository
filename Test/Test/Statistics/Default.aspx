﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Statistics_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <br />
            <br />
            <div class="container py-4">
                <h4 class="text-uppercase text-center">Chart Control in asp.net</h4>
                <div class="form-group">
                    <label>Select Chart:</label>
                    <asp:DropDownList ID="ddlChart" AutoPostBack="true" runat="server" CssClass="custom-select col-md-4" OnSelectedIndexChanged="ddlChart_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <asp:Chart ID="Chart1" runat="server" Width="450" AlternateText="CHARTS">
                    <Titles>
                        <asp:Title Text="Total Marks of Students"></asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series Name="Series1" ChartArea="ChartArea1"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Talent Name"></AxisX>
                            <AxisY Title="Number of Youth's Having this Talent"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
