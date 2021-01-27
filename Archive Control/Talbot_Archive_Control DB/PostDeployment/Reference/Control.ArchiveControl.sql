TRUNCATE TABLE [Control].[ArchiveControl];

--------------------------------------------------------------------------------THREAD ID - 1 START HERE---------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
           (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'CfgRecItem'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'CfgRecItem'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.CfgRecItem OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.CfgRecItem WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.CfgRecItem WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolLORSScty'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolLORSScty'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolLORSScty OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolLORSScty WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolLORSScty WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolROE'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolROE'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolROE OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolROE WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolROE WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)


INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolSCMRC'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolSCMRC'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolSCMRC OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolSCMRC WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolSCMRC WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolCrMgt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolCrMgt'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolCrMgt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolCrMgt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolCrMgt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolGrpMmb'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolGrpMmb'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolGrpMmb OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolGrpMmb WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolGrpMmb WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolInsd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolInsd'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolInsd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolInsd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolInsd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'USMPolIDUpd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'USMPolIDUpd'
		   ,1		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.USMPolIDUpd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.USMPolIDUpd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.USMPolIDUpd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 1 END HERE---------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------THREAD ID - 2 START HERE---------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolLdr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolLdr'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolLdr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolLdr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolLdr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'UsmMain'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'UsmMain'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.UsmMain OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.UsmMain WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.UsmMain WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)


INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'AccgROE'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'AccgROE'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.AccgROE OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.AccgROE WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.AccgROE WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'AnlyTy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'AnlyTy'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.AnlyTy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.AnlyTy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.AnlyTy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'BOA'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'BOA'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.BOA OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.BOA WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.BOA WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'BOC'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'BOC'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.BOC OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.BOC WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.BOC WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'CMConst'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'CMConst'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.CMConst OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.CMConst WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.CMConst WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'CMWdg'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'CMWdg'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.CMWdg OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.CMWdg WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.CMWdg WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Ctry'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Ctry'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Ctry OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Ctry WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Ctry WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)


INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Dti'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Dti'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Dti OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Dti WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Dti WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]				   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Fil'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Fil'
		   ,2		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Fil OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Fil WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Fil WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 2 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 3 START HERE---------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Anly'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Anly'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Anly OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Anly WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Anly WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Cas'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Cas'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Cas OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Cas WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Cas WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '	
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '	
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Ccy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Ccy'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Ccy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Ccy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Ccy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)  


INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'MsgCtrl'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'MsgCtrl'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.MsgCtrl OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.MsgCtrl WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.MsgCtrl WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolSctyMain'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolSctyMain'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolSctyMain OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolSctyMain WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolSctyMain WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PmInfo'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PmInfo'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PmInfo OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PmInfo WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PmInfo WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolGrp'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolGrp'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolGrp OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolGrp WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolGrp WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolLyr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolLyr'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolLyr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolLyr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolLyr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolPmDedTy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolPmDedTy'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolPmDedTy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolPmDedTy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolPmDedTy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'UsmDefd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'UsmDefd'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.UsmDefd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.UsmDefd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.UsmDefd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolLnk'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolLnk'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolLnk OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolLnk WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolLnk WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'RIAttt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'RIAttt'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.RIAttt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.RIAttt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.RIAttt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolPm'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolPm'
		   ,3		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolPm OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolPm WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolPm WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		) 
