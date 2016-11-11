using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
using System.Web;
namespace CapaNegocios
{
  public  class cls_Usuario
    {
        cls_Usuarios clsUser = new cls_Usuarios();
        public DataTable login(cls_Usuarios User) {            
            
            return this.clsUser.sp_login(User);
        }
        public DataTable List_Usuarios(cls_Usuarios User)
        {        
            return clsUser.sp_Listar_Usuarios(User);
        }
        
        public string Insert_Usuarios(cls_Usuarios User)
        {
         

            if (  clsUser.sp_Insert_Usuarios(User))
            {
                return "Solicitud procesada.";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }
            
        public string Delete_Usuarios(cls_Usuarios User)
        {
            if (clsUser.sp_Delete_Usuarios(User))
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
