using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
 public  class cls_Proformas: cls_Conexion
    {

        public int Pref_id { get; set; }
        public int Us_id { get; set; }
        public int Cli_id { get; set; }
        public DateTime Pref_date { get; set; }
        public string Pref_estado { get; set; }
        public int Cre_id { get; set; }
        public DateTime Pref_valido { get; set; }
        public string Pref_doc_number { get; set; }

        public int sp_Insert_Proformas(cls_Proformas Proformas)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Proformas";
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proformas.Pref_id;
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Proformas.Us_id;
                cmd.Parameters.Add("@cli_id", SqlDbType.Int).Value = Proformas.Cli_id;
                cmd.Parameters.Add("@pref_date", SqlDbType.Date).Value = Proformas.Pref_date;
                cmd.Parameters.Add("@pref_estado", SqlDbType.VarChar, 255).Value = Proformas.Pref_estado;
                cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Proformas.Cre_id;
                cmd.Parameters.Add("@pref_valido", SqlDbType.Date).Value = Proformas.Pref_valido;
                cmd.Parameters.Add("@pref_doc_number", SqlDbType.VarChar, 30).Value = Proformas.Pref_doc_number;

                cmd.Connection.Open();
                int var =    Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Connection.Close();
                return var;
            }
            catch (Exception ex)
            {

                return 0;
            }

        }

        public bool sp_Delete_Proformas(cls_Proformas Proformas)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Proformas";
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proformas.Pref_id;

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

        public DataTable sp_List_Proformas(cls_Proformas Proformas)

        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Proformas";
                cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proformas.Pref_id;


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
