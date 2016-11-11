using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
  public  class cls_Clientes:cls_Conexion
    {
        public int Cli_id { get; set; }
        public string Cli_razon_social { get; set; }
        public string Doc_type { get; set; }
        public string Cli_doc_number { get; set; }
        public string Cli_direccion { get; set; }
        public string Cli_distrito { get; set; }
        public string Cli_tel { get; set; }
        public string Cli_correo { get; set; }
        public string Cli_father { get; set; }
        public string Cli_type { get; set; }



        public bool sp_Insert_Clientes(cls_Clientes Clientes)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Clientes";
                cmd.Parameters.Add("@cli_id", SqlDbType.Int).Value = Clientes.Cli_id;
                cmd.Parameters.Add("@cli_razon_social", SqlDbType.VarChar, 30).Value = Clientes.Cli_razon_social;
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 30).Value = Clientes.Doc_type;
                cmd.Parameters.Add("@cli_doc_number", SqlDbType.VarChar, 30).Value = Clientes.Cli_doc_number;
                cmd.Parameters.Add("@cli_direccion", SqlDbType.VarChar, 30).Value = Clientes.Cli_direccion;
                cmd.Parameters.Add("@cli_distrito", SqlDbType.VarChar, 30).Value = Clientes.Cli_distrito;
                cmd.Parameters.Add("@cli_tel", SqlDbType.VarChar, 30).Value = Clientes.Cli_tel;
                cmd.Parameters.Add("@cli_correo", SqlDbType.VarChar, 30).Value = Clientes.Cli_correo;
                cmd.Parameters.Add("@cli_father", SqlDbType.VarChar, 20).Value = Clientes.Cli_father;
                cmd.Parameters.Add("@cli_type", SqlDbType.VarChar, 30).Value = Clientes.Cli_type;

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

        public bool sp_Delete_Clientes(cls_Clientes Clientes)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Clientes";
                cmd.Parameters.Add("@cli_doc_number ", SqlDbType.VarChar, 29).Value = Clientes.Cli_doc_number;

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

        public DataTable sp_List_Clientes(cls_Clientes Clientes)

        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Clientes";
                cmd.Parameters.Add("@cli_id", SqlDbType.VarChar, 20).Value = Clientes.Cli_id;
                cmd.Parameters.Add("@cli_type", SqlDbType.VarChar, 20).Value = Clientes.Cli_type;


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
