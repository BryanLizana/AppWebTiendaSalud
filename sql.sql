USE [master]
GO
/****** Object:  Database [WebTiendaSaludV1]    Script Date: 13/11/2016 22:49:58 ******/
CREATE DATABASE [WebTiendaSaludV1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebTiendaSaludV1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebTiendaSaludV1.mdf' , SIZE = 5312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebTiendaSaludV1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebTiendaSaludV1_log.ldf' , SIZE = 9408KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebTiendaSaludV1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebTiendaSaludV1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebTiendaSaludV1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebTiendaSaludV1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebTiendaSaludV1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebTiendaSaludV1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebTiendaSaludV1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET RECOVERY FULL 
GO
ALTER DATABASE [WebTiendaSaludV1] SET  MULTI_USER 
GO
ALTER DATABASE [WebTiendaSaludV1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebTiendaSaludV1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebTiendaSaludV1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebTiendaSaludV1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebTiendaSaludV1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebTiendaSaludV1', N'ON'
GO
USE [WebTiendaSaludV1]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_razon_social] [varchar](255) NOT NULL,
	[doc_type] [varchar](20) NOT NULL,
	[cli_doc_number] [varchar](255) NOT NULL,
	[cli_direccion] [varchar](255) NULL,
	[cli_distrito] [varchar](255) NULL,
	[cli_tel] [varchar](255) NULL,
	[cli_correo] [varchar](255) NULL,
	[cli_father] [varchar](255) NOT NULL,
	[cli_type] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Clientes__FFEFE14F59B00DA9] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compras](
	[comp_id] [int] IDENTITY(1,1) NOT NULL,
	[us_id] [int] NOT NULL,
	[provee_id] [int] NOT NULL,
	[comp_date] [date] NOT NULL,
	[comp_estado] [varchar](255) NULL,
	[solicomp_id] [int] NOT NULL,
	[doc_type] [varchar](20) NOT NULL,
	[comp_doc_number] [varchar](30) NOT NULL,
	[cre_id] [int] NOT NULL,
 CONSTRAINT [PK__Compras__531653DD7E3CC9F0] PRIMARY KEY CLUSTERED 
(
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Creditos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Creditos](
	[cre_id] [int] IDENTITY(1,1) NOT NULL,
	[cre_plazos] [int] NOT NULL,
	[cre_interes] [decimal](10, 2) NULL,
	[cre_subtotal] [decimal](10, 2) NULL,
	[cre_igv] [decimal](10, 2) NULL,
	[cre_total] [decimal](10, 2) NULL,
	[cre_pago] [decimal](10, 2) NULL,
	[cre_estado] [varchar](255) NULL,
	[cre_date_fin] [date] NULL,
	[cre_date_prox] [date] NULL,
 CONSTRAINT [PK__Creditos__059AC58BCA01382C] PRIMARY KEY CLUSTERED 
(
	[cre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doc_numbers]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doc_numbers](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_type] [varchar](60) NULL,
	[doc_number] [int] NULL,
 CONSTRAINT [PK__Doc_numb__8AD0292412E39D61] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lotes_pro]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lotes_pro](
	[lote_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_id] [int] NOT NULL,
	[lote_vence] [date] NULL,
	[lote_cod] [varchar](30) NOT NULL,
	[lote_cant] [int] NULL,
	[lote_almacen] [varchar](255) NULL,
	[solicomp_id] [int] NOT NULL,
	[lote_aporte] [decimal](10, 2) NULL,
	[lote_estado] [varchar](20) NULL,
	[lote_stock] [int] NOT NULL,
 CONSTRAINT [PK__Lotes_pr__E0E20FB3573F65C6] PRIMARY KEY CLUSTERED 
(
	[lote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name_comercial] [varchar](255) NULL,
	[pro_name] [varchar](255) NULL,
	[pro_precio_uni] [decimal](10, 2) NULL,
	[pro_precio_may] [decimal](10, 2) NULL,
	[pro_type] [varchar](20) NULL,
	[pro_procedencia] [varchar](100) NULL,
 CONSTRAINT [PK__Producto__335E4CA64A9A6AE8] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proforma_detalles]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proforma_detalles](
	[pref_id] [int] NOT NULL,
	[pro_id] [int] NULL,
	[lote_id] [int] NULL,
	[cant] [decimal](10, 2) NULL,
	[importe] [decimal](10, 2) NULL,
	[estado] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proformas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proformas](
	[pref_id] [int] IDENTITY(1,1) NOT NULL,
	[us_id] [int] NULL,
	[cli_id] [int] NULL,
	[pref_date] [date] NULL,
	[pref_estado] [varchar](255) NULL,
	[cre_id] [int] NOT NULL,
	[pref_valido] [date] NULL,
	[pref_doc_number] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Proforma__F94C4B3DCF01A20E] PRIMARY KEY CLUSTERED 
