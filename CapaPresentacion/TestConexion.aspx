<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestConexion.aspx.cs" Inherits="CapaPresentacion.TestConexion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>

    <h2 >Title Form</h2>
    <div>
            <form id="form1" runat="server">

        <div style="">
            <asp:Label  CssClass="Labeltxt" ID="Label1" runat="server" Text="Campo">
                <span >Campoo</span>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Campo" MaxLength="10" CssClass="textbox"></asp:TextBox>
            </asp:Label>
        </div>     
        
        <div style="">
            <asp:Label  CssClass="Labeltxt" ID="Label2" runat="server" Text="Campo">
                <span >Campoo</span>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Campo" MaxLength="10" CssClass="textbox"></asp:TextBox>
            </asp:Label>
        </div>   

        <div style="">
            <asp:Label  CssClass="Labeltxt" ID="Label3" runat="server" Text="Campo">
                <span >Campoo</span>
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Campo" MaxLength="10" CssClass="textbox"></asp:TextBox>
            </asp:Label>
        </div>   

        <div style="">
            <asp:Label  CssClass="Labeltxt" ID="Label4" runat="server" Text="Campo">
                <span >Campoo</span>
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Campo" MaxLength="10" CssClass="textbox"></asp:TextBox>
            </asp:Label>
        </div>   

        <div style="">
            <asp:Label  CssClass="Labeltxt" ID="Label5" runat="server" Text="Campo">
                <span >Campoo</span>
            <asp:TextBox ID="TextBox5" runat="server" placeholder="Campo" MaxLength="10" CssClass="textbox"></asp:TextBox>
            </asp:Label>
        </div>   

        <div style="">
            <asp:Label  CssClass="Labeltxt" ID="Label6" runat="server" Text="">
             <asp:Button ID="Button1" runat="server" Text="Save" />
            </asp:Label>          
        </div>   

        <div style="">
            <asp:DropDownList ID="cb" runat="server">
            </asp:DropDownList>       
        </div>   

        <div style="">
            <asp:Calendar ID="date" runat="server"></asp:Calendar>  
        </div> 


            
    </form>
    </div>

</body>
</html>
