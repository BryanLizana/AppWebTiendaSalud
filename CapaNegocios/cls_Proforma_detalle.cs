using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
    public class cls_Proforma_detalle
    {
        cls_Proforma_detalles clsProdet = new cls_Proforma_detalles();
        public DataTable List_Proforma_detalles(cls_Proforma_detalles Proforma_detalle)
        {
            return clsProdet.sp_List_Proforma_detalles(Proforma_detalle);
        }

        public string Insert_Proforma_detalles(cls_Proforma_detalles Proforma_detalle)
        {

            if (clsProdet.sp_Insert_Proforma_detalles(Proforma_detalle))
            {
                return "Proceso Completado";
            }
            else
            {
                return "No se pudo ejecutar la solicitud, intente más tarde";
            }
        }

        public string Delete_Proforma_detalles(cls_Proforma_detalles Proforma_detalle)
        {

            if (clsProdet.sp_Delete_Proforma_detalles(Proforma_detalle))
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
