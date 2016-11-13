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

        cls_Compra clsComp = new cls_Compra();
        cls_Compras Compra = new cls_Compras();

        cls_Credito clsCredito = new cls_Credito();
        cls_Creditos Credito = new cls_Creditos();

        public void load()
        {
            Solicitud.Solicomp_id = 0;
            dgv.DataSource = clsSolicomp.List_Solicitud_comp(Solicitud);
            dgv.DataBind();

                
            Compra.Comp_id = 0; 
            dgv_list_compra.DataSource = clsComp.List_Compras(Compra);
            dgv_list_compra.DataBind();
        }


        public void clean_compra()
        {

        }
        public void clean_provee()
        {   

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

                //clean compra

                txtuser_id.Text = Session["User_id"].ToString();
                txtuser.Text = Session["User_code"].ToString();

                place_compra.Visible = true;

                Lotes_pro.Lote_id = 0;
                Lotes_pro.Solicomp_id = Convert.ToInt32(dgvrow.Cells[1].Text);
                dgv_list_lotes.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
                dgv_list_lotes.DataBind();

                double total = 0;

                for (int i = 0; i < dgv_list_lotes.Rows.Count; i++)
                {   
                    GridViewRow dgv_list_lotes_row = dgv_list_lotes.Rows[i];
                    total += Convert.ToDouble(dgv_list_lotes_row.Cells[8].Text);
                }

                txtsubto.Text = total.ToString("0#.##");
                txtigv.Text = (total * 0.18).ToString("0#.##");
                txttotal.Text = (total * 1.18).ToString("0#.##");


                txtsolicompid.Text = dgvrow.Cells[1].Text;
                txtuser_solicomp.Text = dgvrow.Cells[3].Text;
                dgv_list_lotes.Visible = true;

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
                txtLotcode.Text = dgvrow.Cells[5].Text;
                //
                txtaporte.Text = dgvrow.Cells[8].Text;
                dtlotvence.SelectedDate = Convert.ToDateTime(dgvrow.Cells[4].Text);

            }

        }

        protected void btn_cancelar_lot(object sender, EventArgs e)
        {
            clean_lot();

            place_edit_lot.Visible = false;

        }
            
        protected void btn_save_lot(object sender, EventArgs e)
        {
            if (txtpro_id.Text != "" && txtproducto.Text != "" && txtLotcant.Text != "" && txtLotcant.Text != "" && cbalmacen.Text != "" && txtaporte.Text != "" && dtlotvence.SelectedDate != null)
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

        protected void dgv_list_compra_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_lotes.Rows[index];
            if (e.CommandName == "editar")
            {
                place_compra.Visible = true;
                place_list_solicomp.Visible = false;

            }
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            //clean compra
            place_compra.Visible = false;
        }
        protected void btn_save(object sender, EventArgs e)
        {

            if (txtcre_mensual.Text != "")
            {
                if (txtsolicompid.Text != "")
                {
                    //create credito basic
                    Credito.Cre_id = (txtcre_id.Text != "") ? Convert.ToInt32(txtcre_id.Text) :0 ;
                    Credito.Cre_plazos = Convert.ToInt32(cbmes.SelectedValue.ToString());
                    Credito.Cre_subtotal = Convert.ToDouble(txtsubto.Text);
                    Credito.Cre_igv = Convert.ToDouble(txtigv.Text);
                    Credito.Cre_total = Convert.ToDouble(txttotal.Text);
                    Credito.Cre_interes = Convert.ToDouble(txtcre_interes.Text) * Convert.ToInt32(cbmes.SelectedValue.ToString());
                    Credito.Cre_pago =( Convert.ToDouble(txtcre_interes.Text) * Convert.ToInt32(cbmes.SelectedValue.ToString()) ) + Convert.ToDouble(txttotal.Text);
                    Credito.Cre_estado = "COMPLETADO";
                    Credito.Cre_date_fin = DateTime.Now.AddMonths(Convert.ToInt32(cbmes.SelectedValue.ToString()) - 1) ;
                    Credito.Cre_date_prox = DateTime.Now;


                    int cre_id = clsCredito.Insert_Creditos(Credito);

                    Compra.Comp_id = (txtcompraid.Text == "") ? 0 : Convert.ToInt32(txtcompraid.Text);
                    Compra.Comp_date = DateTime.Now;
                    Compra.Comp_doc_number = txtcode.Text;
                    Compra.Comp_estado = "COMPLETADO";
                    Compra.Doc_type = "DOCCOMPRA";
                    Compra.Provee_id = Convert.ToInt32(txtprovee_id.Text);
                    Compra.Solicomp_id = Convert.ToInt32(txtsolicompid.Text);
                    Compra.Us_id = Convert.ToInt32(txtuser_id.Text);
                    Compra.Cre_id = cre_id;

                    //msg
                    clsComp.Insert_Compras(Compra);

                    place_credito.Visible = false;
                    btnsave.Visible = true;
                    //clean compra
                    Response.Redirect("compras.aspx");

                }
            }
            else
            {
                place_credito.Visible = true;
                btnsave.Visible = false;

            }

        }

        protected void cbmes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //crev

            int mes = Convert.ToInt32(cbmes.SelectedValue.ToString());

            txtcre_interes.Text = ((Convert.ToDouble(txttotal.Text) / mes) * 0.5).ToString("0#.##");
            txtcre_mensual.Text = ((Convert.ToDouble(txttotal.Text) / mes) * 1.5).ToString("0#.##");


        }
    }
}