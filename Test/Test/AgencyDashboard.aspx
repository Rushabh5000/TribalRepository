<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLoginMaster.master" AutoEventWireup="true" CodeFile="AgencyDashboard.aspx.cs" Inherits="AgencyDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
    .heading {
            width: 250px;
            left: 0;
            position: absolute;
            height: 60px;
            border: 2px solid brown;
            background-color: brown;
            float: left;
            border-right-color: black;
            text-align: left;
        }

        .v1 {
            margin-left: 127px;
            position: absolute;
            height: 60px;
            width: 100%;
            border: 5px solid brown;
            text-align: center;
            background-color: brown;
        }

        .sidenav {
            margin-top: 60px;
            position: absolute;
            z-index:1;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            
        }

            .sidenav a {
                padding: 12px;
                text-decoration: none;
                font-size: 18px;
                color: #818181;
                display: block;
            }

                .sidenav a:hover {
                    color: #f1f1f1;
                }

        .main1 {
            margin-left: 100px;
            margin-top: 75px;            
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

                .sidenav a {
                    font-size: 18px;
                }
        }

        #contentshow {
            padding: 0px;
            top:100px;
            height: auto;
            width: 100%;
            height: 550px;
        }

        h3 {
            color: yellow;
        }
        h2
        {
            margin-left:-180px;
            color: yellow;
        }
    </style>

    <div class="heading">
        <h3>Agency Dashboard</h3>
    </div>
    <div class="v1">
        <%=_content %>
    </div>
    <div class="sidenav">
        <a href="AgencyDashboard.aspx">Home</a>
        <hr />
        <a href="AddEvent.aspx" target="targetframe">Add Event</a>
        <hr />
        <a href="AgencyViewEvents.aspx" target="targetframe">View Events</a>
        <hr />
        <a href="AgencyUpdatInfo.aspx" target="targetframe">Update Personal Info</a>
        <hr />
        <a href="RaiseQuery.aspx" target="targetframe">Raise Support Ticket</a>
        <hr />
        <a href="Logout.aspx">Logout</a>
    </div>

    <div class="main1">
        <iframe name="targetframe" allowtransparency="true" scrolling="yes" frameborder="0" id="contentshow"></iframe>
    </div>
</asp:Content>

