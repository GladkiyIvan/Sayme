USE [SaymeDB]
GO
/****** Object:  Table [dbo].[SearchComment]    Script Date: 17.07.2018 18:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchComment](
	[id_comment] [int] NOT NULL,
	[likes] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchComment]  WITH CHECK ADD  CONSTRAINT [FK_SearchComment_Comment] FOREIGN KEY([id_comment])
REFERENCES [dbo].[Comment] ([id])
GO
ALTER TABLE [dbo].[SearchComment] CHECK CONSTRAINT [FK_SearchComment_Comment]
GO
