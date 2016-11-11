using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public class cls_Proveedores : cls_Conexion
    {

        public int Provee_id { get; set; }
        public string Provee_razons { get; set; }
        public string Provee_ruc { get; set; }
        public string Provee_direccion { get; set; }
        public string Provee_distrito { get; set; }


        public bool sp_Insert_Proveedores(cls_Proveedores Proveedores)
        {
            try
            {   
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Proveedores";
                cmd.Parameters.Add("@provee_id", SqlDbType.Int).Value = Proveedores.Provee_id;
                cmd.Parameters.Add("@provee_razons", SqlDbType.VarChar, 30).Value = Proveedores.Provee_razons;
                cmd.Parameters.Add("@provee_ruc", SqlDbType.VarChar, 30).Value = Proveedores.Provee_ruc;
                cmd.Parameters.Add("@provee_direccion", SqlDbType.VarChar, 30).Value = Proveedores.Provee_direccion;
                cmd.Parameters.Add("@provee_distrito", SqlDbType.VarChar, 30).Value = Proveedores.Provee_distrito;
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public bool sp_Delete_Proveedores(cls_Proveedores Proveedores)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Proveedores";
                cmd.Parameters.Add("@provee_id", SqlDbType.Int).Value = Proveedores.Provee_id;
                //cmd.Parameters.Add("@provee_ruc", SqlDbType.VarChar, 30).Value = Proveedores.Provee_ruc;
      
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();

                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public DataTable sp_List_Proveedores(cls_Proveedores Proveedores)

        {   

            try
            {   
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Proveedores";
                cmd.Parameters.Add("@provee_id", SqlDbType.Int).Value = Proveedores.Provee_id;
                //cmd.Parameters.Add("@provee_ruc", SqlDbType.VarChar, 30).Value = Proveedores.Provee_ruc;


                //SqlDataReader dr = cmd.ExecuteReader();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);
                return dt_list;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }





    }
}
