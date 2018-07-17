USE [SaymeDB]
GO
/****** Object:  Table [dbo].[LikePost]    Script Date: 17.07.2018 18:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikePost](
	[id_user] [int] NOT NULL,
	[id_post] [int] NOT NULL,
	[liked] [bit] NOT NULL,
 CONSTRAINT [PK_LikePost] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC,
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_Post] FOREIGN KEY([id_post])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_Post]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_User]
GO
