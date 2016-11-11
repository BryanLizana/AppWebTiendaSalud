using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
   public class cls_Producto
    {
        cls_Productos clsPro = new cls_Productos();
        public DataTable List_Productos(cls_Productos Producto)
        {
            return clsPro.sp_List_Productos(Producto);
        }

        public string Insert_Productos(cls_Productos Producto)
        {
            
            if (clsPro.sp_Insert_Productos(Producto))
            {
                return "Proceso Completado";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }

        public string Delete_Productos(cls_Productos Producto)
        {
            if (clsPro.sp_Delete_Productos(Producto))
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
