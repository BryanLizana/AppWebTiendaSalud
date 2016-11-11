using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
  public  class cls_Productos: cls_Conexion
    {

        public int Pro_id { get; set; }
        public string Pro_name_comercial { get; set; }
        public string Pro_name { get; set; }
        public double Pro_precio_uni { get; set; }
        public double Pro_precio_may { get; set; }
        public string Pro_type { get; set; }
        public string Pro_procedencia { get; set; }
        public int mode { get; set; }




        public bool sp_Insert_Productos(cls_Productos Productos)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Productos";
                cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Productos.Pro_id;
                cmd.Parameters.Add("@pro_name_comercial", SqlDbType.VarChar, 30).Value = Productos.Pro_name_comercial;
                cmd.Parameters.Add("@pro_name", SqlDbType.VarChar, 30).Value = Productos.Pro_name;
                cmd.Parameters.Add("@pro_precio_uni", SqlDbType.Decimal).Value = Productos.Pro_precio_uni;
                cmd.Parameters.Add("@pro_precio_may", SqlDbType.Decimal).Value = Productos.Pro_precio_may;
                cmd.Parameters.Add("@pro_type", SqlDbType.VarChar, 30).Value = Productos.Pro_type;
                cmd.Parameters.Add("@pro_procedencia", SqlDbType.VarChar, 100).Value = Productos.Pro_procedencia;
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

        public bool sp_Delete_Productos(cls_Productos Productos)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Productos";
                cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Productos.Pro_id;
                
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

        public DataTable sp_List_Productos(cls_Productos Productos)

        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Productos";
                cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Productos.Pro_id;

                //1 para proventas y 0 pro solicomp 
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = Productos.mode;
                    
                
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
