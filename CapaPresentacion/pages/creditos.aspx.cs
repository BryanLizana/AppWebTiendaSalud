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

            Credito.Cre_id = 0;
            dgv_list_cre.DataSource = clsCre.List_Creditos(Credito);
            dgv_list_cre.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        protected void dgv_list_cre_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }   

        protected void btn_cancel_provee(object sender, EventArgs e)
        {

        }
    }
}