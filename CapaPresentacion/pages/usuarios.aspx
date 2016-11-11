<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="CapaPresentacion.pages.usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="main">
  
    <form id="form1" runat="server" >
  
      <h2>Usuarios</h2>
        <asp:Button ID="Button1" runat="server" Text="Añadir Nuevo Usuario" class='button-success pure-button' OnClick="Button1_Click" />

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
                    <label for='name'>DNI</label> 
                    <asp:TextBox ID="txtdni" runat="server"  MaxLength="9"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='password'>Nombres</label>
                    <asp:TextBox ID="txtfname" runat="server" placeholder='Nombres' MaxLength="30"></asp:TextBox>

                </div>

                <div class='pure-control-group'>
                    <label for='email'>Apellidos</label>
                    <asp:TextBox ID="txtlname" runat="server" placeholder='Apellidos'  MaxLength="30"></asp:TextBox>
                </div>

                <div class='pure-control-group'>
                    <label for='foo'>Distrito</label>
                    <asp:TextBox ID="txtdistrito" runat="server" placeholder='Distrito'  MaxLength="30"></asp:TextBox>
                </div>
                <div class='pure-control-group'>
                    <label for='foo'>Direccion</label>
                    <asp:TextBox ID="txtdireccion" runat="server" placeholder='Direcciòn' Rows="5" ></asp:TextBox>
                </div>
                <div class='pure-control-group'>
                    <label for='foo'>Password</label>
                    <asp:TextBox ID="txtpass" runat="server" placeholder='Direcciòn' Rows="5" ></asp:TextBox>
                </div>
          
                  <div class='pure-control-group'>
                    <label for='foo'>TypeUser</label>
                     <asp:DropDownList ID="cbtype" runat="server">
                         <asp:ListItem Value="1">Admin</asp:ListItem>
                         <asp:ListItem Value="2">UserType2</asp:ListItem>
                         <asp:ListItem Value="3">UserType3</asp:ListItem>
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
     
        <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowDeleting="dgv_RowDeleting" OnRowEditing="dgv_RowEditing" OnRowCommand="dgv_RowCommand">
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
