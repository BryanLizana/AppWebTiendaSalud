using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
   public class cls_Venta
    {
        cls_Ventas clsVen = new cls_Ventas();
        public DataTable List_Ventas(cls_Ventas Venta)
        {
            return clsVen.sp_List_Ventas(Venta);
        }   

        public string Insert_Ventas(cls_Ventas Venta)
        {

            if (clsVen.sp_Insert_Ventas(Venta))
            {
                return "Solicitud procesada.";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }

        public string Delete_Ventas(cls_Ventas Venta)
        {
    

            if (clsVen.sp_Delete_Ventas(Venta))
            {
                return "Solicitud procesada.";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }
    }
}