(
	[pref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[provee_id] [int] IDENTITY(1,1) NOT NULL,
	[provee_razons] [varchar](100) NOT NULL,
	[provee_ruc] [varchar](20) NULL,
	[provee_direccion] [varchar](250) NULL,
	[provee_distrito] [varchar](100) NULL,
 CONSTRAINT [PK__Proveedo__890451537FAAE0EE] PRIMARY KEY CLUSTERED 
(
	[provee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solicitud_comp]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Solicitud_comp](
	[solicomp_id] [int] IDENTITY(1,1) NOT NULL,
	[us_id] [int] NOT NULL,
	[doc_type] [varchar](20) NOT NULL,
	[solicomp_doc_number] [varchar](20) NOT NULL,
	[solicomp_date] [datetime] NOT NULL,
	[solicomp_estado] [varchar](255) NULL,
	[solicomp_valido] [datetime] NULL,
 CONSTRAINT [PK__Solicitu__18806D780B4D99BD] PRIMARY KEY CLUSTERED 
(
	[solicomp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[us_id] [int] IDENTITY(1,1) NOT NULL,
	[us_fname] [varchar](255) NOT NULL,
	[us_lname] [varchar](255) NOT NULL,
	[doc_type] [varchar](15) NOT NULL,
	[us_doc_number] [int] NOT NULL,
	[us_type] [int] NOT NULL,
	[us_direccion] [varchar](300) NULL,
	[us_distrito] [varchar](100) NULL,
	[us_password] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Usuarios__2E701A675FCD8608] PRIMARY KEY CLUSTERED 
(
	[us_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventas](
	[ven_id] [int] IDENTITY(1,1) NOT NULL,
	[pref_id] [int] NULL,
	[ven_date] [date] NULL,
	[us_id] [int] NULL,
	[doc_type] [varchar](20) NULL,
	[ven_doc_number] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Ventas__7BA8BB693A9FC46E] PRIMARY KEY CLUSTERED 
(
	[ven_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [index__cli]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index__cli] ON [dbo].[Clientes]
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_comp]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_comp] ON [dbo].[Compras]
(
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_cre]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_cre] ON [dbo].[Creditos]
(
	[cre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indes_lote]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [indes_lote] ON [dbo].[Lotes_pro]
(
	[lote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_pro]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_pro] ON [dbo].[Productos]
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_pref]    Script Date: 13/11/2016 22:49:58 ******/
CREATE NONCLUSTERED INDEX [index_pref] ON [dbo].[Proforma_detalles]
(
	[pref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_pref]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_pref] ON [dbo].[Proformas]
(
	[pref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_solicomp]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_solicomp] ON [dbo].[Solicitud_comp]
(
	[solicomp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_user]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_user] ON [dbo].[Usuarios]
(
	[us_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_vent]    Script Date: 13/11/2016 22:49:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_vent] ON [dbo].[Ventas]
(
	[ven_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [fk_comp_to_cre] FOREIGN KEY([cre_id])
REFERENCES [dbo].[Creditos] ([cre_id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [fk_comp_to_cre]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [fk_comp_to_provee] FOREIGN KEY([provee_id])
REFERENCES [dbo].[Proveedores] ([provee_id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [fk_comp_to_provee]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [fk_comp_to_soli] FOREIGN KEY([solicomp_id])
REFERENCES [dbo].[Solicitud_comp] ([solicomp_id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [fk_comp_to_soli]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [fk_comp_to_us] FOREIGN KEY([us_id])
REFERENCES [dbo].[Usuarios] ([us_id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [fk_comp_to_us]
GO
ALTER TABLE [dbo].[Lotes_pro]  WITH CHECK ADD  CONSTRAINT [fk_lote_to_pro] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Productos] ([pro_id])
GO
ALTER TABLE [dbo].[Lotes_pro] CHECK CONSTRAINT [fk_lote_to_pro]
GO
ALTER TABLE [dbo].[Lotes_pro]  WITH CHECK ADD  CONSTRAINT [fk_lote_to_soli] FOREIGN KEY([solicomp_id])
REFERENCES [dbo].[Solicitud_comp] ([solicomp_id])
GO
ALTER TABLE [dbo].[Lotes_pro] CHECK CONSTRAINT [fk_lote_to_soli]
GO
ALTER TABLE [dbo].[Proforma_detalles]  WITH CHECK ADD  CONSTRAINT [fk_vendet_to_pro] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Productos] ([pro_id])
GO
ALTER TABLE [dbo].[Proforma_detalles] CHECK CONSTRAINT [fk_vendet_to_pro]
GO
ALTER TABLE [dbo].[Proforma_detalles]  WITH CHECK ADD  CONSTRAINT [fk_vendet_to_ven] FOREIGN KEY([pref_id])
REFERENCES [dbo].[Proformas] ([pref_id])
GO
ALTER TABLE [dbo].[Proforma_detalles] CHECK CONSTRAINT [fk_vendet_to_ven]
GO
ALTER TABLE [dbo].[Proformas]  WITH CHECK ADD  CONSTRAINT [fk_pref_to_cli] FOREIGN KEY([cli_id])
REFERENCES [dbo].[Clientes] ([cli_id])
GO
ALTER TABLE [dbo].[Proformas] CHECK CONSTRAINT [fk_pref_to_cli]
GO
ALTER TABLE [dbo].[Proformas]  WITH CHECK ADD  CONSTRAINT [fk_ven_to_cre] FOREIGN KEY([cre_id])
REFERENCES [dbo].[Creditos] ([cre_id])
GO
ALTER TABLE [dbo].[Proformas] CHECK CONSTRAINT [fk_ven_to_cre]
GO
ALTER TABLE [dbo].[Proformas]  WITH CHECK ADD  CONSTRAINT [fk_ven_to_us] FOREIGN KEY([us_id])
REFERENCES [dbo].[Usuarios] ([us_id])
GO
ALTER TABLE [dbo].[Proformas] CHECK CONSTRAINT [fk_ven_to_us]
GO
ALTER TABLE [dbo].[Solicitud_comp]  WITH CHECK ADD  CONSTRAINT [fk_soli_to_us] FOREIGN KEY([us_id])
REFERENCES [dbo].[Usuarios] ([us_id])
GO
ALTER TABLE [dbo].[Solicitud_comp] CHECK CONSTRAINT [fk_soli_to_us]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [fk_ven_to_pref] FOREIGN KEY([pref_id])
REFERENCES [dbo].[Proformas] ([pref_id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [fk_ven_to_pref]
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_id]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_Cliente_id](
@cli_doc_number varchar(20)
)
AS
SELECT cli_id FROM Clientes WHERE cli_doc_number=@cli_doc_number


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Clientes]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Clientes] ( 
@cli_id int ) AS 
begin 
DELETE Clientes WHERE cli_id = @cli_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Compras]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Compras] ( 
@comp_id int ) AS 
begin 
DELETE Compras WHERE comp_id = @comp_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Creditos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Creditos] ( 
@cre_id int ) AS 
begin 
DELETE Creditos WHERE cre_id = @cre_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Lotes_pro]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Lotes_pro] ( 
@lote_id int ) AS 
begin 
DELETE Lotes_pro WHERE lote_id = @lote_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Productos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Productos] ( 
@pro_id int ) AS 
begin 
DELETE Productos WHERE pro_id = @pro_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Proforma_detalles]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Proforma_detalles] ( 
@pref_id int ,
@pro_id int 
) AS 
begin 
DELETE Proforma_detalles WHERE pref_id = @pref_id and pro_id = @pro_id
end 


------------------------------------- 
/*****
public int Pref_id {get;set;} 
public int Pro_id {get;set;} 
public int Lote_id {get;set;} 

public boolean Cant {get;set;} 
public boolean Importe {get;set;} 
public string Estado {get;set;} 
cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proforma_detalles.Pref_id;
cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Proforma_detalles.Pro_id;
cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Proforma_detalles.Lote_id;
cmd.Parameters.Add("@cant", SqlDbType.Decimal).Value = Proforma_detalles.Cant;
cmd.Parameters.Add("@importe", SqlDbType.Decimal).Value = Proforma_detalles.Importe;
cmd.Parameters.Add("@estado", SqlDbType.VarChar,20).Value = Proforma_detalles.Estado;
*****/



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Proformas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Proformas] ( 
@pref_id int ) AS 
begin 
DELETE Proformas WHERE pref_id = @pref_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Proveedores]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Proveedores] ( 
@provee_id int ) AS 
begin 
DELETE Proveedores WHERE provee_id = @provee_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Solicitud_comp]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Solicitud_comp] ( 
@solicomp_id int ) AS 
begin 
DELETE Solicitud_comp WHERE solicomp_id = @solicomp_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Usuarios]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Usuarios] ( 
@us_id int ) AS 
begin 
DELETE Usuarios WHERE us_id = @us_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Ventas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Delete_Ventas] ( 
@ven_id int ) AS 
begin 
DELETE Ventas WHERE ven_id = @ven_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Clientes]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Insert_Clientes] ( 
@cli_id int,
@cli_razon_social varchar(255),
@doc_type varchar(20),
@cli_doc_number varchar(255),
@cli_direccion varchar(255),
@cli_distrito varchar(255),
@cli_tel varchar(255),
@cli_correo varchar(255),
@cli_father varchar(255),
@cli_type varchar(20) 
) AS 
if @cli_id = 0 
begin 
INSERT INTO Clientes( cli_razon_social,doc_type,cli_doc_number,cli_direccion,cli_distrito,cli_tel,cli_correo,cli_father,cli_type ) VALUES (@cli_razon_social,@doc_type,@cli_doc_number,@cli_direccion,@cli_distrito,@cli_tel,@cli_correo,@cli_father,@cli_type) 
end 
else 
begin 
UPDATE Clientes set cli_razon_social= @cli_razon_social,doc_type= @doc_type,cli_doc_number= @cli_doc_number,cli_direccion= @cli_direccion,cli_distrito= @cli_distrito,cli_tel= @cli_tel,cli_correo= @cli_correo,cli_father= @cli_father,cli_type= @cli_type WHERE cli_id = @cli_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Compras]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Cli_id {get;set;} 
public string Cli_razon_social {get;set;} 
public string Doc_type {get;set;} 
public string Cli_doc_number {get;set;} 
public string Cli_direccion {get;set;} 
public string Cli_distrito {get;set;} 
public string Cli_tel {get;set;} 
public string Cli_correo {get;set;} 
public string Cli_father {get;set;} 
public string Cli_type {get;set;} 
cmd.Parameters.Add("@cli_id", SqlDbType.Int).Value = Clientes.Cli_id;
cmd.Parameters.Add("@cli_razon_social", SqlDbType.VarChar,30).Value = Clientes.Cli_razon_social;
cmd.Parameters.Add("@doc_type", SqlDbType.VarChar,30).Value = Clientes.Doc_type;
cmd.Parameters.Add("@cli_doc_number", SqlDbType.VarChar,30).Value = Clientes.Cli_doc_number;
cmd.Parameters.Add("@cli_direccion", SqlDbType.VarChar,30).Value = Clientes.Cli_direccion;
cmd.Parameters.Add("@cli_distrito", SqlDbType.VarChar,30).Value = Clientes.Cli_distrito;
cmd.Parameters.Add("@cli_tel", SqlDbType.VarChar,30).Value = Clientes.Cli_tel;
cmd.Parameters.Add("@cli_correo", SqlDbType.VarChar,30).Value = Clientes.Cli_correo;
cmd.Parameters.Add("@cli_father", SqlDbType.VarChar,30).Value = Clientes.Cli_father;
cmd.Parameters.Add("@cli_type", SqlDbType.VarChar,30).Value = Clientes.Cli_type;
*****/
CREATE procedure [dbo].[sp_Insert_Compras] ( 
@comp_id int,
@us_id int,
@provee_id int,
@comp_date date,
@comp_estado varchar(255),
@solicomp_id int,
@doc_type varchar(20),
@comp_doc_number varchar(30),
@cre_id int 
) AS 
if @comp_id = 0 
begin 
INSERT INTO Compras( us_id,provee_id,comp_date,comp_estado,solicomp_id,doc_type,comp_doc_number,cre_id ) VALUES (@us_id,@provee_id,@comp_date,@comp_estado,@solicomp_id,@doc_type,@comp_doc_number,@cre_id) 
Update Lotes_pro set lote_estado = 'COMPLETADO' WHERE solicomp_id = @solicomp_id
Update Solicitud_comp set solicomp_estado = 'FINALIZADO' WHERE solicomp_id = @solicomp_id
update Lotes_pro set lote_stock = lote_cant WHERE solicomp_id = @solicomp_id
end     
else 
begin 
UPDATE Compras set us_id= @us_id,provee_id= @provee_id,comp_date= @comp_date,comp_estado= @comp_estado,solicomp_id= @solicomp_id,doc_type= @doc_type,comp_doc_number= @comp_doc_number,cre_id= @cre_id WHERE comp_id = @comp_id 
Update Solicitud_comp set solicomp_estado = 'FINALIZADO' WHERE solicomp_id = @solicomp_id
Update Lotes_pro set lote_estado = @comp_estado WHERE solicomp_id = @solicomp_id
update Lotes_pro set lote_stock = lote_cant WHERE solicomp_id = @solicomp_id

