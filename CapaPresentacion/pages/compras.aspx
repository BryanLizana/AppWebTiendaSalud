<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="compras.aspx.cs" Inherits="CapaPresentacion.pages.compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="main">
    <form id="form1" runat="server">
            <%  
                            if (Session["msg"].ToString() != "0")
                            {
                            Response.Write( Session["msg"].ToString());
                                Session["msg"] = "0";
                            }

               %>

    <%--Edit Compra no visible-data soli--%>

        <asp:PlaceHolder ID="place_compra" runat="server" Visible ="false">
            <div class='pure-form pure-form-aligned' >
            <%--variables importantes--%>
               <asp:TextBox ID="txtsolicompid" runat="server"  Visible="false"></asp:TextBox>
            <%--Aññadir proveedor--%>
               <div class='pure-control-group'>
                       <label for='password'>Proveedor</label>
                        <asp:TextBox ID="txtprovee_id" runat="server"  MaxLength="50" Visible="false"></asp:TextBox>

                        <asp:TextBox ID="txtprovee" runat="server"  MaxLength="50" Enabled="false"></asp:TextBox>
                        <div class='pure-u-1-2'>
                             <asp:Button ID="btn_addprovee" runat="server" Text="Añadir Proveedor" OnClick="btn_add_provee"  class='button-success pure-button' />
                        </div>
                </div>
                 <asp:PlaceHolder ID="place_list_provee" runat="server" Visible="false">
                                    <br />
                                    <asp:GridView ID="dgv_list_provee" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_provee_RowCommand" >
                                        <Columns>
                                                <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                            </Columns>
                                     </asp:GridView>

                                   <asp:Button ID="btn_cancelprovee" runat="server" Text="Cancelar" OnClick="btn_cancel_provee"  class='button-warning pure-button' />
                  </asp:PlaceHolder>


             <%--list-lotes-soli no visible--%>
                                <asp:PlaceHolder ID="place_edit_lot" runat="server" Visible="False">
                                      <asp:TextBox ID="txtlot_id" runat="server"  visible="false"></asp:TextBox>
                                            <div class='pure-form pure-form-aligned' >
                                            <fieldset>
                                            <legend>Ingrese datos del Lote</legend>
                                               
                                                <div class='pure-control-group'>
                                                      <label for='password'>Producto</label>
                                                    <asp:TextBox ID="txtpro_id" runat="server"  MaxLength="30" Visible="false"></asp:TextBox>

                                                    <asp:TextBox ID="txtproducto" runat="server"  MaxLength="50" Enabled="false"></asp:TextBox>

                                                </div>
                                            

                                                <div class='pure-control-group'>
                                                    <label for='password'>Lote Code</label>
                                                    <asp:TextBox ID="txtLotcode" runat="server"  MaxLength="30" Enabled="true" ></asp:TextBox>

                                                </div>

                                                <div class='pure-control-group'>
                                                    <label for='email'>Cantidad</label>
                                                    <asp:TextBox ID="txtLotcant" runat="server" Enabled="false" ></asp:TextBox>
                                                </div>
                                                   <div class='pure-control-group'>
                                                    <label for='foo'>Aporte</label>
                                                    <asp:TextBox ID="txtaporte" runat="server" ></asp:TextBox>
                                                </div>
                                                <div class='pure-control-group'>
                                                     <label >Fecha de Vencimiento del Lote</label>
                                                      <div class="pure-u-1-2">
                                                            <asp:Calendar ID="dtlotvence" runat="server" CssClass="no_a"></asp:Calendar>
                                                      </div>
                                                </div>

                                                <div class='pure-control-group'>
                                                    <label for='foo'>Almacen</label>
                                                    <asp:DropDownList ID="cbalmacen" runat="server">
                                                        <asp:ListItem Value="FRONT">FRONT</asp:ListItem>
                                                        <asp:ListItem Value="BACK">BACK</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                               <div class='pure-controls'>
                                                <asp:Button ID="btn_lotcancelar" runat="server" Text="Cancelar Lote" OnClick="btn_cancelar_lot"  class='button-warning pure-button' />
                                                <asp:Button ID="btn_lotsave" runat="server" Text="Save" OnClick="btn_save_lot"  class='button-success pure-button' />
                                                </div>
                                           </fieldset>
                                 </div>
                                       
                                          
                                </asp:PlaceHolder>
                                <hr />
                                <h3 >Lotes asociados</h3>
                                <%--//list de Lotes asociados --%>
                                        <br />
                                <asp:GridView ID="dgv_list_lotes" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True"  OnRowCommand="dgv_list_lotes_RowCommand" >
                                    <Columns>
                                         <asp:buttonfield buttontype="Link"  commandname="editar" headertext="" text="Actualizar"/>
                                         <asp:buttonfield buttontype="Link"   commandname="eliminar" headertext="" text="Eliminar"/>
                                                           
                                    </Columns>
                                </asp:GridView>
                                <br />  <br />
                
                  </div>            
        </asp:PlaceHolder>

    <%--List compras visible--%>
          <asp:PlaceHolder ID="place_list_solicomp" runat="server">   <hr />

                <h3>Listado de Solicitud de Compra</h3>
                <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_RowCommand">
                    <Columns>
                        <asp:buttonfield buttontype="Link"   commandname="compra" headertext="" text="Hacer Compra"/>
                                                           
                    </Columns>
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </asp:PlaceHolder>


    </form>
    </div>
</asp:Content>
