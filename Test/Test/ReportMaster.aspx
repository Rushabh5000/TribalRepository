<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ReportMaster.aspx.cs" Inherits="ReportMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style type="text/css">
        .WrapText {
            width: 100%;
            word-break: break-word;
        }
    </style>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Master Report" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large"></asp:Label>
        
    </div>
    <hr />
    <div class="form-group">
            <label>Download Report in </label>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="ddlFileFormat" CssClass="form-control" runat="server">
                <asp:ListItem Text="PDF" Value=".pdf"></asp:ListItem>
                <asp:ListItem Text="WORD" Value=".doc"></asp:ListItem>
                <asp:ListItem Text="EXCEL" Value=".xls"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <div >
                <asp:Button ID="btnDownload" runat="server" OnClick="Button1_Click" Text="Download Report" CssClass="btn btn-default" />
            </div>
        </div>

    <br />
    <div class="WrapText">
        <asp:GridView ID="GridView1" AllowSorting="True" OnSorting="GridView1_Sorting" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" OnPageIndexChanging="GridView1_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <AlternatingRowStyle BackColor="#CCCCCC" />

            <Columns>
                <asp:BoundField DataField="pid" HeaderText="Profile ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="pid" />
                <asp:BoundField DataField="Name" HeaderText="Youth / Agency Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Name" />
                <asp:BoundField DataField="Age" HeaderText="Youth Age" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Age" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Contact Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Address" />
                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Email" />
                <asp:BoundField DataField="Role" HeaderText="Role" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="80px" SortExpression="Role" />
                <asp:BoundField DataField="Timestamp" ReadOnly="true" HeaderText="Date Registered" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="Timestamp" />
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
</asp:Content>