end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Creditos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Comp_id {get;set;} 
public int Us_id {get;set;} 
public int Provee_id {get;set;} 
public DateTime Comp_date {get;set;} 
public string Comp_estado {get;set;} 
public int Solicomp_id {get;set;} 
public string Doc_type {get;set;} 
public string Comp_doc_number {get;set;} 
public int Cre_id {get;set;} 
cmd.Parameters.Add("@comp_id", SqlDbType.Int).Value = Compras.Comp_id;
cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Compras.Us_id;
cmd.Parameters.Add("@provee_id", SqlDbType.Int).Value = Compras.Provee_id;
cmd.Parameters.Add("@comp_date", SqlDbType.DateTime).Value = Compras.Comp_date;
cmd.Parameters.Add("@comp_estado", SqlDbType.VarChar,30).Value = Compras.Comp_estado;
cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Compras.Solicomp_id;
cmd.Parameters.Add("@doc_type", SqlDbType.VarChar,30).Value = Compras.Doc_type;
cmd.Parameters.Add("@comp_doc_number", SqlDbType.VarChar,30).Value = Compras.Comp_doc_number;
cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Compras.Cre_id;
*****/
CREATE procedure [dbo].[sp_Insert_Creditos] ( 
@cre_id int,
@cre_plazos int,
@cre_interes decimal(6,2),
@cre_subtotal decimal(6,2),
@cre_igv decimal(6,2),
@cre_total decimal(6,2),
@cre_pago decimal(6,2),
@cre_estado varchar(255),
@cre_date_fin date,
@cre_date_prox date 
) AS 
if @cre_id = 0 
begin 
INSERT INTO Creditos( cre_plazos,cre_interes,cre_subtotal,cre_igv,cre_total,cre_pago,cre_estado,cre_date_fin,cre_date_prox ) VALUES (@cre_plazos,@cre_interes,@cre_subtotal,@cre_igv,@cre_total,@cre_pago,@cre_estado,@cre_date_fin,@cre_date_prox) 
SELECT SCOPE_IDENTITY()
end 
else 
begin 
UPDATE Creditos set cre_plazos= @cre_plazos,cre_interes= @cre_interes,cre_subtotal= @cre_subtotal,cre_igv= @cre_igv,cre_total= @cre_total,cre_pago= @cre_pago,cre_estado= @cre_estado,cre_date_fin= @cre_date_fin,cre_date_prox= @cre_date_prox WHERE cre_id = @cre_id 
select @cre_id
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Doc_numbers]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Cre_id {get;set;} 
public int Cre_plazos {get;set;} 
public boolean Cre_interes {get;set;} 
public boolean Cre_subtotal {get;set;} 
public boolean Cre_igv {get;set;} 
public boolean Cre_total {get;set;} 
public boolean Cre_pago {get;set;} 
public string Cre_estado {get;set;} 
public DateTime Cre_date_fin {get;set;} 
public DateTime Cre_date_prox {get;set;} 
cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Creditos.Cre_id;
cmd.Parameters.Add("@cre_plazos", SqlDbType.Int).Value = Creditos.Cre_plazos;
cmd.Parameters.Add("@cre_interes", SqlDbType.Decimal).Value = Creditos.Cre_interes;
cmd.Parameters.Add("@cre_subtotal", SqlDbType.Decimal).Value = Creditos.Cre_subtotal;
cmd.Parameters.Add("@cre_igv", SqlDbType.Decimal).Value = Creditos.Cre_igv;
cmd.Parameters.Add("@cre_total", SqlDbType.Decimal).Value = Creditos.Cre_total;
cmd.Parameters.Add("@cre_pago", SqlDbType.Decimal).Value = Creditos.Cre_pago;
cmd.Parameters.Add("@cre_estado", SqlDbType.VarChar,30).Value = Creditos.Cre_estado;
cmd.Parameters.Add("@cre_date_fin", SqlDbType.DateTime).Value = Creditos.Cre_date_fin;
cmd.Parameters.Add("@cre_date_prox", SqlDbType.DateTime).Value = Creditos.Cre_date_prox;
*****/

