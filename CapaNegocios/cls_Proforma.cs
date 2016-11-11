using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
   public class cls_Proforma
    {
        cls_Proformas clsProf = new cls_Proformas();
        public DataTable List_Proformas(cls_Proformas Cliente)
        {
            return clsProf.sp_List_Proformas(Cliente);
        }

        public int Insert_Proformas(cls_Proformas Cliente)
        {
            //Se envía el last id 
            return clsProf.sp_Insert_Proformas(Cliente);
        }

        public string Delete_Proformas(cls_Proformas Cliente)
        {
            if (clsProf.sp_Delete_Proformas(Cliente))
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
