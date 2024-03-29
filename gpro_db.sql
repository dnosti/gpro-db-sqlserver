USE [master]
GO
/****** Object:  Database [gpro_db]    Script Date: 13/3/2020 21:43:10 ******/
CREATE DATABASE [gpro_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gpro_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\gpro_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gpro_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\gpro_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [gpro_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gpro_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gpro_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gpro_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gpro_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gpro_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gpro_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [gpro_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [gpro_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gpro_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gpro_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gpro_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gpro_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gpro_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gpro_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gpro_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gpro_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gpro_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gpro_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gpro_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gpro_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gpro_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gpro_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gpro_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gpro_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [gpro_db] SET  MULTI_USER 
GO
ALTER DATABASE [gpro_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gpro_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gpro_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gpro_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gpro_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gpro_db] SET QUERY_STORE = OFF
GO
USE [gpro_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [gpro_db]
GO
/****** Object:  User [Lisandro]    Script Date: 13/3/2020 21:43:11 ******/
CREATE USER [Lisandro] FOR LOGIN [Lisandro] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Lisandro]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [bigint] NOT NULL,
	[razonSocialCliente] [varchar](50) NULL,
	[apellidoCliente] [varchar](50) NULL,
	[nombreCliente] [varchar](50) NULL,
	[direccionCliente] [varchar](50) NOT NULL,
	[telefonoCliente] [varchar](30) NOT NULL,
	[emailCliente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[apellidoEmpleado] [varchar](50) NOT NULL,
	[nombreEmpleado] [varchar](50) NOT NULL,
	[fechaIngreso] [date] NOT NULL,
	[Telefono] [varchar](30) NOT NULL,
	[Domicilio] [varchar](50) NOT NULL,
	[Localidad] [varchar](50) NOT NULL,
	[Provincia] [varchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Nacionalidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoProyecto]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoProyecto](
	[IdEmpleado] [int] NOT NULL,
	[IdProyecto] [int] NOT NULL,
 CONSTRAINT [PK_EmpleadoProyecto] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC,
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EscalaAntiguedad]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalaAntiguedad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CantAnios] [int] NOT NULL,
	[Porcentaje] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EscalaHoras]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalaHoras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CantHoras] [int] NOT NULL,
	[PorcentajeHoras] [real] NOT NULL,
 CONSTRAINT [PK_EscalaHoras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EscalaPerfiles]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalaPerfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PorcentajePerfil] [real] NOT NULL,
	[CantPerfilesMensuales] [int] NOT NULL,
 CONSTRAINT [PK_Escala] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoHoras]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoHoras](
	[EstadoHoras] [varchar](9) NOT NULL,
 CONSTRAINT [PK_EstadoHoras] PRIMARY KEY CLUSTERED 
(
	[EstadoHoras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoLiquidacion]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoLiquidacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EstadoLiquidacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoProyecto]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoProyecto](
	[EstadoProyecto] [varchar](20) NOT NULL,
 CONSTRAINT [PK_EstadoProyecto] PRIMARY KEY CLUSTERED 
(
	[EstadoProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoraTrabajada]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoraTrabajada](
	[idHoraTrabajada] [int] IDENTITY(1,1) NOT NULL,
	[Perfil_idPerfil] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Proyecto_idProyecto] [int] NOT NULL,
	[Tarea_idTarea] [int] NOT NULL,
	[catidadHorasTrab] [int] NOT NULL,
	[fechaHorasTrab] [date] NOT NULL,
	[estadoHorasTrab] [varchar](9) NOT NULL,
 CONSTRAINT [PK_HoraTrabajada_1] PRIMARY KEY CLUSTERED 
(
	[idHoraTrabajada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liquidacion]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liquidacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Importe] [real] NOT NULL,
	[FechaDesde] [date] NOT NULL,
	[FechaHasta] [date] NOT NULL,
	[IdEscalaPerfiles] [int] NOT NULL,
	[IdEscalaHoras] [int] NOT NULL,
	[IdEscalaAntiguedad] [int] NOT NULL,
 CONSTRAINT [PK_Liquidacion_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[IdModulo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[descripcionPerfil] [varchar](20) NOT NULL,
	[ValorHora] [real] NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilEmpleado]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilEmpleado](
	[PerfilEmpleado_idPerfil] [int] NOT NULL,
	[PerfilEmpleado_idEmpleado] [int] NOT NULL,
	[Proyecto_IdProyecto] [int] NOT NULL,
 CONSTRAINT [PK_PerfilEmpleado_1] PRIMARY KEY CLUSTERED 
(
	[PerfilEmpleado_idPerfil] ASC,
	[PerfilEmpleado_idEmpleado] ASC,
	[Proyecto_IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[idProyecto] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[tituloProyecto] [varchar](50) NOT NULL,
	[descripcionProyecto] [varchar](250) NOT NULL,
	[estadoProyecto] [varchar](20) NOT NULL,
	[id_Empleado_PM] [int] NOT NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[idProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](10) NOT NULL,
	[Descripcion] [varchar](30) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolOperacion]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolOperacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdOperacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[Proyecto_idProyecto] [int] NOT NULL,
	[idTarea] [int] IDENTITY(1,1) NOT NULL,
	[PerfilEmpleado_idPerfil] [int] NOT NULL,
	[PerfilEmpleado_idEmpleado] [int] NOT NULL,
	[descripcionTarea] [varchar](250) NOT NULL,
	[horasEstimadasTarea] [int] NOT NULL,
	[horasOverbudgetTarea] [int] NULL,
 CONSTRAINT [PK_Tarea_1] PRIMARY KEY CLUSTERED 
(
	[idTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/3/2020 21:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[PasswordHash] [varbinary](64) NOT NULL,
	[PasswordSalt] [varbinary](128) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmpleadoProyecto]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoProyecto_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[EmpleadoProyecto] CHECK CONSTRAINT [FK_EmpleadoProyecto_Empleado]
GO
ALTER TABLE [dbo].[EmpleadoProyecto]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoProyecto_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Proyecto] ([idProyecto])
GO
ALTER TABLE [dbo].[EmpleadoProyecto] CHECK CONSTRAINT [FK_EmpleadoProyecto_Proyecto]
GO
ALTER TABLE [dbo].[HoraTrabajada]  WITH CHECK ADD  CONSTRAINT [FK_HoraTrabajada_EstadoHoras] FOREIGN KEY([estadoHorasTrab])
REFERENCES [dbo].[EstadoHoras] ([EstadoHoras])
GO
ALTER TABLE [dbo].[HoraTrabajada] CHECK CONSTRAINT [FK_HoraTrabajada_EstadoHoras]
GO
ALTER TABLE [dbo].[HoraTrabajada]  WITH CHECK ADD  CONSTRAINT [FK_HoraTrabajada_PerfilEmpleado] FOREIGN KEY([Perfil_idPerfil], [IdEmpleado], [Proyecto_idProyecto])
REFERENCES [dbo].[PerfilEmpleado] ([PerfilEmpleado_idPerfil], [PerfilEmpleado_idEmpleado], [Proyecto_IdProyecto])
GO
ALTER TABLE [dbo].[HoraTrabajada] CHECK CONSTRAINT [FK_HoraTrabajada_PerfilEmpleado]
GO
ALTER TABLE [dbo].[HoraTrabajada]  WITH CHECK ADD  CONSTRAINT [FK_HoraTrabajada_Tarea] FOREIGN KEY([Tarea_idTarea])
REFERENCES [dbo].[Tarea] ([idTarea])
GO
ALTER TABLE [dbo].[HoraTrabajada] CHECK CONSTRAINT [FK_HoraTrabajada_Tarea]
GO
ALTER TABLE [dbo].[Liquidacion]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Liquidacion] CHECK CONSTRAINT [FK_Liquidacion_Empleado]
GO
ALTER TABLE [dbo].[Liquidacion]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_EscalaAntiguedad] FOREIGN KEY([IdEscalaAntiguedad])
REFERENCES [dbo].[EscalaAntiguedad] ([Id])
GO
ALTER TABLE [dbo].[Liquidacion] CHECK CONSTRAINT [FK_Liquidacion_EscalaAntiguedad]
GO
ALTER TABLE [dbo].[Liquidacion]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_EscalaHoras] FOREIGN KEY([IdEscalaHoras])
REFERENCES [dbo].[EscalaHoras] ([Id])
GO
ALTER TABLE [dbo].[Liquidacion] CHECK CONSTRAINT [FK_Liquidacion_EscalaHoras]
GO
ALTER TABLE [dbo].[Liquidacion]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_EscalaPerfiles] FOREIGN KEY([IdEscalaPerfiles])
REFERENCES [dbo].[EscalaPerfiles] ([Id])
GO
ALTER TABLE [dbo].[Liquidacion] CHECK CONSTRAINT [FK_Liquidacion_EscalaPerfiles]
GO
ALTER TABLE [dbo].[Liquidacion]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_EstadoLiquidacion] FOREIGN KEY([Estado])
REFERENCES [dbo].[EstadoLiquidacion] ([Id])
GO
ALTER TABLE [dbo].[Liquidacion] CHECK CONSTRAINT [FK_Liquidacion_EstadoLiquidacion]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Modulo] FOREIGN KEY([IdModulo])
REFERENCES [dbo].[Modulo] ([Id])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Modulo]
GO
ALTER TABLE [dbo].[PerfilEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_idEmpleadp] FOREIGN KEY([PerfilEmpleado_idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[PerfilEmpleado] CHECK CONSTRAINT [FK_idEmpleadp]
GO
ALTER TABLE [dbo].[PerfilEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PerfilEmpleado_Perfil] FOREIGN KEY([PerfilEmpleado_idPerfil])
REFERENCES [dbo].[Perfil] ([idPerfil])
GO
ALTER TABLE [dbo].[PerfilEmpleado] CHECK CONSTRAINT [FK_PerfilEmpleado_Perfil]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Cliente]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Empleado] FOREIGN KEY([id_Empleado_PM])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Empleado]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_EstadoProyecto] FOREIGN KEY([estadoProyecto])
REFERENCES [dbo].[EstadoProyecto] ([EstadoProyecto])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_EstadoProyecto]
GO
ALTER TABLE [dbo].[RolOperacion]  WITH CHECK ADD  CONSTRAINT [FK_RolOp_Operacion] FOREIGN KEY([IdOperacion])
REFERENCES [dbo].[Operacion] ([Id])
GO
ALTER TABLE [dbo].[RolOperacion] CHECK CONSTRAINT [FK_RolOp_Operacion]
GO
ALTER TABLE [dbo].[RolOperacion]  WITH CHECK ADD  CONSTRAINT [FK_RolOp_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[RolOperacion] CHECK CONSTRAINT [FK_RolOp_Rol]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [gpro_db] SET  READ_WRITE 
GO
