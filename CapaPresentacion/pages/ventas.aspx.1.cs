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
    public partial class ventas : System.Web.UI.Page
    {
        cls_Venta ClsVen = new cls_Venta();
        cls_Ventas Venta = new cls_Ventas();
        
        public void load(){
        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
    }
}