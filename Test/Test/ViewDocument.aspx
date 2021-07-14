<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewDocument.aspx.cs" Inherits="ViewDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
            <div>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large" Text="View Documents"></asp:Label>
                
            </div>
        <hr />
            <asp:Label ID="Label1" runat="server" Text="Document for Youth Email ID  " Font-Bold="True" Font-Names="Calibri" Font-Size="Medium"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium"></asp:Label>
            <br /><br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                ForeColor="Black" GridLines="Vertical" Font-Names="Calibri" Font-Size="Large" HorizontalAlign="Center">
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <AlternatingRowStyle BackColor="#CCCCCC" />

                <Columns>    
                    <asp:BoundField DataField="Talent" HeaderText="Talent" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Large" SortExpression="Talent" ItemStyle-Width="100px"/>
                    <asp:TemplateField HeaderText="Document">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="500px" Width="500px"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
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

