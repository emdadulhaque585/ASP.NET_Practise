<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ex_02_ImageUploadToDB.aspx.cs" Inherits="Work_01.Ex_02_ImageUploadToDB" %>

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
            <h2>Add New</h2>
            <br />
            <div class="col-md-12">
                <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="productId" DataSourceID="dsProductsNew" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting" >
                    <Fields>
                        <asp:TemplateField HeaderText="productId" InsertVisible="False" SortExpression="productId">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("picture") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                        <asp:BoundField DataField="unitPrice" HeaderText="unitPrice" SortExpression="unitPrice" />
                        <asp:TemplateField HeaderText="picture" SortExpression="picture">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("picture") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsProductsNew" runat="server" ConnectionString="<%$ ConnectionStrings:TESTDBConnection %>" DeleteCommand="DELETE FROM [tblProductNew2] WHERE [productId] = @productId" InsertCommand="INSERT INTO [tblProductNew2] ([productName], [unitPrice], [picture]) VALUES (@productName, @unitPrice, @picture)" SelectCommand="SELECT [productId], [productName], [unitPrice], [picture] FROM [tblProductNew2]" UpdateCommand="UPDATE [tblProductNew2] SET [productName] = @productName, [unitPrice] = @unitPrice, [picture] = @picture WHERE [productId] = @productId">
                    <DeleteParameters>
                        <asp:Parameter Name="productId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="productName" Type="String" />
                        <asp:Parameter Name="unitPrice" Type="Decimal" />
                        <asp:Parameter Name="picture" Type="Object" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="productName" Type="String" />
                        <asp:Parameter Name="unitPrice" Type="Decimal" />
                        <asp:Parameter Name="picture" Type="Object" />
                        <asp:Parameter Name="productId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
