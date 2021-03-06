﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocios;
using System.Data;
namespace CapaPresentacion.pages
{
    public partial class clientes : System.Web.UI.Page
    {
        cls_Cliente clsClie = new cls_Cliente();
        cls_Clientes Cliente = new cls_Clientes();

        public void load()
        {
            string typecli = (Session["Cli_type"].ToString() != "0") ? Session["Cli_type"].ToString() : "PERSONA" ;
            Cliente.Cli_type = typecli;
            Cliente.Cli_id = 0;
            dgv.DataSource = clsClie.List_Clientes(Cliente);
            dgv.DataBind();
            //Session["Cli_type"] = "0";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        protected void cbtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbtype.SelectedValue == "EMPRESA")
            {
                lbdni.Text = "RUC";
                lbname.Text = "Razon Social";
                txtdni.MaxLength = 20;
            }
            else
            {
                lbdni.Text = "DNI";
                lbname.Text = "Nombres";
                txtdni.MaxLength = 9;
            }
        }


        protected void cblisttype_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["Cli_type"] = (cblisttype.SelectedValue == "EMPRESA") ? "EMPRESA" : "PERSONA";
            load();
        }   

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Cli_id"] = "0";
            PlaceHolder1.Visible = true;
            //empy form
            txtdni.Text = "";
            txtfname.Text = "";
            txtdireccion.Text = "";
            txtdistrito.Text = "";
            txtemail.Text = "";
            txttel.Text = "";
            
        }

        protected void btn_cancelar(object sender, EventArgs e)
        {
            Session["Cli_id"] = "0";
            PlaceHolder1.Visible = false;
        }
        protected void btn_save(object sender, EventArgs e)
        {
           if( txtfname.Text != ""  && txtdireccion.Text != "" && txtdistrito.Text != "" && txtdni.Text != "" && txtemail.Text != "" && txtfname.Text != "" &&  txttel.Text != "" ){

            Cliente.Cli_id = Convert.ToInt32(Session["Cli_id"].ToString());
            Cliente.Cli_razon_social = txtfname.Text;
            Cliente.Cli_doc_number = txtdni.Text;
            Cliente.Cli_distrito = txtdistrito.Text;
            Cliente.Cli_direccion = txtdireccion.Text;
            Cliente.Cli_correo = txtemail.Text;
            Cliente.Cli_tel = txttel.Text;
            Cliente.Cli_type = cbtype.SelectedValue;

            Cliente.Cli_father = "NO";

            Cliente.Doc_type = (cbtype.SelectedValue == "EMPRESA") ? "RUC":"DNI" ;

            functions fn = new functions();
            Session["msg"] = fn.msg(clsClie.Insert_Clientes(Cliente), "info");
            PlaceHolder1.Visible = false;
                Session["msg"] = "0";
                Response.Redirect("clientes.aspx");
           }else  {
            functions fn = new functions();
            Session["msg"] = fn.msg("Campos Vacíos", "info");
            Session["Cli_id"] = "0";
            Response.Redirect("clientes.aspx");
           }

        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

         
        }


        protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //soli
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow dgvrow = dgv.Rows[index];
            if (e.CommandName == "editar")
            {

                string id = dgvrow.Cells[2].Text;
                Session["Cli_id"] = id;
                PlaceHolder1.Visible = true;
                //edit
                if (PlaceHolder1.Visible == true)
                {
                    if (Session["Cli_id"].ToString() != "0")
                    {
                        DataTable dt_user = new DataTable();
                        Cliente.Cli_id = Convert.ToInt32(Session["Cli_id"].ToString());
                        dt_user = clsClie.List_Clientes(Cliente);

                        //first data
                        DataRow dr = dt_user.Rows[0];
                        txtdni.Text = dr[2].ToString();
                        txtfname.Text = dr[1].ToString();
                        txtdireccion.Text = dr[3].ToString();
                        txtdistrito.Text = dr[4].ToString();

                        txtemail.Text = dr[6].ToString();
                        txttel.Text = dr[5].ToString();
                        cbtype.SelectedValue = dr[8].ToString();


                    }
                }
                    


            }
            else if (e.CommandName == "eliminar")
            {
                Cliente.Cli_id = Convert.ToInt32(dgvrow.Cells[2].Text);
                //msg
               
                 functions fn = new functions();
                Session["msg"] = fn.msg( clsClie.Delete_Clientes(Cliente), "info");
                Session["Cli_id"] = "0";
                Response.Redirect("clientes.aspx");
                        
            }
               
            
        }


        protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewRow dr_dgv = dgv.Rows[e.NewEditIndex];

            //var row_data = dr_dgv.Cells[2].Text;
            //string id = Convert.ToString(row_data);
            //Session["Other_user_id"] = id;
            //PlaceHolder1.Visible = true;
            ////edit
            //if (PlaceHolder1.Visible == true)
            //{
            //    if (Session["Other_user_id"].ToString() != "0")
            //    {
            //        DataTable dt_user = new DataTable();
            //       Cliente.Us_id = Convert.ToInt32(Session["Other_user_id"].ToString());
            //        dt_user = this.clsUser.List_Usuarios(this.User);

            //        //first data
            //        DataRow dr = dt_user.Rows[0];
            //        txtdni.Text = dr[4].ToString();
            //        txtfname.Text = dr[1].ToString();
            //        txtlname.Text = dr[2].ToString();
            //        txtdireccion.Text = dr[6].ToString();
            //        txtdistrito.Text = dr[7].ToString();
            //        cbtype.SelectedIndex = Convert.ToInt32(dr[5].ToString()) - 1;
            //        txtpass.Text = dr[8].ToString();

            //    }
            //}

        }


    }
}