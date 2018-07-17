USE [SaymeDB]
GO
/****** Object:  Table [dbo].[Following]    Script Date: 17.07.2018 18:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Following](
	[id_who] [int] NOT NULL,
	[id_whom] [int] NOT NULL,
 CONSTRAINT [PK_Following] PRIMARY KEY CLUSTERED 
(
	[id_who] ASC,
	[id_whom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_UserWho] FOREIGN KEY([id_who])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_UserWho]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_UserWhom] FOREIGN KEY([id_whom])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_UserWhom]
GO
