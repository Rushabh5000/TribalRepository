<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLoginMaster.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <style>
        .heading {
            width: 100%;
            left: 0;
            position: absolute;
            border: 2px solid brown;
            text-align: center;
            background-color: brown;
            float: left;
            border-right-color: black;
            text-align: center;
        }

        .sidenav {
            margin-top: 60px;
            position: absolute;
            z-index: 1;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
        }

            .sidenav a {
                padding: 5px;
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
            top: 100px;
            height: auto;
            width: 100%;
            height: 550px;
        }

        h3 {
            color: yellow;
        }
    </style>

    <div class="heading">
        <h3>Admin Dashboard</h3>
    </div>
    <div class="v1">
    </div>
    <div class="sidenav">
        <a href="AdminDashboard.aspx" >Home</a>
        <hr />
        <a href="ViewAllEvents.aspx" target="targetframe">View All Events</a>
        <hr />
        <a href="ViewReports.aspx" target="targetframe">View Report</a>
        <hr />
        <a href="ManageProfiles.aspx" target="targetframe">Manage Profiles</a>
        <hr />
        <a href="VerifyData.aspx" target="targetframe">Verify Data</a>
        <hr />
        <a href="VerifyDocument.aspx" target="targetframe">Verify Document</a>
        <hr />
        <a href="AllQueries.aspx" target="targetframe">View All Queries</a>
        <hr />
        <a href="ResolveQueries.aspx" target="targetframe">Resolve Queries</a>

    </div>
    
    <div class="main1">
        <iframe name="targetframe" allowtransparency="true" scrolling="yes" frameborder="0" id="contentshow"></iframe>
    </div>
</asp:Content>

