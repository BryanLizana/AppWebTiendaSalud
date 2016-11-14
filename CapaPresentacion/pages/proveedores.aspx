<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="proveedores.aspx.cs" Inherits="CapaPresentacion.pages.proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    
  <div class="main">
  
    <form id="form1" runat="server" >
  
      <h2>Proveedores</h2>
        <asp:Button ID="Button2" runat="server" Text="Añadir Nuevo Proveedor" class='button-success pure-button' OnClick="Button1_Click" />

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
              <legend>Ingrese datos del Usuario</legend>
                   
                <div class='pure-control-group'>
                    <label for='name'>RUC</label> 
                    <asp:TextBox ID="txtruc" runat="server"  MaxLength="20"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='password'>Razón Social</label>
                    <asp:TextBox ID="txtname" runat="server" placeholder='Razon Social' MaxLength="120"></asp:TextBox>

                </div>

                <div class='pure-control-group'>
                    <label for='email'>Distrito</label>
                    <asp:TextBox ID="txtdistrito" runat="server" placeholder='Distrito'  MaxLength="120"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='foo'>Dirección</label>
                    <asp:TextBox ID="txtdireccion" runat="server" placeholder='Dirección'  MaxLength="120"></asp:TextBox>
                </div>
             
                <div class='pure-controls'>
                   <asp:Button ID="btncancelar" runat="server" Text="Cancelar" OnClick="btn_cancelar"  class='button-warning pure-button' />
                   <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />
                </div>
            </fieldset>
        </div>
        </asp:PlaceHolder>

        
        <br />  <br />
     
        <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowDeleting="dgv_RowDeleting" OnRowEditing="dgv_RowEditing">
            <Columns>
                <asp:CommandField AccessibleHeaderText="btndelete" InsertVisible="False" ShowDeleteButton="True" />
                <asp:CommandField DeleteText="Editar" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </form>

    </div>

</asp:Content>
