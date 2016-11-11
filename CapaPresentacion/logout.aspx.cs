using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fn para borrar todas las var session
            //sessiones
            //user
            Session["User_id"] = "0";
            Session["User_code"] = "0";
            Session["User_pass"] = "0";
            Session["User_name"] = "0";
            Session["User_type"] = "0";
            Response.Redirect("login.aspx");
        }
    }
}