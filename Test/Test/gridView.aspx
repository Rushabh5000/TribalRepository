<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gridView.aspx.cs" Inherits="gridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" AllowSorting="True" OnRowCommand="GridView1_RowCommand" OnSorting="GridView1_Sorting" DataKeyNames="Id" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <AlternatingRowStyle BackColor="#CCCCCC" />

                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Serial No" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
                        <ItemStyle HorizontalAlign="Center" Font-Size="X-Large"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="200" Width="200" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">
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
                    <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="X-Large">

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
</asp:Content>

