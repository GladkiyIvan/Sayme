USE [SaymeDB]
GO
/****** Object:  Table [dbo].[LikeComment]    Script Date: 17.07.2018 18:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeComment](
	[id_user] [int] NOT NULL,
	[id_comment] [int] NOT NULL,
	[liked] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LikeComment]  WITH CHECK ADD  CONSTRAINT [FK_LikeComment_Comment] FOREIGN KEY([id_comment])
REFERENCES [dbo].[Comment] ([id])
GO
ALTER TABLE [dbo].[LikeComment] CHECK CONSTRAINT [FK_LikeComment_Comment]
GO
ALTER TABLE [dbo].[LikeComment]  WITH CHECK ADD  CONSTRAINT [FK_LikeComment_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[LikeComment] CHECK CONSTRAINT [FK_LikeComment_User]
GO
