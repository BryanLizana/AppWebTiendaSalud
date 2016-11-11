using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

using CapaDatos;
namespace CapaNegocios
{
  public  class cls_Solicitud_compra
    {
        cls_Solicitud_comp clsClie = new cls_Solicitud_comp();
        public DataTable List_Solicitud_comp(cls_Solicitud_comp Solicitud_comp)
        {   
            return clsClie.sp_List_Solicitud_comp(Solicitud_comp);
        }

        public int Insert_Solicitud_comp(cls_Solicitud_comp Solicitud_comp)
        {
            //last id return
            return clsClie.sp_Insert_Solicitud_comp(Solicitud_comp);
        }

        public string Delete_Solicitud_comp(cls_Solicitud_comp Solicitud_comp)
        {

            if (clsClie.sp_Delete_Solicitud_comp(Solicitud_comp))
            {
                return "Proceso Completado";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
           
        }
    }
}   
