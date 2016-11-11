<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CapaPresentacion.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <!--scripts-->
    <script src="/resources/jquery.min.js"></script>
    <%--<script src="/resources/bootstrap.min.js"></script>--%>
    <script src="/js/main.js"></script> 
    <!--Styles-->
   <link href="/resources/pure.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
</head>
  <%
        if (Session["User_code"].ToString() != "0")
        {
                 Response.Redirect("~/pages/panel_control.aspx");
          
        }
    %>
<body>

            <div style="width:320px; margin:auto;margin-top:10%;">
                    <form class="pure-form pure-form-stacked"  runat="server" >
                    <fieldset>
                         <%--<div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> Message Error</div>--%>
                        <%  
                            if (Session["msg"].ToString() != "0")
                            {
                            Response.Write( Session["msg"].ToString());
                                Session["msg"] = "0";
                            }

                            %>
                        <legend>Login</legend>

                        <label for="email">Email</label>
                        <asp:TextBox ID="txtus_code" runat="server" CssClass="form-control" required autofocus MaxLength="10"></asp:TextBox> <br/>

                        <label for="password">Password</label>
                           <asp:TextBox ID="txtus_pass" runat="server" CssClass="form-control" required MaxLength="15"></asp:TextBox>  <br/>

                        <asp:Button ID="btn_save" runat="server" Text="Sign in" OnClick="Button1_Click" CssClass="pure-button pure-button-primary"/>
                    </fieldset>
                </form>
            </div>

</body>
</html>
