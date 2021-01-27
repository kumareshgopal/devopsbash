CREATE TABLE [dbo].[AuditLog] (
    [AuditLogId]          INT            IDENTITY (1, 1) NOT NULL,
    [ThreadID]            INT            NOT NULL,
    [BatchID]             INT            NOT NULL,
    [ArchiveControlID]    INT            NOT NULL,
    [TableName]           NVARCHAR (100) NOT NULL,
    [Message]             NVARCHAR (MAX) NOT NULL,
    [RowsPerBatchDeleted] BIGINT         DEFAULT ((0)) NOT NULL,
    [BatchStartDateTime]  DATETIME       NOT NULL,
    [BatchEndDateTime]    DATETIME       NULL,
    [CreatedDateTime]     DATETIME       CONSTRAINT [DF_AuditLog_LastModifiedDateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK3] PRIMARY KEY NONCLUSTERED ([AuditLogId] ASC)
);

