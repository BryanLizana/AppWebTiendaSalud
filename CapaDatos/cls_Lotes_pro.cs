using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public  class cls_Lotes_pro:cls_Conexion
    {

        public int Lote_id { get; set; }
        public int Pro_id { get; set; }
        public DateTime Lote_vence { get; set; }
        public string Lote_cod { get; set; }
        public int Lote_cant { get; set; }
        public string Lote_almacen { get; set; }
        public int Solicomp_id { get; set; }
        public double Lote_aporte { get; set; }
        public string Lote_estado { get; set; }
        public int Lote_stock { get; set; }
        

        public bool sp_Insert_Lotes_pro(cls_Lotes_pro Lotes_pro)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Lotes_pro";
                cmd.Parameters.Add("@lote_id", SqlDbType.Int).Value = Lotes_pro.Lote_id;
                cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Lotes_pro.Pro_id;
                cmd.Parameters.Add("@lote_vence", SqlDbType.DateTime).Value = Lotes_pro.Lote_vence;
                cmd.Parameters.Add("@lote_cod", SqlDbType.VarChar, 30).Value = Lotes_pro.Lote_cod;
                cmd.Parameters.Add("@lote_cant", SqlDbType.Int).Value = Lotes_pro.Lote_cant;
                cmd.Parameters.Add("@lote_almacen", SqlDbType.VarChar, 30).Value = Lotes_pro.Lote_almacen;
                cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Lotes_pro.Solicomp_id;
                cmd.Parameters.Add("@lote_aporte", SqlDbType.Decimal).Value = Lotes_pro.Lote_aporte.ToString().Replace(".",",");
                cmd.Parameters.Add("@lote_estado", SqlDbType.VarChar, 30).Value = Lotes_pro.Lote_estado;
                cmd.Parameters.Add("@lote_stock", SqlDbType.Int).Value = Lotes_pro.Lote_stock;
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return true;
            }
            catch (Exception )
            {

                return false;
            }

        }

        public bool sp_Delete_Lotes_pro(cls_Lotes_pro Lotes_pro)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Lotes_pro";
                cmd.Parameters.Add("@lote_id", SqlDbType.Int).Value = Lotes_pro.Lote_id;
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

        public DataTable sp_List_Lotes_pro(cls_Lotes_pro Lotes_pro)

        {

            try
            {
                
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Lotes_pro";
                cmd.Parameters.Add("@lote_id", SqlDbType.Int).Value = Lotes_pro.Lote_id;
                cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Lotes_pro.Solicomp_id;

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