CREATE procedure [dbo].[sp_Insert_Doc_numbers] ( 
@doc_type varchar(60),
@doc_number int 
) AS 
begin 
INSERT INTO Doc_numbers( doc_type,doc_number ) VALUES (@doc_type,@doc_number) 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Lotes_pro]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
-- alter procedure sp_Delete_Doc_numbers ( 
-- @doc_id int ) AS 
-- begin 
-- DELETE Doc_numbers WHERE doc_id = @doc_id 
-- end 
-- GO 

------------------------------------- 
/*****
public int Doc_id {get;set;} 
public string Doc_type {get;set;} 
public int Doc_number {get;set;} 
cmd.Parameters.Add("@doc_id", SqlDbType.Int).Value = Doc_numbers.Doc_id;
cmd.Parameters.Add("@doc_type", SqlDbType.VarChar,30).Value = Doc_numbers.Doc_type;
cmd.Parameters.Add("@doc_number", SqlDbType.Int).Value = Doc_numbers.Doc_number;
*****/
CREATE procedure [dbo].[sp_Insert_Lotes_pro] ( 
@lote_id int,
@pro_id int,
@lote_vence date,
@lote_cod varchar(30),
@lote_cant int,
@lote_almacen varchar(255),
@solicomp_id int,
@lote_aporte decimal(6,2),
@lote_estado varchar(50),
@lote_stock int 
) AS 
if @lote_id = 0 
begin 
INSERT INTO Lotes_pro( pro_id,lote_vence,lote_cod,lote_cant,lote_almacen,solicomp_id,lote_aporte,lote_estado,lote_stock ) VALUES (@pro_id,@lote_vence,@lote_cod,@lote_cant,@lote_almacen,@solicomp_id,@lote_aporte,@lote_estado,@lote_stock) 
end 
else 
begin 
UPDATE Lotes_pro set pro_id= @pro_id,lote_vence= @lote_vence,lote_cod= @lote_cod,lote_cant= @lote_cant,lote_almacen= @lote_almacen,solicomp_id= @solicomp_id,lote_aporte= @lote_aporte,lote_estado= @lote_estado,lote_stock= @lote_stock WHERE lote_id = @lote_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Productos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Lote_id {get;set;} 
public int Pro_id {get;set;} 
public DateTime Lote_vence {get;set;} 
public string Lote_cod {get;set;} 
public int Lote_cant {get;set;} 
public string Lote_almacen {get;set;} 
public int Solicomp_id {get;set;} 
public boolean Lote_aporte {get;set;} 
public string Lote_estado {get;set;} 
public int Lote_stock {get;set;} 
cmd.Parameters.Add("@lote_id", SqlDbType.Int).Value = Lotes_pro.Lote_id;
cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Lotes_pro.Pro_id;
cmd.Parameters.Add("@lote_vence", SqlDbType.DateTime).Value = Lotes_pro.Lote_vence;
cmd.Parameters.Add("@lote_cod", SqlDbType.VarChar,30).Value = Lotes_pro.Lote_cod;
cmd.Parameters.Add("@lote_cant", SqlDbType.Int).Value = Lotes_pro.Lote_cant;
cmd.Parameters.Add("@lote_almacen", SqlDbType.VarChar,30).Value = Lotes_pro.Lote_almacen;
cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Lotes_pro.Solicomp_id;
cmd.Parameters.Add("@lote_aporte", SqlDbType.Decimal).Value = Lotes_pro.Lote_aporte;
cmd.Parameters.Add("@lote_estado", SqlDbType.VarChar,20).Value = Lotes_pro.Lote_estado;
cmd.Parameters.Add("@lote_stock", SqlDbType.Int).Value = Lotes_pro.Lote_stock;
*****/

