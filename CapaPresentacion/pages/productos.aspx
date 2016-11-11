<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="CapaPresentacion.pages.productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
        <div class="main">
  
    <form id="form1" runat="server" >
  
      <h2>Productos</h2>
        <asp:Button ID="Button1" runat="server" Text="Añadir Nuevo Producto" class='button-success pure-button' OnClick="Button1_Click" />

        <br />  <br />
             <%  
                            if (Session["msg"].ToString() != "0")
                            {
                            Response.Write( Session["msg"].ToString());
                                Session["msg"] = "0";
                            }

               %>
         <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="False">

            <div class='pure-form pure-form-aligned'  runat="server">
            <fieldset>
              <legend>Ingrese datos del Producto</legend>
                   
                <div class='pure-control-group'>
                    <label for='name'>Nombre Comercial</label> 
                    <asp:TextBox ID="txtname_co" runat="server"  MaxLength="30"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='password'>Nombres</label>
                    <asp:TextBox ID="txtname" runat="server" placeholder='' MaxLength="30"></asp:TextBox>

                </div>

                <div class='pure-control-group'>
                    <label for='email'>Precio Unitario</label>
                    <asp:TextBox ID="txtpreciou" runat="server" placeholder=''  MaxLength="30"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='foo'>Precio Por Mayor</label>
                    <asp:TextBox ID="txtpreciom" runat="server" placeholder=''  MaxLength="30"></asp:TextBox>
                </div>
                <div class='pure-control-group'>
                    <label for='foo'>Procedencia</label>
                    <asp:TextBox ID="txtprocedencia" runat="server" placeholder='' Rows="5" ></asp:TextBox>
                </div>
                  <div class='pure-control-group'>
                    <label for='foo'>Tipo del Producto</label>
                     <asp:DropDownList ID="cbtype" runat="server">
                         <asp:ListItem Value="MEDICAMENTO">Medicamento</asp:ListItem>
                         <asp:ListItem Value="INSTRUMENTO">Instrumento</asp:ListItem>
                         <asp:ListItem Value="HERRAMIENTA">Herramienta</asp:ListItem>
                   </asp:DropDownList>
                   </div>
                <div class='pure-controls'>
                   <asp:Button ID="btncancelar" runat="server" Text="Cancelar" OnClick="btn_cancelar"  class='button-warning pure-button' />
                   <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />
                </div>
            </fieldset>
        </div>
        </asp:PlaceHolder>

        
        <br />  <br />
   <%--                <div class='pure-control-group'>
                    <label for='foo'>Tipo del Producto</label>
                     <asp:DropDownList ID="cblisttype" runat="server" OnSelectedIndexChanged="cblisttype_SelectedIndexChanged" AutoPostBack="true" >
                         <asp:ListItem Value="MEDICAMENTO">Medicamento</asp:ListItem>
                         <asp:ListItem Value="INSTRUMENTO">Instrumento</asp:ListItem>
                         <asp:ListItem Value="HERRAMIENTA">Herramienta</asp:ListItem>
                    </asp:DropDownList>
                   </div>--%>
        <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowDeleting="dgv_RowDeleting" OnRowEditing="dgv_RowEditing">
            <Columns>
                <asp:CommandField AccessibleHeaderText="btndelete" InsertVisible="False" ShowDeleteButton="True" />
                <asp:CommandField DeleteText="Editar" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </form>

    </div>

    

</asp:Content>
