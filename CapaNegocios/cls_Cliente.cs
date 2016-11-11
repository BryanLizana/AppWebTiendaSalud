using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
   public class cls_Cliente
    {
        cls_Clientes clsClie = new cls_Clientes();
        public DataTable List_Clientes(cls_Clientes Cliente)
        {
            return clsClie.sp_List_Clientes(Cliente);
        }

        public string Insert_Clientes(cls_Clientes Cliente)
        {

                if (clsClie.sp_Insert_Clientes(Cliente))
                {
                    return "Solicitud procesada.";
                }
                else
                {
                    return "No se pudo ejecutar la solicitud, intente más tarde";
                }
            
        }

        public string Delete_Clientes(cls_Clientes Cliente)
        {       
           

            if (clsClie.sp_Delete_Clientes(Cliente))
            {
                return "Registro Eliminado";
            }
            else
            {
                return "No se pudo exe, intente más tarde";
            }
        }
    }
}
