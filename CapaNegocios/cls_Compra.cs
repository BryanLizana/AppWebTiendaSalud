using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
  public  class cls_Compra
    {
        cls_Compras clsComp = new cls_Compras();
        public DataTable List_Compras(cls_Compras Compra)
        {
            return clsComp.sp_List_Compras(Compra);
        }

        public string Insert_Compras(cls_Compras Compra)
        {
            if (clsComp.sp_Insert_Compras(Compra))
            {
                return "Solicitud procesada.";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }

        public string Delete_Compras(cls_Compras Compra)
        {

            if (clsComp.sp_Delete_Compras(Compra))
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
