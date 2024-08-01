<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="YourNamespace.Customers" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Müşteri Listesi</title>
    <style>
        /* Stil ayarları */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Müşteriler</h1>
        </header>
        <section>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CustomerId" HeaderText="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="Ad" />
                    <asp:BoundField DataField="LastName" HeaderText="Soyad" />
                    <asp:BoundField DataField="Email" HeaderText="E-posta" />
                    <asp:ButtonField CommandName="Edit" Text="Düzenle" />
                </Columns>
            </asp:GridView>
        </section>
    </form>
</body>
</html>
