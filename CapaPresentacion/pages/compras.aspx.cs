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
    public partial class compras : System.Web.UI.Page
    {
        cls_Lote_pro clsLotPro = new cls_Lote_pro();
        cls_Lotes_pro Lotes_pro = new cls_Lotes_pro();

        cls_Proveedor clsProvee = new cls_Proveedor();
        cls_Proveedores Proveedor = new cls_Proveedores();

        cls_Solicitud_comp Solicitud = new cls_Solicitud_comp();
        cls_Solicitud_compra clsSolicomp = new cls_Solicitud_compra();

        public void load()
        {
            Solicitud.Solicomp_id = 0;
            dgv.DataSource = clsSolicomp.List_Solicitud_comp(Solicitud);
            dgv.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        //txtaporte.Text = "";
        public void clean_lot()
        {
            txtLotcant.Text = "";
            txtLotcode.Text = "";
            txtproducto.Text = "";
            txtpro_id.Text = "";
            txtaporte.Text = "";

        }

        protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
                //soli
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow dgvrow = dgv.Rows[index];
                if (e.CommandName == "comprar")
                {

                place_compra.Visible = true;




                }

                    
            }
            
        protected void dgv_list_provee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_provee.Rows[index];
            if (e.CommandName == "select")
            {
                txtprovee.Text = dgvrow.Cells[2].Text;
                txtprovee_id.Text = dgvrow.Cells[1].Text;
                place_list_provee.Visible = false;
                btn_addprovee.Visible = true;

            }
        }

        protected void btn_add_provee(object sender, EventArgs e)
        {
            place_list_provee.Visible = true;
            btn_addprovee.Visible = false;
            Proveedor.Provee_id = 0;
            dgv_list_provee.DataSource = clsProvee.List_Proveedores(Proveedor);
            dgv_list_provee.DataBind();

        }

        protected void btn_cancel_provee(object sender, EventArgs e)
        {
            // clean proveedor 

            place_list_provee.Visible = false;
            btn_addprovee.Visible = true;      
        }

        protected void dgv_list_lotes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //lot
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_lotes.Rows[index];
            if (e.CommandName == "editar")
            {
                place_edit_lot.Visible = true;
                txtlot_id.Text = dgvrow.Cells[2].Text;

                Lotes_pro.Lote_id = Convert.ToInt32(txtlot_id.Text);
                DataTable dt = clsLotPro.List_Lotes_pro(Lotes_pro);
                DataRow dr = dt.Rows[0];

                txtproducto.Text = dgvrow.Cells[3].Text;
                txtpro_id.Text = dr[1].ToString();
                txtLotcant.Text = dgvrow.Cells[6].Text;
                cbalmacen.SelectedItem.Value = dgvrow.Cells[7].Text;

                //
                txtaporte.Text = "";
                dtlotvence.SelectedDate = Convert.ToDateTime("");

            }

        }

        protected void btn_cancelar_lot(object sender, EventArgs e)
        {
            clean_lot();

            place_edit_lot.Visible = false;

        }
            
        protected void btn_save_lot(object sender, EventArgs e)
        {
            if (txtpro_id.Text != "" && txtproducto.Text != "" && txtLotcant.Text != "" && txtLotcant.Text != "" && cbalmacen.Text != "")
            {
                //save
                Lotes_pro.Lote_id = (txtlot_id.Text != "") ? Convert.ToInt32(txtlot_id.Text) : 0;
                Lotes_pro.Pro_id = Convert.ToInt32(txtpro_id.Text);
                Lotes_pro.Lote_vence = dtlotvence.SelectedDate;
                Lotes_pro.Lote_cod = txtLotcode.Text;
                Lotes_pro.Lote_cant = Convert.ToInt32(txtLotcant.Text);
                Lotes_pro.Lote_almacen = cbalmacen.SelectedValue;
                Lotes_pro.Lote_estado = "PROCESO";
                Lotes_pro.Lote_aporte = Convert.ToDouble(txtaporte.Text);
                Lotes_pro.Lote_stock = 0;
                Lotes_pro.Solicomp_id = Convert.ToInt32(txtsolicompid.Text);
                clsLotPro.Insert_Lotes_pro(Lotes_pro);

                Lotes_pro.Lote_id = 0;
                Lotes_pro.Solicomp_id = Convert.ToInt32(txtsolicompid.Text);
                //Lotes_pro.mode = 1; 
                dgv_list_lotes.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
                dgv_list_lotes.DataBind();
                clean_lot();
                
                place_edit_lot.Visible = false;
            }

            
        }
    }
}