using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
 public   class cls_Proveedor
    {
        cls_Proveedores clsProvee = new cls_Proveedores();
        public DataTable List_Proveedores(cls_Proveedores Proveedores)
        {
            return clsProvee.sp_List_Proveedores(Proveedores);
        }

        public string Insert_Proveedores(cls_Proveedores Proveedores)
        {
            if (clsProvee.sp_Insert_Proveedores(Proveedores))
            {
                return "Proceso Completado";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }
            
        public string Delete_Proveedores(cls_Proveedores Proveedores)
        {

            if (clsProvee.sp_Delete_Proveedores(Proveedores))
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