--------------------------------------------------------------------------------THREAD ID - 3 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 4 START HERE---------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SCMMovt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SCMMovt'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SCMMovt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SCMMovt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SCMMovt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolMain'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolMain'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolMain OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolMain WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolMain WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Flag'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Flag'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Flag OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Flag WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Flag WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'GeoCd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'GeoCd'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.GeoCd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.GeoCd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.GeoCd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'GrpEvt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'GrpEvt'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.GrpEvt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.GrpEvt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.GrpEvt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Ldr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Ldr'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Ldr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Ldr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Ldr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'LdrType'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'LdrType'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.LdrType OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.LdrType WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.LdrType WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PIClubDcde'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PIClubDcde'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PIClubDcde OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PIClubDcde WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PIClubDcde WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PMLEvt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PMLEvt'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PMLEvt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PMLEvt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PMLEvt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolEntSt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolEntSt'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolEntSt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolEntSt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolEntSt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolHRCtry'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolHRCtry'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolHRCtry OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolHRCtry WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolHRCtry WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolLnkTy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolLnkTy'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolLnkTy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolLnkTy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolLnkTy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolReRef'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolReRef'
		   ,4		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolReRef OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolReRef WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolReRef WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 4 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 5 START HERE-------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'CoverHldr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'CoverHldr'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.CoverHldr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.CoverHldr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.CoverHldr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPol'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPol'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPol OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPol WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPol WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolAdvNt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolAdvNt'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolAdvNt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolAdvNt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolAdvNt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolLyrLnk'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolLyrLnk'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolLyrLnk OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolLyrLnk WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolLyrLnk WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolPmDeds'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolPmDeds'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolPmDeds OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolPmDeds WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolPmDeds WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'ROE'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'ROE'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.ROE OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.ROE WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.ROE WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Vsl'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Vsl'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Vsl OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Vsl WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Vsl WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VslCpcy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VslCpcy'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VslCpcy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VslCpcy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VslCpcy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolScty'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolScty'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolScty OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolScty WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolScty WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolFlds'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolFlds'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolFlds OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolFlds WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolFlds WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'InPolLyr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'InPolLyr'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.InPolLyr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.InPolLyr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.InPolLyr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'MDM'
           ,'BusinessPlan'
		   ,'Talbot_PSA_Archive'
		   ,'MDM'
		   ,'BusinessPlan'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.MDM.BusinessPlan OUTPUT deleted.* INTO Talbot_PSA_Archive.MDM.BusinessPlan WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND CDCDate < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.MDM.BusinessPlan WHERE CDCDate < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'BrokerManager'
           ,'SubscribeBrokerMapping'
		   ,'Talbot_PSA_Archive'
		   ,'BrokerManager'
		   ,'SubscribeBrokerMapping'
		   ,5		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.BrokerManager.SubscribeBrokerMapping OUTPUT deleted.* INTO Talbot_PSA_Archive.BrokerManager.SubscribeBrokerMapping WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND CDCDate < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.BrokerManager.SubscribeBrokerMapping WHERE CDCDate < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 5 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 6 START HERE-------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'EpseLog'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'EpseLog'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.EpseLog OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.EpseLog WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.EpseLog WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolSIC'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolSIC'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolSIC OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolSIC WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolSIC WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolSt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolSt'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolSt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolSt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolSt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolTy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolTy'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolTy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolTy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolTy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'RskCat'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'RskCat'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.RskCat OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.RskCat WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.RskCat WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SCMMainAsAt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SCMMainAsAt'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SCMMainAsAt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SCMMainAsAt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SCMMainAsAt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SICCds'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SICCds'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SICCds OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SICCds WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SICCds WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SICStd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SICStd'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SICStd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SICStd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SICStd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'UsmNarr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'UsmNarr'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.UsmNarr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.UsmNarr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.UsmNarr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'USMQulgCgy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'USMQulgCgy'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.USMQulgCgy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.USMQulgCgy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.USMQulgCgy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VslNt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VslNt'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VslNt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VslNt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VslNt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VslTy'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VslTy'
		   ,6		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VslTy OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VslTy WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VslTy WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 6 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 7 START HERE-------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Bkr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Bkr'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Bkr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Bkr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Bkr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Evt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Evt'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Evt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Evt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Evt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Insd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Insd'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Insd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Insd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Insd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)


INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolRevHist'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolRevHist'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolRevHist OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolRevHist WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolRevHist WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolVsl'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolVsl'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolVsl OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolVsl WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolVsl WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Uwr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Uwr'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Uwr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Uwr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Uwr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VslNarr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VslNarr'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VslNarr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VslNarr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VslNarr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SCMExtdPolDtl'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SCMExtdPolDtl'
		   ,7		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SCMExtdPolDtl OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SCMExtdPolDtl WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SCMExtdPolDtl WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 7 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 8 START HERE-------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'LpsoErrBckt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'LpsoErrBckt'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.LpsoErrBckt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.LpsoErrBckt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.LpsoErrBckt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolPm'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolPm'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolPm OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolPm WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolPm WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'OutPolSctyAccs'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'OutPolSctyAccs'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.OutPolSctyAccs OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.OutPolSctyAccs WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.OutPolSctyAccs WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolMainRenPosn'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolMainRenPosn'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolMainRenPosn OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolMainRenPosn WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolMainRenPosn WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolSectNarr'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolSectNarr'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolSectNarr OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolSectNarr WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolSectNarr WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'Rsk'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'Rsk'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.Rsk OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.Rsk WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.Rsk WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SCMMain'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SCMMain'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SCMMain OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SCMMain WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SCMMain WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VslExNm'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VslExNm'
		   ,8		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VslExNm OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VslExNm WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VslExNm WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 8 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 9 START HERE-------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'InPol'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'InPol'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.InPol OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.InPol WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.InPol WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolConst'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolConst'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolConst OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolConst WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolConst WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolMltLmt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolMltLmt'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolMltLmt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolMltLmt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolMltLmt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VldnMasks'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VldnMasks'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VldnMasks OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VldnMasks WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VldnMasks WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'VslCo'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'VslCo'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.VslCo OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.VslCo WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.VslCo WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'WH_RIAMovt'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'WH_RIAMovt'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.WH_RIAMovt OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.WH_RIAMovt WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.WH_RIAMovt WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'TrnAnly'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'TrnAnly'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.TrnAnly OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.TrnAnly WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.TrnAnly WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'SCMExtdLossDtl'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'SCMExtdLossDtl'
		   ,9		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.SCMExtdLossDtl OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.SCMExtdLossDtl WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.SCMExtdLossDtl WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 9 END HERE---------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------THREAD ID - 10 START HERE-------------------------------------------------------------------------------------------------
INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'MOA'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'MOA'
		   ,10		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.MOA OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.MOA WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.MOA WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolAnlyCd'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolAnlyCd'
		   ,10		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolAnlyCd OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolAnlyCd WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolAnlyCd WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)

INSERT INTO [Control].[ArchiveControl]
            (
			  [SourceDatabaseName]		
			, [SourceSchemaName]			
			, [SourceTableName]		
			, [ArchiveDatabaseName]	
			, [ArchiveSchemaName]			
			, [ArchiveTableName]			
			, [ThreadId]								
			, [RowsPerBatch]	
			, [IsArchiveCandidate]			
			, [ArchivingQuery]		
			, [IsPurgeCandidate]			
			, [PurgeQuery]		
			, [IsRestoreCandidate]			
			, [RestoreQuery]					
			, [RunLastArchive]		
			, [RunLastPurge]		
			, [RunLastRestore]			   
		   )
VALUES (
           'Talbot_PSA'
           ,'Subscribe'
           ,'PolCvrHldrs'
		   ,'Talbot_PSA_Archive'
		   ,'Subscribe'
		   ,'PolCvrHldrs'
		   ,10		 
		   ,10000
		   ,1
		   ,'DELETE TOP (@RowsPerbatch) Talbot_PSA.Subscribe.PolCvrHldrs OUTPUT deleted.* INTO Talbot_PSA_Archive.Subscribe.PolCvrHldrs WHERE (RowStatus = ''X'' OR (RowStatus = ''H'' AND tran_end_time < DATEADD(MM,-3,CONVERT(DATE,GETDATE(),112)))) SELECT @rowCnt=@@ROWCOUNT '
           ,0
           ,'DELETE TOP (@RowsPerbatch) <<ArchiveDatabaseName.ArchiveSchemaName>>.PolCvrHldrs WHERE tran_end_time < DATEADD(YY,-5,CONVERT(DATE,GETDATE(),112)) SELECT @rowCnt=@@ROWCOUNT '
		   ,0
		   , ' WHERE << Enter restore condition >>; SELECT @rowCnt=@@ROWCOUNT; '		
		   , NULL
		   , NULL
		   , NULL
		)
--------------------------------------------------------------------------------THREAD ID - 10 END HERE---------------------------------------------------------------------------------------------------