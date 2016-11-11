using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
  public  class cls_Ventas: cls_Conexion
    {

        public int Ven_id { get; set; }
        public int Pref_id { get; set; }
        public DateTime Ven_date { get; set; }
        public int Us_id { get; set; }
        public string Doc_type { get; set; }
        public string Ven_doc_number { get; set; }
        public bool sp_Insert_Ventas(cls_Ventas Ventas)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Ventas";
                cmd.Parameters.Add("@ven_id", SqlDbType.Int).Value = Ventas.Ven_id;
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Ventas.Pref_id;
                cmd.Parameters.Add("@ven_date", SqlDbType.DateTime).Value = Ventas.Ven_date;
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Ventas.Us_id;
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 30).Value = Ventas.Doc_type;
                cmd.Parameters.Add("@ven_doc_number", SqlDbType.VarChar, 30).Value = Ventas.Ven_doc_number;
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

        public bool sp_Delete_Ventas(cls_Ventas Ventas)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Ventas";
                cmd.Parameters.Add("@ven_id", SqlDbType.Int).Value = Ventas.Ven_id;
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

        public DataTable sp_List_Ventas(cls_Ventas Ventas)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Ventas";
                cmd.Parameters.Add("@ven_id", SqlDbType.Int).Value = Ventas.Ven_id;

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
