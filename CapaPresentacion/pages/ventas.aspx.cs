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

        cls_Cliente ClsCli = new cls_Cliente();
        cls_Clientes Cliente = new cls_Clientes();

        cls_Producto clsPro = new cls_Producto();
        cls_Productos Producto = new cls_Productos();
        public void load(){
        
        //list ventas
                Venta.Ven_id = 0;
                dgv.DataSource = ClsVen.List_Ventas(Venta);
                dgv.DataBind();
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
               place_list_cliente.Visible = false;
                btn_addcli.Visible = true;

           }


        }

        protected void btn_add_cli(object sender, EventArgs e)
        {
           btn_addcli.Visible = false;
           place_list_cliente.Visible = true;
           Cliente.Cli_id = 0;
           Cliente.Cli_type = "PERSONA";
           dgv_list_client.DataSource = ClsCli.List_Clientes(Cliente);
           dgv_list_client.DataBind();


        }
        protected void btn_cancelarcli(object sender, EventArgs e)
        {
            //clean cliente 
            place_list_cliente.Visible = true;

        }
        protected void btn_cancelar_pro(object sender, EventArgs e)
        {
            //btn_cancelarcli pro to venta

            //clean pro
            place_list_pro.Visible = false;
            place_edit_pro.Visible = false;
            btn_add_pro.Visible = true; 
        }

        protected void btn_save_pro(object sender, EventArgs e)
        {
            //savve pro to venta

            //clean pro
            place_list_pro.Visible = false;
            place_edit_pro.Visible = false;
            btn_add_pro.Visible = true;
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            //cancel venta
            //cleanventa
            place_edit_venta.Visible = true;
            btn_add_venta.Visible = true;
            place_dgv.Visible = true;

        }

        protected void btn_save(object sender, EventArgs e)
        {
            //savve venta

            //cleanventa
            place_edit_venta.Visible = true;
            btn_add_venta.Visible = true;
            place_dgv.Visible = true;


        }
        protected void btn_addpro(object sender, EventArgs e)
        {

            Producto.mode = 1;
            dgv_list_pro.DataSource = clsPro.List_Productos(Producto);
            dgv_list_pro.DataBind();
            place_list_pro.Visible = true;
            place_edit_pro.Visible = true;
            btn_add_pro.Visible = false;
    
        }

        protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //soli
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv.Rows[index];
            if (e.CommandName == "editar")
            {

                place_edit_venta.Visible = true;
                place_dgv.Visible = false;
                txtven_id.Text = dgvrow.Cells[2].Text;            
                txtuser_id.Text = dgvrow.Cells[3].Text;
                txtuser.Text = dgvrow.Cells[4].Text;
                txtcode.Text = dgvrow.Cells[5].Text;
  


            }
            else if (e.CommandName == "eliminar")
            {
                Venta.Ven_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                //msg

                functions fn = new functions();
                Session["msg"] = fn.msg(ClsVen.Delete_Ventas(Venta), "info");
                //Response.Redirect("solicompra.aspx");

                ClsVen.Delete_Ventas(Venta);
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
            }
            

        }


        protected void dgv_list_profo_detalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //pro
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_pro.Rows[index];
            if (e.CommandName == "editar")
            {

            }
            else if (e.CommandName == "eliminar")
            {

            }


        }

        protected void btn_add_ven(object sender, EventArgs e)
        {
            place_edit_venta.Visible = true;
            btn_add_venta.Visible = false;
            place_dgv.Visible = false;


            cls_Proforma_detalle clsPrefDet = new cls_Proforma_detalle();
            cls_Proforma_detalles PrefDetalle = new cls_Proforma_detalles();

            PrefDetalle.Pref_id = 0;
            dgv_list_profo_detalle.DataSource =   clsPrefDet.List_Proforma_detalles(PrefDetalle);
            dgv_list_profo_detalle.DataBind();

        }
    }
}