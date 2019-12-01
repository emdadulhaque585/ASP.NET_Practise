<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Work_01.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-12">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            </div>
            <div class="col-md-12">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <h2>Image Upload</h2>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <img  src='<%# Eval("pic","Images/{0}") %>' width="150" height="150" class="img-rounded"/>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label ID="Label1" runat="server" Text="" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
