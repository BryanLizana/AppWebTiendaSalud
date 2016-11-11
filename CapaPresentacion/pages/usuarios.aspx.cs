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
    public partial class usuarios : System.Web.UI.Page
    {


        cls_Usuario clsUser = new cls_Usuario();
        cls_Usuarios User = new cls_Usuarios();
        public void load()
        {
            User.Us_id = 0;
            dgv.DataSource = clsUser.List_Usuarios(User);
            dgv.DataBind();


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Other_user_id"] = "0";
            PlaceHolder1.Visible = true;
            //empy form
            txtdni.Text = "";
            txtfname.Text = "";
            txtlname.Text = "";
            txtdireccion.Text = "";
            txtdistrito.Text = "";
            txtpass.Text = "";
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            Session["Other_user_id"] = "0";
            PlaceHolder1.Visible = false;   
        }
        protected void btn_save(object sender, EventArgs e)
        {
            if(txtdireccion.Text != "" && txtdistrito.Text != "" txtdni.Text != "" && txtfname.Text != "" && txtlname.Text != "" && txtpass.Text != ""){
                    User.Us_id = Convert.ToInt32(Session["Other_user_id"].ToString());
                    this.User.Us_doc_number = Convert.ToInt32(txtdni.Text);
                    this.User.Us_fname = txtfname.Text;
                    this.User.Us_lname = txtlname.Text;
                    this.User.Us_direccion = txtdireccion.Text;
                    this.User.Us_distrito = txtdistrito.Text;
                    this.User.Us_password = txtpass.Text;
                    this.User.Us_type = Convert.ToInt32(cbtype.SelectedIndex) + 1;
                    this.User.Doc_type = "DNI";
                    functions fn = new functions();
                    Session["msg"] = fn.msg(clsUser.Insert_Usuarios(this.User),"info");
                    Session["Other_user_id"] = "0";
                    PlaceHolder1.Visible = false;
                    Response.Redirect("/pages/usuarios.aspx");
            }
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];
            //var asd = Session["Other_user_id"];
            var row_data = e.Values[0];
            string id = Convert.ToString(row_data);
            Session["Other_user_id"] = id;
            PlaceHolder1.Visible = true;
            //edit
            if (PlaceHolder1.Visible == true)
            {
                if (Session["Other_user_id"].ToString() != "0")
                {
                    DataTable dt_user = new DataTable();
                    this.User.Us_id = Convert.ToInt32(Session["Other_user_id"]);
                    dt_user = this.clsUser.List_Usuarios(this.User);

                    //first data
                    DataRow dr = dt_user.Rows[0];
                    txtdni.Text = dr[4].ToString();
                    txtfname.Text = dr[1].ToString();
                    txtlname.Text = dr[2].ToString();
                    txtdireccion.Text = dr[6].ToString();
                    txtdistrito.Text = dr[7].ToString();
                    cbtype.SelectedIndex = Convert.ToInt32(dr[5].ToString()) - 1;
                    txtpass.Text = dr[8].ToString();

                }
            }
        }

        protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgv_RowEditing(object sender, GridViewEditEventArgs e)
        {
     
           
        }

        
        protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //soli
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv.Rows[index];
            if (e.CommandName == "editar")
            {

                string id = dgvrow.Cells[2].Text;
                Session["Other_user_id"] = id;
                PlaceHolder1.Visible = true;
                //edit
                if (PlaceHolder1.Visible == true)
                {
                    if (Session["Other_user_id"].ToString() != "0")
                    {
                        DataTable dt_user = new DataTable();
                        User.Us_id = Convert.ToInt32(Session["Other_user_id"].ToString());
                        dt_user = clsUser.List_Usuarios(User);

                         //first data
                            DataRow dr = dt_user.Rows[0];
                            txtdni.Text = dr[4].ToString();
                            txtfname.Text = dr[1].ToString();
                            txtlname.Text = dr[2].ToString();
                            txtdireccion.Text = dr[6].ToString();
                            txtdistrito.Text = dr[7].ToString();
                            cbtype.SelectedIndex = Convert.ToInt32(dr[5].ToString()) - 1;
                            txtpass.Text = dr[8].ToString();


                    }
                }
                    


            }
            else if (e.CommandName == "eliminar")
            {
                User.Us_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                //msg
               
                functions fn = new functions();
                Session["msg"] = fn.msg( clsUser.Delete_Usuarios(User), "info");
                Session["Other_user_id"] = "0";
                Response.Redirect("usuarios.aspx");
                        
            }
               
            
        }


    }
}