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
    public partial class creditos : System.Web.UI.Page
    {
        cls_Credito clsCre = new cls_Credito();
        cls_Creditos Credito = new cls_Creditos();
        
        public void load(){
        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
    }
}