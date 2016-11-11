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
    public partial class proformas : System.Web.UI.Page
    {
        cls_Proforma ClsProf = new cls_Proforma();
        cls_Proformas Proforma = new cls_Proformas();
        
        public void load(){
        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
    }
}