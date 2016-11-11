using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
    public class cls_Usuarios:cls_Conexion
    {
        //Atributos
        public int Us_id { get; set; }
        public string Us_fname { get; set; }
        public string Us_lname { get; set; }
        public string Doc_type { get; set; }
        public int Us_doc_number { get; set; }
        public int Us_type { get; set; }
        public string Us_direccion { get; set; }
        public string Us_distrito { get; set; }
        public string Us_password { get; set; }


        //Métodos
        public DataTable sp_login( cls_Usuarios Usuarios)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Login";
                cmd.Parameters.Add("@us_doc_number", SqlDbType.Int).Value = Usuarios.Us_doc_number;
                cmd.Parameters.Add("@us_password", SqlDbType.VarChar, 20).Value = Usuarios.Us_password;
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }



        public bool sp_Insert_Usuarios(cls_Usuarios Usuarios)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Usuarios";
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Usuarios.Us_id;
                cmd.Parameters.Add("@us_fname", SqlDbType.VarChar, 255).Value = Usuarios.Us_fname;
                cmd.Parameters.Add("@us_lname", SqlDbType.VarChar, 255).Value = Usuarios.Us_lname;
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 15).Value = Usuarios.Doc_type;
                cmd.Parameters.Add("@us_doc_number", SqlDbType.Int).Value = Usuarios.Us_doc_number;
                cmd.Parameters.Add("@us_type", SqlDbType.Int).Value = Usuarios.Us_type;
                cmd.Parameters.Add("@us_direccion", SqlDbType.VarChar, 300).Value = Usuarios.Us_direccion;
                cmd.Parameters.Add("@us_distrito", SqlDbType.VarChar, 100).Value = Usuarios.Us_distrito;
                cmd.Parameters.Add("@us_password", SqlDbType.VarChar, 20).Value = Usuarios.Us_password;
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
        public DataTable sp_Listar_Usuarios(cls_Usuarios Usuarios)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Usuarios";
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Usuarios.Us_id;
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool sp_Delete_Usuarios(cls_Usuarios Usuarios)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Usuarios";
                cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Usuarios.Us_id;
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






    }
}
