USE [SaymeDB]
GO
/****** Object:  Table [dbo].[SearchPost]    Script Date: 17.07.2018 18:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchPost](
	[id_post] [int] NOT NULL,
	[likes] [int] NOT NULL,
 CONSTRAINT [PK_SearchPost] PRIMARY KEY CLUSTERED 
(
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchPost]  WITH CHECK ADD  CONSTRAINT [FK_SearchPost_Post] FOREIGN KEY([id_post])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[SearchPost] CHECK CONSTRAINT [FK_SearchPost_Post]
GO
