USE [DEVELOPERS_DB]
GO
/****** Object:  User [tensolite]    Script Date: 10/02/2022 17:59:19 ******/
CREATE USER [tensolite] FOR LOGIN [tensolite] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tensolite]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tensolite]
GO
/****** Object:  Table [dbo].[TM_DEVELOPERS]    Script Date: 10/02/2022 17:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_DEVELOPERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[profesion] [varchar](50) NOT NULL,
	[puesto] [varchar](50) NOT NULL,
	[tecnologia] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TM_DEVELOPERS] ON 

INSERT [dbo].[TM_DEVELOPERS] ([id], [nombre], [profesion], [puesto], [tecnologia]) VALUES (1, N'Mario Campbell', N'Diseñador Gráfico', N'Frontend', N'React')
INSERT [dbo].[TM_DEVELOPERS] ([id], [nombre], [profesion], [puesto], [tecnologia]) VALUES (2, N'Nicolás Berdú', N'Ingeniero en Sistemas', N'Backend', N'SQL')
INSERT [dbo].[TM_DEVELOPERS] ([id], [nombre], [profesion], [puesto], [tecnologia]) VALUES (3, N'Carlos Soria', N'Ingeniero en Sistemas', N'Fullstack', N'Vue')
INSERT [dbo].[TM_DEVELOPERS] ([id], [nombre], [profesion], [puesto], [tecnologia]) VALUES (4, N'Marcos López', N'Desarrollador', N'Frontend', N'React')
SET IDENTITY_INSERT [dbo].[TM_DEVELOPERS] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_I_DEVELOPER_01]    Script Date: 10/02/2022 17:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_I_DEVELOPER_01]
@ID INT,
@NOMBRE VARCHAR(50),
@PROFESION VARCHAR(50),
@PUESTO VARCHAR(50),
@TECNOLOGIA VARCHAR(50)
AS
BEGIN
	INSERT INTO TM_DEVELOPERS
	(NOMBRE, PROFESION, PUESTO, TECNOLOGIA)
	VALUES
	(@NOMBRE, @PROFESION, @PUESTO, @TECNOLOGIA)

	SELECT * FROM TM_DEVELOPERS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_L_DEVELOPER_01]    Script Date: 10/02/2022 17:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_L_DEVELOPER_01]

AS
BEGIN
	SELECT * FROM TM_DEVELOPERS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_L_DEVELOPERXID_01]    Script Date: 10/02/2022 17:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_L_DEVELOPERXID_01]
@input_parameter INT
AS
BEGIN
	SELECT * FROM TM_DEVELOPERS WHERE ID = @input_parameter
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_DEVELOPER_01]    Script Date: 10/02/2022 17:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_U_DEVELOPER_01]
@ID INT,
@NOMBRE VARCHAR(50),
@PROFESION VARCHAR(50),
@PUESTO VARCHAR(50),
@TECNOLOGIA VARCHAR(50)
AS
BEGIN
	UPDATE TM_DEVELOPERS
	SET
		NOMBRE = @NOMBRE,
		PROFESION = @PROFESION,
		PUESTO = @PUESTO,
		TECNOLOGIA = @TECNOLOGIA
	WHERE
		ID = @ID

	SELECT * FROM TM_DEVELOPERS
END
GO