CREATE procedure [dbo].[sp_Insert_Productos] ( 
@pro_id int,
@pro_name_comercial varchar(255),
@pro_name varchar(255),
@pro_precio_uni decimal(6,2),
@pro_precio_may decimal(6,2),
@pro_type varchar(20),
@pro_procedencia varchar(100) 
) AS 
if @pro_id = 0 
begin 
INSERT INTO Productos( pro_name_comercial,pro_name,pro_precio_uni,pro_precio_may,pro_type,pro_procedencia ) VALUES (@pro_name_comercial,@pro_name,@pro_precio_uni,@pro_precio_may,@pro_type,@pro_procedencia) 
end 
else 
begin 
UPDATE Productos set pro_name_comercial= @pro_name_comercial,pro_name= @pro_name,pro_precio_uni= @pro_precio_uni,pro_precio_may= @pro_precio_may,pro_type= @pro_type,pro_procedencia= @pro_procedencia WHERE pro_id = @pro_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Proforma_detalles]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Pro_id {get;set;} 
public string Pro_name_comercial {get;set;} 
public string Pro_name {get;set;} 
public boolean Pro_precio_uni {get;set;} 
public boolean Pro_precio_may {get;set;} 
public string Pro_type {get;set;} 
public string Pro_procedencia {get;set;} 
cmd.Parameters.Add("@pro_id", SqlDbType.Int).Value = Productos.Pro_id;
cmd.Parameters.Add("@pro_name_comercial", SqlDbType.VarChar,30).Value = Productos.Pro_name_comercial;
cmd.Parameters.Add("@pro_name", SqlDbType.VarChar,30).Value = Productos.Pro_name;
cmd.Parameters.Add("@pro_precio_uni", SqlDbType.Decimal).Value = Productos.Pro_precio_uni;
cmd.Parameters.Add("@pro_precio_may", SqlDbType.Decimal).Value = Productos.Pro_precio_may;
cmd.Parameters.Add("@pro_type", SqlDbType.VarChar,30).Value = Productos.Pro_type;
cmd.Parameters.Add("@pro_procedencia", SqlDbType.VarChar,30).Value = Productos.Pro_procedencia;
*****/
CREATE procedure [dbo].[sp_Insert_Proforma_detalles] ( 
@pref_id int,
@pro_id int,
@lote_id int,
@cant decimal(6,2),
@importe decimal(6,2),
@estado varchar(20) 
) AS 

begin 
INSERT INTO Proforma_detalles(pref_id, pro_id,cant,importe,estado,lote_id ) VALUES (@pref_id,@pro_id,@cant,@importe,@estado,@lote_id) 
end 



