﻿using System;
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
    public partial class proformas : System.Web.UI.Page
    {
        //cls_Venta ClsVen = new cls_Venta();
        //cls_Ventas Venta = new cls_Ventas();

        cls_Cliente ClsCli = new cls_Cliente();
        cls_Clientes Cliente = new cls_Clientes();

        cls_Producto clsPro = new cls_Producto();
        cls_Productos Producto = new cls_Productos();

        cls_Proforma clsProf = new cls_Proforma();
        cls_Proformas Proforma = new cls_Proformas();

        cls_Proforma_detalle clsDetall = new cls_Proforma_detalle();
        cls_Proforma_detalles Detalle = new cls_Proforma_detalles();

        cls_Credito clsCredito = new cls_Credito();
        cls_Creditos Credito = new cls_Creditos();

    
        public void load()
        {

            //list ventas
            Proforma.Pref_id = 0;
            dgv.DataSource = clsProf.List_Proformas(Proforma);
            dgv.DataBind();
        }

        public int save_cre(string estado)
        {
            //create credito basic
            Credito.Cre_id = (txtcre_id.Text != "") ? Convert.ToInt32(txtcre_id.Text) : 0;
            Credito.Cre_plazos = (cbmes.SelectedValue != null) ? Convert.ToInt32(cbmes.SelectedValue.ToString()) : 0;
            Credito.Cre_subtotal = (txtven_subto.Text != "") ? Convert.ToDouble(txtven_subto.Text) : 0;
            Credito.Cre_igv = (txven_igv.Text != "") ? Convert.ToDouble(txven_igv.Text) : 0;
            Credito.Cre_total = (txtven_total.Text != "") ? Convert.ToDouble(txtven_total.Text) : 0;
            Credito.Cre_interes = (txtcre_interes.Text != "") ? Convert.ToDouble(txtcre_interes.Text) * Convert.ToInt32(cbmes.SelectedValue.ToString()) : 0;
            Credito.Cre_pago = (cbmes.SelectedValue != "1") ? (Convert.ToDouble(txtcre_interes.Text) * Convert.ToInt32(cbmes.SelectedValue.ToString())) + Convert.ToDouble(txtven_total.Text) : 0;
            Credito.Cre_estado = estado;
            Credito.Cre_date_fin = DateTime.Now.AddMonths(Convert.ToInt32(cbmes.SelectedValue.ToString()) - 1);
            Credito.Cre_date_prox = DateTime.Now;

            return clsCredito.Insert_Creditos(Credito);
        }
        public int save_profo(string estado)
        {
            int id_cre = 0;
            Proforma.Pref_id = txtprof_id.Text != "" ? Convert.ToInt32(txtprof_id.Text) : 0;
            Proforma.Pref_doc_number = "PROFORMA";
            Proforma.Pref_estado = estado;
            Proforma.Pref_valido = DateTime.Now;
            Proforma.Cli_id = Convert.ToInt32(txtcli_id.Text);
            Proforma.Us_id = Convert.ToInt32(txtuser_id.Text);
            id_cre = save_cre(estado);
            Proforma.Cre_id = id_cre;

            txtcre_id.Text = id_cre.ToString();
            txtprof_id.Text = (clsProf.Insert_Proformas(Proforma)).ToString();


            return Convert.ToInt32(txtprof_id.Text);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        public void clean_form()
        {
            txtcli.Text = "";
            txtcre_id.Text = "";
            txtlot_id.Text = "";
            txtprof_id.Text = "";
            txtpro_id.Text = "";
            txtpro_name.Text = "";
            txtpro_importe.Text = "";
            //txtuser_id.Text = "";

        }

        public void cal_total()
        {
            double total = 0;

            for (int i = 0; i < dgv_list_profo_detalle.Rows.Count; i++)
            {
                GridViewRow dgv_list_lotes_row = dgv_list_profo_detalle.Rows[i];
                total += Convert.ToDouble(dgv_list_lotes_row.Cells[4].Text);
            }

            txtven_subto.Text = total.ToString("0#.##");
            txven_igv.Text = (total * 0.18).ToString("0#.##");
            txtven_total.Text = (total * 1.18).ToString("0#.##");

        }
        protected void dgv_list_client_RowCommand(object sender, GridViewCommandEventArgs e)
        {
         
            if (e.CommandName == "select")
            {
                //cli
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow dgvrow = dgv_list_client.Rows[index];
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
            
            place_list_cliente.Visible = false;

        }
        protected void btn_cancelar_pro(object sender, EventArgs e)
        {
            //btn_cancelarcli pro to venta

            txtpro_id.Text = "";
            txtpro_name.Text = "";
            txtpro_importe.Text = "";

            place_list_pro.Visible = false;
            place_edit_pro.Visible = false;
            btn_add_pro.Visible = true;
        }

        protected void btn_save_pro(object sender, EventArgs e)
        {
            if (txtpro_cant.Text != "" && txtpro_name.Text != "" && txtcli_id.Text != "" && txtuser_id.Text !="" && txtlot_id.Text != "" && txtpro_id.Text != "")
            {
                //save profo
                int id_prof = save_profo("PROCESO");

                //save pro to pref
                Detalle.Cant = Convert.ToInt32(txtpro_cant.Text);
                Detalle.Estado = "POCESO";
                Detalle.Lote_id = Convert.ToInt32(txtlot_id.Text);
                Detalle.Pref_id = id_prof;
                Detalle.Pro_id = Convert.ToInt32(txtpro_id.Text);
                Detalle.Importe = Convert.ToDouble(txtpro_importe.Text) * Convert.ToInt32(txtpro_cant.Text);

                //msg
                clsDetall.Insert_Proforma_detalles(Detalle);

                txtpro_id.Text = "";
                txtpro_name.Text = "";
                txtpro_importe.Text = "";
                place_list_pro.Visible = false;
                place_edit_pro.Visible = false;
                btn_add_pro.Visible = true;

                cls_Proforma_detalle clsPrefDet = new cls_Proforma_detalle();
                cls_Proforma_detalles PrefDetalle = new cls_Proforma_detalles();

                PrefDetalle.Pref_id = id_prof;
                dgv_list_profo_detalle.DataSource = clsPrefDet.List_Proforma_detalles(PrefDetalle);
                dgv_list_profo_detalle.DataBind();

                cal_total();
            }
            else
            {
               functions fn = new functions();
                    Session["msg"] = fn.msg("Campos Vacíos", "info");
                    Response.Redirect("proformas.aspx");

            }
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            //cancel venta
            clean_form();
            place_edit_proforma.Visible = false;
            btn_add_proforma.Visible = true;
            place_dgv.Visible = true;


        }

        protected void btn_save(object sender, EventArgs e)
        {
            if (txtcre_mensual.Text != "")
            {

                if (txtcre_mensual.Text != "")
                {
                    save_profo("COMPLETADO");

                    //savve venta
                    //Venta.Ven_id = (txtprof_id.Text != "") ? Convert.ToInt32(txtprof_id.Text) : 0;
                    //Venta.Doc_type = "VENTA";
                    //Venta.Pref_id = Convert.ToInt32(txtprof_id.Text);
                    //Venta.Us_id = Convert.ToInt32(txtuser_id.Text);
                    //Venta.Ven_date = DateTime.Now;
                    //Venta.Ven_doc_number = txtcode.Text;
                    //ClsVen.Insert_Ventas(Venta);
                    //msg

                    clean_form();


                    place_edit_proforma.Visible = false;
                    btn_add_proforma.Visible = true;
                    place_dgv.Visible = true;


                    Response.Redirect("proformas.aspx");
                }
                else
                {
                    functions fn = new functions();
                    Session["msg"] = fn.msg("Campos Vacíos", "info");
                    Response.Redirect("proformas.aspx");
                }


            }
            else
            {
                add_data_cre();
                place_credito.Visible = true;
                btnsave.Visible = false;

            }

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
           
            if (e.CommandName == "editar")
            {
                //Proformas
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow dgvrow = dgv.Rows[index];

                place_edit_proforma.Visible = true;
                place_dgv.Visible = false;
                txtprof_id.Text = dgvrow.Cells[2].Text;

                //Venta.Ven_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                //DataTable dt = ClsVen.List_Ventas(Venta);
                //DataRow dr = dt.Rows[0];

                
                ////list pro asoiciados
                Proforma.Pref_id = Convert.ToInt32(dgvrow.Cells[2].Text);
              DataTable dt =  clsProf.List_Proformas(Proforma);
              DataRow dr = dt.Rows[0];
               
                txtuser.Text = dgvrow.Cells[3].Text;
                txtuser_id.Text = dr[1].ToString();
                txtcli.Text = dgvrow.Cells[4].Text;
                txtcli_id.Text = dr[2].ToString();


                cls_Proforma_detalle clsPrefDet = new cls_Proforma_detalle();
                cls_Proforma_detalles PrefDetalle = new cls_Proforma_detalles();

                PrefDetalle.Pref_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                dgv_list_profo_detalle.DataSource = clsPrefDet.List_Proforma_detalles(PrefDetalle);
                dgv_list_profo_detalle.DataBind();

                txtven_subto.Text = dgvrow.Cells[7].Text;
                txven_igv.Text = dgvrow.Cells[5].Text;
                txtven_total.Text = dgvrow.Cells[6].Text;


                cal_total();



            }
            else if (e.CommandName == "eliminar")
            { //Proformas
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow dgvrow = dgv.Rows[index];

                Proforma.Pref_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                //msg

                functions fn = new functions();
                Session["msg"] = fn.msg(clsProf.Delete_Proformas(Proforma), "info");
                Response.Redirect("proformas.aspx");


            }


        }

        protected void dgv_list_pro_RowCommand(object sender, GridViewCommandEventArgs e)
        {
          
            if (e.CommandName == "select")
            {
                //pro
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow dgvrow = dgv_list_pro.Rows[index];
                txtpro_id.Text = dgvrow.Cells[1].Text;
                txtpro_name.Text = dgvrow.Cells[2].Text;
                txtlot_id.Text = dgvrow.Cells[9].Text;
                txtpro_importe.Text = dgvrow.Cells[4].Text;
                place_list_pro.Visible = false;
            }


        }


        protected void dgv_list_profo_detalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
          


        }

        protected void btn_add_ven(object sender, EventArgs e)
        {
            place_edit_proforma.Visible = true;
            btn_add_proforma.Visible = false;
            place_dgv.Visible = false;

            txtuser.Text = Session["User_code"].ToString();
            txtuser_id.Text = Session["User_id"].ToString();

            

            cls_Proforma_detalle clsPrefDet = new cls_Proforma_detalle();
            cls_Proforma_detalles PrefDetalle = new cls_Proforma_detalles();

            PrefDetalle.Pref_id = 0;
            dgv_list_profo_detalle.DataSource = clsPrefDet.List_Proforma_detalles(PrefDetalle);
            dgv_list_profo_detalle.DataBind();


            cal_total();

        }

        public void add_data_cre()
        {
            //crev

            int mes = Convert.ToInt32(cbmes.SelectedValue.ToString());

            if (mes != 1)
            {
                txtcre_interes.Text = ((Convert.ToDouble(txtven_total.Text) / mes) * 0.05).ToString("0#.##");
                txtcre_mensual.Text = ((Convert.ToDouble(txtven_total.Text) / mes) * 1.05).ToString("0#.##");

            }
            else
            {
                txtcre_interes.Text = "0,0";
                txtcre_mensual.Text = "0,0";
            }
        }
        protected void cbmes_SelectedIndexChanged(object sender, EventArgs e)
        {
            add_data_cre();
        }

        

        protected void dgv_list_client_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgv_list_client.PageIndex = e.NewPageIndex;
            Cliente.Cli_id = 0;
            Cliente.Cli_type = "PERSONA";
            dgv_list_client.DataSource = ClsCli.List_Clientes(Cliente);
            dgv_list_client.DataBind();
        }
    }
}