/*
=====================================================================
Author:		Aziz Alam
Create date: 11/11/2016
Description: Data Archiving. This procedure will archive the data into archived database
based on business logic
======================================================================
Modifications :
Who					When				What	
======================================================================
Example 
EXEC [Control].[ArchiveManager] 'Talbot_PSA','Subscribe','MOA',1,1,1
======================================================================
*/
CREATE PROCEDURE [Control].[ArchiveManager] 
          @SourceDatabaseName	NVARCHAR(100)
		, @SourceSchemaName		NVARCHAR(100)
		, @SourceTableName		NVARCHAR(100)
		, @IsArchiveCandidate	INT 
		, @ThreadID				INT 		
		, @BatchID				INT

AS

SET NOCOUNT ON

BEGIN TRY
DECLARE 
	 @loopPointer					INT
	,@ArchiveControlID				INT
	,@deleteCount					INT
	,@runLast						DATETIME
	,@RowsPerBatch					SMALLINT
	,@ArchiveCmd					NVARCHAR(4000)
	,@ssql							NVARCHAR(4000)
	,@runNext						DATETIME
	,@rowCnt						SMALLINT
	,@OuterBatchStartDateTime		DATETIME
	,@InternalBatchStartDateTime	DATETIME
	,@ArchiveDatabaseName			NVARCHAR(100)
	,@ArchiveSchemaName				NVARCHAR(100)
	,@ArchiveTableName				NVARCHAR(100)	
	
BEGIN -- Outermost loop for the Archive process 
	SELECT TOP 1 
		 @ArchiveControlID		= ArchiveControlID 
		,@RunLast				= RunLastArchive		
		,@RowsPerBatch			= RowsPerBatch			
		,@ArchiveCmd			= ArchivingQuery
		,@ArchiveDatabaseName	= ArchiveDatabaseName	
		,@ArchiveSchemaName		= ArchiveSchemaName		
		,@ArchiveTableName		= ArchiveTableName		
	FROM [Control].[ArchiveControl]
	WHERE SourceDatabaseName = @SourceDatabaseName
	AND SourceSchemaName = @SourceSchemaName
	AND SourceTableName = @SourceTableName
	AND IsArchiveCandidate = @IsArchiveCandidate
	
	-- Continue if control table returns a record
	IF (@@ROWCOUNT <> 0)  
		
		BEGIN
			
			SELECT 
				@rowCnt = @RowsPerBatch -- required to kick off first iteration	
			  , @OuterBatchStartDateTime = CURRENT_TIMESTAMP
			  , @loopPointer = 1
			  , @deleteCount = 0
			
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
									, @SourceTableName
									, 'Archiving of records from source table: ' + @SourceTableName + ' to archive table: ' + @ArchiveTableName +' has been started'
									, 0
									, @OuterBatchStartDateTime
									, NULL
									, CURRENT_TIMESTAMP);		
			COMMIT TRANSACTION;

			BEGIN -- valid Archive task							

				WHILE(@rowCnt = @RowsPerBatch)
				BEGIN -- Perform work in loop 
					BEGIN TRANSACTION

						SELECT @InternalBatchStartDateTime = CURRENT_TIMESTAMP	

						EXEC sp_executesql @ArchiveCmd ,N'@RowsPerBatch SMALLINT, @rowCnt SMALLINT OUTPUT',@RowsPerBatch , @rowCnt OUTPUT
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
												, @SourceTableName
												, 'Records archived in iteration :' + CAST(@loopPointer AS VARCHAR)
												, @rowCnt
												, @InternalBatchStartDateTime
												, CURRENT_TIMESTAMP
												, CURRENT_TIMESTAMP
												);

						SET @loopPointer = @loopPointer + 1 -- Batch counter, which counts number of batches required to archived the records based on archiving query
						SET @deleteCount = @deleteCount + @rowCnt --number of records deleted from source DB and archived in Archive DB in each batch

					COMMIT TRANSACTION;					

				END -- Perform work in a loop				

				BEGIN TRANSACTION 
					-- One Archive task completed ; update run date
					UPDATE [Control].ArchiveControl 
					SET RunLastArchive = GETDATE()
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
											, @SourceTableName
											, 'Archiving of records from source table: ' + @SourceTableName + ' to archive table: ' + @ArchiveTableName + ' has been completed. Total archived records are: ' + CAST(@deleteCount AS VARCHAR)
											, 0
											, @OuterBatchStartDateTime
											, CURRENT_TIMESTAMP
											, CURRENT_TIMESTAMP
											);
				COMMIT TRANSACTION
		
			END -- valid Archive cycle

		END 
END -- -- outermost loop for the Archive process 

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
	
	SELECT @ssql = 'Error while archiving the records for ArchiveControlID: ' + CAST(@ArchiveControlID AS NVARCHAR(255)) + ' on line: ' + CAST(@ErrorLine AS VARCHAR(10)) + ' is :' + @ErrorMessage


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
							, @SourceTableName
							, @ssql
							, 0
							, @OuterBatchStartDateTime
							, CURRENT_TIMESTAMP
							, CURRENT_TIMESTAMP
							);

END CATCH

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;