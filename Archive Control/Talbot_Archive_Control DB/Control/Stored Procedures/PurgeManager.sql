/*
=====================================================================
Author:		Aziz Alam
Create date: 11/11/2016
Description: Data Purginh. This procedure will purge/delete the data from archived database
based on business logic
======================================================================
Modifications :
Who					When				What	
======================================================================
Example 
EXEC [Control].[PurgeManager] 'Talbot_PSA_Archive','Subscribe','MOA_Archive',1,1,1
======================================================================
*/
CREATE PROCEDURE [Control].[PurgeManager] 
          @ArchiveDatabase	 NVARCHAR(100)
		, @ArchiveSchemaName NVARCHAR(100)
		, @ArchiveTableName	 NVARCHAR(100)
		, @IsPurgeCandidate	 INT 
		, @ThreadID			 INT 		
		, @BatchID			 INT

AS

SET NOCOUNT ON

BEGIN TRY
DECLARE 
	 @loopPointer					INT
	,@ArchiveControlID				INT
	,@deleteCount					INT
	,@runLast						DATETIME
	,@RowsPerBatch					SMALLINT
	,@PurgeCmd						NVARCHAR(4000)
	,@ssql							NVARCHAR(4000)
	,@runNext						DATETIME
	,@rowCnt						SMALLINT
	,@OuterBatchStartDateTime		DATETIME
	,@InternalBatchStartDateTime	DATETIME	
	,@IsArchiveCandidate			INT 
	
BEGIN -- Outermost loop for the Archive process 
	SELECT TOP 1 
		 @ArchiveControlID	= ArchiveControlID 
		,@RunLast			= RunLastPurge		
		,@RowsPerBatch		= RowsPerBatch			
		,@PurgeCmd			= PurgeQuery
	FROM [Control].[ArchiveControl]
	WHERE ArchiveDatabaseName = @ArchiveDatabase
	AND ArchiveSchemaName = @ArchiveSchemaName
	AND ArchiveTableName =  @ArchiveTableName
	AND IsPurgeCandidate = @IsPurgeCandidate
	
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
									, @ArchiveTableName
									, 'Purging of records from table: ' + @ArchiveTableName + ' has been started'
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

						EXEC sp_executesql @PurgeCmd ,N'@RowsPerBatch SMALLINT, @rowCnt SMALLINT OUTPUT',@RowsPerBatch , @rowCnt OUTPUT
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
												, 'Records purged in iteration :' + CAST(@loopPointer AS VARCHAR)
												, @rowCnt
												, @InternalBatchStartDateTime
												, CURRENT_TIMESTAMP
												, CURRENT_TIMESTAMP
												);

						SET @loopPointer = @loopPointer + 1 -- Batch counter, which counts number of batches required to purged the records based on purge query
						SET @deleteCount = @deleteCount + @rowCnt --number of records deleted from archive DB

					COMMIT TRANSACTION;					

				END -- Perform work in a loop				

				BEGIN TRANSACTION 
					-- One purge task completed ; update run date
					UPDATE [Control].ArchiveControl 
					SET RunLastPurge = GETDATE()
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
											, 'Purging of records from archive table: ' + @ArchiveTableName + ' has been completed. Total purged records are: ' + CAST(@deleteCount AS VARCHAR)
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
	
	SELECT @ssql = 'Error while purging the records for ArchiveControlID: ' + CAST(@ArchiveControlID AS NVARCHAR(255)) + ' on line: ' + CAST(@ErrorLine AS VARCHAR(10)) + ' is :' + @ErrorMessage

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