<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="panel_control.aspx.cs" Inherits="CapaPresentacion.pages.panel_control" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <%--mensaje de inicio--%>
    <h1>Bienvenido a Beurer Health</h1>
    <fieldset>
        <legend>Datos Del Sistema</legend>
      
      <span>Cómo agregar productos?</span>
      <p>
          1.Paso :  El usuario con privilegios N° 3 tiene que crear una solicitud de compra, agregando los lotes de producto que necesita.
          2.Paso : El usuario con privilegios N° 2 es el encargado de comprar esos lotes, en al sección de 'Compras' . Ahí le aparecerá un listado de las compras hechas y de las Solicitudes de Compra.
          Para cumplir el pedido de la solicitud sólo basta con hacer click al enlacen "Hacer Compra" y rellenar todos los datos que se le solicita.
          Antes de guardar fijarse que se haya  actualizado los lotes; con el precio del lote y su fecha de vencimiento del mismo, También ahí se peude seleccionar en qué tipo de almacen estará:
          FRONT: Listo para vender.
          BACK: Almacenado, en espera.
          3.Paso :Una vez que los lotes estén comprados ya se podrán listar los productos que pueden ser vendidos, claro sólo los que tengan el tipo de almacen 'FRONT'.
            *Para cambiar un lote de BACK a FRONT o viceversa solo basta con ir al  módulo LOTE y editar el lote deseado. Usuario con privilegios N° 2 o 1         

      </p>

    <span>Modulos</span>
      <p>
           Módulo PROFORMAS : Se rellena con los campos indicados y si se necesita crear un cliente se añade en el módulo Cliente. Se usa para crear Proformas las cuales se puede finalizar  su venta en el Módulo VENTAS.
           Módulo VENTAS : Lista las proformas y las ventas realizadas|Crear venta
           Módulo SOLICOMPRA : Aquí se hace los pedidos de los productos que se necesitan.
           Módulo Compras : Completa las compras de las solicitudes creadas.

           Módulo Usuario: Usuarios que usarán el sistema
           Módulo Cliente : Listado de clientes para realizar ventas o proformas
           Módulo Proveedor: Listado de proveedores a los cuales se harán las compras de los productos
           Módulo Creditos: Listado de creditos de ventas y compras
           Módulo Lotes: listado de lotes ya comprados
           
      </p>
    </fieldset>

</asp:Content>
