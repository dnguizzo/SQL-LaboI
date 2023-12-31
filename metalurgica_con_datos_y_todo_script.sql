USE [metalurgica]
GO
/****** Object:  Table [dbo].[barrios]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[barrios](
	[id_barrio] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_localidad] [int] NULL,
 CONSTRAINT [pk_barrios] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] NOT NULL,
	[apellido] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[calle] [varchar](50) NULL,
	[num_calle] [int] NULL,
	[id_barrio] [int] NULL,
	[id_tipo_de_cliente] [int] NULL,
	[id_tipo_doc] [int] NULL,
	[num_doc] [numeric](15, 0) NULL,
	[cod_contacto] [int] NULL,
	[desc_contacto] [varchar](50) NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contactos]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactos](
	[cod_contacto] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_contactos] PRIMARY KEY CLUSTERED 
(
	[cod_contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[costo_mano_de_obra]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[costo_mano_de_obra](
	[id_costo_mo] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio_unitario] [numeric](10, 2) NULL,
 CONSTRAINT [pk_costo_mano_obra] PRIMARY KEY CLUSTERED 
(
	[id_costo_mo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[costo_materias_primas]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[costo_materias_primas](
	[id_costo_mp] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio_unitario] [numeric](10, 2) NULL,
 CONSTRAINT [pk_costo_materias_primas] PRIMARY KEY CLUSTERED 
(
	[id_costo_mp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_ordenes_pedidos_clientes]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ordenes_pedidos_clientes](
	[id_det_orden] [int] NOT NULL,
	[cod_orden] [int] NULL,
	[id_pieza] [int] NULL,
	[cantidad_de_piezas] [int] NULL,
	[precio_pieza] [numeric](10, 2) NULL,
 CONSTRAINT [pk_detalle_ordenes_pedidos_clientes] PRIMARY KEY CLUSTERED 
(
	[id_det_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalles_ordenes_produccion]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_ordenes_produccion](
	[id_detalles_op] [int] IDENTITY(1,1) NOT NULL,
	[id_pieza] [int] NULL,
	[id_orden_prod_pieza] [int] NULL,
	[id_materia_prima] [int] NULL,
	[id_mano_de_obra] [int] NULL,
 CONSTRAINT [pk_detalles_ordenes_produccion_pieza_orden_prod_mp_mo] PRIMARY KEY CLUSTERED 
(
	[id_detalles_op] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[localidades]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[localidades](
	[id_localidad] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_provincia] [int] NULL,
 CONSTRAINT [pk_localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mano_de_obras]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mano_de_obras](
	[id_mano_de_obra] [int] NOT NULL,
	[cantidad_hs] [int] NULL,
	[id_costo_mo] [int] NULL,
 CONSTRAINT [pk_mano_de_obras] PRIMARY KEY CLUSTERED 
(
	[id_mano_de_obra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[materias_primas]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materias_primas](
	[id_materia_prima] [int] NOT NULL,
	[cantidad] [int] NULL,
	[id_costo_mp] [int] NULL,
 CONSTRAINT [pk_materias_primas] PRIMARY KEY CLUSTERED 
(
	[id_materia_prima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ordenes_pedidos_clientes]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenes_pedidos_clientes](
	[cod_orden] [int] NOT NULL,
	[fecha_pedido] [date] NULL,
	[id_cliente] [int] NULL,
 CONSTRAINT [pk_ordenes_pedidos_clientes] PRIMARY KEY CLUSTERED 
(
	[cod_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ordenes_produccion_piezas]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenes_produccion_piezas](
	[id_orden_prod_pieza] [int] NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[id_det_orden] [int] NULL,
 CONSTRAINT [pk_ordenes_produccion_piezas] PRIMARY KEY CLUSTERED 
(
	[id_orden_prod_pieza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paises]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paises](
	[id_pais] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [pk_paises] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[piezas]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[piezas](
	[id_pieza] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_piezas] PRIMARY KEY CLUSTERED 
(
	[id_pieza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincia] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_pais] [int] NULL,
 CONSTRAINT [pk_provincias] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_de_clientes]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_de_clientes](
	[id_tipo_de_cliente] [int] NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_tipo_de_clientes] PRIMARY KEY CLUSTERED 
(
	[id_tipo_de_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipos_de_docs]    Script Date: 21/06/2021 10:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipos_de_docs](
	[id_tipo_doc] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipos_de_docs] PRIMARY KEY CLUSTERED 
(
	[id_tipo_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (1, N' CENTRO', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (2, N'NUEVA CORDOBA', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (3, N'GENERAL PAZ', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (4, N'1 DE MAYO', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (5, N' SAN MARTIN', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (6, N'COFICO', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (7, N'GUEMES', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (8, N'ALTA CORDOBA', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (9, N'JARDIN', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (10, N'CERRO', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (11, N'LOS PLATANOS', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (12, N'AYACUCHO', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (13, N'OBSERVATORIO', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (14, N'ALTO ALBERDI', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (15, N'EMPALME', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (16, N'BELLA VISTA', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (17, N'URCA', 19)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (18, N'ABASTO', 16)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (19, N'ALTOS DE SAN LORENZO', 16)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (20, N'EL RETIRO', 16)
INSERT [dbo].[barrios] ([id_barrio], [nombre], [id_localidad]) VALUES (21, NULL, NULL)
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (1, N'Gonzales', N'Roberto', N'Rivadavia', 1500, 3, 2, 1, CAST(24518963 AS Numeric(15, 0)), 3, N'3516998854')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (2, N'Arias', N'Patricia', N'San Martin', 137, 2, 1, 5, CAST(30125896494 AS Numeric(15, 0)), 2, N'3514589456')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (3, N'Ramirez', N'Juan', N'Schweitzer', 1739, 18, 2, 5, CAST(20389645697 AS Numeric(15, 0)), 3, N'2215689742')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (4, N'Griglio', N'Antonella', N'La tablada', 48, 7, 2, 2, CAST(27785120 AS Numeric(15, 0)), 3, N'35115701639')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (5, N'Brasca', N'Francisco', N'Los Cerros', 1557, 1, 1, 6, CAST(10204720 AS Numeric(15, 0)), 1, N'Brascafran@gmail.com')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (6, N'Velez', N'Alberto', N'Rivadavia', 88, 20, 2, 3, CAST(21457896 AS Numeric(15, 0)), 2, N'3541420291')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (7, N'Amsler', N'Matilda', N'Venecia', 204, 15, 1, 4, CAST(12569874 AS Numeric(15, 0)), 3, N'2265832253')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (8, N'Ferrer', N'Jose', N'San Luis', 252, 19, 2, 5, CAST(20115263455 AS Numeric(15, 0)), 4, N'@ferrer_jose')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (9, N'Velazco', N'Denise', N'Champaqui', 300, 8, 1, 1, CAST(30152478 AS Numeric(15, 0)), 5, N'Los autos')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (10, N'Varas', N'Emiliano', N'Lago Argentino', 2606, 1, 2, 2, CAST(20145896 AS Numeric(15, 0)), 6, N'@varas_emiliano')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (11, N'Rigo', N'Lucia', N'Los Condores', 116, 2, 1, 3, CAST(35012348 AS Numeric(15, 0)), 1, N'rigolu@hotmail.com')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (12, N'Reynoso', N'Carlos', N'Lima', 536, 3, 2, 4, CAST(31256489 AS Numeric(15, 0)), 2, N'299487569')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (13, N'Ontivero', N'Lucas', N'Pasaje Haiti', 2133, 4, 1, 5, CAST(20289645694 AS Numeric(15, 0)), 3, N'343155569')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (14, N'Ferrer', N'Pedro', N'Martin Coronado', 533, 5, 2, 6, CAST(20135786 AS Numeric(15, 0)), 4, N'@ferrerpedro')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (15, N'Grosso', N'Paula', N'La Antartida', 504, 6, 1, 1, CAST(12345678 AS Numeric(15, 0)), 5, N'Ferreteria la Abuela')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (16, N'Calvo', N'Juan', N'Perito Moreno', 30, 7, 2, 2, CAST(35647812 AS Numeric(15, 0)), 6, N'@juancalvo')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (17, N'Ramirez', N'Rodrigo', N'La Paz', 179, 8, 1, 3, CAST(45968732 AS Numeric(15, 0)), 1, N'Rodrigoramirez@gmail.com')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (18, N'Rodriguez', N'Juan Ignacio', N'Roque Sanz Peña', 739, 9, 2, 4, CAST(35268741 AS Numeric(15, 0)), 2, N'3541458796')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (19, N'Arias', N'Juan', N'Las Vertientes', 173, 10, 2, 5, CAST(20458967123 AS Numeric(15, 0)), 3, N'1125465894')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (20, N'Gonzalez', N'Josefina', N'Roma', 739, 11, 1, 6, CAST(501236547 AS Numeric(15, 0)), 4, N'@josegonzalez')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (21, N'Castro', N'Pablo', N'Mistral', 800, 12, 2, 1, CAST(15698742 AS Numeric(15, 0)), 5, N'Catro Pablo')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (22, N'Gimenez', N'Santiago', N'Pablo Verones', 1500, 13, 1, 2, CAST(50469871 AS Numeric(15, 0)), 6, N'@gimenezstigo')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (23, N'Arias', N'Carlos', N'Las Rosas', 3800, 14, 2, 3, CAST(12698755 AS Numeric(15, 0)), 1, N'carlosarias@gmail.com')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (24, N'Ayassa', N'Gimena', N'San Martin', 900, 15, 1, 4, CAST(789654123 AS Numeric(15, 0)), 2, N'351454562')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (25, N'Zara', N'Walter', N'Arequito', 1200, 16, 2, 5, CAST(20323325651 AS Numeric(15, 0)), 3, N'363558465')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (26, N'Castro', N'Carolina', N'Argentina', 19, 17, 1, 6, CAST(456977132 AS Numeric(15, 0)), 4, N'@carocastro')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (27, N'Fernandes', N'Alejandro', N'Los Cerros', 179, 19, 2, 1, CAST(547896321 AS Numeric(15, 0)), 5, N'Alejandro Fernandez')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (28, N'Diaz', N'Juan', N'Cordoba', 209, 20, 1, 1, CAST(12256479 AS Numeric(15, 0)), 6, N'@juandiaz')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (29, N'Rodriguez', N'Pedro', N'Los Inmigrantes', 5039, 1, 2, 5, CAST(20457896124 AS Numeric(15, 0)), 1, N'pedrorod@hotmail.com')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (30, N'Garcia', N'Juan Cruz', N'Carcano', 7056, 2, 1, 5, CAST(20478965122 AS Numeric(15, 0)), 2, N'221458796')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (31, N'Perez', N'Carlos', N'Carcano', 78, 14, 1, 1, CAST(20532687 AS Numeric(15, 0)), 3, N'3554632289')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (32, N'Guevara', N'Jose', N'Lombardos', 569, 15, 1, 1, CAST(24898785 AS Numeric(15, 0)), 3, N'3659658544')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (33, N'Giliberto', N'Mirta', N'Sicilianos', 365, 12, 1, 1, CAST(34696458 AS Numeric(15, 0)), 3, N'1154896558')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (34, N'Tobledo', N'Norma', N'Peru', 2011, 21, 2, 5, CAST(2311254691 AS Numeric(15, 0)), 2, N'2625898542')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (35, N'Moron', N'Cecilia', N'Figueroa Alcorta', 9680, 21, 2, 5, CAST(2056984531 AS Numeric(15, 0)), 2, N'2463254521')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (36, N'Zacar', N'Pedro', N'Tupungato', 654, 21, 2, 5, CAST(2312546231 AS Numeric(15, 0)), 2, N'2156325523')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (37, N'Ardhu', N'Matias', N'Nuñez', 2589, 19, 2, 5, CAST(20369856473 AS Numeric(15, 0)), 2, N'29912545632')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (38, N'Leeiva', N'Josefa', N'Cordillera', 2214, 16, 1, 1, CAST(44125689 AS Numeric(15, 0)), 3, N'3516932565')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (39, N'Gomez', N'Mayra', N'Velez Sarfield', 12, 2, 1, 1, CAST(25698751 AS Numeric(15, 0)), 3, N'112569896')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (40, N'Moreno', N'Susana', N'Armenio', 63, 1, 1, 1, CAST(26532653 AS Numeric(15, 0)), 3, N'256322563')
INSERT [dbo].[clientes] ([id_cliente], [apellido], [nombre], [calle], [num_calle], [id_barrio], [id_tipo_de_cliente], [id_tipo_doc], [num_doc], [cod_contacto], [desc_contacto]) VALUES (41, N'Sosa', N'Carolina', N'Sarmiento', 1157, 2, 2, 1, CAST(36508415 AS Numeric(15, 0)), 3, N'3518065473')
INSERT [dbo].[contactos] ([cod_contacto], [descripcion]) VALUES (1, N'E-mail')
INSERT [dbo].[contactos] ([cod_contacto], [descripcion]) VALUES (2, N'Telefono fijo')
INSERT [dbo].[contactos] ([cod_contacto], [descripcion]) VALUES (3, N'Telefono Celular')
INSERT [dbo].[contactos] ([cod_contacto], [descripcion]) VALUES (4, N'Instagram')
INSERT [dbo].[contactos] ([cod_contacto], [descripcion]) VALUES (5, N'Facebook')
INSERT [dbo].[contactos] ([cod_contacto], [descripcion]) VALUES (6, N'Twitter')
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (1, N'Hornos', CAST(150.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (2, N'Ensamblaje', CAST(200.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (3, N'Fresadora', CAST(245.50 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (4, N'Roscado', CAST(275.75 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (5, N'Pulido', CAST(180.20 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (6, N'Acabado y Limpieza', CAST(160.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (7, N'Secado', CAST(150.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (8, N'Sierra', CAST(235.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (9, N'Soldadura', CAST(450.20 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (10, N'Radial', CAST(380.10 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (11, N'Matriceria', CAST(550.80 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (12, N'Torno', CAST(650.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_mano_de_obra] ([id_costo_mo], [descripcion], [precio_unitario]) VALUES (13, N'Taller', CAST(180.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (1, N'Hojalata', CAST(675.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (2, N'Cobre', CAST(8530.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (3, N'Zinc', CAST(3463.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (4, N'Acero', CAST(5830.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (5, N'Aluminio', CAST(6570.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (6, N'Bronce', CAST(7800.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (7, N'Plomo', CAST(2350.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (8, N'Lubrincates', CAST(800.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (9, N'Asbestos', CAST(700.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (10, N'Fibra de vidrio', CAST(500.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (11, N'Mechas 6', CAST(400.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (12, N'Mechas 8', CAST(480.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (13, N'Mechas 10', CAST(520.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (14, N'Hierro 4', CAST(1105.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (15, N'Hierro 6', CAST(1215.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (16, N'Hierro 8', CAST(1650.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (17, N'Hierro 12', CAST(2594.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (18, N'Tungsteno', CAST(1458.30 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (19, N'resinas', CAST(1235.50 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (20, N'cromo', CAST(5400.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (21, N'aleacion', CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[costo_materias_primas] ([id_costo_mp], [descripcion], [precio_unitario]) VALUES (22, N'hierro', CAST(8500.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (1, 1, 18, 5, CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (2, 2, 20, 1, CAST(150000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (3, 3, 19, 13, CAST(195400.99 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (4, 4, 14, 20, CAST(23500.35 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (5, 5, 20, 4, CAST(600000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (6, 6, 1, 30, CAST(223000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (7, 7, 6, 10, CAST(98999.99 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (8, 8, 14, 3, CAST(15350.40 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (9, 9, 5, 40, CAST(582030.40 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (10, 10, 4, 20, CAST(210600.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (11, 11, 7, 25, CAST(180000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (12, 12, 9, 15, CAST(78895.20 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (13, 13, 17, 100, CAST(286000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (14, 14, 5, 35, CAST(140000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (15, 15, 10, 15, CAST(65700.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (16, 16, 13, 150, CAST(785644.30 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (17, 17, 15, 5, CAST(67550.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (18, 18, 9, 10, CAST(150000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (19, 19, 11, 40, CAST(230000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (20, 20, 11, 80, CAST(460000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (21, 21, 13, 15, CAST(82000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (22, 22, 2, 30, CAST(142300.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (23, 23, 16, 50, CAST(380000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (24, 24, 17, 50, CAST(680000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (25, 25, 12, 20, CAST(211600.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (26, 26, 5, 10, CAST(42500.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (27, 27, 6, 90, CAST(689990.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (29, 29, 14, 130, CAST(1320000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (30, 30, 17, 200, CAST(450000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (31, 35, 12, 75, CAST(793500.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (32, 36, 5, 20, CAST(85000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (33, 37, 6, 70, CAST(536659.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (34, 38, 2, 30, CAST(142300.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (35, 38, 17, 150, CAST(450000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (36, 39, 16, 38, CAST(380000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (37, 40, 17, 300, CAST(450000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (38, 41, 14, 3, CAST(1320000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (39, 42, 5, 150, CAST(850000.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (40, 43, 2, 180, CAST(142300.00 AS Numeric(10, 2)))
INSERT [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden], [cod_orden], [id_pieza], [cantidad_de_piezas], [precio_pieza]) VALUES (41, 44, 2, 150, CAST(142300.00 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[detalles_ordenes_produccion] ON 

INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (59, 18, 1, 22, 2)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (60, 20, 4, 22, 13)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (61, 19, 7, 22, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (62, 14, 10, 2, 10)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (63, 20, 13, 22, 13)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (64, 1, 16, 4, 11)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (65, 6, 19, 2, 4)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (66, 14, 22, 2, 10)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (67, 5, 25, 5, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (68, 4, 28, 5, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (69, 7, 31, 2, 11)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (70, 9, 34, 3, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (71, 17, 37, 22, 13)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (72, 5, 40, 5, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (73, 10, 43, 21, 2)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (74, 13, 46, 6, 4)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (75, 15, 49, 6, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (76, 9, 52, 3, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (77, 11, 55, 21, 3)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (78, 11, 58, 21, 3)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (79, 13, 61, 6, 4)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (80, 2, 64, 4, 9)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (81, 16, 67, 22, 11)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (82, 17, 70, 22, 13)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (83, 12, 73, 22, 11)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (84, 5, 76, 5, 1)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (85, 6, 79, 2, 4)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (86, 14, 82, 2, 10)
INSERT [dbo].[detalles_ordenes_produccion] ([id_detalles_op], [id_pieza], [id_orden_prod_pieza], [id_materia_prima], [id_mano_de_obra]) VALUES (87, 17, 85, 22, 13)
SET IDENTITY_INSERT [dbo].[detalles_ordenes_produccion] OFF
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (1, N' SAN JUAN', 22)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (2, N'SAN LUIS', 21)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (3, N'RIO GALLEGOS', 23)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (4, N'VIEDMA', 19)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (5, N' USHUAIA', 18)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (6, N'SANTA FE', 17)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (7, N'SANTIAGO DEL ESTERO', 16)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (8, N'SAN MIGUEL DE TUCUMAN', 15)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (9, N'POSADAS', 13)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (10, N'NEUQUEN', 14)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (11, N'LA RIOJA', 11)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (12, N'MENDOZA', 12)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (13, N'SANTA ROSA', 10)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (14, N'FORMOSA', 8)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (15, N'RESISTENCIA', 5)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (16, N'LA PLATA', 1)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (17, N'SAN FERNANDO DEL VALLE DE CATAMARCA', 3)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (18, N'RAWSON', 2)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (19, N'CORDOBA', 6)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (20, N'CORRIENTES', 4)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (21, N'PARANA', 7)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (22, N'SAN SALVADOR DE JUJUY', 20)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (23, N'SALTA', 20)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (24, N'SANTIAGO DE CHILE', 24)
INSERT [dbo].[localidades] ([id_localidad], [nombre], [id_provincia]) VALUES (25, NULL, NULL)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (1, 1, 1)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (2, 2, 1)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (3, 3, 1)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (4, 4, 1)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (5, 5, 1)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (6, 1, 2)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (7, 2, 2)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (8, 3, 2)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (9, 1, 3)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (10, 2, 3)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (11, 3, 3)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (12, 1, 4)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (13, 2, 4)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (14, 3, 4)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (15, 1, 5)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (16, 2, 5)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (17, 3, 5)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (18, 1, 6)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (19, 2, 6)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (20, 3, 6)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (21, 1, 7)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (22, 2, 7)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (23, 3, 7)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (24, 1, 8)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (25, 2, 8)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (26, 3, 8)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (27, 1, 9)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (28, 2, 9)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (29, 3, 9)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (30, 1, 10)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (31, 2, 10)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (32, 3, 10)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (33, 1, 11)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (34, 2, 11)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (35, 3, 11)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (36, 1, 12)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (37, 2, 12)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (38, 3, 12)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (39, 1, 13)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (40, 2, 13)
INSERT [dbo].[mano_de_obras] ([id_mano_de_obra], [cantidad_hs], [id_costo_mo]) VALUES (41, 3, 13)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (1, 1, 1)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (2, 2, 1)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (3, 3, 1)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (4, 1, 2)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (5, 2, 2)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (6, 3, 2)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (7, 1, 3)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (8, 2, 3)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (9, 3, 3)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (10, 1, 4)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (11, 2, 4)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (12, 3, 4)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (13, 1, 5)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (14, 2, 5)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (15, 3, 5)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (16, 1, 6)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (17, 2, 6)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (18, 3, 6)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (19, 1, 7)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (20, 2, 7)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (21, 1, 21)
INSERT [dbo].[materias_primas] ([id_materia_prima], [cantidad], [id_costo_mp]) VALUES (22, 1, 22)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (1, CAST(N'2009-05-12' AS Date), 2)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (2, CAST(N'2020-05-15' AS Date), 12)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (3, CAST(N'2021-08-22' AS Date), 18)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (4, CAST(N'2012-04-15' AS Date), 1)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (5, CAST(N'2018-06-05' AS Date), 7)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (6, CAST(N'2020-08-11' AS Date), 25)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (7, CAST(N'2021-04-12' AS Date), 18)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (8, CAST(N'2016-09-18' AS Date), 30)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (9, CAST(N'2011-11-15' AS Date), 26)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (10, CAST(N'2019-02-10' AS Date), 22)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (11, CAST(N'2016-04-02' AS Date), 29)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (12, CAST(N'2020-12-12' AS Date), 14)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (13, CAST(N'2009-08-06' AS Date), 6)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (14, CAST(N'2016-08-22' AS Date), 14)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (15, CAST(N'2012-07-15' AS Date), 16)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (16, CAST(N'2016-07-13' AS Date), 12)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (17, CAST(N'2021-02-12' AS Date), 26)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (18, CAST(N'2020-06-09' AS Date), 16)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (19, CAST(N'2010-04-25' AS Date), 14)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (20, CAST(N'2017-09-26' AS Date), 9)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (21, CAST(N'2018-08-11' AS Date), 7)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (22, CAST(N'2019-07-23' AS Date), 11)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (23, CAST(N'2017-06-21' AS Date), 13)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (24, CAST(N'2020-08-15' AS Date), 4)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (25, CAST(N'2017-03-15' AS Date), 3)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (26, CAST(N'2019-01-30' AS Date), 8)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (27, CAST(N'2011-09-26' AS Date), 19)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (29, CAST(N'2018-04-23' AS Date), 21)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (30, CAST(N'2019-10-12' AS Date), 25)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (31, CAST(N'2020-08-12' AS Date), 1)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (32, CAST(N'2020-09-13' AS Date), 3)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (33, CAST(N'2020-12-05' AS Date), 19)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (34, CAST(N'2020-08-05' AS Date), 41)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (35, CAST(N'2021-07-05' AS Date), 41)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (36, CAST(N'2021-01-24' AS Date), 13)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (37, CAST(N'2021-01-07' AS Date), 25)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (38, CAST(N'2021-02-15' AS Date), 12)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (39, CAST(N'2021-05-17' AS Date), 5)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (40, CAST(N'2021-05-18' AS Date), 12)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (41, CAST(N'2021-05-27' AS Date), 21)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (42, CAST(N'2021-06-17' AS Date), 3)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (43, CAST(N'2021-07-05' AS Date), 15)
INSERT [dbo].[ordenes_pedidos_clientes] ([cod_orden], [fecha_pedido], [id_cliente]) VALUES (44, CAST(N'2021-03-17' AS Date), 35)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (1, CAST(N'2009-05-12' AS Date), CAST(N'2009-05-13' AS Date), 1)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (4, CAST(N'2020-05-15' AS Date), CAST(N'2020-05-16' AS Date), 2)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (7, CAST(N'2021-08-22' AS Date), CAST(N'2021-08-23' AS Date), 3)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (10, CAST(N'2012-04-15' AS Date), CAST(N'2012-04-16' AS Date), 4)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (13, CAST(N'2018-06-05' AS Date), CAST(N'2018-06-06' AS Date), 5)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (16, CAST(N'2020-08-11' AS Date), CAST(N'2020-08-12' AS Date), 6)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (19, CAST(N'2021-04-12' AS Date), CAST(N'2021-04-13' AS Date), 7)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (22, CAST(N'2016-09-18' AS Date), CAST(N'2016-09-19' AS Date), 8)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (25, CAST(N'2011-11-15' AS Date), CAST(N'2011-11-16' AS Date), 9)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (28, CAST(N'2019-02-10' AS Date), CAST(N'2019-02-11' AS Date), 10)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (31, CAST(N'2016-04-02' AS Date), CAST(N'2016-04-05' AS Date), 11)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (34, CAST(N'2020-12-12' AS Date), CAST(N'2020-12-15' AS Date), 12)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (37, CAST(N'2009-08-06' AS Date), CAST(N'2009-08-09' AS Date), 13)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (40, CAST(N'2016-08-22' AS Date), CAST(N'2016-08-25' AS Date), 14)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (43, CAST(N'2012-07-15' AS Date), CAST(N'2012-07-18' AS Date), 15)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (46, CAST(N'2016-07-13' AS Date), CAST(N'2016-07-16' AS Date), 16)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (49, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-15' AS Date), 17)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (52, CAST(N'2020-06-09' AS Date), CAST(N'2020-06-12' AS Date), 18)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (55, CAST(N'2010-04-25' AS Date), CAST(N'2010-04-28' AS Date), 19)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (58, CAST(N'2017-09-26' AS Date), CAST(N'2017-10-01' AS Date), 20)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (61, CAST(N'2018-07-10' AS Date), CAST(N'2018-07-15' AS Date), 21)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (64, CAST(N'2020-10-26' AS Date), CAST(N'2020-10-31' AS Date), 22)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (67, CAST(N'2017-08-16' AS Date), CAST(N'2017-08-21' AS Date), 23)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (70, CAST(N'2020-11-30' AS Date), CAST(N'2020-12-05' AS Date), 24)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (73, CAST(N'2017-03-16' AS Date), CAST(N'2017-03-21' AS Date), 25)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (76, CAST(N'2014-05-12' AS Date), CAST(N'2014-05-17' AS Date), 26)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (79, CAST(N'2021-04-12' AS Date), CAST(N'2021-04-17' AS Date), 27)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (82, CAST(N'2012-05-22' AS Date), CAST(N'2012-05-27' AS Date), 29)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (85, CAST(N'2017-02-10' AS Date), CAST(N'2017-02-15' AS Date), 30)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (88, CAST(N'2021-05-10' AS Date), CAST(N'2021-05-15' AS Date), 31)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (91, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-24' AS Date), 32)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (94, CAST(N'2021-01-08' AS Date), CAST(N'2021-01-11' AS Date), 33)
INSERT [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza], [fecha_inicio], [fecha_fin], [id_det_orden]) VALUES (97, CAST(N'2021-03-26' AS Date), CAST(N'2021-03-29' AS Date), 34)
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (1, N' ARGENTINA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (2, N'CHILE')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (3, N'BRASIL')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (4, N'COLOMBIA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (5, N'PERU')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (6, N'PARAGUAY')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (7, N'URUGUAY')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (8, N'BOLIVIA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (9, N'COSTA RICA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (10, N'ECUADOR')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (11, N'CUBA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (12, N'MEXICO')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (13, N'SURINAM')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (14, N'GUAYANA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (15, N'GUAYANA FRANCESA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (16, N'VENEZUELA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (17, N'MADAGASCAR')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (18, N'SENEGAL')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (19, N'EGIPTO')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (20, N' CANADA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (21, N'ESTADOS UNIDOS')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (22, N'ESPAÑA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (23, N'CHINA')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (24, N'JAPON')
INSERT [dbo].[paises] ([id_pais], [nombre]) VALUES (25, N'NUEVA ZELANDA')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (1, N'Chapa Galvanizada de Acero')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (2, N'Vias de Acero')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (3, N'Alambron de acero')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (4, N'Placas de aluminio')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (5, N'Lingotes de aluminio para fusion y moldeo')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (6, N'Alambron de cobre')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (7, N'Chapas de cobre')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (8, N'Oxido y polvo de zinc')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (9, N'Aleaciones de zinc')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (10, N'Combo de mechas metalicas')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (11, N'Caños de metal')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (12, N'Vigas de hierro')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (13, N'Bobinas de bronce')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (14, N'Hilos de cobre')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (15, N'Chapas y perfileria de bronce')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (16, N'Herrajes de metal')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (17, N'Cerraduras de metal')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (18, N'Combo de tornillos metalicos')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (19, N'Vigas metalicas')
INSERT [dbo].[piezas] ([id_pieza], [descripcion]) VALUES (20, N'Caldera metalica')
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (1, N' BUENOS AIRES', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (2, N'CHUBUT', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (3, N'CATAMARCA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (4, N'CORRIENTES', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (5, N' CHACO', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (6, N'CORDOBA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (7, N'ENTRE RIOS', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (8, N'FORMOSA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (9, N'JUJUY', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (10, N'LA PAMPA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (11, N' LA RIOJA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (12, N'MENDOZA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (13, N'MISIONES', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (14, N'NEUQUEN', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (15, N' TUCUMAN', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (16, N'SANTIAGO DEL ESTERO', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (17, N'SANTA FE', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (18, N'TIERRA DEL FUEGO', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (19, N'RIO NEGRO', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (20, N'SALTA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (21, N' SAN LUIS', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (22, N'SAN JUAN', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (23, N'SANTA CRUZ', 1)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (24, N'SANTIAGO DE CHILE', 2)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (25, N'DISTRITO FEDERAL', 3)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (26, NULL, 2)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (27, NULL, 3)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (28, NULL, 4)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (29, NULL, 5)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (30, NULL, 6)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (31, NULL, 7)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (32, NULL, 8)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (33, NULL, 9)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (34, NULL, 10)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (35, NULL, 11)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (36, NULL, 12)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (37, NULL, 13)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (38, NULL, 14)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (39, NULL, 15)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (40, NULL, 16)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (41, NULL, 17)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (42, NULL, 18)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (43, NULL, 19)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (44, NULL, 20)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (45, NULL, 21)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (46, NULL, 22)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (47, NULL, 23)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (48, NULL, 24)
INSERT [dbo].[provincias] ([id_provincia], [nombre], [id_pais]) VALUES (49, NULL, 25)
INSERT [dbo].[tipo_de_clientes] ([id_tipo_de_cliente], [descripcion]) VALUES (1, N'Persona Juridica')
INSERT [dbo].[tipo_de_clientes] ([id_tipo_de_cliente], [descripcion]) VALUES (2, N'Persona Fisica')
INSERT [dbo].[tipos_de_docs] ([id_tipo_doc], [descripcion]) VALUES (1, N'Documento Nacional de Identidad')
INSERT [dbo].[tipos_de_docs] ([id_tipo_doc], [descripcion]) VALUES (2, N'Libreta Civica')
INSERT [dbo].[tipos_de_docs] ([id_tipo_doc], [descripcion]) VALUES (3, N'Libreta de Enrolamiento')
INSERT [dbo].[tipos_de_docs] ([id_tipo_doc], [descripcion]) VALUES (4, N'Cedula de Identidad')
INSERT [dbo].[tipos_de_docs] ([id_tipo_doc], [descripcion]) VALUES (5, N'CUIT')
INSERT [dbo].[tipos_de_docs] ([id_tipo_doc], [descripcion]) VALUES (6, N'Pasaporte')
ALTER TABLE [dbo].[barrios]  WITH CHECK ADD  CONSTRAINT [fk_barrios_localidades] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[barrios] CHECK CONSTRAINT [fk_barrios_localidades]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_barrios] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_clientes_barrios]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_contactos] FOREIGN KEY([cod_contacto])
REFERENCES [dbo].[contactos] ([cod_contacto])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_clientes_contactos]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_id_tipo_de_clientes] FOREIGN KEY([id_tipo_de_cliente])
REFERENCES [dbo].[tipo_de_clientes] ([id_tipo_de_cliente])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_clientes_id_tipo_de_clientes]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_id_tipos_de_docs] FOREIGN KEY([id_tipo_doc])
REFERENCES [dbo].[tipos_de_docs] ([id_tipo_doc])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_clientes_id_tipos_de_docs]
GO
ALTER TABLE [dbo].[detalle_ordenes_pedidos_clientes]  WITH CHECK ADD  CONSTRAINT [fk_detalle_ordenes_pedidos_clientes_ordenes_pedidos_clientes] FOREIGN KEY([cod_orden])
REFERENCES [dbo].[ordenes_pedidos_clientes] ([cod_orden])
GO
ALTER TABLE [dbo].[detalle_ordenes_pedidos_clientes] CHECK CONSTRAINT [fk_detalle_ordenes_pedidos_clientes_ordenes_pedidos_clientes]
GO
ALTER TABLE [dbo].[detalle_ordenes_pedidos_clientes]  WITH CHECK ADD  CONSTRAINT [fk_detalle_ordenes_pedidos_clientes_piezas] FOREIGN KEY([id_pieza])
REFERENCES [dbo].[piezas] ([id_pieza])
GO
ALTER TABLE [dbo].[detalle_ordenes_pedidos_clientes] CHECK CONSTRAINT [fk_detalle_ordenes_pedidos_clientes_piezas]
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion]  WITH CHECK ADD  CONSTRAINT [fk_detalles_ordenes_produccion_maos_de_obra] FOREIGN KEY([id_mano_de_obra])
REFERENCES [dbo].[mano_de_obras] ([id_mano_de_obra])
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion] CHECK CONSTRAINT [fk_detalles_ordenes_produccion_maos_de_obra]
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion]  WITH CHECK ADD  CONSTRAINT [fk_detalles_ordenes_produccion_materias_primas] FOREIGN KEY([id_materia_prima])
REFERENCES [dbo].[materias_primas] ([id_materia_prima])
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion] CHECK CONSTRAINT [fk_detalles_ordenes_produccion_materias_primas]
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion]  WITH CHECK ADD  CONSTRAINT [fk_detalles_ordenes_produccion_ordenes_produccion_piezas] FOREIGN KEY([id_orden_prod_pieza])
REFERENCES [dbo].[ordenes_produccion_piezas] ([id_orden_prod_pieza])
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion] CHECK CONSTRAINT [fk_detalles_ordenes_produccion_ordenes_produccion_piezas]
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion]  WITH CHECK ADD  CONSTRAINT [fk_detalles_ordenes_produccion_piezas] FOREIGN KEY([id_pieza])
REFERENCES [dbo].[piezas] ([id_pieza])
GO
ALTER TABLE [dbo].[detalles_ordenes_produccion] CHECK CONSTRAINT [fk_detalles_ordenes_produccion_piezas]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk_localidades_provincias] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk_localidades_provincias]
GO
ALTER TABLE [dbo].[mano_de_obras]  WITH CHECK ADD  CONSTRAINT [fk_costo_mano_de_obra_mano_de_obras] FOREIGN KEY([id_costo_mo])
REFERENCES [dbo].[costo_mano_de_obra] ([id_costo_mo])
GO
ALTER TABLE [dbo].[mano_de_obras] CHECK CONSTRAINT [fk_costo_mano_de_obra_mano_de_obras]
GO
ALTER TABLE [dbo].[materias_primas]  WITH CHECK ADD  CONSTRAINT [fk_costo_materias_primas_materias_primas] FOREIGN KEY([id_costo_mp])
REFERENCES [dbo].[costo_materias_primas] ([id_costo_mp])
GO
ALTER TABLE [dbo].[materias_primas] CHECK CONSTRAINT [fk_costo_materias_primas_materias_primas]
GO
ALTER TABLE [dbo].[ordenes_pedidos_clientes]  WITH CHECK ADD  CONSTRAINT [fk_ordenes_pedidos_clientes_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[ordenes_pedidos_clientes] CHECK CONSTRAINT [fk_ordenes_pedidos_clientes_clientes]
GO
ALTER TABLE [dbo].[ordenes_produccion_piezas]  WITH CHECK ADD  CONSTRAINT [fk_ordenes_produccion_piezas_detalle_ordenes_pedidos_clientes] FOREIGN KEY([id_det_orden])
REFERENCES [dbo].[detalle_ordenes_pedidos_clientes] ([id_det_orden])
GO
ALTER TABLE [dbo].[ordenes_produccion_piezas] CHECK CONSTRAINT [fk_ordenes_produccion_piezas_detalle_ordenes_pedidos_clientes]
GO
ALTER TABLE [dbo].[provincias]  WITH CHECK ADD  CONSTRAINT [fk_paises_provincias] FOREIGN KEY([id_pais])
REFERENCES [dbo].[paises] ([id_pais])
GO
ALTER TABLE [dbo].[provincias] CHECK CONSTRAINT [fk_paises_provincias]
GO
