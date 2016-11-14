<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="compras.aspx.cs" Inherits="CapaPresentacion.pages.compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="main">
    <form id="form1" runat="server">
        <h2>Compra</h2>
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
               <asp:TextBox ID="txtcompraid" runat="server"  Visible="false"></asp:TextBox>

                  <div class='pure-control-group'>
                        <label>Code</label>
                        <asp:TextBox ID="txtcode" runat="server"   MaxLength="30"></asp:TextBox>
                  </div>
                  <div class='pure-control-group'>  
                        <label >User - Compra</label>
                       <asp:TextBox ID="txtuser_id" runat="server"  Visible="false"></asp:TextBox>
                        <asp:TextBox ID="txtuser" runat="server"  Enabled ="false"></asp:TextBox>
                  </div>
                   <div class='pure-control-group'>  
                        <label for='email'>User - Solicitud</label>
                        <asp:TextBox ID="txtuser_solicomp" runat="server"   MaxLength="30" Enabled ="false"></asp:TextBox>
                  </div>
            <%--Aññadir proveedor--%>
               <div class='pure-control-group'>
                       <label >Proveedor</label>
                        <asp:TextBox ID="txtprovee_id" runat="server"  MaxLength="50" Visible="false"></asp:TextBox>

                        <asp:TextBox ID="txtprovee" runat="server"  MaxLength="50" Enabled="false"></asp:TextBox>
                        <div class='pure-u-1-2'>
                             <asp:Button ID="btn_addprovee" runat="server" Text="Añadir Proveedor" OnClick="btn_add_provee"  class='button-success pure-button' />
                        </div>
                </div>
                 <asp:PlaceHolder ID="place_list_provee" runat="server" Visible="false">
                                    <br />
                                    <asp:GridView ID="dgv_list_provee" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_provee_RowCommand"  OnPageIndexChanging="dgv_list_provee_PageIndexChanging" PageSize="5" AllowPaging="true">
                                        <Columns>
                                                <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                            </Columns>
                                     </asp:GridView>
                     <br />
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
                                                    <asp:DropDownList ID="cbalmacen" runat="server" >
                                                        <asp:ListItem Value="FRONT">FRONT</asp:ListItem>
                                                        <asp:ListItem Value="BACK">BACK</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                               <div class='pure-controls'>
                                                <asp:Button ID="btn_lotcancelar" runat="server" Text="Cancelar Lote" OnClick="btn_cancelar_lot"  class='button-warning pure-button' />&nbsp
                                                <asp:Button ID="btn_lotsave" runat="server" Text="Save" OnClick="btn_save_lot"  class='button-success pure-button' />
                                                </div>
                                           </fieldset>
                                 </div>
                                       
                                          
                                </asp:PlaceHolder>
                                <hr />
                                <%--//list de Lotes asociados --%>
                                <span >Lotes asociados</span>

                                <asp:GridView ID="dgv_list_lotes" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True"  OnRowCommand="dgv_list_lotes_RowCommand" >
                                    <Columns>
                                         <asp:buttonfield buttontype="Link"  commandname="editar" headertext="" text="Actualizar"/>
                                         <asp:buttonfield buttontype="Link"   commandname="eliminar" headertext="" text="Eliminar" Visible="false" />
                                                           
                                    </Columns>
                                </asp:GridView>
                                <br />  <br />


                  <div class='pure-control-group'>
                        <label >Sub Total</label>
                        <asp:TextBox ID="txtsubto" runat="server"   Enabled="true"></asp:TextBox>
                    </div>
                    <div class='pure-control-group'>
                        <label >IGV</label>
                        <asp:TextBox ID="txtigv" runat="server"  Enabled="true"></asp:TextBox>
                    </div>
                    <div class='pure-control-group'>
                        <label >Total</label>
                        <asp:TextBox ID="txttotal" runat="server"   Enabled="true"></asp:TextBox>
                    </div>

                 <div class='pure-controls'>
                    <asp:Button ID="btncancel" runat="server" Text="Cancelar" OnClick="btn_cancelar"  class='button-warning pure-button' />&nbsp
                    <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />
                 </div>
                <br />
                 <%--Form de crédito--%>
                <asp:PlaceHolder ID="place_credito" runat="server" Visible ="false">
                    <asp:TextBox ID="txtcre_id" runat="server" Visible="false"></asp:TextBox>                
                    <div class='pure-control-group'>
                    <label for='foo'>Plazos</label>
                            <asp:DropDownList ID="cbmes" runat="server" OnSelectedIndexChanged="cbmes_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="11">11</asp:ListItem>
                                    <asp:ListItem Value="12">12</asp:ListItem>

                            </asp:DropDownList>
                    </div>
                    <div class='pure-control-group'>
                    <label for='foo'>Pago Mensual</label>
                    <asp:TextBox ID="txtcre_mensual" runat="server" ></asp:TextBox>
                    </div>
                    <div class='pure-control-group'>
                    <label for='foo'>Iterés Mensual (5%)</label>
                    <asp:TextBox ID="txtcre_interes" runat="server" ></asp:TextBox>
                    </div>
                 <div class='pure-controls'>
                        <asp:Button ID="btn_save_cre" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />              
                 </div>
                </asp:PlaceHolder>



                  </div>            
        </asp:PlaceHolder>

    <%--List compras visible--%>
          <asp:PlaceHolder ID="place_list_solicomp" runat="server">   <hr />

                <h3>Listado de Solicitud de Compra</h3>
                <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_RowCommand">
                    <Columns>
                        <asp:buttonfield buttontype="Link"   commandname="comprar" headertext="" text="Hacer Compra"/>
                                                           
                    </Columns>
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </asp:PlaceHolder>
    <%--List compras visible--%>
    <asp:PlaceHolder ID="place_list_compra" runat="server">   <hr />

        <h3>Listado de Compras</h3>
        <asp:GridView ID="dgv_list_compra" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_compra_RowCommand">
            <Columns>
                <asp:buttonfield buttontype="Link"   commandname="editar" headertext="" text="Editar"/>
                                                           
            </Columns>
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

    </asp:PlaceHolder>

    </form>
    </div>
</asp:Content>
