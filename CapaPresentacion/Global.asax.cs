using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace CapaPresentacion
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //sessiones
            //msg
            Session["msg"] = "0";

            //user
            Session["User_id"] = "0";
            Session["User_code"] = "0";
            Session["User_pass"] = "0";
            Session["User_name"] = "0";
            Session["User_type"] = "0";

            //Other user
            Session["Other_user_id"] = "0";
            Session["Other_user"] = "0";


            //cliente
            Session["Cli_id"] = "0";
            Session["Cli_ruc"] = "0";
            Session["Cli_type"] = "0";


            //venta
            Session["Venta_id"] = "0";

            //proforma 
            Session["Proforma_id"] = "0";

            //proveedor
            Session["Proveedor_id"] = "0";

            //producto
            Session["Producto_id"] = "0";
            Session["Producto_type"] = "0";

            //solicitud compra
            Session["Solicomp_id"] = "0";


            //Lotes-solicomp
            Session["Lotes_pro_id"] = "0";






        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}