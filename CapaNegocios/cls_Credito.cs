using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
   public class cls_Credito
    {
        cls_Creditos clsCre = new cls_Creditos();
        public DataTable List_Creditos(cls_Creditos Cliente)
        {
            return clsCre.sp_List_Creditos(Cliente);
        }

        public int Insert_Creditos(cls_Creditos Cliente)
        {

            return clsCre.sp_Insert_Creditos(Cliente);
        }

        public string Delete_Creditos(cls_Creditos Cliente)
        {
           

            if (clsCre.sp_Delete_Creditos(Cliente))
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
