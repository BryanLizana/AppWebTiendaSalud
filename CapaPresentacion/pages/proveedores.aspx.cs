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
    public partial class proveedores : System.Web.UI.Page
    {
        cls_Proveedor clsProvee = new cls_Proveedor();  
        cls_Proveedores Proveedor = new cls_Proveedores();


        public void load()
        {
            Proveedor.Provee_id = 0;
            dgv.DataSource = clsProvee.List_Proveedores(Proveedor);
            dgv.DataBind();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Proveedor_id"] = "0";
            PlaceHolder1.Visible = true;
            //empy form
            txtruc.Text = "";
            txtname.Text = "";
            txtdireccion.Text = "";
            txtdistrito.Text = "";
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            Session["Proveedor_id"] = "0";
            PlaceHolder1.Visible = false;
        }
        protected void btn_save(object sender, EventArgs e)
        {
           if( txtruc.Text != "" && txtname.Text != "" && txtdistrito.Text != "" && txtdireccion.Text != "" ){
                Proveedor.Provee_id = Convert.ToInt32(Session["Proveedor_id"].ToString());
                Proveedor.Provee_ruc = txtruc.Text;
                Proveedor.Provee_razons = txtname.Text;
                Proveedor.Provee_distrito = txtdistrito.Text;
                Proveedor.Provee_direccion = txtdireccion.Text;

                functions fn = new functions();
                Session["msg"] = fn.msg(clsProvee.Insert_Proveedores(Proveedor), "info");
                Session["Proveedor_id"] = "0";
                PlaceHolder1.Visible = false;
                Response.Redirect("proveedores.aspx");
           }else
           {
               //empty
           }

        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            var row_data = e.Values[0];
            string id = Convert.ToString(row_data);
            Session["Proveedor_id"] = id;
            PlaceHolder1.Visible = true;
            //edit
            if (PlaceHolder1.Visible == true)
            {
                if (Session["Proveedor_id"].ToString() != "0")
                {
                    DataTable dt_user = new DataTable();
                    Proveedor.Provee_id = Convert.ToInt32(Session["Proveedor_id"].ToString());
                    dt_user = clsProvee.List_Proveedores(Proveedor);

                    //first data
                    DataRow dr = dt_user.Rows[0];
                    txtruc.Text = dr[1].ToString();
                    txtname.Text = dr[2].ToString();
                    txtdireccion.Text = dr[3].ToString();
                    txtdistrito.Text = dr[4].ToString();

                }
            }
        }

        protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];

            //var row_data = dr_dgv.Cells[2].Text;
            //string id = Convert.ToString(row_data);
            //Session["Other_user_id"] = id;
            //PlaceHolder1.Visible = true;
            ////edit
            //if (PlaceHolder1.Visible == true)
            //{
            //    if (Session["Other_user_id"].ToString() != "0")
            //    {
            //        DataTable dt_user = new DataTable();
            //       Proveedor.Us_id = Convert.ToInt32(Session["Other_user_id"].ToString());
            //        dt_user = this.clsUser.List_Usuarios(this.User);

            //        //first data
            //        DataRow dr = dt_user.Rows[0];
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
    }
}