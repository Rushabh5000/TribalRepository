<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="VerifyDocument.aspx.cs" Inherits="VerifyDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnRowCommand="GridView1_RowCommand" OnSorting="GridView1_Sorting" DataKeyNames="Email" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
        ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <AlternatingRowStyle BackColor="#CCCCCC" />

        <Columns>
            <asp:BoundField DataField="pid" HeaderText="Profile ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="pid" />
            <asp:BoundField DataField="Name" HeaderText="Youth Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Name" />
            <asp:BoundField DataField="Age" HeaderText="Youth Age" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Age" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Contact Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="100px" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="150px" SortExpression="Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Email" />
            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" ItemStyle-Width="80px" SortExpression="Status" />
            
            <asp:ButtonField CommandName="Select" HeaderText="View Document" ShowHeader="True" Text="View Document" />
            
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
    </asp:Content>

