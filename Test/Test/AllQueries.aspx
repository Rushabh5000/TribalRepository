<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="AllQueries.aspx.cs" Inherits="AllQueries" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .WrapText {
            width: 100%;
            word-break: break-word;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <div>
                <asp:Label ID="Label1" runat="server" Text="All Queries" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large"></asp:Label>

            </div>
            <br />
            <div class="WrapText">
                <asp:GridView ID="GridView1" AllowSorting="True" OnSorting="GridView1_Sorting" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="X-Large" HorizontalAlign="Center">
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />

                    <Columns>
                        <asp:BoundField DataField="query_id" HeaderText="Query ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="query_id" ItemStyle-Width="80px" />
                        <asp:BoundField DataField="email" HeaderText="Email Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="email" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="message" HeaderText="Query Message" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="message" />

                        <asp:BoundField DataField="resolution" HeaderText="Resolution" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="resolution" />
                        <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="status" ItemStyle-Width="120px" />
                        <asp:BoundField DataField="timestamp" HeaderText="Query Log Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="timestamp" ItemStyle-Width="120px" />

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
        </div>
    </form>
</body>
</html>