begin
Update Lotes_pro set lote_stock = (lote_stock -@cant) where lote_id = @lote_id
end



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Proformas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Insert_Proformas] ( 
@pref_id int,
@us_id int,
@cli_id int,
@pref_date date,
@pref_estado varchar(255),
@cre_id int,
@pref_valido date,
@pref_doc_number varchar(30) 
) AS 
if @pref_id = 0 
begin 
INSERT INTO Proformas( us_id,cli_id,pref_date,pref_estado,cre_id,pref_valido,pref_doc_number ) VALUES (@us_id,@cli_id,@pref_date,@pref_estado,@cre_id,@pref_valido,@pref_doc_number) 
SELECT SCOPE_IDENTITY()
end 
else 
begin 
UPDATE Proformas set us_id= @us_id,cli_id= @cli_id,pref_date= @pref_date,pref_estado= @pref_estado,cre_id= @cre_id,pref_valido= @pref_valido,pref_doc_number= @pref_doc_number WHERE pref_id = @pref_id 
select @pref_id
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Proveedores]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Pref_id {get;set;} 
public int Us_id {get;set;} 
public int Cli_id {get;set;} 
public DateTime Pref_date {get;set;} 
public string Pref_estado {get;set;} 
public int Cre_id {get;set;} 
public DateTime Pref_valido {get;set;} 
public string Pref_doc_number {get;set;} 
cmd.Parameters.Add("@pref_id", SqlDbType.Int).Value = Proformas.Pref_id;
cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Proformas.Us_id;
cmd.Parameters.Add("@cli_id", SqlDbType.Int).Value = Proformas.Cli_id;
cmd.Parameters.Add("@pref_date", SqlDbType.DateTime).Value = Proformas.Pref_date;
cmd.Parameters.Add("@pref_estado", SqlDbType.VarChar,30).Value = Proformas.Pref_estado;
cmd.Parameters.Add("@cre_id", SqlDbType.Int).Value = Proformas.Cre_id;
cmd.Parameters.Add("@pref_valido", SqlDbType.DateTime).Value = Proformas.Pref_valido;
cmd.Parameters.Add("@pref_doc_number", SqlDbType.VarChar,30).Value = Proformas.Pref_doc_number;
*****/
CREATE procedure [dbo].[sp_Insert_Proveedores] ( 
@provee_id int,
@provee_razons varchar(100),
@provee_ruc varchar(20),
@provee_direccion varchar(250),
@provee_distrito varchar(100) 
) AS 
if @provee_id = 0 
begin 
INSERT INTO Proveedores( provee_razons,provee_ruc,provee_direccion,provee_distrito ) VALUES (@provee_razons,@provee_ruc,@provee_direccion,@provee_distrito) 
end 
else 
begin 
UPDATE Proveedores set provee_razons= @provee_razons,provee_ruc= @provee_ruc,provee_direccion= @provee_direccion,provee_distrito= @provee_distrito WHERE provee_id = @provee_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Solicitud_comp]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Provee_id {get;set;} 
public string Provee_razons {get;set;} 
public string Provee_ruc {get;set;} 
public string Provee_direccion {get;set;} 
public string Provee_distrito {get;set;} 
cmd.Parameters.Add("@provee_id", SqlDbType.Int).Value = Proveedores.Provee_id;
cmd.Parameters.Add("@provee_razons", SqlDbType.VarChar,30).Value = Proveedores.Provee_razons;
cmd.Parameters.Add("@provee_ruc", SqlDbType.VarChar,30).Value = Proveedores.Provee_ruc;
cmd.Parameters.Add("@provee_direccion", SqlDbType.VarChar,30).Value = Proveedores.Provee_direccion;
cmd.Parameters.Add("@provee_distrito", SqlDbType.VarChar,30).Value = Proveedores.Provee_distrito;
*****/
CREATE procedure [dbo].[sp_Insert_Solicitud_comp] ( 
@solicomp_id int,
@us_id int,
@doc_type varchar(20),
@solicomp_doc_number varchar(20),
@solicomp_date datetime,
@solicomp_estado varchar(255),
@solicomp_valido datetime 
) AS 
if @solicomp_id = 0 
begin 
INSERT INTO Solicitud_comp( us_id,doc_type,solicomp_doc_number,solicomp_date,solicomp_estado,solicomp_valido ) VALUES (@us_id,@doc_type,@solicomp_doc_number,@solicomp_date,@solicomp_estado,@solicomp_valido) 
SELECT SCOPE_IDENTITY()
end 
else 
begin 
UPDATE Solicitud_comp set us_id= @us_id,doc_type= @doc_type,solicomp_doc_number= @solicomp_doc_number,solicomp_date= @solicomp_date,solicomp_estado= @solicomp_estado,solicomp_valido= @solicomp_valido WHERE solicomp_id = @solicomp_id 
select @solicomp_id
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Usuarios]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Solicomp_id {get;set;} 
public int Us_id {get;set;} 
public string Doc_type {get;set;} 
public string Solicomp_doc_number {get;set;} 
public DateTime Solicomp_date {get;set;} 
public string Solicomp_estado {get;set;} 
public DateTime Solicomp_valido {get;set;} 
cmd.Parameters.Add("@solicomp_id", SqlDbType.Int).Value = Solicitud_comp.Solicomp_id;
cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Solicitud_comp.Us_id;
cmd.Parameters.Add("@doc_type", SqlDbType.VarChar,30).Value = Solicitud_comp.Doc_type;
cmd.Parameters.Add("@solicomp_doc_number", SqlDbType.VarChar,30).Value = Solicitud_comp.Solicomp_doc_number;
cmd.Parameters.Add("@solicomp_date", SqlDbType.DateTime).Value = Solicitud_comp.Solicomp_date;
cmd.Parameters.Add("@solicomp_estado", SqlDbType.VarChar,30).Value = Solicitud_comp.Solicomp_estado;
cmd.Parameters.Add("@solicomp_valido", SqlDbType.DateTime).Value = Solicitud_comp.Solicomp_valido;
*****/
CREATE procedure [dbo].[sp_Insert_Usuarios] ( 
@us_id int,
@us_fname varchar(255),
@us_lname varchar(255),
@doc_type varchar(15),
@us_doc_number int,
@us_type int,
@us_direccion varchar(300),
@us_distrito varchar(100),
@us_password varchar(20) 
) AS 
if @us_id = 0 
begin 
INSERT INTO Usuarios( us_fname,us_lname,doc_type,us_doc_number,us_type,us_direccion,us_distrito,us_password ) VALUES (@us_fname,@us_lname,@doc_type,@us_doc_number,@us_type,@us_direccion,@us_distrito,@us_password) 
end 
else 
begin 
UPDATE Usuarios set us_fname= @us_fname,us_lname= @us_lname,doc_type= @doc_type,us_doc_number= @us_doc_number,us_type= @us_type,us_direccion= @us_direccion,us_distrito= @us_distrito,us_password= @us_password WHERE us_id = @us_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Ventas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
/*****
public int Us_id {get;set;} 
public string Us_fname {get;set;} 
public string Us_lname {get;set;} 
public string Doc_type {get;set;} 
public int Us_doc_number {get;set;} 
public int Us_type {get;set;} 
public string Us_direccion {get;set;} 
public string Us_distrito {get;set;} 
public string Us_password {get;set;} 
cmd.Parameters.Add("@us_id", SqlDbType.Int).Value = Usuarios.Us_id;
cmd.Parameters.Add("@us_fname", SqlDbType.VarChar,30).Value = Usuarios.Us_fname;
cmd.Parameters.Add("@us_lname", SqlDbType.VarChar,30).Value = Usuarios.Us_lname;
cmd.Parameters.Add("@doc_type", SqlDbType.VarChar,30).Value = Usuarios.Doc_type;
cmd.Parameters.Add("@us_doc_number", SqlDbType.Int).Value = Usuarios.Us_doc_number;
cmd.Parameters.Add("@us_type", SqlDbType.Int).Value = Usuarios.Us_type;
cmd.Parameters.Add("@us_direccion", SqlDbType.VarChar,30).Value = Usuarios.Us_direccion;
cmd.Parameters.Add("@us_distrito", SqlDbType.VarChar,30).Value = Usuarios.Us_distrito;
cmd.Parameters.Add("@us_password", SqlDbType.VarChar,30).Value = Usuarios.Us_password;
*****/
CREATE procedure [dbo].[sp_Insert_Ventas] ( 
@ven_id int,
@pref_id int,
@ven_date date,
@us_id int,
@doc_type varchar(20),
@ven_doc_number varchar(20) 
) AS 
if @ven_id = 0 
begin 
INSERT INTO Ventas( pref_id,ven_date,us_id,doc_type,ven_doc_number ) VALUES (@pref_id,@ven_date,@us_id,@doc_type,@ven_doc_number) 
Update Proforma_detalles set estado = 'Completado' WHERE pref_id = @pref_id;
end 
else 
begin 
UPDATE Ventas set pref_id= @pref_id,ven_date= @ven_date,us_id= @us_id,doc_type= @doc_type,ven_doc_number= @ven_doc_number WHERE ven_id = @ven_id 
Update Proforma_detalles set estado = 'Completado' WHERE pref_id = @pref_id;
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Clientes]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Clientes] ( 
@cli_id int,
@cli_type varchar(20)

 ) AS 
