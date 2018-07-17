USE [SaymeDB]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.07.2018 18:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[login] [nvarchar](16) NOT NULL,
	[password] [nvarchar](16) NOT NULL,
	[bio] [nvarchar](256) NOT NULL,
	[mail] [nvarchar](40) NOT NULL,
	[active] [bit] NOT NULL,
	[avatar] [image] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
