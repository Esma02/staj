<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="YourNamespace.CustomerDetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Müşteri Detayları</title>
    <style>
        /* Stil ayarları */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .input-group input {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #555;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .gridview th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Müşteri Detayları</h1>
        </header>
        <div class="container">
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                
                <div class="input-group">
                    <asp:Label ID="lblFirstName" runat="server" Text="Adı:"></asp:Label>
                    <asp:TextBox ID="txtFirstName" runat="server" Enabled="False" />
                </div>
                <div class="input-group">
                    <asp:Label ID="lblLastName" runat="server" Text="Soyadı:"></asp:Label>
                    <asp:TextBox ID="txtLastName" runat="server" Enabled="False" />
                </div>
                <div class="input-group">
                    <asp:Label ID="lblEmail" runat="server" Text="E-posta:"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" Enabled="False" />
                </div>

                <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="OrderDate" HeaderText="Sipariş Tarihi" SortExpression="OrderDate" DataFormatString="{0:dd.MM.yyyy}" />
                        <asp:BoundField DataField="Amount" HeaderText="Miktar" SortExpression="Amount" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Description" HeaderText="Açıklama" SortExpression="Description" />
                    </Columns>
                </asp:GridView>

                <div class="input-group">
                    <asp:Label ID="lblOrderDate" runat="server" Text="Sipariş Tarihi:"></asp:Label>
                    <asp:TextBox ID="txtOrderDate" runat="server" TextMode="Date" />
                </div>
                <div class="input-group">
                    <asp:Label ID="lblOrderAmount" runat="server" Text="Miktar:"></asp:Label>
                    <asp:TextBox ID="txtOrderAmount" runat="server" />
                </div>
                <div class="input-group">
                    <asp:Label ID="lblOrderDescription" runat="server" Text="Açıklama:"></asp:Label>
                    <asp:TextBox ID="txtOrderDescription" runat="server" />
                </div>
                <asp:Button ID="btnAddOrder" runat="server" Text="Yeni Sipariş Ekle" OnClick="btnAddOrder_Click" CssClass="btn" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
