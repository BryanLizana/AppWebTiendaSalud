using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
  public  class cls_Lote_pro
    {
        cls_Lotes_pro clsListP = new cls_Lotes_pro();
        public DataTable List_Lotes_pro(cls_Lotes_pro Lotes_pro)
        {
            return clsListP.sp_List_Lotes_pro(Lotes_pro);
        }   

        public string Insert_Lotes_pro(cls_Lotes_pro Lotes_pro)
        {
            
            if (clsListP.sp_Insert_Lotes_pro(Lotes_pro))
            {
                return "Proceso Completado";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }   

        public string Delete_Lotes_pro(cls_Lotes_pro Lotes_pro)
        {
            
            if (clsListP.sp_Delete_Lotes_pro(Lotes_pro))
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
