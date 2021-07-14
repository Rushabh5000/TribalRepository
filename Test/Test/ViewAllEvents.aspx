<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAllEvents.aspx.cs" Inherits="ViewAllEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="GridView1_Sorting" DataKeyNames="Id" OnPageIndexChanging="GridView1_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
            ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="X-Large" HorizontalAlign="Center">
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <AlternatingRowStyle BackColor="#CCCCCC" />

            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Event ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Agency Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Event Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Venue" HeaderText="Venue" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>


                <asp:BoundField DataField="Startdate" HeaderText="Startdate" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">

                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Enddate" HeaderText="Enddate" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Enddate" HeaderText="Enddate" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Interested" HeaderText="Interested" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Going" HeaderText="Going" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large">
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
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
