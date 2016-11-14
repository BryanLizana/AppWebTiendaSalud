using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocios;
using System.Data;
namespace CapaPresentacion.pages
{
    public partial class lotes : System.Web.UI.Page
    {
        cls_Lote_pro clsPro = new cls_Lote_pro();
        cls_Lotes_pro Lotes_pro = new cls_Lotes_pro();
        public void load()
        {
            Lotes_pro.Lote_id = 0;
            //Lotes_pro.mode = 1; 
            dgv.DataSource = clsPro.List_Lotes_pro(Lotes_pro);
            dgv.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        //add pro to lot
        public void btn_addpro(object sender, EventArgs e)
        {
            cls_Productos Producto = new cls_Productos();
            cls_Producto clsPro = new cls_Producto();
            Producto.Pro_id = 0;
            dgv_list_pro.DataSource = clsPro.List_Productos(Producto);
            dgv_list_pro.DataBind();
            place_ListProducto.Visible = true;
        }

        protected void btnadd_data(object sender, EventArgs e)
        {
            Session["Solicomp_id"] = "0";
            Session["Producto_id"] = "0";
            Session["Lotes_pro_id"] = "0"; ;
            PlaceHolder1.Visible = true;
            //empy form
            txtaporte.Text = "";   
            txtcant.Text = "";
            txtcode.Text = "";
            dtvence.TodaysDate = DateTime.Now;
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            Session["Solicomp_id"] = "0";
            Session["Producto_id"] = "0";
            Session["Lotes_pro_id"] = "0";
            PlaceHolder1.Visible = false;
            Response.Redirect("/pages/lotes.aspx");
        }
        protected void btn_save(object sender, EventArgs e)
        {
          if(txtcode.Text != "" && txtaporte.Text != "" && txtcant.Text != "" && cbalmacen.Text != "" ){
                 Lotes_pro.Lote_id = Convert.ToInt32(Session["Lotes_pro_id"].ToString());

                Lotes_pro.Lote_cod = txtcode.Text;
                Lotes_pro.Lote_aporte = Convert .ToDouble(txtaporte.Text);
                Lotes_pro.Lote_cant = Convert.ToInt32(txtcant.Text);
                Lotes_pro.Lote_almacen = cbalmacen.SelectedValue;
                Lotes_pro.Lote_vence = dtvence.SelectedDate;
                Lotes_pro.Lote_estado = "0";
                Lotes_pro.Lote_stock = Convert.ToInt32(txtcant.Text);
                Lotes_pro.Solicomp_id = Convert.ToInt32(Session["Solicomp_id"].ToString());
                Lotes_pro.Pro_id = Convert.ToInt32(Session["Producto_id"].ToString());


                functions fn = new functions();
                Session["msg"] = fn.msg(clsPro.Insert_Lotes_pro(Lotes_pro), "info");

                Session["Solicomp_id"] = "0";

                Session["Producto_id"] = "0";
                Session["Lotes_pro_id"] = "0";
                PlaceHolder1.Visible = false;
                Response.Redirect("/pages/lotes.aspx");
          }else{
               functions fn = new functions();
                Session["msg"] = fn.msg("Campos vacíos", "info");

                Response.Redirect("/pages/lotes.aspx");
          }
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];
            //var asd = Session["Lotes_pro_id"];
            var row_data = e.Values[0];
            string id = Convert.ToString(row_data);
            Session["Lotes_pro_id"] = id;
            PlaceHolder1.Visible = true;
            //edit
            if (PlaceHolder1.Visible == true)
            {
                if (Session["Lotes_pro_id"].ToString() != "0")
                {
                    DataTable dt_Lotes_pro = new DataTable();
                    Lotes_pro.Lote_id = Convert.ToInt32(Session["Lotes_pro_id"]);
                    dt_Lotes_pro = this.clsPro.List_Lotes_pro(Lotes_pro);
                    //first data
                    DataRow dr = dt_Lotes_pro.Rows[0];
                    dtvence.SelectedDate =Convert.ToDateTime(dr[2].ToString());
                    txtcode.Text = dr[3].ToString();
                    txtcant.Text = dr[4].ToString();
                    cbalmacen.SelectedValue = dr[5].ToString();
                    txtaporte.Text = dr[7].ToString();

                    Session["Solicomp_id"] = dr[6].ToString();
                    Session["Producto_id"] = dr[1].ToString();

                }
            }
        }

        protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];
            //var asd = Session["Lotes_pro_id"];
            //var row_data = dr_dgv.Cells[2].Text;
            //string id = Convert.ToString(row_data);
            //Session["Lotes_pro_id"] = id;
            //PlaceHolder1.Visible = true;
            ////edit
            //if (PlaceHolder1.Visible == true)
            //{
            //    if (Session["Lotes_pro_id"].ToString() != "0")
            //    {
            //        DataTable dt_Lotes_pro = new DataTable();
            //        Lotes_pro.Pro_id = Convert.ToInt32(Session["Lotes_pro_id"]);
            //        dt_Lotes_pro = this.clsPro.List_Lotes_pros(Lotes_pro);

            //        //first data
            //        DataRow dr = dt_Lotes_pro.Rows[0];
            //        txtdni.Text = dr[4].ToString();
            //        txtfname.Text = dr[1].ToString();
            //        txtlname.Text = dr[2].ToString();
            //        txtdireccion.Text = dr[6].ToString();
            //        txtdistrito.Text = dr[7].ToString();
            //        cbtype.SelectedIndex = Convert.ToInt32(dr[5].ToString()) - 1;
            //        txtpass.Text = dr[8].ToString();

            //    }
            //}

        }

        protected void dgv_list_pro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}