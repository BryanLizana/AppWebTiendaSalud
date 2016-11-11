using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

namespace CapaDatos
{
  public  class cls_Conexion
    {
        public SqlConnection conx;
        
        public cls_Conexion()   
        {
            conx = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
        }
    }
}
