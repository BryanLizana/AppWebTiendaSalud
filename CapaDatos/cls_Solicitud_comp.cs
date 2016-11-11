using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public class cls_Solicitud_comp:cls_Conexion
    {
      
        public int Solicomp_id { get; set; }
        public int Us_id { get; set; }
        public string Doc_type { get; set; }
        public string Solicomp_doc_number { get; set; }
        public DateTime Solicomp_date { get; set; }
        public string Solicomp_estado { get; set; }
        public DateTime Solicomp_valido { get; set; }

        public int sp_Insert_Solicitud_comp(cls_Solicitud_comp Solicitud_comp)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Solicitud_comp";
                cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Solicitud_comp.Solicomp_id;
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Solicitud_comp.Us_id;
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 30).Value = Solicitud_comp.Doc_type;
                cmd.Parameters.Add("@solicomp_doc_number", SqlDbType.VarChar, 30).Value = Solicitud_comp.Solicomp_doc_number;
                cmd.Parameters.Add("@solicomp_date", SqlDbType.DateTime).Value = Solicitud_comp.Solicomp_date;
                cmd.Parameters.Add("@solicomp_estado", SqlDbType.VarChar, 30).Value = Solicitud_comp.Solicomp_estado;
                cmd.Parameters.Add("@solicomp_valido", SqlDbType.DateTime).Value = Solicitud_comp.Solicomp_valido;
                //cmd.Connection.Open();
                //cmd.ExecuteNonQuery();
                //cmd.Connection.Close();
                cmd.Connection.Open();
                var newID = cmd.ExecuteScalar();
                cmd.Connection.Close();
             
                return Convert.ToInt32(newID);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public bool sp_Delete_Solicitud_comp(cls_Solicitud_comp Solicitud_comp)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Solicitud_comp";
                cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Solicitud_comp.Solicomp_id;

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

        public DataTable sp_List_Solicitud_comp(cls_Solicitud_comp Solicitud_comp)
        {

            try
            {
                
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Solicitud_comp";
                cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Solicitud_comp.Solicomp_id;

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
