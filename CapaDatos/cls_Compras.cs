using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public class cls_Compras:cls_Conexion
    {

        public int Comp_id { get; set; }
        public int Us_id { get; set; }
        public int Provee_id { get; set; }
        public DateTime Comp_date { get; set; }
        public string Comp_estado { get; set; }
        public int Solicomp_id { get; set; }
        public string Doc_type { get; set; }
        public string Comp_doc_number { get; set; }
        public int Cre_id { get; set; }

        public bool sp_Insert_Compras(cls_Compras Compras)
        {   
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Compras";
                cmd.Parameters.Add("@comp_id", SqlDbType.Int).Value = Compras.Comp_id;
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Compras.Us_id;
                cmd.Parameters.Add("@provee_id", SqlDbType.Int).Value = Compras.Provee_id;
                cmd.Parameters.Add("@comp_date", SqlDbType.Date).Value = Compras.Comp_date;
                cmd.Parameters.Add("@comp_estado", SqlDbType.VarChar, 255).Value = Compras.Comp_estado;
                cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Compras.Solicomp_id;
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 20).Value = Compras.Doc_type;
                cmd.Parameters.Add("@comp_doc_number", SqlDbType.VarChar, 30).Value = Compras.Comp_doc_number;
                cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Compras.Cre_id;
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

        public bool sp_Delete_Compras(cls_Compras Compras)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Compras";
                cmd.Parameters.Add("@comp_id", SqlDbType.Int).Value = Compras.Comp_id;
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

        public DataTable sp_List_Compras(cls_Compras Compras)

        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Compras";
                cmd.Parameters.Add("@comp_id", SqlDbType.Int).Value = Compras.Comp_id;

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
