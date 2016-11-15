<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ventas.aspx.cs" Inherits="CapaPresentacion.pages.ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="main">
        <form id="form1" runat="server">
            <h2>Ventas</h2>

             <%   if (Session["msg"].ToString() != "0")
                {
                Response.Write( Session["msg"].ToString());
                    Session["msg"] = "0";
                }   %>
            <asp:PlaceHolder ID="place_edit_venta" runat="server" Visible="false">
                 <div class='pure-form pure-form-aligned' >
                    <asp:TextBox ID="txtven_id" runat="server"   visible="false"></asp:TextBox>
                    <asp:TextBox ID="txtprof_id" runat="server"   visible="false"></asp:TextBox>

                    <div class='pure-control-group'>
                        <label >Code</label>
                        <asp:TextBox ID="txtcode" runat="server"  MaxLength="30" ></asp:TextBox>
                    </div>
                    <div class='pure-control-group'>
                        <label >User</label>
                        <asp:TextBox ID="txtuser_id" runat="server"  MaxLength="30" visible="false"></asp:TextBox>
                        <asp:TextBox ID="txtuser" runat="server"  MaxLength="30" Enabled="false"></asp:TextBox>
                    </div>
                  
                    <div class='pure-control-group'>
                            <label for='password'>Cliente</label>
                        <asp:TextBox ID="txtcli_id" runat="server"  MaxLength="50" Visible="false"></asp:TextBox>

                        <asp:TextBox ID="txtcli" runat="server"  MaxLength="50" Enabled="false"></asp:TextBox>
                        <div class='pure-u-1-2'>
                             <asp:Button ID="btn_addcli" runat="server" Text="Añadir Cliente" OnClick="btn_add_cli"  class='button-success pure-button' />
                        </div>
                    </div>

                                                    
                            <asp:PlaceHolder ID="place_list_cliente" runat="server" Visible="false">
                                <br />
                                <asp:GridView ID="dgv_list_client" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_client_RowCommand"  OnPageIndexChanging="dgv_list_client_PageIndexChanging" PageSize="5" AllowPaging="true" >
                                    <Columns>
                                            <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                        </Columns>
                                 </asp:GridView>
                                 <br />
                               <asp:Button ID="btn_cancel_cli" runat="server" Text="Cancelar List Client" OnClick="btn_cancelarcli"  class='button-warning pure-button' />
                                <br />   <br />
                            </asp:PlaceHolder>

                       <div class='pure-control-group'>
                             <asp:Button ID="btn_add_pro" runat="server" Text="Añadir Producto" OnClick="btn_addpro"  class='button-success pure-button' />
                        </div>
                     <hr />
                            <asp:PlaceHolder ID="place_edit_pro" runat="server" Visible="false">
                                    <div class='pure-form pure-form-aligned' >
                                        <div class='pure-control-group'>
                                            <label >Producto</label>
                                            <asp:TextBox ID="txtpro_id" runat="server"  MaxLength="30" visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtlot_id" runat="server"   visible="false"></asp:TextBox>
                                           
                                             <asp:TextBox ID="txtpro_name" runat="server"  MaxLength="30" Enabled="false"></asp:TextBox>
                                        </div>
                                          <div class='pure-control-group'>
                                            <label >Importe</label>
                                            <asp:TextBox ID="txtpro_importe" runat="server" MaxLength="10" ></asp:TextBox>
                                        </div>
                                        <div class='pure-control-group'>
                                            <label >Cantidad</label>
                                            <asp:TextBox ID="txtpro_cant" runat="server" Max="99999"  type="number"  ></asp:TextBox>
                                        </div>
                                         <div class='pure-control-group'>
                                                <asp:PlaceHolder ID="place_list_pro" runat="server" Visible="false">
                                                    <br />
                                                    <asp:GridView ID="dgv_list_pro" runat="server" AllowPaging="True"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_pro_RowCommand" OnPageIndexChanging="dgv_list_pro_PageIndexChanging" PageSize="3" >
                                                        <Columns>
                                                                <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                                            </Columns>
                                                    </asp:GridView>

                                               </asp:PlaceHolder>
                                     
                                        </div>

                                        <div class='pure-controls'>
                                            <asp:Button ID="btncancelpro" runat="server" Text="Cancelar" OnClick="btn_cancelar_pro"  class='button-warning pure-button' />&nbsp
                                            <asp:Button ID="btnsavepro" runat="server" Text="Save" OnClick="btn_save_pro"  class='button-success pure-button' />
                                        </div>
                                    </div>
                             </asp:PlaceHolder>
                              
                   
                     <div class='pure-control-group'>
                          <span>Productos de la compra</span>
                        <asp:GridView ID="dgv_list_profo_detalle" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_profo_detalle_RowCommand" >
                           
                        </asp:GridView>  
                      </div>
                     <div class='pure-control-group'>
                        <label >Sub Total</label>
                        <asp:TextBox ID="txtven_subto" runat="server"   Enabled="false"></asp:TextBox>
                    </div>
                    <div class='pure-control-group'>
                        <label >IGV</label>
                        <asp:TextBox ID="txven_igv" runat="server"  Enabled="false"></asp:TextBox>
                    </div>
                    <div class='pure-control-group'>
                        <label >Total</label>
                        <asp:TextBox ID="txtven_total" runat="server"   Enabled="false"></asp:TextBox>
                    </div>

                    <div class='pure-controls'>
                         <asp:Button ID="btncancel" runat="server" Text="Cancelar" OnClick="btn_cancelar"  class='button-warning pure-button' />&nbsp
                         <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />
                    </div>
                <%--Form de crédito--%>
                                    <asp:PlaceHolder ID="place_credito" runat="server" Visible ="false"><br />
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
            <asp:PlaceHolder ID="place_dgv" runat="server">
                 <div class='pure-u-1-2'>
                             <asp:Button ID="btn_add_venta" runat="server" Text="Crear Venta" OnClick="btn_add_ven"  class='button-success pure-button' />
                </div>
                <br /> <br />
                <span>Listado de Ventas</span>
                
                <asp:GridView ID="dgv" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_RowCommand">
                    <Columns>
                    <asp:buttonfield buttontype="Link"  commandname="editar" headertext="" text="Editar"/>
                    <asp:buttonfield buttontype="Link"   commandname="eliminar" headertext="" text="Eliminar"/>
                                                            
                    </Columns>
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </asp:PlaceHolder>
            <br />
              <div class='pure-u-1-2'>
                  <asp:Button ID="btn_listproforma" runat="server" Text="Listar Proformas" OnClick="btn_list_proforma"  class='button-success pure-button' />
              </div>
            <br />
            <asp:PlaceHolder ID="place_list_proformas" runat="server" Visible="false">
               
                <br /> <br />
                <span>Listado de Proformas</span>
                
                <asp:GridView ID="dgv_list_proforma" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_proforma_RowCommand">
                    <Columns>
                    <asp:buttonfield buttontype="Link"  commandname="vender" headertext="" text="Realizar Venta"/>
                                                            
                    </Columns>
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </asp:PlaceHolder>

        </form>
       
    </div>

</asp:Content>
