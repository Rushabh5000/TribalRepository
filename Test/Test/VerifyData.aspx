<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="VerifyData.aspx.cs" Inherits="VerifyData" %>

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
            <asp:Label ID="Label1" runat="server" Text="Verify Profiles" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large"></asp:Label>
        </div>
        <br />
        <div class="WrapText">
            <asp:GridView ID="GridView1" AllowSorting="True" OnSorting="GridView1_Sorting" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <AlternatingRowStyle BackColor="#CCCCCC" />

                <Columns>
                    <asp:BoundField DataField="pid" HeaderText="Profile ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="pid" />
                    <asp:BoundField DataField="Name" HeaderText="Youth / Agency Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Name" />
                    <asp:BoundField DataField="Age" HeaderText="Youth Age" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Age" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Contact Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="150px" SortExpression="Address" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="80px" SortExpression="Role" />
                    <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="80px" SortExpression="Status" />
                    <asp:BoundField DataField="Comment" HeaderText="Comment" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="Comment">
                        <ItemStyle HorizontalAlign="Center" Font-Size="Large"></ItemStyle>
                    </asp:BoundField>

                    <asp:ButtonField ButtonType="Button" CommandName="Verify" HeaderText="Verify" ShowHeader="True" Text="Verify" />

                    <asp:CommandField ShowEditButton="true" ButtonType="Button" HeaderText="Add Comment" EditText="Add Comment" />

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