--declare    @var_cli_razon_social varchar(50)
--declare     @var_cli_doc_number varchar(50)
--    if @cli_type = 'PERSONA'
--	begin
--      set  @var_cli_razon_social = 'Nombre'
--      set @var_cli_doc_number= 'DNI'
--	end
--	else 
--	begin
--     set  @var_cli_razon_social = 'Razón Social'
--      set @var_cli_doc_number= 'RUC'
--	end

if @cli_id = 0 
begin 
SELECT cli_id as 'ID',cli_razon_social as 'Razón Social',cli_doc_number as 'DocNumber' ,cli_direccion as 'Dirección',cli_distrito as 'Distrito',cli_tel as 'Telefono',cli_correo as 'Correo',cli_father as 'EmpresaSuperior',cli_type as 'Type' FROM Clientes WHERE cli_type = @cli_type
end 
else 
begin 
SELECT cli_id as 'ID',cli_razon_social as 'Razón Social',cli_doc_number as 'DocNumber' ,cli_direccion as 'Dirección',cli_distrito as 'Distrito',cli_tel as 'Telefono',cli_correo as 'Correo',cli_father as 'EmpresaSuperior',cli_type as 'Type'FROM Clientes WHERE cli_id = @cli_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Compras]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Compras] ( 
@comp_id int ) AS 
if @comp_id = 0 
begin 
SELECT comp_id as 'ID',u.us_doc_number as 'Usuario-Vendedor' ,p.provee_ruc as 'RucProveedor',comp_date as 'FechaCrec',comp_estado as 'Estado',solicomp_id as 'IdSoliComp',c.doc_type,comp_doc_number as 'DocNumber',cre.cre_id as 'CreditoID',cre.cre_estado as 'Estado del Crédito',cre.cre_total as 'Monto'  FROM Compras as c INNER JOIN Usuarios as u on u.us_id = c.us_id INNER JOIN Proveedores as p on p.provee_id = c.provee_id INNER JOIN Creditos as cre on c.cre_id = cre.cre_id
end 
else 
begin 
SELECT comp_id, us_id, provee_id, comp_date, comp_estado, solicomp_id, doc_type, comp_doc_number, cre_id FROM Compras WHERE comp_id = @comp_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Creditos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Creditos] ( 
@cre_id int
 ) AS 
if @cre_id = 0 
begin 
SELECT c.cre_id as 'ID',v.ven_doc_number as 'CODE',cre_plazos as 'Plazos',cre_interes as 'Interés',cre_subtotal as 'SubTotal',cre_igv as 'IGV',cre_total as 'Total',cre_pago as 'Pago' ,cre_estado as 'Estado',cre_date_fin as 'FechaFinal',cre_date_prox as 'FechaCrec' FROM Creditos as c inner join Proformas as p on p.cre_id = c.cre_id inner join Ventas as v on v.pref_id =  p.pref_id  where p.pref_estado = 'COMPLETADO'
union
SELECT c.cre_id as 'ID',com.comp_doc_number as 'CODE',cre_plazos  as 'Plazos',cre_interes as 'Interés',cre_subtotal as 'SubTotal',cre_igv as 'IGV',cre_total as 'Total',cre_pago as 'Pago' ,cre_estado as 'Estado',cre_date_fin as 'FechaFinal',cre_date_prox as 'FechaCrec' FROM Creditos as c inner join Compras as com on com.cre_id = c.cre_id where com.comp_estado = 'COMPLETADO' order by ID DESC 
end 
else 
begin 
SELECT cre_id, cre_plazos, cre_interes, cre_subtotal, cre_igv, cre_total, cre_pago, cre_estado, cre_date_fin, cre_date_prox FROM Creditos WHERE cre_id = @cre_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Doc_numbers]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Doc_numbers] ( 
@doc_type varchar(100)

 ) AS 
begin 
Select top 1  doc_number from Doc_numbers  WHERE doc_type = @doc_type order by doc_number DESC
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_Lotes_pro]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Lotes_pro] ( 
@lote_id int,
@solicomp_id int ) AS 
if @solicomp_id != 0
begin
    SELECT lote_id as 'ID',p.pro_name as 'Producto',lote_vence as 'Vencimiento',lote_cod as 'CODE',lote_cant as 'Cantidad',lote_almacen as 'Almacen',lote_aporte as 'Aporte',lote_estado as 'Estado',lote_stock as 'Stock' FROM Lotes_pro as lp  INNER JOIN Productos as p on p.pro_id = lp.pro_id WHERE solicomp_id = @solicomp_id 
   
end
else
begin
    if @lote_id = 0 
    begin 
    SELECT lote_id as 'ID',p.pro_name as 'Producto',lote_vence as 'Vencimiento',lote_cod as 'CODE',lote_cant as 'Cantidad',lote_almacen as 'Almacen',solicomp_id as 'SoliCompID',lote_aporte as 'Aporte',lote_estado as 'Estado',lote_stock as 'Stock' FROM Lotes_pro as lp  INNER JOIN Productos as p on p.pro_id = lp.pro_id 
    end 
    else 
    begin 
    SELECT lote_id, pro_id, lote_vence, lote_cod, lote_cant, lote_almacen, solicomp_id, lote_aporte, lote_estado, lote_stock FROM Lotes_pro WHERE lote_id = @lote_id 
    end 
