CREATE TABLE [Control].[ArchiveControl] (
    [ArchiveControlID]    INT             IDENTITY (1, 1) NOT NULL,
    [SourceDatabaseName]  NVARCHAR (50)   NOT NULL,
    [SourceSchemaName]    NVARCHAR (50)   NOT NULL,
    [SourceTableName]     NVARCHAR (50)   NOT NULL,
    [ArchiveDatabaseName] NVARCHAR (50)   NOT NULL,
    [ArchiveSchemaName]   NVARCHAR (50)   NOT NULL,
    [ArchiveTableName]    NVARCHAR (50)   NOT NULL,
    [ThreadId]            INT             NOT NULL,
    [RowsPerBatch]        SMALLINT        DEFAULT ((5000)) NOT NULL,
    [IsArchiveCandidate]  INT             NOT NULL,
    [ArchivingQuery]      NVARCHAR (4000) NOT NULL,
    [IsPurgeCandidate]    INT             NOT NULL,
    [PurgeQuery]          NVARCHAR (4000) NOT NULL,
    [IsRestoreCandidate]  INT             NOT NULL,
    [RestoreQuery]        NVARCHAR (4000) NOT NULL,
    [RunLastArchive]      DATETIME        NULL,
    [RunLastPurge]        DATETIME        NULL,
    [RunLastRestore]      DATETIME        NULL
);

