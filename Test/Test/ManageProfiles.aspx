<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="ManageProfiles.aspx.cs" Inherits="ManageProfiles" %>

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
                <asp:Label ID="Label1" runat="server" Text="Manage Profiles" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large"></asp:Label>

            </div>
            <br />
            <div class="WrapText">
                <asp:GridView ID="GridView1" AllowSorting="True" OnSorting="GridView1_Sorting" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />

                    <Columns>
                        <asp:BoundField DataField="pid" HeaderText="Profile ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="pid" />
                        <asp:BoundField DataField="Name" HeaderText="Youth / Agency Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Name" />
                        <asp:BoundField DataField="Age" HeaderText="Youth Age" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Age" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Contact Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="PhoneNumber" />
                        <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Address" ItemStyle-Width="200px"  />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Email" />
                        <asp:BoundField DataField="Role" HeaderText="Role" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="80px" SortExpression="Role" />
                        <asp:BoundField DataField="Timestamp" ReadOnly="true" HeaderText="Date Registered" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="Timestamp" />

                        <asp:CommandField ShowEditButton="true" HeaderText="Edit Record" ButtonType="Button" ItemStyle-Width="60px" />
                        <asp:CommandField ShowDeleteButton="true" HeaderText="Delete Record" ButtonType="Button" ItemStyle-Width="80px" />

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

