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
        
        //list ventas
                Lotes_pro.Lote_id = 0;
                //id no real-list empy list
                Lotes_pro.Solicomp_id = Convert.ToInt32(txtsoli_id.Text);
                //Lotes_pro.mode = 1; 
                dgv_list_lotes_to_solicomp.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
                dgv_list_lotes_to_solicomp.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        protected void dgv_list_client_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           //cli
           int index = Convert.ToInt32(e.CommandArgument);
           GridViewRow dgvrow = dgv_list_client.Rows[index];
           if (e.CommandName == "select")
           {
               txtcli.Text = dgvrow.Cells[2].Text;
               txtcli_id.Text = dgvrow.Cells[1].Text;
               place_list_pro.Visible = false;
               btnaddpro.Visible = true;
           }
        }

        protected void btn_add_cli(object sender, EventArgs e)
        {
           btn_addcli.Visible = false;
           place_list_cliente.Visible = true;
           Cliente.Cli_id = 0;
           Cliente.Cli_type = "PERSONA";
           dgv_list_client.DataSource = clsClie.List_Clientes(Cliente);
           dgv_list_client.DataBind();

        }

        //protected void btn_cancelarcli(object sender, EventArgs e)
        //{

        //    btn_addcli.Visible = true;
        //    place_list_cliente.Visible = false;

        //}


         protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //soli
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv.Rows[index];
            if (e.CommandName == "editar")
            {

                place_Solicomp.Visible = true;
                place_list_solicomp.Visible = false;
                txtsoli_id.Text = dgvrow.Cells[2].Text;            
                txtuser_id.Text = dgvrow.Cells[3].Text;
                txtuser.Text = dgvrow.Cells[4].Text;
                txtcode.Text = dgvrow.Cells[5].Text;
                dtvence.SelectedDate = Convert.ToDateTime(dgvrow.Cells[8].Text);
  


            }
            else if (e.CommandName == "eliminar")
            {
                Solicitud.Solicomp_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                //msg

                 //functions fn = new functions();
                // Session["msg"] = fn.msg(clsPro.Delete_Productos(Producto), "info");
                //  Response.Redirect("solicompra.aspx");

                clsSolicomp.Delete_Solicitud_comp(Solicitud);
                load();
                        
            }
               
            
        }

        protected void dgv_list_pro_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //pro
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_pro.Rows[index];
            if (e.CommandName == "select")
            {
                txtpro_id.Text = dgvrow.Cells[1].Text;
                txtpro_name.Text = dgvrow.Cells[2].Text;
                place_list_pro.Visible = false;
                btnaddpro.Visible = true;
            }
            

        }
        

    }
}