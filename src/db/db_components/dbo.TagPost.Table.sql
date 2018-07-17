USE [SaymeDB]
GO
/****** Object:  Table [dbo].[TagPost]    Script Date: 17.07.2018 18:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagPost](
	[id_post] [int] NOT NULL,
	[id_tag] [int] NOT NULL,
 CONSTRAINT [PK_TagPost] PRIMARY KEY CLUSTERED 
(
	[id_post] ASC,
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TagPost]  WITH CHECK ADD  CONSTRAINT [FK_TagPost_Post] FOREIGN KEY([id_post])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[TagPost] CHECK CONSTRAINT [FK_TagPost_Post]
GO
ALTER TABLE [dbo].[TagPost]  WITH CHECK ADD  CONSTRAINT [FK_TagPost_Tag] FOREIGN KEY([id_tag])
REFERENCES [dbo].[Tag] ([id])
GO
ALTER TABLE [dbo].[TagPost] CHECK CONSTRAINT [FK_TagPost_Tag]
GO
