USE [SaymeDB]
GO
/****** Object:  Table [dbo].[SearchTag]    Script Date: 17.07.2018 18:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchTag](
	[id_tag] [int] NOT NULL,
	[counter] [int] NOT NULL,
 CONSTRAINT [PK_SearchTag] PRIMARY KEY CLUSTERED 
(
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchTag]  WITH CHECK ADD  CONSTRAINT [FK_SearchTag_Tag] FOREIGN KEY([id_tag])
REFERENCES [dbo].[Tag] ([id])
GO
ALTER TABLE [dbo].[SearchTag] CHECK CONSTRAINT [FK_SearchTag_Tag]
GO
