USE SaymeDB
GO
CREATE TABLE dbo.SearchComment(
	id_comment bigint NOT NULL,
	likes int NOT NULL
)
GO
ALTER TABLE dbo.SearchComment  WITH CHECK ADD  CONSTRAINT FK_SearchComment_Comment FOREIGN KEY(id_comment)
REFERENCES dbo.Comment (id)
GO
ALTER TABLE dbo.SearchComment CHECK CONSTRAINT FK_SearchComment_Comment
GO
