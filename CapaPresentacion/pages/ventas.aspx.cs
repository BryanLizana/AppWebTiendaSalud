using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaNegocios;
using CapaDatos;
namespace CapaPresentacion.pages
{
    public partial class ventas : System.Web.UI.Page
    {
        cls_Venta ClsVen = new cls_Venta();
        cls_Ventas Venta = new cls_Ventas();
        
        public void load(){
        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        //protected void dgv_list_client_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    //cli
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    GridViewRow dgvrow = dgv_list_client.Rows[index];
        //    if (e.CommandName == "select")
        //    {
        //        txtcli.Text = dgvrow.Cells[2].Text;
        //        txtcli_id.Text = dgvrow.Cells[1].Text;
        //        place_listpro.Visible = false;
        //        btnaddpro.Visible = true;
        //    }
        //}

        //protected void btn_add_cli(object sender, EventArgs e)
        //{
        //    btn_addcli.Visible = false;
        //    place_list_cliente.Visible = true;
        //    Cliente.Cli_id = 0;
        //    Cliente.Cli_type = "PERSONA";
        //    dgv_list_client.DataSource = clsClie.List_Clientes(Cliente);
        //    dgv_list_client.DataBind();

        //}

        //protected void btn_cancelarcli(object sender, EventArgs e)
        //{

        //    btn_addcli.Visible = true;
        //    place_list_cliente.Visible = false;

        //}

    }
}