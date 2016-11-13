<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="solicompra.aspx.cs" Inherits="CapaPresentacion.pages.solicompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

<div class="main">
  
    <form id="form1" runat="server" >
      <h2>Solicitud de compra</h2>
             <%  
                            if (Session["msg"].ToString() != "0")
                            {
                            Response.Write( Session["msg"].ToString());
                                Session["msg"] = "0";
                            }

               %>
           <div class='pure-controls'>
                                <asp:Button ID="btnaddSolicomp" runat="server" Text="Añadir Nueva Solicitud" OnClick="btn_addSolip"  class='button-success pure-button' />
          </div>
        <br /><br />

        <asp:PlaceHolder ID="place_Solicomp" runat="server" Visible="False">
                        
                        <div class='pure-form pure-form-aligned'  runat="server">
                              <fieldset>
                            <legend>Ingrese datos de la Solicitud</legend>                                       
                              <%--//Soli_compra edit--%>
                                       <asp:TextBox ID="txtsoli_id" runat="server"  visible="false"></asp:TextBox>
                             
                                <div class='pure-control-group'>
                                    <label for='password'>User</label>
                                     <asp:TextBox ID="txtuser_id" runat="server"  MaxLength="30" visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtuser" runat="server"  MaxLength="30" Enabled="false"></asp:TextBox>
                                </div>
                              

                                <div class='pure-control-group'>
                                    <label for='email'>Code</label>
                                    <asp:TextBox ID="txtcode" runat="server"   MaxLength="30"></asp:TextBox>
                                </div>

                             
                                <div class='pure-control-group' >
                                    <label for='email'>Tiempo Límite</label>
                                    <div class="pure-u-1-2">
                                    <asp:Calendar ID="dtvence" runat="server" CssClass="no_a"></asp:Calendar>
                                    </div>

                                </div>
                                <div class='pure-control-group'>
                                   <asp:Button ID="btnaddlot" runat="server" Text="Añadir Nuevo Lote" class='button-success pure-button' OnClick="btn_addLot" />
                                </div>                 
                                      <br />  <br />
             
                                <%--//Add Lote to Soli_compra--%>
                                <asp:PlaceHolder ID="place_addlote" runat="server" Visible="False">
                                      <asp:TextBox ID="txtlot_id" runat="server"  visible="false"></asp:TextBox>
                                            <div class='pure-form pure-form-aligned' >
                                            <fieldset>
                                            <legend>Ingrese datos del Lote</legend>
                                               
                                                <div class='pure-control-group'>
                                                      <label for='password'>Producto</label>
                                                    <asp:TextBox ID="txtpro_id" runat="server"  MaxLength="30" Visible="false"></asp:TextBox>

                                                    <asp:TextBox ID="txtproducto" runat="server"  MaxLength="50" Enabled="false"></asp:TextBox>
                                                    <div class="pure-u-1-2">
                                                        <asp:Button ID="btnaddpro" runat="server" Text="Añadir Producto" OnClick="btn_addpro"  class='button-success pure-button' />
                                                    </div>

                                                </div>
                                                <div>
                                                    <%--//list de productos a seleccionar --%>
                                                    <asp:PlaceHolder ID="place_listpro" runat="server" Visible="false">
                                                        <span>Selecciona Un Producto</span>
                                                        <br />
                                                        <asp:GridView ID="dgv_list_pro" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_pro_RowCommand" >
                                                            <Columns>
                                                                  <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>                                                                 
                                                            </Columns>
                                                    </asp:GridView>
                                                        <br />
                                                <asp:Button ID="btncancel_pro" runat="server" Text="Cancelar" OnClick="btn_cancelar_pro"  class='button-warning pure-button' />

                                                    </asp:PlaceHolder>
                                                </div>

                                                <div class='pure-control-group'>
                                                    <label for='password'>Lote Code</label>
                                                    <asp:TextBox ID="txtLotcode" runat="server"  MaxLength="30" Enabled="true" ></asp:TextBox>

                                                </div>

                                                <div class='pure-control-group'>
                                                    <label for='email'>Cantidad</label>
                                                    <asp:TextBox ID="txtLotcant" runat="server"   MaxLength="30"></asp:TextBox>
                                                </div>

                                                <div class='pure-control-group'>
                                                    <label for='foo'>Almacen</label>
                                                    <asp:DropDownList ID="cbalmacen" runat="server">
                                                        <asp:ListItem Value="FRONT">FRONT</asp:ListItem>
                                                        <asp:ListItem Value="BACK">BACK</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                               <div class='pure-controls'>
                                                <asp:Button ID="btnlotcancelar" runat="server" Text="Cancelar Lote" OnClick="btn_cancelar_lot"  class='button-warning pure-button' />&nbsp
                                                <asp:Button ID="btnlotsave" runat="server" Text="Save" OnClick="btn_save_lot"  class='button-success pure-button' />
                                                </div>
                                           </fieldset>
                                 </div>
                                       
                                          
                                </asp:PlaceHolder>
                                <hr />
                                <%--//list de Lotes asociados --%>
                                <span >Lotes de la Solicitud</span>

                                <asp:GridView ID="dgv_list_lotes_to_solicomp" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True"  OnRowCommand="dgv_list_lotes_to_solicomp_RowCommand" >
                                    <Columns>
                                         <asp:buttonfield buttontype="Link"  commandname="editar" headertext="" text="Editar"/>
                                         <asp:buttonfield buttontype="Link"   commandname="eliminar" headertext="" text="Eliminar"/>
                                                           
                                    </Columns>
                                </asp:GridView>
                                <br />  <br />

                                <div class='pure-controls'>
                                <asp:Button ID="btncancelar" runat="server" Text="Cancelar Solicitud" OnClick="btn_cancelar_soli"  class='button-warning pure-button' />
                                <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save_soli"  class='button-success pure-button' />
                                </div>
                            </fieldset>
                        </div>

         </asp:PlaceHolder>
        <asp:PlaceHolder ID="place_list_solicomp" runat="server">
             <hr />

            <h3>Listado de Solicitud</h3>
            <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_RowCommand">
                <Columns>
                 <asp:buttonfield buttontype="Link"  commandname="editar" headertext="" text="Editar"/>
                 <asp:buttonfield buttontype="Link"   commandname="eliminar" headertext="" text="Eliminar"/>
                                                           
                </Columns>
                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </asp:PlaceHolder>
        
    </form>

    </div>

</asp:Content>
