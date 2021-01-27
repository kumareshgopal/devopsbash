/*
=====================================================================
Author:		Aziz Alam
Create date: 11/11/2016
Description: Data restoration. This procedure will restore the archived data back to the source table

======================================================================
Modifications :
Who					When				What	
======================================================================
Example 
EXEC [Control].[RestoreManager] 'Talbot_PSA_Archive','Subscribe','MOA_Archive',1,1,1
======================================================================
*/
CREATE PROCEDURE [Control].[RestoreManager] 
          @ArchiveDatabaseName		NVARCHAR(100)
		, @ArchiveSchemaName		NVARCHAR(100)
		, @ArchiveTableName			NVARCHAR(100)
		, @IsRestoreCandidate		INT 
		, @ThreadID					INT 		
		, @BatchID					INT

AS

SET NOCOUNT ON

BEGIN TRY
DECLARE 
	 @loopPointer					INT
	,@ArchiveControlID				INT
	,@deleteCount					INT
	,@runLast						DATETIME
	,@RowsPerBatch					SMALLINT
	,@RestoreCmd					NVARCHAR(MAX)
	,@RestoreClause					NVARCHAR(MAX)
	,@ssql							NVARCHAR(MAX)
	,@runNext						DATETIME
	,@rowCnt						SMALLINT
	,@OuterBatchStartDateTime		DATETIME
	,@InternalBatchStartDateTime	DATETIME
	,@TargetDatabaseName			NVARCHAR(100)
	,@TargetSchemaName				NVARCHAR(100)	
	,@TargetTableName				NVARCHAR(100)
	,@DeleteArchiveSQL				NVARCHAR(MAX)
	,@InsertTargetSQL				NVARCHAR(MAX)
	,@DeleteArchiveSQLResult		NVARCHAR(MAX)
	,@InsertTargetSQLResult			NVARCHAR(MAX)
	,@ParmDefinitionDel				NVARCHAR(MAX)
	,@ParmDefinitionIns				NVARCHAR(MAX)
	
