using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public class cls_Proforma_detalles:cls_Conexion
    {

        public int Pref_id { get; set; }
        public int Pro_id { get; set; }
        public int Lote_id { get; set; }
        public double Cant { get; set; }
        public double Importe { get; set; }
        public string Estado { get; set; }
        public bool sp_Insert_Proforma_detalles(cls_Proforma_detalles Proforma_detalles)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();  
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Proforma_detalles";
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proforma_detalles.Pref_id;
                cmd.Parameters.Add("@lote_id", SqlDbType.Int).Value = Proforma_detalles.Lote_id;                
                cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Proforma_detalles.Pro_id;
                cmd.Parameters.Add("@cant", SqlDbType.Int).Value = Proforma_detalles.Cant;
                cmd.Parameters.Add("@importe", SqlDbType.Decimal).Value = Proforma_detalles.Importe;
                cmd.Parameters.Add("@estado", SqlDbType.VarChar, 30).Value = Proforma_detalles.Estado;
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }

        }

        public bool sp_Delete_Proforma_detalles(cls_Proforma_detalles Proforma_detalles)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Proforma_detalles";
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proforma_detalles.Pref_id;
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

        public DataTable sp_List_Proforma_detalles(cls_Proforma_detalles Proforma_detalles)

        {

            try
            {
                
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Proforma_detalles";
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proforma_detalles.Pref_id;

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
