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
            <asp:PlaceHolder ID="place_edit_venta" runat="server">
                 <div class='pure-form pure-form-aligned' >
                    <asp:TextBox ID="txtven_id" runat="server"   visible="false"></asp:TextBox>
                    <div class='pure-control-group'>
                        <label >Code</label>
                        <asp:TextBox ID="txtcode" runat="server"  MaxLength="30" Enabled="false"></asp:TextBox>
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

                       <div>
                                                    
                    <asp:PlaceHolder ID="place_list_cliente" runat="server" Visible="false">
                        <br />
                        <asp:GridView ID="dgv_list_client" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_client_RowCommand" >
                            <Columns>
                                    <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                </Columns>
                         </asp:GridView>

                       <asp:Button ID="btn_cancel_cli" runat="server" Text="Cancelar" OnClick="btn_cancelarcli"  class='button-warning pure-button' />
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="place_edit_pro" runat="server" Visible="false">
                            <div class='pure-form pure-form-aligned' >
                                <div class='pure-control-group'>
                                    <label >Producto</label>
                                    <asp:TextBox ID="txtpro_id" runat="server"  MaxLength="30" visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtpro_name" runat="server"  MaxLength="30" Enabled="false"></asp:TextBox>
                                </div>

                                <div class='pure-control-group'>
                                    <label >Cantidad</label>
                                    <asp:TextBox ID="txtpro_cant" runat="server" ></asp:TextBox>
                                </div>
                                 <div class='pure-control-group'>
                                        <asp:PlaceHolder ID="place_list_pro" runat="server" Visible="false">
                                            <br />
                                            <asp:GridView ID="dgv_list_pro" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_pro_RowCommand" >
                                                <Columns>
                                                        <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                                    </Columns>
                                            </asp:GridView>

                                             <asp:Button ID="btn_cancel_list_pro" runat="server" Text="Cancelar" OnClick="btn_cancel_list_pro"  class='button-warning pure-button' />
                                        </asp:PlaceHolder>
                                     
                                </div>

                                <div class='pure-controls'>
                                    <asp:Button ID="btncancelpro" runat="server" Text="Cancelar Lote" OnClick="btn_cancelar_pro"  class='button-warning pure-button' />
                                    <asp:Button ID="btnsavepro" runat="server" Text="Save" OnClick="btn_save_pro"  class='button-success pure-button' />
                                </div>
                            </div>
                     </asp:PlaceHolder>

                    <span>Productos de la compra</span>


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
                         <asp:Button ID="btncancel" runat="server" Text="Cancelar Lote" OnClick="btn_cancelar"  class='button-warning pure-button' />
                         <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btn_save"  class='button-success pure-button' />
                    </div>

                </div>   
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="place_dgv" runat="server">
                <span>Listado de Ventas</span>
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



     <%-- <div class='pure-control-group'>
                                                <asp:Button ID="btn_addcli" runat="server" Text="Añadir Cliente" OnClick="btn_add_cli"  class='button-success pure-button' />
                                                </div>

                                                <div class='pure-control-group'>
                                                      <label for='password'>Cliente</label>
                                                    <asp:TextBox ID="txtcli_id" runat="server"  MaxLength="50" Visible="false"></asp:TextBox>

                                                    <asp:TextBox ID="txtcli" runat="server"  MaxLength="50" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div>
                                                    
                                                    <asp:PlaceHolder ID="place_list_cliente" runat="server" Visible="false">
                                                        <br />
                                                        <asp:GridView ID="dgv_list_client" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_client_RowCommand" >
                                                            <Columns>
                                                                  <asp:buttonfield buttontype="Link"  commandname="select" headertext="" text="Select"/>
                                                             </Columns>
                                                    </asp:GridView>

                                                    <asp:Button ID="btn_cancel_cli" runat="server" Text="Cancelar" OnClick="btn_cancelarcli"  class='button-warning pure-button' />
                                                    </asp:PlaceHolder>
                                 </div>--%>

</asp:Content>
