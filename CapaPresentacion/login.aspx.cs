using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocios;
using CapaDatos;
using System.Data;
namespace CapaPresentacion
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cls_Usuario fn_User = new cls_Usuario();
            cls_Usuarios Usuario = new cls_Usuarios();

            Usuario.Us_doc_number = Convert.ToInt32(txtus_code.Text);
            Usuario.Us_password = txtus_pass.Text;
            DataTable dt = new DataTable();
            dt = fn_User.login(Usuario);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Session["User_id"] = dr[0].ToString();
                Session["User_code"] =  dr[1].ToString();
                Session["User_pass"] =  dr[2].ToString();
                Session["User_name"] =  dr[3].ToString();
                Session["User_type"] =  dr[4].ToString();
                //viewthis
                Response.Redirect("pages/panel_control.aspx");
            
            }
            else
            {
                functions fn = new functions();
                Session["msg"] = fn.msg("error","Acceso incorreto");
            }
           

        }
    }
}