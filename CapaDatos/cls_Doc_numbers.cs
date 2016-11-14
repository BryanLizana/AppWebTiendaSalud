using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public class cls_Doc_numbers:cls_Conexion
    {
        //@doc_type varchar(60),
        //@doc_number int

        public int doc_number { get; set; }
        public string doc_type { get; set; }


        public bool sp_Insert_Doc(cls_Doc_numbers Doc)
        {   
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Doc_numbers";
                cmd.Parameters.Add("@doc_number", SqlDbType.Int).Value = Doc.doc_number;
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 30).Value = Doc.doc_type;

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

        public cls_Doc_numbers sp_List_Doc(cls_Doc_numbers Doc)

        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Doc_numbers";
                cmd.Parameters.Add("@doc_type", SqlDbType.VarChar, 30).Value = Doc.doc_type;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);


                string value;
                int num;
                if (dt_list.Rows.Count > 0)
                {
                    DataRow row = dt_list.Rows[0];
                    //value = row[0].ToString();
                    num = Convert.ToInt32(row[0].ToString()) + 1;
                    value = Doc.doc_type + (num).ToString().PadLeft(5 - num.ToString().Length, '0');
                }
                else
                {

                    value = Doc.doc_type + "0001";
                    num = 1;
                }



                Doc.doc_number = num;
                Doc.doc_type = value;



                return Doc;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
