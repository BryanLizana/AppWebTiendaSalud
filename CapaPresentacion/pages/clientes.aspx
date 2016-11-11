<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="CapaPresentacion.pages.clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
     <div class="main">
  
    <form id="form1" runat="server" >
  
      <h2>Clientes</h2>
        <asp:Button ID="Button1" runat="server" Text="Añadir Nuevo Cliente" class='button-success pure-button' OnClick="Button1_Click" />

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
              <legend>Ingrese datos del Cliente</legend>
                   
                    <div class='pure-control-group'>
                             
                        <label> <asp:Label ID="lbdni" runat="server">DNI</asp:Label></label>
                        <asp:TextBox ID="txtdni" runat="server"  MaxLength="9"></asp:TextBox>
                    </div>

                    <div class='pure-control-group'>
                       <label> <asp:Label ID="lbname" runat="server">Nombres</asp:Label></label>
                        <asp:TextBox ID="txtfname" runat="server" placeholder='' MaxLength="30"></asp:TextBox>
                    </div>


                <div class='pure-control-group'>
                    <label for='foo'>Distrito</label>
                    <asp:TextBox ID="txtdistrito" runat="server" placeholder='Distrito'  MaxLength="30"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='foo'>Direccion</label>
                    <asp:TextBox ID="txtdireccion" runat="server" placeholder='Direcciòn'  ></asp:TextBox>
                </div>
                <div class='pure-control-group'>
                    <label for='foo'>Telefono</label>
                    <asp:TextBox ID="txttel" runat="server" placeholder='Direcciòn' MaxLength="20" ></asp:TextBox>
                </div>
          
                 <div class='pure-control-group'>
                    <label for='foo'>Email</label>
                    <asp:TextBox ID="txtemail" runat="server" placeholder='Direcciòn'  ></asp:TextBox>
                </div>

                  <div class='pure-control-group'>
                    <label for='foo'>TypeUser</label>
                     <asp:DropDownList ID="cbtype" runat="server" OnSelectedIndexChanged="cbtype_SelectedIndexChanged" AutoPostBack="True">
                         <asp:ListItem Value="PERSONA">Persona</asp:ListItem>
                         <asp:ListItem Value="EMPRESA">Empresa</asp:ListItem>
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
         <div class='pure-control-group'>
         <label for='foo'>Tipo de listado de Ciente</label>
                <asp:DropDownList ID="cblisttype" runat="server" OnSelectedIndexChanged="cblisttype_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="PERSONA">Persona</asp:ListItem>
                    <asp:ListItem Value="EMPRESA">Empresa</asp:ListItem>
        </asp:DropDownList>
        </div>
        <br />  <br />

        <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowDeleting="dgv_RowDeleting" OnRowEditing="dgv_RowEditing"  OnRowCommand="dgv_RowCommand" >
            <Columns>
                <!--<asp:CommandField AccessibleHeaderText="btndelete" InsertVisible="False" ShowDeleteButton="True" />
                <asp:CommandField DeleteText="Editar" ShowDeleteButton="True" />-->

                <asp:buttonfield buttontype="Link"  commandname="editar" headertext="" text="Editar"/>
                <asp:buttonfield buttontype="Link"   commandname="eliminar" headertext="" text="Eliminar"/>
      
            </Columns>
        </asp:GridView>
    </form>

    </div>


</asp:Content>
