<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="lotes.aspx.cs" Inherits="CapaPresentacion.pages.lotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
            <div class="main">
  
    <form id="form1" runat="server" >
  
      <h2>Lotes</h2>
       <%-- <asp:Button ID="btnaddlot" runat="server" Text="Añadir Nuevo Lote" class='button-success pure-button' OnClick="btnadd_data" />
        --%>
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
              <legend>Ingrese datos del Lote</legend>
                   
                <div class='pure-control-group'>
                   <asp:Button ID="btnaddpro" runat="server" Text="Añadir Producto" OnClick="btn_addpro"  class='button-success pure-button' />
                </div>

                <div class='pure-control-group'>
                    <label for='password'>Lote Code</label>
                    <asp:TextBox ID="txtcode" runat="server" placeholder='' MaxLength="30" Enabled="false"></asp:TextBox>

                </div>

                <div class='pure-control-group'>
                    <label for='email'>Cantidad</label>
                    <asp:TextBox ID="txtcant" runat="server" placeholder=''  MaxLength="30"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='foo'>Almacen</label>
                     <asp:DropDownList ID="cbalmacen" runat="server">
                         <asp:ListItem Value="FRONT">FRONT</asp:ListItem>
                         <asp:ListItem Value="BACK">BACK</asp:ListItem>
                   </asp:DropDownList>
                   </div>
                <hr />
                  <div class='pure-control-group'>
                    <label for='foo'>Actualizar despuès de comprar el lote.</label>
                </div>
                <div class='pure-control-group'>
                    <label for='foo'>Aporte</label>
                    <asp:TextBox ID="txtaporte" runat="server" placeholder='' Rows="5" ></asp:TextBox>
                </div>
                <div class='pure-control-group'>
                    <asp:Calendar ID="dtvence" runat="server"></asp:Calendar>
                </div>
                <div class='pure-controls'>
                   <asp:Button ID="btncancelar" runat="server" Text="Cancelar" OnClick="btn_cancelar"  class='button-warning pure-button' />
                   <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />
                </div>
            </fieldset>
        </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="place_ListProducto" runat="server" Visible="false">
            <br />
             
        </asp:PlaceHolder>
        <br />  <br />

        <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowDeleting="dgv_RowDeleting" OnRowEditing="dgv_RowEditing">
            <Columns>
                <asp:CommandField AccessibleHeaderText="btndelete" InsertVisible="False" ShowDeleteButton="True" Visible="false" />
                <asp:CommandField DeleteText="Editar" ShowDeleteButton="True"  />
            </Columns>
        </asp:GridView>

         <br />

         <asp:GridView ID="dgv_list_pro" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowDeleting="dgv_RowDeleting" OnRowEditing="dgv_RowEditing" OnSelectedIndexChanged="dgv_list_pro_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField Text="Add"  />
                </Columns>
        </asp:GridView>
    </form>

    </div>

</asp:Content>
