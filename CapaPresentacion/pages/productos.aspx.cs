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
    
    public partial class productos : System.Web.UI.Page
    {
        cls_Producto clsPro = new cls_Producto();
        cls_Productos Producto = new cls_Productos();
        public void load()
        {
            Producto.Pro_id = 0;
            //Producto.mode = 1; 
            dgv.DataSource = clsPro.List_Productos(Producto);
            dgv.DataBind();


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Producto_id"] = "0";
            PlaceHolder1.Visible = true;
            //empy form
            txtname_co.Text = "";
            txtname.Text = "";
            txtpreciou.Text = "";
            txtpreciom.Text = "";
            txtprocedencia.Text = "";
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            Session["Producto_id"] = "0";
            PlaceHolder1.Visible = false;
            Response.Redirect("/pages/productos.aspx");
        }
        protected void btn_save(object sender, EventArgs e)
        {
            Producto.Pro_id = Convert.ToInt32(Session["Producto_id"].ToString());
            Producto.Pro_name_comercial = txtname_co.Text;
            Producto.Pro_name = txtname.Text;
            Producto.Pro_precio_uni =    Convert.ToDouble(txtpreciou.Text);
            Producto.Pro_precio_may = Convert.ToDouble(txtpreciom.Text);
            Producto.Pro_procedencia = txtprocedencia.Text;
            Producto.Pro_type = cbtype.SelectedValue;
            functions fn = new functions();
            Session["msg"] = fn.msg(clsPro.Insert_Productos(Producto), "info");
            Session["Producto_id"] = "0";
            PlaceHolder1.Visible = false;
            Response.Redirect("/pages/productos.aspx");
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];
            //var asd = Session["Producto_id"];
            var row_data = e.Values[0];
            string id = Convert.ToString(row_data);
            Session["Producto_id"] = id;
            PlaceHolder1.Visible = true;
            //edit
            if (PlaceHolder1.Visible == true)
            {
                if (Session["Producto_id"].ToString() != "0")
                {
                    DataTable dt_Producto = new DataTable();
                    Producto.Pro_id = Convert.ToInt32(Session["Producto_id"]);
                    dt_Producto = this.clsPro.List_Productos(Producto);

                    //first data
                    DataRow dr = dt_Producto.Rows[0];
                    txtname_co.Text = dr[1].ToString();
                    txtname.Text = dr[2].ToString();
                    txtpreciou.Text = dr[3].ToString();
                    txtpreciom.Text = dr[4].ToString();
                    cbtype.SelectedValue = dr[5].ToString();
                    txtprocedencia.Text = dr[6].ToString();

                }
            }
        }

        protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];
            //var asd = Session["Producto_id"];
            //var row_data = dr_dgv.Cells[2].Text;
            //string id = Convert.ToString(row_data);
            //Session["Producto_id"] = id;
            //PlaceHolder1.Visible = true;
            ////edit
            //if (PlaceHolder1.Visible == true)
            //{
            //    if (Session["Producto_id"].ToString() != "0")
            //    {
            //        DataTable dt_Producto = new DataTable();
            //        Producto.Pro_id = Convert.ToInt32(Session["Producto_id"]);
            //        dt_Producto = this.clsPro.List_Productos(Producto);

            //        //first data
            //        DataRow dr = dt_Producto.Rows[0];
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

        //protected void cblisttype_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Session["Producto_type"] = (cblisttype.Text =="") ? "MEDICAMENTO" : cblisttype.SelectedValue.ToString();
        //    load();
        //}
    }
}