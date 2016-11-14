<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="creditos.aspx.cs" Inherits="CapaPresentacion.pages.creditos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
   <div class="main">
    <form id="form1" runat="server">
                    <br />
                        <asp:GridView ID="dgv_list_cre" runat="server"  class='pure-table pure-table-bordered pure-table-odd' ShowHeaderWhenEmpty="True" OnRowCommand="dgv_list_cre_RowCommand" >
                       
                        </asp:GridView>
                     <br />
    </form>
  </div>
</asp:Content>
