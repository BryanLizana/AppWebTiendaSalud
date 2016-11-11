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
    public partial class solicompra : System.Web.UI.Page
    {
        cls_Lote_pro clsLotPro = new cls_Lote_pro();
        cls_Lotes_pro Lotes_pro = new cls_Lotes_pro();

        cls_Producto clsPro = new cls_Producto();
        cls_Productos Producto = new cls_Productos();

        cls_Solicitud_comp Solicitud = new cls_Solicitud_comp();
        cls_Solicitud_compra clsSolicomp = new cls_Solicitud_compra();

        cls_Cliente clsClie = new cls_Cliente();
        cls_Clientes Cliente = new cls_Clientes();
            

        public void clean_lot()
        {
            txtLotcant.Text = "";
            txtLotcode.Text = "";
            txtproducto.Text = "";
            txtpro_id.Text = "";
           
        }
        public  void clean_solip()
        {
            txtuser.Text = "";
            txtuser_id.Text = "";
            txtcode.Text = "";
            clean_lot();
        }

        public void load()
        {
            //cargar data-List-Solicomp
            Solicitud.Solicomp_id = 0;
            dgv.DataSource= clsSolicomp.List_Solicitud_comp(Solicitud);
            dgv.DataBind();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        protected void btn_addSolip(object sender, EventArgs e)
        {
            place_Solicomp.Visible = true;
            place_list_solicomp.Visible = false;
            Lotes_pro.Lote_id = 0;
            //id no real-list empy list
            Lotes_pro.Solicomp_id = 100;
            //Lotes_pro.mode = 1; 
            dgv_list_lotes_to_solicomp.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
            dgv_list_lotes_to_solicomp.DataBind();
            clean_solip();
            txtuser.Text = Session["User_name"].ToString();
            txtuser_id.Text = Session["User_id"].ToString();


        }
        protected void btn_addLot(object sender, EventArgs e)
        {
            //save soli
            Solicitud.Solicomp_id = (txtsoli_id.Text != "") ? Convert.ToInt32(txtsoli_id.Text) :0 ;            
            Solicitud.Us_id = Convert.ToInt32(txtuser_id.Text);
            Solicitud.Doc_type = "";
            Solicitud.Solicomp_doc_number = txtcode.Text;
            Solicitud.Solicomp_date = DateTime.Now;
            Solicitud.Solicomp_estado = "PROCESO";
            Solicitud.Solicomp_valido= Convert.ToDateTime(dtvence.SelectedDate);

            int id_soli = clsSolicomp.Insert_Solicitud_comp(Solicitud);
            txtsoli_id.Text = Convert.ToString(id_soli);
           
            btnaddlot.Visible = false;
            place_list_solicomp.Visible = false;
            place_addlote.Visible = true;
            clean_lot();

        }   
        protected void btn_addpro(object sender, EventArgs e)
        {
            btnaddpro.Visible = false;
            place_list_solicomp.Visible = false;
            place_listpro.Visible = true;
            Producto.Pro_id = 0;
            dgv_list_pro.DataSource = clsPro.List_Productos(Producto);
            dgv_list_pro.DataBind();

        }



        protected void btn_cancelar_soli(object sender, EventArgs e)
        {
            place_list_solicomp.Visible = true;
            place_Solicomp.Visible = false;
            clean_solip();
             Response.Redirect("solicompra.aspx");
        }
       


        protected void btn_cancelar_pro(object sender, EventArgs e)
        {
            btnaddpro.Visible = true;
            place_listpro.Visible = false;
        }

        protected void btn_cancelar_lot(object sender, EventArgs e)
        {
            btnaddlot.Visible = true;
            place_addlote.Visible = false;
            clean_lot();
           

        }
        protected void btn_save_soli(object sender, EventArgs e)
        {
            //save
            //save soli
            place_Solicomp.Visible= false;
            btnaddSolicomp.Visible= true;
            Solicitud.Solicomp_id = (txtsoli_id.Text != "") ? Convert.ToInt32(txtsoli_id.Text) :0 ;            
            Solicitud.Us_id = Convert.ToInt32(txtuser_id.Text);
            Solicitud.Doc_type = "";
            Solicitud.Solicomp_doc_number = txtcode.Text;
            Solicitud.Solicomp_date = DateTime.Now;
            Solicitud.Solicomp_estado = "COMPLETADO";
            Solicitud.Solicomp_valido= Convert.ToDateTime(dtvence.SelectedDate);

            int id_soli = clsSolicomp.Insert_Solicitud_comp(Solicitud);
            if (id_soli > 0){
                clean_solip();                
            }

            Response.Redirect("solicompra.aspx");

        }
        protected void btn_save_lot(object sender, EventArgs e)
        {
            //save
            Lotes_pro.Lote_id =  (txtlot_id.Text != "") ? Convert.ToInt32(txtlot_id.Text) : 0;
            Lotes_pro.Pro_id = Convert.ToInt32(txtpro_id.Text);
            Lotes_pro.Lote_vence = DateTime.Now;
            Lotes_pro.Lote_cod = txtLotcode.Text;
            Lotes_pro.Lote_cant =Convert.ToInt32(txtLotcant.Text);
            Lotes_pro.Lote_almacen = cbalmacen.SelectedValue;
            Lotes_pro.Lote_estado = "PROCESO";
            Lotes_pro.Lote_stock = 0;
            Lotes_pro.Solicomp_id = Convert.ToInt32(txtsoli_id.Text);
            clsLotPro.Insert_Lotes_pro(Lotes_pro);

            Lotes_pro.Lote_id = 0;
            Lotes_pro.Solicomp_id = Convert.ToInt32(txtsoli_id.Text);
            //Lotes_pro.mode = 1; 
            dgv_list_lotes_to_solicomp.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
            dgv_list_lotes_to_solicomp.DataBind();
            clean_lot();

            btnaddlot.Visible = true;
            place_addlote.Visible = false;


        }



        protected void dgv_list_pro_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //pro
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_pro.Rows[index];
            if (e.CommandName == "select")
            {
                txtproducto.Text = dgvrow.Cells[2].Text;
                txtpro_id.Text = dgvrow.Cells[1].Text;
                place_listpro.Visible = false;
                btnaddpro.Visible = true;
            }
            

        }


        protected void dgv_list_lotes_to_solicomp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //lot
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv_list_lotes_to_solicomp.Rows[index];
            if (e.CommandName == "editar")
            {
                btnaddlot.Visible = false;
                place_list_solicomp.Visible = false;
                place_addlote.Visible = true;

                txtlot_id.Text =  dgvrow.Cells[2].Text;
                Lotes_pro.Lote_id = Convert.ToInt32(txtlot_id.Text);
                DataTable dt = clsLotPro.List_Lotes_pro(Lotes_pro);
                DataRow dr = dt.Rows[0];

                txtproducto.Text = dgvrow.Cells[3].Text;
                txtpro_id.Text = dr[1].ToString();
                txtLotcant.Text = dgvrow.Cells[6].Text;
                cbalmacen.SelectedItem.Value = dgvrow.Cells[7].Text;


            }
            else if (e.CommandName == "eliminar")
            {
                Lotes_pro.Lote_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                  //functions fn = new functions();
                // Session["msg"] = fn.msg(clsLotPro.Delete_Lotes_pro(Lotes_pro), "info");

                clsLotPro.Delete_Lotes_pro(Lotes_pro);

                        Lotes_pro.Lote_id = 0;
                        Lotes_pro.Solicomp_id = Convert.ToInt32(txtsoli_id.Text);
                        //Lotes_pro.mode = 1; 
                        dgv_list_lotes_to_solicomp.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
                        dgv_list_lotes_to_solicomp.DataBind();
            }
        }

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
                Lotes_pro.Lote_id = 0;
                //id no real-list empy list
                Lotes_pro.Solicomp_id = Convert.ToInt32(txtsoli_id.Text);
                //Lotes_pro.mode = 1; 
                dgv_list_lotes_to_solicomp.DataSource = clsLotPro.List_Lotes_pro(Lotes_pro);
                dgv_list_lotes_to_solicomp.DataBind();


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
            
   
        
    }
}