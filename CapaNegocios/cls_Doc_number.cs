using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
namespace CapaNegocios
{
    public class cls_Doc_number
    {
        cls_Doc_numbers clsDoc = new cls_Doc_numbers();

        public bool Insert_Doc(cls_Doc_numbers clsDoc)
        {
            clsDoc.sp_Insert_Doc(clsDoc);
            return true;
        }

        public cls_Doc_numbers List_Doc(cls_Doc_numbers clsDoc)
        {
            return clsDoc.sp_List_Doc(clsDoc);
        }
    }
}
