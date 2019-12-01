<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ex_01.aspx.cs" Inherits="Work_01.Ex_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-12">
                <h2>Add New </h2>
                <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered" runat="server" Width="100%" AutoGenerateRows="False" DataKeyNames="productId" DataSourceID="dsProducts" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting" >
                    <Fields>
                        <asp:BoundField DataField="productId" HeaderText="productId" InsertVisible="False" ReadOnly="True" SortExpression="productId" />
                        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                        <asp:BoundField DataField="unitPrice" HeaderText="unitPrice" SortExpression="unitPrice" />
                        <asp:TemplateField HeaderText="picture" SortExpression="picture">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("picture") %>' />
                                
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:TESTDBConnection %>" DeleteCommand="DELETE FROM [tblProductNew] WHERE [productId] = @productId" InsertCommand="INSERT INTO [tblProductNew] ([productName], [unitPrice], [picture]) VALUES (@productName, @unitPrice, @picture)" SelectCommand="SELECT * FROM [tblProductNew]" UpdateCommand="UPDATE [tblProductNew] SET [productName] = @productName, [unitPrice] = @unitPrice, [picture] = @picture WHERE [productId] = @productId">
                    <DeleteParameters>
                        <asp:Parameter Name="productId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="productName" Type="String" />
                        <asp:Parameter Name="unitPrice" Type="Decimal" />
                        <asp:Parameter Name="picture" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="productName" Type="String" />
                        <asp:Parameter Name="unitPrice" Type="Decimal" />
                        <asp:Parameter Name="picture" Type="String" />
                        <asp:Parameter Name="productId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-md-12">
                <h2>Product List</h2>
            </div>
        </div>
    </form>
    
</body>
</html>