end


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Productos]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Productos] ( 
@pro_id int, 
@mode int
) AS 
if @mode = 1
begin
    SELECT p.pro_id as 'ID',lp.lote_cod  as 'Codigo',pro_name_comercial as 'Producto',pro_precio_uni as 'PrecioUni',pro_precio_may as 'PrecioPorMayor',pro_type as 'Type',pro_procedencia as 'Procedencia',lp.lote_stock ,lp.lote_id  as 'IDLot' FROM Productos as p INNER JOIN Lotes_pro as lp on p.pro_id = lp.pro_id WHERE lp.lote_stock > 0 and lp.lote_estado = 'COMPLETADO'  and lp.lote_almacen = 'FRONT'
    --lote_vence < DATE.getdate ?
end
else
begin
    if @pro_id = 0 
		begin 
		  SELECT pro_id as 'ID',pro_name_comercial as 'Producto',pro_precio_uni as 'PrecioUni',pro_precio_may as 'PrecioPorMayor',pro_type as 'Type',pro_procedencia as 'Procedencia' FROM Productos 
		end 
    else 
		begin 
		SELECT pro_id, pro_name_comercial, pro_name, pro_precio_uni, pro_precio_may, pro_type, pro_procedencia FROM Productos WHERE pro_id = @pro_id 
		end 
end


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Proforma_detalles]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Proforma_detalles] ( 
@pref_id int ) AS 

begin 
SELECT p.pro_id,lp.lote_cod as 'Code', pro_name_comercial as 'Producto',cant as 'Cantidad',importe as 'Importe' FROM Proforma_detalles as pd INNER JOIN Productos as p on p.pro_id = pd.pro_id  INNER JOIN Lotes_pro as lp on pd.lote_id = lp.lote_id WHERE pref_id = @pref_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Proformas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Proformas] ( 
@pref_id int ) AS 
if @pref_id = 0 
begin 
SELECT pref_id,u.us_doc_number as 'Usuario' ,cl.cli_doc_number as 'Cliente',pref_date as 'FechaCreac',pref_estado as  'Estado',cre.cre_id as 'IdCredito',pref_valido as 'VálidoHasta',pref_doc_number as 'DocNumber',cre.cre_igv,cre.cre_total,cre.cre_subtotal FROM Proformas as pf INNER JOIN Usuarios as u on pf.us_id = u.us_id  INNER JOIN Clientes as cl on cl.cli_id = pf.cli_id  inner join Creditos as cre on pf.cre_id =  cre.cre_id  where pf.pref_doc_number = 'PROFORMA'
end 
else 
begin 
SELECT pref_id, us_id, cli_id, pref_date, pref_estado, cre_id, pref_valido, pref_doc_number FROM Proformas WHERE pref_id = @pref_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Proveedores]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Proveedores] ( 
@provee_id int ) AS 
if @provee_id = 0 
begin 
SELECT provee_id,provee_razons as 'Razón Social',provee_ruc as 'RUC',provee_direccion as 'Dirección',provee_distrito as 'Distrito' FROM Proveedores 
end 
else 
begin 
SELECT provee_id, provee_razons, provee_ruc, provee_direccion, provee_distrito FROM Proveedores WHERE provee_id = @provee_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Solicitud_comp]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Solicitud_comp] ( 
@solicomp_id int ) AS 
if @solicomp_id = 0 
begin 
SELECT solicomp_id,u.us_id ,u.us_doc_number as 'User',solicomp_doc_number as 'Docnumber',solicomp_date as 'FechaCreac',solicomp_estado as 'Estado',solicomp_valido as 'VálidoHasta' FROM Solicitud_comp as scomp INNER JOIN Usuarios as u on u.us_id  = scomp.us_id  where scomp.solicomp_estado = 'COMPLETADO'
end 
else 
begin 
SELECT solicomp_id, us_id, doc_type, solicomp_doc_number, solicomp_date, solicomp_estado, solicomp_valido FROM Solicitud_comp WHERE solicomp_id = @solicomp_id 
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_Usuarios]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Usuarios] ( 
@us_id int ) AS 
if @us_id = 0 
begin 
SELECT us_id,us_fname as 'Nombre',us_lname as 'Apellido',us_doc_number as 'DNI',us_type as 'Privilegios',us_direccion as 'Dirección',us_distrito as 'Distrito',us_password as 'Password' FROM Usuarios 
end 
else 
begin 
SELECT us_id, us_fname, us_lname, doc_type, us_doc_number, us_type, us_direccion, us_distrito, us_password FROM Usuarios WHERE us_id = @us_id 
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_List_Ventas]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_Ventas] ( 
@ven_id int ) AS 
if @ven_id = 0 
begin 
SELECT ven_id,p.pref_doc_number,ven_date,u.us_doc_number,ven_doc_number,c.cre_igv,c.cre_total,c.cre_subtotal,cli.cli_doc_number,cli_razon_social FROM Ventas as v inner join Proformas as p on v.pref_id = p.pref_id inner join Usuarios as u on u.us_id =  v.us_id inner join Creditos as c on c.cre_id =  p.cre_id inner join Clientes as cli on p.cli_id = cli.cli_id
end 
else 
begin 
SELECT ven_id, p.pref_id, ven_date, v.us_id, doc_type, ven_doc_number,p.cli_id FROM Ventas as v  inner join Proformas as p on v.pref_id = p.pref_id  WHERE ven_id = @ven_id 
end 

select * from Creditos

GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 13/11/2016 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------

CREATE procedure  [dbo].[sp_Login](
@us_doc_number varchar(20),
@us_password varchar(15)
)
AS
begin 
SELECT us_id,us_doc_number, us_password, us_fname, us_type, us_lname, us_direccion, us_distrito FROM Usuarios WHERE us_doc_number = @us_doc_number AND  us_password = @us_password  
end 




GO
USE [master]
GO
ALTER DATABASE [WebTiendaSaludV1] SET  READ_WRITE 
GO
