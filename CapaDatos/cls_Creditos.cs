using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
  public  class cls_Creditos:cls_Conexion
    {

        public int Cre_id { get; set; }
        public int Cre_plazos { get; set; }
        public double Cre_interes { get; set; }
        public double Cre_subtotal { get; set; }
        public double Cre_igv { get; set; }
        public double Cre_total { get; set; }
        public double Cre_pago { get; set; }
        public string Cre_estado { get; set; }
        public DateTime Cre_date_fin { get; set; }
        public DateTime Cre_date_prox { get; set; }

        public int sp_Insert_Creditos(cls_Creditos Creditos)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Insert_Creditos";
                cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Creditos.Cre_id;
                cmd.Parameters.Add("@cre_plazos", SqlDbType.Int).Value = Creditos.Cre_plazos;
                cmd.Parameters.Add("@cre_interes", SqlDbType.Decimal).Value = Creditos.Cre_interes.ToString().Replace(".", ",");
                cmd.Parameters.Add("@cre_subtotal", SqlDbType.Decimal).Value = Creditos.Cre_subtotal;
                cmd.Parameters.Add("@cre_igv", SqlDbType.Decimal).Value = Creditos.Cre_igv;
                cmd.Parameters.Add("@cre_total", SqlDbType.Decimal).Value = Creditos.Cre_total;
                cmd.Parameters.Add("@cre_pago", SqlDbType.Decimal).Value = Creditos.Cre_pago;
                cmd.Parameters.Add("@cre_estado", SqlDbType.VarChar, 255).Value = Creditos.Cre_estado;
                cmd.Parameters.Add("@cre_date_fin", SqlDbType.Date).Value = Creditos.Cre_date_fin;
                cmd.Parameters.Add("@cre_date_prox", SqlDbType.Date).Value = Creditos.Cre_date_prox;
                cmd.Connection.Open();
                var newID = cmd.ExecuteScalar();
                cmd.Connection.Close();

                return Convert.ToInt32(newID);
            }
            catch (Exception ex)
            {

                return 0;
            }

        }

        public bool sp_Delete_Creditos(cls_Creditos Creditos)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_Delete_Creditos";
                cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Creditos.Cre_id;
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

        public DataTable sp_List_Creditos(cls_Creditos Creditos)

        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conx;
                cmd.CommandText = "sp_List_Creditos";
                cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Creditos.Cre_id;

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
