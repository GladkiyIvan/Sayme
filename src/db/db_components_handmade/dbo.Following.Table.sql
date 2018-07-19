USE SaymeDB
GO
CREATE TABLE dbo.Following(
	id_who int NOT NULL,
	id_whom int NOT NULL,
)
GO
ALTER TABLE dbo.Following  WITH CHECK ADD  CONSTRAINT FK_Following_UserWho FOREIGN KEY(id_who)
REFERENCES dbo.User (id)
GO
ALTER TABLE dbo.Following CHECK CONSTRAINT FK_Following_UserWho
GO
ALTER TABLE dbo.Following  WITH CHECK ADD  CONSTRAINT FK_Following_UserWhom FOREIGN KEY(id_whom)
REFERENCES dbo.User (id)
GO
ALTER TABLE dbo.Following CHECK CONSTRAINT FK_Following_UserWhom
GO
