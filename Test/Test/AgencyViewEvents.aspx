<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgencyViewEvents.aspx.cs" Inherits="AgencyViewEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .parent {
            margin-left: 60px;
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
        #GridView1
        {
            margin-top:30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="parent">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="GridView1_Sorting" DataKeyNames="Id" OnPageIndexChanging="GridView1_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <AlternatingRowStyle BackColor="#CCCCCC" />

                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Serial No" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Event Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Venue" HeaderText="Venue" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>


                    <asp:BoundField DataField="Startdate" HeaderText="Startdate" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">

                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Enddate" HeaderText="Enddate" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Enddate" HeaderText="Enddate" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Interested" HeaderText="Interested" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Going" HeaderText="Going" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>

                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