BEGIN -- Outermost loop for the restore process 
	SELECT TOP 1 
		 @ArchiveControlID		 = ArchiveControlID 
		,@RunLast				 = RunLastRestore		
		,@RowsPerBatch			 = RowsPerBatch		
		,@TargetDatabaseName	 = SourceDatabaseName
		,@TargetSchemaName		 = SourceSchemaName
		,@TargetTableName		 = SourceTableName
		,@RestoreClause			 = RestoreQuery
		,@IsRestoreCandidate     = IsRestoreCandidate
	FROM [Control].[ArchiveControl]
	WHERE ArchiveDatabaseName = @ArchiveDatabaseName	
	AND ArchiveSchemaName =	@ArchiveSchemaName	
	AND ArchiveTableName =	@ArchiveTableName		
	AND IsRestoreCandidate = @IsRestoreCandidate
	
	-- Continue if control table returns a record
	IF (@@ROWCOUNT <> 0)  
		
		BEGIN
			
			SELECT 
				@rowCnt = @RowsPerBatch -- required to kick off first iteration	
			  , @OuterBatchStartDateTime = CURRENT_TIMESTAMP
			  , @loopPointer = 1
			  , @deleteCount = 0
			  , @DeleteArchiveSQL		= N' USE ' + @TargetDatabaseName + ' SELECT @DeleteArchiveSQLResultOUT = SUBSTRING(
								(SELECT '', deleted.'' + QUOTENAME(COLUMN_NAME)
									FROM INFORMATION_SCHEMA.COLUMNS 
									WHERE TABLE_NAME = ''' + @TargetTableName +''' AND Table_Schema = ''' + @TargetSchemaName +'''
									AND COLUMN_NAME NOT IN (SELECT col.name AS ColumnName
															FROM sys.Computed_columns AS col
															INNER JOIN sys.objects AS obj ON col.object_id = obj.object_id
															WHERE obj.name = ''' + @TargetTableName + '''
															)
									ORDER BY ORDINAL_POSITION
									FOR XML path('''')),3,200000);'
				, @InsertTargetSQL		= N' USE ' + @TargetDatabaseName + ' SELECT @InsertTargetSQLResultOUT = SUBSTRING(
											(SELECT '', '' + QUOTENAME(COLUMN_NAME)
												FROM INFORMATION_SCHEMA.COLUMNS 
												WHERE TABLE_NAME = ''' + @TargetTableName +''' AND Table_Schema = ''' + @TargetSchemaName +'''
												AND COLUMN_NAME NOT IN (SELECT col.name AS ColumnName
																		FROM sys.Computed_columns AS col
																		INNER JOIN sys.objects AS obj ON col.object_id = obj.object_id
																		WHERE obj.name = ''' + @TargetTableName + '''
																		)
												ORDER BY ORDINAL_POSITION
												FOR XML path('''')),
											3,
											200000);'

			SET @ParmDefinitionDel = '@DeleteArchiveSQLResultOUT VARCHAR(MAX) OUTPUT'
			EXECUTE sp_ExecuteSql @DeleteArchiveSQL, @ParmDefinitionDel, @DeleteArchiveSQLResultOUT = @DeleteArchiveSQLResult OUTPUT

			SET @ParmDefinitionIns = '@InsertTargetSQLResultOUT VARCHAR(MAX) OUTPUT'
			EXECUTE sp_ExecuteSql @InsertTargetSQL, @ParmDefinitionIns, @InsertTargetSQLResultOUT = @InsertTargetSQLResult OUTPUT
			
			-- Entry Audit log
			BEGIN TRANSACTION	
			INSERT INTO dbo.AuditLog ([ThreadID]
									, [BatchID]
									, [ArchiveControlID]
									, [TableName]
									, [Message]
									, [RowsPerBatchDeleted]
									, [BatchStartDateTime]
									, [BatchEndDateTime]
									, [CreatedDateTime]
							) VALUES 
									( @ThreadID
									, @BatchID
									, @ArchiveControlID
									, @ArchiveTableName
									, 'Restoration of records from archive table: ' + @ArchiveTableName + ' to source table: ' + @TargetTableName + ' has been started'
									, 0
									, @OuterBatchStartDateTime
									, NULL
									, CURRENT_TIMESTAMP);		
			COMMIT TRANSACTION;
			
			BEGIN -- valid restore task							

				WHILE(@rowCnt = @RowsPerBatch)
				BEGIN -- Perform work in loop 
					BEGIN TRANSACTION

						SELECT @InternalBatchStartDateTime = CURRENT_TIMESTAMP	
						
						SET @RestoreCmd = 'SET IDENTITY_INSERT ' + @TargetDatabaseName + '.' + @TargetSchemaName + '.' + @TargetTableName + ' ON;
										   DELETE TOP ('+ CAST(@RowsPerBatch AS VARCHAR) +') ' + @ArchiveDatabaseName + '.' + @ArchiveSchemaName + '.' +  @ArchiveTableName + ' OUTPUT ' + @DeleteArchiveSQLResult + ' INTO ' +  @TargetDatabaseName + '.' + @TargetSchemaName + '.' + @TargetTableName + ' (' + @InsertTargetSQLResult + ')' + @RestoreClause +' SET IDENTITY_INSERT ' + @TargetDatabaseName + '.' + @TargetSchemaName + '.' + @TargetTableName + ' OFF ;'
						PRINT @RestoreCmd
						EXEC sp_executesql @RestoreCmd ,N'@rowCnt SMALLINT OUTPUT',@rowCnt OUTPUT

						-- Audit log on each successful batch completion
						INSERT INTO dbo.AuditLog ([ThreadID]
												, [BatchID]
												, [ArchiveControlID]
												, [TableName]
												, [Message]
												, [RowsPerBatchDeleted]
												, [BatchStartDateTime]
												, [BatchEndDateTime]
												, [CreatedDateTime]
											) VALUES 
												( @ThreadID
												, @BatchID
												, @ArchiveControlID
												, @ArchiveTableName
												, 'Records restored in iteration :' + CAST(@loopPointer AS VARCHAR)
												, @rowCnt
												, @InternalBatchStartDateTime
												, CURRENT_TIMESTAMP
												, CURRENT_TIMESTAMP
												);

						SET @loopPointer = @loopPointer + 1 -- Batch counter, which counts number of batches required to restored the records based on restore query
						SET @deleteCount = @deleteCount + @rowCnt --number of records deleted from archived DB and restored in source DB in each iteration

					COMMIT TRANSACTION;					

				END -- Perform work in a loop

				BEGIN TRANSACTION 
					-- One restore task completed ; update run date
					UPDATE [Control].ArchiveControl 
					SET RunLastRestore = GETDATE()
					WHERE ArchiveControlID = @ArchiveControlID
					-- Exit Audit Log
					INSERT INTO dbo.AuditLog ([ThreadID]
											, [BatchID]
											, [ArchiveControlID]
											, [TableName]
											, [Message]
											, [RowsPerBatchDeleted]
											, [BatchStartDateTime]
											, [BatchEndDateTime]
											, [CreatedDateTime]
										) VALUES 
											( @ThreadID
											, @BatchID
											, @ArchiveControlID
											, @ArchiveTableName
											, 'Restoration of records from archive table: ' + @ArchiveTableName + ' to source table: ' + @TargetTableName + ' has been completed. Total restored records are: ' + CAST(@deleteCount AS VARCHAR)
											, 0
											, @OuterBatchStartDateTime
											, CURRENT_TIMESTAMP
											, CURRENT_TIMESTAMP
											);
				COMMIT TRANSACTION
		
			END -- valid restore cycle

		END 
END -- -- outermost loop for the restore process 

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
	-- CUSTOM ERROR HANDLING 
	
    DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
	
	SELECT @ssql = 'Error while restoring the records for ArchiveControlID: ' + CAST(@ArchiveControlID AS NVARCHAR(255)) + ' on line: ' + CAST(@ErrorLine AS VARCHAR(10)) + ' is :' + @ErrorMessage

	INSERT INTO dbo.AuditLog ([ThreadID]
							, [BatchID]
							, [ArchiveControlID]
							, [TableName]
							, [Message]
							, [RowsPerBatchDeleted]
							, [BatchStartDateTime]
							, [BatchEndDateTime]
							, [CreatedDateTime]
						) VALUES 
							( @ThreadID
							, @BatchID
							, @ArchiveControlID
							, @ArchiveTableName
							, @ssql
							, 0
							, @OuterBatchStartDateTime
							, CURRENT_TIMESTAMP
							, CURRENT_TIMESTAMP
							);

END CATCH

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;