USE [APQM_DB]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 02/28/2014 16:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RFQSummaryHeader]    Script Date: 02/28/2014 16:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQSummaryHeader](
	[RFQSummaryHeaderKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BOMDetailKey] [numeric](18, 0) NOT NULL,
	[PPAPDate] [datetime] NOT NULL,
	[InitialReleaseQty] [float] NOT NULL,
	[InitialReleaseDate] [datetime] NOT NULL,
	[PrebuildQty] [float] NOT NULL,
	[PrebuildDate] [datetime] NOT NULL,
	[PurchasingAllRecommendations] [nvarchar](150) NOT NULL,
	[EngineeringAllConcurrences] [nvarchar](150) NOT NULL,
	[ManufacturingAllConcurrences] [nvarchar](150) NOT NULL,
	[QualityAllConcurrences] [nvarchar](150) NOT NULL,
	[SalesAllConcurrences] [nvarchar](150) NOT NULL,
	[Notes] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_RFQSummaryHeader] PRIMARY KEY CLUSTERED 
(
	[RFQSummaryHeaderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQNumber]    Script Date: 02/28/2014 16:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQNumber](
	[RFQNumberKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BOMDetailKey] [numeric](18, 0) NOT NULL,
	[RFQNumber] [numeric](18, 0) NOT NULL,
	[SIFHeaderKey] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_RFQNumber_1] PRIMARY KEY CLUSTERED 
(
	[BOMDetailKey] ASC,
	[RFQNumber] ASC,
	[SIFHeaderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_RFQNumber] UNIQUE NONCLUSTERED 
(
	[RFQNumberKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RFQEAV_NewEAV]    Script Date: 02/28/2014 16:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQEAV_NewEAV]
	-- Add the parameters for the stored procedure here
	 @RFQHeaderKey INT
	,@Year NVARCHAR(50)
	,@Volume  float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQEAV]
           ([RFQHeaderKey]
           ,[Year]
           ,[Volume])
     VALUES
           (@RFQHeaderKey
           ,@Year
           ,@Volume)


Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[RFQEAV_EditEAV]    Script Date: 02/28/2014 16:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQEAV_EditEAV]
	-- Add the parameters for the stored procedure here
	 @EAVKey INT
	,@RFQHeaderKey INT
	,@Year NVARCHAR(50)
	,@Volume  float

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[RFQEAV]
   SET [RFQHeaderKey] = @RFQHeaderKey 
      ,[Year] = @Year 
      ,[Volume] = @Volume 
      

WHERE EAVKey=@EAVKey

END
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 02/28/2014 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemMasterKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[PartNumber] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[UM] [nvarchar](20) NOT NULL,
	[Material] [nvarchar](150) NOT NULL,
	[Cost] [float] NOT NULL,
	[CapsonicPN] [nvarchar](50) NOT NULL,
	[CustomerPN] [nvarchar](50) NOT NULL,
	[ManufacturePN] [nvarchar](50) NOT NULL,
	[SupplierPN] [nvarchar](50) NOT NULL,
	[CommCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemMasterKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierMaster]    Script Date: 02/28/2014 16:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierMaster](
	[SupplierMasterKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](80) NOT NULL,
	[ContactName] [nvarchar](150) NOT NULL,
	[ContactPhoneNumber] [nvarchar](150) NOT NULL,
	[ContactCellPhoneNumber] [nvarchar](150) NOT NULL,
	[ContactEmail] [nvarchar](200) NOT NULL,
	[ManufacturingLocation] [nvarchar](max) NOT NULL,
	[ShipLocation] [nvarchar](max) NOT NULL,
	[QuotedCurrency] [nvarchar](50) NOT NULL,
	[Capabilities] [nvarchar](200) NOT NULL,
	[Comments] [nvarchar](200) NOT NULL,
	[Visible] [bit] NOT NULL CONSTRAINT [DF_SupplierMaster_Visible]  DEFAULT ((1)),
	[Commodity] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_SupplierMaster] PRIMARY KEY CLUSTERED 
(
	[SupplierMasterKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MarketSector_EditMarket]    Script Date: 02/28/2014 16:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MarketSector_EditMarket]
	-- Add the parameters for the stored procedure here
	@MarketSectorID numeric(18,0)
	,@Name NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[MarketSector]
   SET [Name] = @Name      
 WHERE [MarketSectorID] = @MarketSectorID

END
GO
/****** Object:  StoredProcedure [dbo].[MarketSector_NewMarket]    Script Date: 02/28/2014 16:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MarketSector_NewMarket]
	-- Add the parameters for the stored procedure here
	@Name NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [APQM_DB].[dbo].[MarketSector]
           ([Name])
     VALUES
           (@Name)


Select @@Identity

END
GO
/****** Object:  Table [dbo].[MarketSector]    Script Date: 02/28/2014 16:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketSector](
	[MarketSectorID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MarketSector] PRIMARY KEY CLUSTERED 
(
	[MarketSectorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_MarketSector] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 02/28/2014 16:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 02/28/2014 16:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 02/28/2014 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 02/28/2014 16:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyIndustriesSupplied_NewIndustry]    Script Date: 02/28/2014 16:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyIndustriesSupplied_NewIndustry]
	-- Add the parameters for the stored procedure here
	@SupplierSurveyKey INT
    ,@IndustriesSuplied nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[SupplierSurveyIndustriesSupplied]
           ([SupplierSurveyKey]
           ,[IndustriesSuplied])
     VALUES
           (@SupplierSurveyKey
           ,@IndustriesSuplied)

SELECT [SupplierSurveyKey]
  FROM [APQM_DB].[dbo].[SupplierSurveyIndustriesSupplied]
WHERE ([SupplierSurveyKey]=@SupplierSurveyKey AND [IndustriesSuplied]=@IndustriesSuplied)

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyIndustriesSupplied_EditIndustry]    Script Date: 02/28/2014 16:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyIndustriesSupplied_EditIndustry]
	-- Add the parameters for the stored procedure here
	 @SupplierIndustriesSuppliedKey INT
	,@SupplierSurveyKey INT
    ,@IndustriesSuplied nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE [APQM_DB].[dbo].[SupplierSurveyIndustriesSupplied]
   SET [SupplierSurveyKey] = @SupplierSurveyKey
      ,[IndustriesSuplied] = @IndustriesSuplied
 WHERE SupplierIndustriesSuppliedKey=@SupplierIndustriesSuppliedKey
END
GO
/****** Object:  Table [dbo].[TokenMaster]    Script Date: 02/28/2014 16:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenMaster](
	[TokenKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[SubjectKey] [numeric](18, 0) NOT NULL,
	[DeadDate] [datetime] NOT NULL,
	[Acknowledgement] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TokenMaster] PRIMARY KEY CLUSTERED 
(
	[TokenKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 02/28/2014 16:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[CustomerKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerMaster] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerMaster] UNIQUE NONCLUSTERED 
(
	[CustomerName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewRFQDetail_ReadAll]    Script Date: 02/28/2014 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQDetail_ReadAll]
AS
SELECT     RFQDetailKey, RFQHeaderKey, ItemDescription, UM, RPCQty, RPCCostPerUnit, OSQty, OSCostPerUnit, ScrapValue, DirectHrlyLaborRate, StdHrs, Burden
FROM         dbo.RFQDetail
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[44] 4[42] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[42] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RFQDetail"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 235
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQDetail_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQDetail_ReadAll'
GO
/****** Object:  View [dbo].[viewRFQCountBySharedItemAux]    Script Date: 02/28/2014 16:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQCountBySharedItemAux]
AS
SELECT     dbo.BOMDetail.ItemMasterKey, dbo.ItemMaster.PartNumber, dbo.ItemMaster.Description, dbo.ItemMaster.Material, dbo.BOMDetail.Cost, 
                      dbo.BOMDetail.Qty AS QtyRequired, COUNT(dbo.RFQHeader.RFQHeaderKey) AS RFQCount
FROM         dbo.BOMDetail INNER JOIN
                      dbo.BOMHeader ON dbo.BOMDetail.BOMHeaderKey = dbo.BOMHeader.BOMHeaderKey INNER JOIN
                      dbo.SIFHeader ON dbo.BOMHeader.SIFHeaderKey = dbo.SIFHeader.SIFHeaderKey INNER JOIN
                      dbo.ItemMaster ON dbo.BOMDetail.ItemMasterKey = dbo.ItemMaster.ItemMasterKey LEFT OUTER JOIN
                      dbo.RFQHeader ON dbo.BOMDetail.BOMDetailKey = dbo.RFQHeader.BOMDetailKey
GROUP BY dbo.BOMHeader.BOMHeaderKey, dbo.BOMDetail.ItemMasterKey, dbo.ItemMaster.PartNumber, dbo.ItemMaster.Description, dbo.ItemMaster.Material, 
                      dbo.BOMDetail.Cost, dbo.BOMDetail.Qty
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[33] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BOMDetail"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BOMHeader"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 125
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIFHeader"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 125
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ItemMaster"
            Begin Extent = 
               Top = 6
               Left = 764
               Bottom = 125
               Right = 942
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 6
               Left = 980
               Bottom = 125
               Right = 1215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountBySharedItemAux'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountBySharedItemAux'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountBySharedItemAux'
GO
/****** Object:  Table [dbo].[CommodityMaster]    Script Date: 02/28/2014 16:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommodityMaster](
	[CommodityKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CommodityCode] [nvarchar](50) NOT NULL,
	[Commodity] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Commodity] PRIMARY KEY CLUSTERED 
(
	[CommodityKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQHeader]    Script Date: 02/28/2014 16:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQHeader](
	[RFQHeaderKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BOMDetailKey] [numeric](18, 0) NOT NULL,
	[SupplierMasterKey] [numeric](18, 0) NOT NULL,
	[RFQNumberKey] [numeric](18, 0) NOT NULL,
	[DrawingLevel] [nvarchar](50) NOT NULL,
	[EstimatedAnnualVolume] [numeric](18, 0) NOT NULL,
	[ProductionLeadTime] [nvarchar](50) NOT NULL,
	[ProductionToolingLeadTime] [nvarchar](50) NOT NULL,
	[PrototypeToolingLeadTime] [nvarchar](50) NOT NULL,
	[PrototypePieceLeadTime] [nvarchar](50) NOT NULL,
	[ToolingDetail] [nvarchar](max) NOT NULL,
	[ProductionTooling] [float] NOT NULL,
	[PrototypeTooling] [float] NOT NULL,
	[PrototypePiece] [float] NOT NULL,
	[SG_A_Profit] [float] NOT NULL,
	[PackingPerUnit] [float] NOT NULL,
	[AssemblyCostPerUnit] [float] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[SentToVendor] [datetime] NOT NULL,
	[FilledUp] [datetime] NOT NULL,
	[PreparedBy] [nvarchar](150) NOT NULL,
	[MOQ] [nvarchar](50) NOT NULL,
	[TargetPrice] [float] NOT NULL,
	[NoQuote] [bit] NOT NULL,
	[MarketSector] [numeric](18, 0) NOT NULL,
	[CommentsToBuyer] [nvarchar](max) NOT NULL,
	[IAgree] [bit] NOT NULL,
	[DateFilledOut] [datetime] NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[ReasonNoQuote] [nvarchar](200) NOT NULL,
	[Weight] [float] NOT NULL,
	[CommentsToVendor] [nvarchar](max) NOT NULL,
	[UMWeight] [nvarchar](50) NOT NULL,
	[AttachmentsFolder] [nvarchar](50) NOT NULL,
	[LeadTimePPAP] [nvarchar](50) NOT NULL,
	[AttachmentsFolderVendor] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Cavitation] [nvarchar](50) NOT NULL,
	[Material] [nvarchar](150) NOT NULL,
	[LeadTimeFirstProductionOrder] [nvarchar](50) NULL,
	[LeadTimePPAP_Fair] [nvarchar](50) NULL,
	[LeadTimeNormalProductionOrders] [nvarchar](50) NULL,
	[EAUCalendarYears] [nvarchar](70) NULL,
 CONSTRAINT [PK_RFQHeader] PRIMARY KEY CLUSTERED 
(
	[RFQHeaderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOMDetailVolume]    Script Date: 02/28/2014 16:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOMDetailVolume](
	[BOMDetailVolumeKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BOMDetailKey] [numeric](18, 0) NOT NULL,
	[Volume] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_BOMDetailVolume] PRIMARY KEY CLUSTERED 
(
	[BOMDetailVolumeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOMDetail]    Script Date: 02/28/2014 16:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOMDetail](
	[BOMDetailKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BOMHeaderKey] [numeric](18, 0) NOT NULL,
	[ItemMasterKey] [numeric](18, 0) NOT NULL,
	[Qty] [float] NOT NULL,
	[Cost] [float] NOT NULL,
	[Status] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[LinePosition] [nvarchar](15) NOT NULL,
	[SalesStatus] [nvarchar](25) NOT NULL,
	[User] [nvarchar](256) NOT NULL,
	[PurchasingStatus] [nvarchar](25) NOT NULL,
	[DirectedBuy] [bit] NOT NULL,
	[Material] [nvarchar](150) NOT NULL,
	[Um] [nvarchar](20) NOT NULL,
	[VendorQuoteEst] [nvarchar](20) NOT NULL,
	[SalesComments] [nvarchar](50) NOT NULL,
	[PurchasingComments] [nvarchar](50) NOT NULL,
	[CapComAssm] [nvarchar](20) NOT NULL,
	[CapsonicPN] [nvarchar](50) NOT NULL,
	[CustomerPN] [nvarchar](50) NOT NULL,
	[ManufacturePN] [nvarchar](50) NOT NULL,
	[SupplierPN] [nvarchar](50) NOT NULL,
	[CommCode] [nvarchar](50) NOT NULL,
	[EAU] [nvarchar](50) NOT NULL CONSTRAINT [DF_BOMDetail_EAU]  DEFAULT ((0)),
 CONSTRAINT [PK_BOMDetail] PRIMARY KEY CLUSTERED 
(
	[BOMDetailKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSuvey]    Script Date: 02/28/2014 16:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSuvey](
	[SupplierSuveyKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierMasterKey] [numeric](18, 0) NOT NULL,
	[StreetAddress] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
	[LastSurvey] [datetime] NOT NULL,
	[NDARec] [datetime] NOT NULL,
	[PrimaryBusiness] [nvarchar](50) NOT NULL,
	[SecundaryBusiness] [nvarchar](50) NOT NULL,
	[UnionYN] [bit] NOT NULL,
	[Local] [nvarchar](50) NOT NULL,
	[ContractExpiration] [nvarchar](50) NOT NULL,
	[CurrentCapacity] [nvarchar](50) NOT NULL,
	[ManufacturingMetod] [nvarchar](max) NOT NULL,
	[ToolingNewInHouseYN] [bit] NOT NULL,
	[ToolingNewOutsourcedYN] [bit] NOT NULL,
	[ToolingInHouseYN] [bit] NOT NULL,
	[ToolingOutsourcedYN] [bit] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[SentToVendor] [datetime] NOT NULL,
 CONSTRAINT [PK_SupplierSuvey] PRIMARY KEY CLUSTERED 
(
	[SupplierSuveyKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Commodity]    Script Date: 02/28/2014 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Commodity](
	[SupplierCommodityKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierKey] [numeric](18, 0) NOT NULL,
	[CommodityKey] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Supplier_Commodity] PRIMARY KEY CLUSTERED 
(
	[SupplierCommodityKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIFHeader]    Script Date: 02/28/2014 16:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIFHeader](
	[SIFHeaderKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerKey] [numeric](18, 0) NOT NULL,
	[InquiryNumber] [nvarchar](50) NOT NULL,
	[Priority] [nvarchar](50) NOT NULL,
	[Revision] [nvarchar](50) NOT NULL,
	[SalesPerson] [nvarchar](50) NOT NULL,
	[CostModelLoc] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[BussinesClass] [nvarchar](50) NOT NULL,
	[Product] [nvarchar](50) NOT NULL,
	[DivLoc] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Reason4Quote] [nvarchar](50) NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[Specification] [nvarchar](50) NOT NULL,
	[DrawingLevel] [nvarchar](50) NOT NULL,
	[TaskDescription] [nvarchar](50) NOT NULL,
	[PartPrint] [nvarchar](50) NOT NULL,
	[Sample] [nvarchar](50) NOT NULL,
	[ToolingTarget] [nvarchar](50) NOT NULL,
	[PrimaryCompetitors] [nvarchar](50) NOT NULL,
	[SpecificResourceRequirements] [nvarchar](50) NOT NULL,
	[Technical] [nvarchar](50) NOT NULL,
	[BOMHeaderKey] [numeric](18, 0) NULL,
	[QuoteDue] [datetime] NOT NULL,
	[SOP] [datetime] NOT NULL,
	[SalesDBID] [numeric](18, 0) NOT NULL,
	[MarketSector] [numeric](18, 0) NOT NULL,
	[AssignedTo] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_SIFHeader_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SIFHeader] PRIMARY KEY CLUSTERED 
(
	[SIFHeaderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 02/28/2014 16:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 02/28/2014 16:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 02/28/2014 16:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 02/28/2014 16:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 02/28/2014 16:57:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 02/28/2014 16:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 02/28/2014 16:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyCertification]    Script Date: 02/28/2014 16:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyCertification](
	[SupplierCertificationKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[Certifications] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SupplierSurveyCertification] PRIMARY KEY CLUSTERED 
(
	[SupplierCertificationKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyForecastSales]    Script Date: 02/28/2014 16:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyForecastSales](
	[SurveyForecastedSalesKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[ForecastSalesYear] [nvarchar](4) NOT NULL,
	[ForecastSales] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SupplierSurveyForecastSales] PRIMARY KEY CLUSTERED 
(
	[SurveyForecastedSalesKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyContacts]    Script Date: 02/28/2014 16:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyContacts](
	[SupplierSuveryContactsKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Cell] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SupplierSurveyContacts] PRIMARY KEY CLUSTERED 
(
	[SupplierSuveryContactsKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyIndustriesSupplied]    Script Date: 02/28/2014 16:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyIndustriesSupplied](
	[SupplierIndustriesSuppliedKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[IndustriesSuplied] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SupplierSurveyIndustriesSupplied] PRIMARY KEY CLUSTERED 
(
	[SupplierIndustriesSuppliedKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOMHeader]    Script Date: 02/28/2014 16:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOMHeader](
	[BOMHeaderKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SIFHeaderKey] [numeric](18, 0) NOT NULL,
	[TopPartNumber] [nvarchar](50) NOT NULL,
	[PartDescription] [nvarchar](50) NOT NULL,
	[Revision] [nvarchar](5) NOT NULL,
	[AnnualVolume] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_BOMHeader] PRIMARY KEY CLUSTERED 
(
	[BOMHeaderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIFDetail]    Script Date: 02/28/2014 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIFDetail](
	[SIFDetailkey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SIFHeaderKey] [numeric](18, 0) NOT NULL,
	[ProgramYear] [nvarchar](50) NOT NULL,
	[ProjectedAnnualVolume] [numeric](18, 0) NOT NULL,
	[PercentVolumePerAward] [float] NOT NULL,
	[ProjectedTargetPrice] [float] NOT NULL,
	[AnnualRevenue] [float] NOT NULL,
 CONSTRAINT [PK_SIFDetail] PRIMARY KEY CLUSTERED 
(
	[SIFDetailkey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 02/28/2014 16:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQDetail]    Script Date: 02/28/2014 16:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQDetail](
	[RFQDetailKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[ItemDescription] [nvarchar](150) NOT NULL,
	[UM] [nvarchar](50) NOT NULL,
	[RPCQty] [float] NOT NULL,
	[RPCCostPerUnit] [float] NOT NULL,
	[OSQty] [float] NOT NULL,
	[OSCostPerUnit] [float] NOT NULL,
	[ScrapValue] [float] NOT NULL,
	[DirectHrlyLaborRate] [float] NOT NULL,
	[StdHrs] [float] NOT NULL,
	[Burden] [float] NOT NULL,
 CONSTRAINT [PK_RFQDetail] PRIMARY KEY CLUSTERED 
(
	[RFQDetailKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQACR]    Script Date: 02/28/2014 16:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQACR](
	[RFQACRKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[Year] [nvarchar](4) NOT NULL,
	[Porcentage] [float] NOT NULL,
 CONSTRAINT [PK_RFQACR] PRIMARY KEY CLUSTERED 
(
	[RFQACRKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQSummary]    Script Date: 02/28/2014 16:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQSummary](
	[RFQSummaryKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[BCost] [float] NOT NULL,
	[CCost] [float] NOT NULL,
	[EAV] [float] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_RFQSummary] PRIMARY KEY CLUSTERED 
(
	[RFQSummaryKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQEAV]    Script Date: 02/28/2014 16:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQEAV](
	[EAVKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[Year] [nvarchar](50) NOT NULL,
	[Volume] [float] NOT NULL,
 CONSTRAINT [PK_RFQEAV] PRIMARY KEY CLUSTERED 
(
	[EAVKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SIFDetail_NewDetail]    Script Date: 02/28/2014 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIFDetail_NewDetail]
	-- Add the parameters for the stored procedure here
	 @SIFHeaderKey int
           ,@ProgramYear nvarchar(50) 
           ,@ProjectedAnnualVolume int 
           ,@PercentVolumePerAward float 
           ,@ProjectedTargetPrice float 
           ,@AnnualRevenue float

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[SIFDetail]
           ([SIFHeaderKey]
           ,[ProgramYear]
           ,[ProjectedAnnualVolume]
           ,[PercentVolumePerAward]
           ,[ProjectedTargetPrice]
           ,[AnnualRevenue])
     VALUES
           (@SIFHeaderKey 
           ,@ProgramYear
           ,@ProjectedAnnualVolume
           ,@PercentVolumePerAward 
           ,@ProjectedTargetPrice  
           ,@AnnualRevenue )

SELECT     SIFDetailkey
FROM         SIFDetail
WHERE (
 [SIFHeaderKey]=@SIFHeaderKey
AND [ProgramYear]=@ProgramYear
AND [ProjectedAnnualVolume]=@ProjectedAnnualVolume
AND [PercentVolumePerAward]=@PercentVolumePerAward
AND [ProjectedTargetPrice]=@ProjectedTargetPrice
AND [AnnualRevenue]=@AnnualRevenue 
)


END
GO
/****** Object:  StoredProcedure [dbo].[SIFDetail_EditDetail]    Script Date: 02/28/2014 16:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIFDetail_EditDetail]
	-- Add the parameters for the stored procedure here
			 @SIFDetailkey int
			,@SIFHeaderKey int
			,@ProgramYear nvarchar(50) 
			,@ProjectedAnnualVolume int 
			,@PercentVolumePerAward float 
			,@ProjectedTargetPrice float 
			,@AnnualRevenue float

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[SIFDetail]
   SET [SIFHeaderKey] = @SIFHeaderKey
      ,[ProgramYear] = @ProgramYear
      ,[ProjectedAnnualVolume] = @ProjectedAnnualVolume
      ,[PercentVolumePerAward] = @PercentVolumePerAward
      ,[ProjectedTargetPrice] = @ProjectedTargetPrice
      ,[AnnualRevenue] = @AnnualRevenue
 WHERE SIFDetailkey = @SIFDetailkey

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 02/28/2014 16:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  View [dbo].[viewRFQSummaryHeader]    Script Date: 02/28/2014 16:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQSummaryHeader]
AS
SELECT     RFQSummaryHeaderKey, BOMDetailKey, PPAPDate, InitialReleaseQty, InitialReleaseDate, PrebuildQty, PrebuildDate, PurchasingAllRecommendations, 
                      EngineeringAllConcurrences, ManufacturingAllConcurrences, QualityAllConcurrences, SalesAllConcurrences, Notes
FROM         dbo.RFQSummaryHeader
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 13
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RFQSummaryHeader"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 218
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3120
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQSummaryHeader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQSummaryHeader'
GO
/****** Object:  StoredProcedure [dbo].[RFQSummaryHeader_New]    Script Date: 02/28/2014 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQSummaryHeader_New]
	-- Add the parameters for the stored procedure here
	 @BOMDetailKey	numeric(18, 0)
	,@PPAPDate	datetime
	,@InitialReleaseQty	float
	,@InitialReleaseDate	datetime
	,@PrebuildQty	float
	,@PrebuildDate	datetime
	,@PurchasingAllRecommendations	nvarchar(150)
	,@EngineeringAllConcurrences	nvarchar(150)
	,@ManufacturingAllConcurrences	nvarchar(150)
	,@QualityAllConcurrences	nvarchar(150)
	,@SalesAllConcurrences	nvarchar(150)
	,@Notes	nvarchar(250)
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQSummaryHeader]
           (
	 [BOMDetailKey]
	,[PPAPDate]
	,[InitialReleaseQty]
	,[InitialReleaseDate]
	,[PrebuildQty]
	,[PrebuildDate]
	,[PurchasingAllRecommendations]
	,[EngineeringAllConcurrences]
	,[ManufacturingAllConcurrences]
	,[QualityAllConcurrences]
	,[SalesAllConcurrences]
	,[Notes]
)
     VALUES
    (@BOMDetailKey
	,@PPAPDate
	,@InitialReleaseQty
	,@InitialReleaseDate
	,@PrebuildQty
	,@PrebuildDate
	,@PurchasingAllRecommendations
	,@EngineeringAllConcurrences
	,@ManufacturingAllConcurrences
	,@QualityAllConcurrences
	,@SalesAllConcurrences
	,@Notes)

Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[RFQSummaryHeader_Edit]    Script Date: 02/28/2014 16:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQSummaryHeader_Edit]
	-- Add the parameters for the stored procedure here
	@RFQSummaryHeaderKey	numeric(18, 0)
	,@BOMDetailKey	numeric(18, 0)
	,@PPAPDate	datetime
	,@InitialReleaseQty	float
	,@InitialReleaseDate	datetime
	,@PrebuildQty	float
	,@PrebuildDate	datetime
	,@PurchasingAllRecommendations	nvarchar(150)
	,@EngineeringAllConcurrences	nvarchar(150)
	,@ManufacturingAllConcurrences	nvarchar(150)
	,@QualityAllConcurrences	nvarchar(150)
	,@SalesAllConcurrences	nvarchar(150)
	,@Notes	nvarchar(250)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE RFQSummaryHeader
SET  
	 BOMDetailKey = @BOMDetailKey
	,PPAPDate = @PPAPDate
	,InitialReleaseQty = @InitialReleaseQty
	,InitialReleaseDate = @InitialReleaseDate
	,PrebuildQty = @PrebuildQty
	,PrebuildDate = @PrebuildDate
	,PurchasingAllRecommendations = @PurchasingAllRecommendations
	,EngineeringAllConcurrences = @EngineeringAllConcurrences
	,ManufacturingAllConcurrences = @ManufacturingAllConcurrences
	,QualityAllConcurrences = @QualityAllConcurrences
	,SalesAllConcurrences = @SalesAllConcurrences
	,Notes = @Notes


WHERE (RFQSummaryHeaderKey = @RFQSummaryHeaderKey)

END
GO
/****** Object:  StoredProcedure [dbo].[RFQACR_NewACR]    Script Date: 02/28/2014 16:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQACR_NewACR]
	-- Add the parameters for the stored procedure here
		@RFQHeaderKey INT
           ,@Year nvarchar(4)
           ,@Porcentage float

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQACR]
           ([RFQHeaderKey]
           ,[Year]
           ,[Porcentage])
     VALUES
           (@RFQHeaderKey
           ,@Year
           ,@Porcentage)

SELECT     [RFQACRKey]
FROM         RFQACR
WHERE     (RFQHeaderKey = @RFQHeaderKey) AND ([Year] = @Year) AND (Porcentage = @Porcentage)

END
GO
/****** Object:  StoredProcedure [dbo].[RFQACR_EditACR]    Script Date: 02/28/2014 16:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQACR_EditACR]
	-- Add the parameters for the stored procedure here
		@RFQHeaderKey INT
           ,@Year nvarchar(4)
           ,@Porcentage float
,@RFQACRKey INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[RFQACR]
   SET [RFQHeaderKey] = @RFQHeaderKey
      ,[Year] = @Year
      ,[Porcentage] = @Porcentage
 WHERE RFQACRKey=@RFQACRKey

END
GO
/****** Object:  StoredProcedure [dbo].[RFQSummary_EditSummary]    Script Date: 02/28/2014 16:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQSummary_EditSummary]
	-- Add the parameters for the stored procedure here
	 @RFQSummaryKey INT
	,@RFQHeaderKey INT
	,@BCost FLOAT
	,@CCost FLOAT
	,@EAV FLOAT
	,@Sequence INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE RFQSummary
SET RFQHeaderKey = @RFQHeaderKey
, BCost = @BCost
, CCost = @CCost
, EAV = @EAV
, Sequence = @Sequence

WHERE (RFQSummaryKey = @RFQSummaryKey)

END
GO
/****** Object:  StoredProcedure [dbo].[RFQSummary_NewSummary]    Script Date: 02/28/2014 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQSummary_NewSummary]
	-- Add the parameters for the stored procedure here
	 @RFQHeaderKey INT
	,@BCost FLOAT
	,@CCost FLOAT
	,@EAV FLOAT
	,@Sequence INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQSummary]
           ([RFQHeaderKey]
           ,[BCost]
           ,[CCost]
           ,[EAV]
           ,[Sequence])
     VALUES
           (@RFQHeaderKey
           ,@BCost
           ,@CCost
           ,@EAV
           ,@Sequence)

Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[RFQNumber_NewNumber]    Script Date: 02/28/2014 16:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQNumber_NewNumber]
	-- Add the parameters for the stored procedure here
	 @BOMDetailKey INT
	,@SIFHeaderKey INT
	,@RFQNumber NVARCHAR(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQNumber]
           ([BOMDetailKey]
           ,[SIFHeaderKey]
           ,[RFQNumber])
     VALUES
           (@BOMDetailKey
			,@SIFHeaderkey
			,@RFQNumber)

	Select @@Identity

END
GO
/****** Object:  View [dbo].[viewRFQNumber]    Script Date: 02/28/2014 16:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQNumber]
AS
SELECT     dbo.RFQNumber.RFQNumberKey, dbo.RFQNumber.BOMDetailKey, dbo.RFQNumber.SIFHeaderKey, dbo.SIFHeader.InquiryNumber, dbo.RFQNumber.RFQNumber, 
                      dbo.SIFHeader.InquiryNumber + 'RFQ' + RIGHT('0000' + CONVERT(VARCHAR, dbo.RFQNumber.RFQNumber), 5) AS RFQGenerated
FROM         dbo.SIFHeader INNER JOIN
                      dbo.RFQNumber ON dbo.SIFHeader.SIFHeaderKey = dbo.RFQNumber.SIFHeaderKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[51] 4[35] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[78] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[67] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RFQNumber"
            Begin Extent = 
               Top = 6
               Left = 12
               Bottom = 150
               Right = 155
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIFHeader"
            Begin Extent = 
               Top = 3
               Left = 332
               Bottom = 489
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1230
         Width = 1260
         Width = 1065
         Width = 1065
         Width = 1695
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3195
         Alias = 1260
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQNumber'
GO
/****** Object:  StoredProcedure [dbo].[BOMDetail_EditDetail]    Script Date: 02/28/2014 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOMDetail_EditDetail]
	-- Add the parameters for the stored procedure here
	 @BOMHeaderKey INT
	,@ItemMasterKey INT
	,@Qty float 
	,@Cost float 
	,@Status nvarchar(25) 
	,@Description nvarchar(150) 
	,@BOMDetailKey INT
	,@LinePosition nvarchar(15)
	,@SalesStatus nvarchar(25)
	,@User nvarchar(256)
	,@PurchasingStatus nvarchar(25)
	,@DirectedBuy bit
	,@Material nvarchar(150)
	,@Um nvarchar(20)
	,@VendorQuoteEst nvarchar(20)
	,@SalesComments nvarchar(50)
	,@PurchasingComments nvarchar(50)
	,@CapComAssm nvarchar(20)
	,@CapsonicPN nvarchar(50)
	,@CustomerPN nvarchar(50)
	,@ManufacturePN nvarchar(50)
	,@SupplierPN nvarchar(50)
	,@CommCode nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


UPDATE [APQM_DB].[dbo].[BOMDetail]
   SET [BOMHeaderKey] = @BOMHeaderKey
      ,[ItemMasterKey] = @ItemMasterKey
      ,[Qty] = @Qty
      ,[Cost] = @Cost
      ,[Status] = @Status
	  ,[Description] = @Description
	  ,[LinePosition] = @LinePosition
	  ,[SalesStatus] = @SalesStatus
	  ,[User] = @User
	  ,[PurchasingStatus] = @PurchasingStatus
	  ,[DirectedBuy] = @DirectedBuy
	  ,[Material] = @Material
	  ,[Um] = @Um
	  ,[VendorQuoteEst] = @VendorQuoteEst
	  ,[SalesComments] = @SalesComments
	  ,[PurchasingComments] = @PurchasingComments
	  ,[CapComAssm] = @CapComAssm
	  ,[CapsonicPN] = @CapsonicPN
	  ,[CustomerPN] = @CustomerPN
	  ,[ManufacturePN] = @ManufacturePN
	  ,[SupplierPN] = @SupplierPN
	  ,[CommCode] = @CommCode
 WHERE BOMDetailKey = @BOMDetailKey


END
GO
/****** Object:  StoredProcedure [dbo].[BOMDetail_NewDetail]    Script Date: 02/28/2014 16:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOMDetail_NewDetail]
	-- Add the parameters for the stored procedure here
	 @BOMHeaderKey INT
	,@ItemMasterKey INT
	,@Qty float 
	,@Cost float 
	,@Status nvarchar(25) 
	,@Description nvarchar(150)
	,@LinePosition nvarchar (15)
	,@SalesStatus nvarchar (25)
	,@User nvarchar(256)
	,@PurchasingStatus nvarchar(25)
	,@DirectedBuy bit
	,@Material nvarchar(150)
	,@Um nvarchar(20)
	,@VendorQuoteEst nvarchar(20)
	,@SalesComments nvarchar(50)
	,@PurchasingComments nvarchar(50)
	,@CapComAssm nvarchar(20)
	,@CapsonicPN nvarchar(50)
	,@CustomerPN nvarchar(50)
	,@ManufacturePN nvarchar(50)
	,@SupplierPN nvarchar(50)
	,@CommCode nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


INSERT INTO [APQM_DB].[dbo].[BOMDetail]
           ([BOMHeaderKey]
           ,[ItemMasterKey]
           ,[Qty]
           ,[Cost]
           ,[Status]
		   ,[Description]
		   ,[LinePosition]
		   ,[SalesStatus]
		   ,[User]
		   ,[PurchasingStatus]
		   ,[DirectedBuy]
		   ,[Material]
		   ,[Um]
		   ,[VendorQuoteEst]
		   ,[SalesComments]
		   ,[PurchasingComments]
		   ,[CapComAssm]
		   ,[CapsonicPN]
		   ,[CustomerPN]
		   ,[ManufacturePN]
		   ,[SupplierPN]
		   ,[CommCode])
     VALUES
           (@BOMHeaderKey 
			,@ItemMasterKey 
			,@Qty  
			,@Cost  
			,@Status
			,@Description
			,@LinePosition
			,@SalesStatus
			,@User
			,@PurchasingStatus
			,@DirectedBuy 
			,@Material
			,@Um
			,@VendorQuoteEst
			,@SalesComments
			,@PurchasingComments
			,@CapComAssm
			,@CapsonicPN
			,@CustomerPN
			,@ManufacturePN
			,@SupplierPN
			,@CommCode)

Select @@Identity

END
GO
/****** Object:  View [dbo].[viewRFQCountPerBOMDetail]    Script Date: 02/28/2014 16:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQCountPerBOMDetail]
AS
SELECT     dbo.BOMHeader.SIFHeaderKey, dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Revision, dbo.BOMDetail.BOMHeaderKey, dbo.BOMHeader.TopPartNumber, 
                      dbo.BOMHeader.PartDescription, dbo.BOMHeader.AnnualVolume, dbo.BOMDetail.BOMDetailKey, dbo.BOMDetail.ItemMasterKey, dbo.ItemMaster.PartNumber, 
                      dbo.BOMDetail.Material, dbo.BOMDetail.VendorQuoteEst, dbo.BOMDetail.Qty, dbo.BOMDetail.Cost, dbo.BOMDetail.CapComAssm, dbo.BOMDetail.DirectedBuy, 
                      dbo.BOMDetail.PurchasingStatus, dbo.BOMDetail.PurchasingComments, dbo.BOMDetail.SalesComments, COUNT(dbo.RFQHeader.RFQHeaderKey) AS RFQCount, 
                      dbo.MarketSector.Name AS MarketSector, dbo.BOMDetail.CapsonicPN, dbo.BOMDetail.CustomerPN, dbo.BOMDetail.ManufacturePN, dbo.BOMDetail.SupplierPN, 
                      dbo.BOMDetail.CommCode, dbo.BOMDetail.[User], dbo.BOMDetail.EAU
FROM         dbo.BOMDetail INNER JOIN
                      dbo.BOMHeader ON dbo.BOMDetail.BOMHeaderKey = dbo.BOMHeader.BOMHeaderKey INNER JOIN
                      dbo.SIFHeader ON dbo.BOMHeader.SIFHeaderKey = dbo.SIFHeader.SIFHeaderKey INNER JOIN
                      dbo.ItemMaster ON dbo.BOMDetail.ItemMasterKey = dbo.ItemMaster.ItemMasterKey LEFT OUTER JOIN
                      dbo.MarketSector ON dbo.SIFHeader.MarketSector = dbo.MarketSector.MarketSectorID LEFT OUTER JOIN
                      dbo.RFQHeader ON dbo.BOMDetail.BOMDetailKey = dbo.RFQHeader.BOMDetailKey
GROUP BY dbo.BOMDetail.BOMDetailKey, dbo.BOMDetail.BOMHeaderKey, dbo.BOMDetail.ItemMasterKey, dbo.BOMDetail.Qty, dbo.BOMDetail.Cost, 
                      dbo.BOMHeader.TopPartNumber, dbo.BOMHeader.PartDescription, dbo.ItemMaster.PartNumber, dbo.SIFHeader.InquiryNumber, dbo.BOMHeader.SIFHeaderKey, 
                      dbo.SIFHeader.Revision, dbo.BOMDetail.Material, dbo.BOMHeader.AnnualVolume, dbo.BOMDetail.PurchasingStatus, dbo.BOMDetail.PurchasingComments, 
                      dbo.BOMDetail.CapComAssm, dbo.BOMDetail.VendorQuoteEst, dbo.BOMDetail.SalesComments, dbo.BOMDetail.DirectedBuy, dbo.MarketSector.Name, 
                      dbo.BOMDetail.CapsonicPN, dbo.BOMDetail.CustomerPN, dbo.BOMDetail.ManufacturePN, dbo.BOMDetail.SupplierPN, dbo.BOMDetail.CommCode, 
                      dbo.BOMDetail.[User], dbo.BOMDetail.EAU
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[77] 4[1] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[33] 4[11] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[60] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[11] 4[60] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[43] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BOMDetail"
            Begin Extent = 
               Top = 15
               Left = 769
               Bottom = 446
               Right = 963
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BOMHeader"
            Begin Extent = 
               Top = 29
               Left = 299
               Bottom = 203
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIFHeader"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 466
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ItemMaster"
            Begin Extent = 
               Top = 141
               Left = 535
               Bottom = 395
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MarketSector"
            Begin Extent = 
               Top = 339
               Left = 261
               Bottom = 428
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 0
               Left = 1037
               Bottom = 515
               Right = 1239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
         Width = 284
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountPerBOMDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 1710
         Alias = 1125
         Table = 1050
         Output = 675
         Append = 1400
         NewValue = 1170
         SortType = 885
         SortOrder = 930
         GroupBy = 855
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountPerBOMDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountPerBOMDetail'
GO
/****** Object:  View [dbo].[viewRFQCompleted]    Script Date: 02/28/2014 16:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQCompleted]
AS
SELECT     dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Revision, dbo.BOMHeader.PartDescription, b.BOMDetailKey, dbo.ItemMaster.PartNumber, b.Material, b.Qty,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.RFQHeader AS r
                            WHERE      (Status = 'COMPLETED' OR
                                                   Status = 'AWARDED' OR
                                                   Status = 'SELECTED' OR
                                                   Status = 'DISMISSED' OR
                                                   Status = 'DECLINED') AND (BOMDetailKey = b.BOMDetailKey)) AS [RFQ COMPLETED], COUNT(*) AS [RFQ Sent], b.[User]
FROM         dbo.SIFHeader INNER JOIN
                      dbo.BOMHeader ON dbo.SIFHeader.SIFHeaderKey = dbo.BOMHeader.SIFHeaderKey INNER JOIN
                      dbo.BOMDetail AS b ON dbo.BOMHeader.BOMHeaderKey = b.BOMHeaderKey INNER JOIN
                      dbo.ItemMaster ON b.ItemMasterKey = dbo.ItemMaster.ItemMasterKey INNER JOIN
                      dbo.RFQHeader ON b.BOMDetailKey = dbo.RFQHeader.BOMDetailKey INNER JOIN
                      dbo.SupplierMaster ON dbo.RFQHeader.SupplierMasterKey = dbo.SupplierMaster.SupplierMasterKey
GROUP BY dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Revision, dbo.BOMHeader.PartDescription, b.BOMDetailKey, dbo.ItemMaster.PartNumber, b.Material, b.Qty, 
                      b.[User]
HAVING      ((SELECT     COUNT(*) AS Expr1
                         FROM         dbo.RFQHeader AS r
                         WHERE     (Status = 'COMPLETED' OR
                                                Status = 'AWARDED' OR
                                                Status = 'SELECTED' OR
                                                Status = 'DISMISSED' OR
                                                Status = 'DECLINED') AND (BOMDetailKey = b.BOMDetailKey)) > 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[15] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[26] 4[35] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[59] 4[11] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[80] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SIFHeader"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 479
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BOMHeader"
            Begin Extent = 
               Top = 86
               Left = 250
               Bottom = 240
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 15
               Left = 426
               Bottom = 376
               Right = 602
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ItemMaster"
            Begin Extent = 
               Top = 222
               Left = 631
               Bottom = 374
               Right = 777
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 0
               Left = 839
               Bottom = 412
               Right = 1042
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SupplierMaster"
            Begin Extent = 
               Top = 30
               Left = 1098
               Bottom = 235
               Right = 1283
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1305
         Width = 8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCompleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'85
         Width = 3555
         Width = 1305
         Width = 1260
         Width = 1590
         Width = 465
         Width = 1440
         Width = 1170
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1290
         Alias = 1095
         Table = 1260
         Output = 675
         Append = 1400
         NewValue = 1170
         SortType = 885
         SortOrder = 930
         GroupBy = 855
         Filter = 1755
         Or = 495
         Or = 495
         Or = 495
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCompleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCompleted'
GO
/****** Object:  StoredProcedure [dbo].[ItemMaster_EditItem]    Script Date: 02/28/2014 16:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ItemMaster_EditItem]
	-- Add the parameters for the stored procedure here
	@PartNumber NVARCHAR(50)
	,@PartDescription NVARCHAR(150)
	,@UM NVARCHAR(20)
	,@PartMaterial NVARCHAR(150)
	,@ItemMasterKey numeric(18,0)
	,@Cost FLOAT
	,@CapsonicPN nvarchar(50)
	,@CustomerPN nvarchar(50)
	,@ManufacturePN nvarchar(50)
	,@SupplierPN nvarchar(50)
	,@CommCode nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[ItemMaster]
   SET [Description] = @PartDescription
      ,[UM] = @UM
      ,[Material] = @PartMaterial
	  ,[PartNumber] = @PartNumber
	  ,[Cost] = @Cost
	  ,[CapsonicPN] = @CapsonicPN
	  ,[CustomerPN] = @CustomerPN
	  ,[ManufacturePN] = @ManufacturePN
	  ,[SupplierPN] = @SupplierPN
	  ,[CommCode] = @CommCode
	  
 WHERE [ItemMasterKey] = @ItemMasterKey

END
GO
/****** Object:  StoredProcedure [dbo].[ItemMaster_NewItem]    Script Date: 02/28/2014 16:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ItemMaster_NewItem]
	-- Add the parameters for the stored procedure here
	@PartNumber NVARCHAR(50)
	,@PartDescription NVARCHAR(150)
	,@UM NVARCHAR(20)
	,@PartMaterial NVARCHAR(150)
	,@Cost FLOAT
	,@CapsonicPN nvarchar(50)
	,@CustomerPN nvarchar(50)
	,@ManufacturePN nvarchar(50)
	,@SupplierPN nvarchar(50)
	,@CommCode nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [APQM_DB].[dbo].[ItemMaster]
           ([PartNumber]
           ,[Description]
           ,[UM]
           ,[Material]
		   ,[Cost]
		   ,[CapsonicPN]
		   ,[CustomerPN]
		   ,[ManufacturePN]
		   ,[SupplierPN]
		   ,[CommCode])
     VALUES
           (@PartNumber
           ,@PartDescription
           ,@UM
           ,@PartMaterial
           ,@Cost
           ,@CapsonicPN
           ,@CustomerPN
           ,@ManufacturePN
           ,@SupplierPN
           ,@CommCode)


Select @@Identity

END
GO
/****** Object:  View [dbo].[viewBOMDetail_ReadAll]    Script Date: 02/28/2014 16:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewBOMDetail_ReadAll]
AS
SELECT     dbo.BOMDetail.BOMDetailKey, dbo.BOMDetail.BOMHeaderKey, dbo.BOMDetail.ItemMasterKey, dbo.BOMDetail.Qty, dbo.BOMDetail.Cost, dbo.BOMDetail.Status, 
                      dbo.BOMDetail.Description, dbo.ItemMaster.PartNumber, dbo.BOMDetail.LinePosition, dbo.BOMDetail.SalesStatus, dbo.BOMDetail.[User], 
                      dbo.BOMDetail.PurchasingStatus, dbo.BOMDetail.DirectedBuy, dbo.BOMDetail.Material, dbo.BOMDetail.Um, dbo.BOMDetail.VendorQuoteEst, 
                      dbo.BOMDetail.SalesComments, dbo.BOMDetail.PurchasingComments, dbo.BOMDetail.CapComAssm, dbo.BOMDetail.CapsonicPN, dbo.BOMDetail.CustomerPN, 
                      dbo.BOMDetail.ManufacturePN, dbo.BOMDetail.SupplierPN, dbo.BOMDetail.CommCode, dbo.BOMDetail.EAU
FROM         dbo.BOMDetail LEFT OUTER JOIN
                      dbo.ItemMaster ON dbo.BOMDetail.ItemMasterKey = dbo.ItemMaster.ItemMasterKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[34] 4[49] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[57] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -179
      End
      Begin Tables = 
         Begin Table = "BOMDetail"
            Begin Extent = 
               Top = 7
               Left = 228
               Bottom = 315
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "ItemMaster"
            Begin Extent = 
               Top = 37
               Left = 515
               Bottom = 261
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2460
         Alias = 1395
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewBOMDetail_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewBOMDetail_ReadAll'
GO
/****** Object:  StoredProcedure [dbo].[SupplierMaster_NewSupplier]    Script Date: 02/28/2014 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierMaster_NewSupplier]
	-- Add the parameters for the stored procedure here

			@SupplierName nvarchar(80)
           ,@ContactName nvarchar(150) 
           ,@ContactPhoneNumber nvarchar(150) 
		   ,@ContactCellPhoneNumber nvarchar(150) 
           ,@ContactEmail nvarchar(200) 
           ,@ManufacturingLocation nvarchar(max) 
           ,@ShipLocation nvarchar(max) 
           ,@QuotedCurrency nvarchar(50)
           ,@Capabilities nvarchar(200)
           ,@Comments nvarchar(200)
           ,@Visible bit
           ,@Commodity nvarchar(150)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[SupplierMaster]
           ([SupplierName]
           ,[ContactName]
           ,[ContactPhoneNumber]
           ,[ContactCellPhoneNumber]
           ,[ContactEmail]
           ,[ManufacturingLocation]
           ,[ShipLocation]
           ,[QuotedCurrency]
           ,[Capabilities]
           ,[Comments]
           ,[Visible]
           ,[Commodity]
)
     VALUES
           (@SupplierName
           ,@ContactName
           ,@ContactPhoneNumber
           ,@ContactCellPhoneNumber
           ,@ContactEmail
           ,@ManufacturingLocation
           ,@ShipLocation
           ,@QuotedCurrency
           ,@Capabilities
           ,@Comments
           ,@Visible
           ,@Commodity)


Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierMaster_EditSupplier]    Script Date: 02/28/2014 16:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierMaster_EditSupplier]
	-- Add the parameters for the stored procedure here

			@SupplierName nvarchar(80)
           ,@ContactName nvarchar(150) 
           ,@ContactPhoneNumber nvarchar(150) 
		   ,@ContactCellPhoneNumber nvarchar(150) 
           ,@ContactEmail nvarchar(200) 
           ,@ManufacturingLocation nvarchar(max) 
           ,@ShipLocation nvarchar(max) 
           ,@QuotedCurrency nvarchar(50) 
		   ,@SupplierKey INT
		   ,@Capabilities nvarchar(200)
           ,@Comments nvarchar(200)
           ,@Visible bit
           ,@Commodity nvarchar(150)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




UPDATE    SupplierMaster
SET       SupplierName = @SupplierName
		, ContactName = @ContactName
		, ContactPhoneNumber = @ContactPhoneNumber
		, ContactCellPhoneNumber = @ContactCellPhoneNumber
		, ContactEmail = @ContactEmail
		, ManufacturingLocation = @ManufacturingLocation
		, ShipLocation = @ShipLocation
		, QuotedCurrency = @QuotedCurrency
		, Capabilities = @Capabilities
		, Comments = @Comments
		, Visible = @Visible
		, Commodity = @Commodity
WHERE     (SupplierMasterKey = @SupplierKey)


END
GO
/****** Object:  View [dbo].[viewBOMHeader_ReadAll]    Script Date: 02/28/2014 16:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewBOMHeader_ReadAll]
AS
SELECT     dbo.BOMHeader.BOMHeaderKey, dbo.BOMHeader.SIFHeaderKey, dbo.BOMHeader.TopPartNumber, dbo.BOMHeader.PartDescription, dbo.SIFHeader.InquiryNumber, 
                      dbo.SIFHeader.Revision, dbo.BOMHeader.AnnualVolume, dbo.SIFHeader.SalesPerson, dbo.CustomerMaster.CustomerName, 
                      dbo.MarketSector.Name AS MarketSector, dbo.SIFHeader.AssignedTo
FROM         dbo.BOMHeader INNER JOIN
                      dbo.SIFHeader ON dbo.BOMHeader.SIFHeaderKey = dbo.SIFHeader.SIFHeaderKey LEFT OUTER JOIN
                      dbo.MarketSector ON dbo.SIFHeader.MarketSector = dbo.MarketSector.MarketSectorID LEFT OUTER JOIN
                      dbo.CustomerMaster ON dbo.SIFHeader.CustomerKey = dbo.CustomerMaster.CustomerKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[31] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[55] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BOMHeader"
            Begin Extent = 
               Top = 2
               Left = 11
               Bottom = 212
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIFHeader"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 262
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "MarketSector"
            Begin Extent = 
               Top = 153
               Left = 559
               Bottom = 242
               Right = 723
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerMaster"
            Begin Extent = 
               Top = 21
               Left = 574
               Bottom = 110
               Right = 736
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2370
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewBOMHeader_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewBOMHeader_ReadAll'
GO
/****** Object:  StoredProcedure [dbo].[BOMHeader_NewBOM]    Script Date: 02/28/2014 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOMHeader_NewBOM]
	-- Add the parameters for the stored procedure here
	 @SIFHeaderKey INT
	,@TopPartNumber NVARCHAR(50)
	,@PartDescription NVARCHAR(50)
	,@Revision  nvarchar(5)
	,@AnnualVolume  numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[BOMHeader]
           ([SIFHeaderKey]
           ,[TopPartNumber]
           ,[PartDescription]
           ,[Revision]
           ,[AnnualVolume])
     VALUES
           (@SIFHeaderKey
           ,@TopPartNumber
           ,@PartDescription
           ,@Revision
           ,@AnnualVolume)


SELECT  @@Identity


END
GO
/****** Object:  StoredProcedure [dbo].[BOMHeader_EditBOM]    Script Date: 02/28/2014 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOMHeader_EditBOM]
	-- Add the parameters for the stored procedure here
	 @SIFHeaderKey INT
	,@TopPartNumber NVARCHAR(50)
	,@PartDescription NVARCHAR(50)
	,@Revision  nvarchar(5)
	,@BOMHeaderKey INT
	,@AnnualVolume  numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE    BOMHeader
SET       SIFHeaderKey = @SIFHeaderKey
		, TopPartNumber = @TopPartNumber
		, PartDescription = @PartDescription
		, Revision = @Revision
		, AnnualVolume = @AnnualVolume
WHERE     (BOMHeaderKey = @BOMHeaderKey)

END
GO
/****** Object:  View [dbo].[viewSIF_ReadAll]    Script Date: 02/28/2014 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewSIF_ReadAll]
AS
SELECT     dbo.SIFHeader.SIFHeaderKey, dbo.SIFHeader.CustomerKey, dbo.BOMHeader.BOMHeaderKey, dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Priority, 
                      dbo.SIFHeader.Revision, dbo.SIFHeader.SalesPerson, dbo.SIFHeader.CostModelLoc, dbo.SIFHeader.Contact, dbo.SIFHeader.BussinesClass, dbo.SIFHeader.Product, 
                      dbo.SIFHeader.DivLoc, dbo.SIFHeader.Department, dbo.SIFHeader.Reason4Quote, dbo.SIFHeader.Application, dbo.SIFHeader.Specification, 
                      dbo.SIFHeader.DrawingLevel, dbo.SIFHeader.TaskDescription, dbo.SIFHeader.PartPrint, dbo.SIFHeader.Sample, dbo.SIFHeader.ToolingTarget, 
                      dbo.SIFHeader.PrimaryCompetitors, dbo.SIFHeader.SpecificResourceRequirements, dbo.SIFHeader.Technical, dbo.BOMHeader.TopPartNumber, 
                      dbo.CustomerMaster.CustomerName, dbo.SIFHeader.QuoteDue, dbo.SIFHeader.SOP, dbo.SIFHeader.SalesDBID, dbo.SIFHeader.MarketSector, 
                      dbo.SIFHeader.AssignedTo, dbo.SIFHeader.CreatedDate
FROM         dbo.CustomerMaster RIGHT OUTER JOIN
                      dbo.SIFHeader ON dbo.CustomerMaster.CustomerKey = dbo.SIFHeader.CustomerKey LEFT OUTER JOIN
                      dbo.BOMHeader ON dbo.SIFHeader.SIFHeaderKey = dbo.BOMHeader.SIFHeaderKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[70] 4[4] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CustomerMaster"
            Begin Extent = 
               Top = 214
               Left = 515
               Bottom = 312
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIFHeader"
            Begin Extent = 
               Top = 16
               Left = 82
               Bottom = 471
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "BOMHeader"
            Begin Extent = 
               Top = 0
               Left = 519
               Bottom = 139
               Right = 683
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSIF_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSIF_ReadAll'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 02/28/2014 16:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 02/28/2014 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 02/28/2014 16:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 02/28/2014 16:55:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 02/28/2014 16:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 02/28/2014 16:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 02/28/2014 16:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 02/28/2014 16:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 02/28/2014 16:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 02/28/2014 16:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 02/28/2014 16:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 02/28/2014 16:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 02/28/2014 16:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 02/28/2014 16:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 02/28/2014 16:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 02/28/2014 16:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 02/28/2014 16:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 02/28/2014 16:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 02/28/2014 16:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 02/28/2014 16:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 02/28/2014 16:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 02/28/2014 16:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 02/28/2014 16:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 02/28/2014 16:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 02/28/2014 16:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 02/28/2014 16:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 02/28/2014 16:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 02/28/2014 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 02/28/2014 16:55:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 02/28/2014 16:55:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 02/28/2014 16:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 02/28/2014 16:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyCertification_EditCertification]    Script Date: 02/28/2014 16:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyCertification_EditCertification]
	-- Add the parameters for the stored procedure here
	 @SupplierCertificationKey INT
	,@SupplierSurveyKey INT
    ,@Certifications nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [APQM_DB].[dbo].[SupplierSurveyCertification]
   SET [SupplierSurveyKey] = @SupplierSurveyKey
      ,[Certifications] = @SupplierSurveyKey
 WHERE SupplierCertificationKey=@SupplierCertificationKey

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyCertification_NewCertification]    Script Date: 02/28/2014 16:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyCertification_NewCertification]
	-- Add the parameters for the stored procedure here
	 @SupplierSurveyKey INT
    ,@Certifications nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[SupplierSurveyCertification]
           ([SupplierSurveyKey]
           ,[Certifications])
     VALUES
           (@SupplierSurveyKey
           ,@Certifications)

SELECT [SupplierCertificationKey]
  FROM [APQM_DB].[dbo].[SupplierSurveyCertification]
WHERE ([SupplierSurveyKey]=@SupplierSurveyKey
		AND [Certifications]=@Certifications)

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 02/28/2014 16:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 02/28/2014 16:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 02/28/2014 16:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 02/28/2014 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyForecastSales_NewForecast]    Script Date: 02/28/2014 16:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyForecastSales_NewForecast]
	-- Add the parameters for the stored procedure here
	 @SupplierSurveyKey INT
    ,@ForecastSalesYear nvarchar(4)
    ,@ForecastSales nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [APQM_DB].[dbo].[SupplierSurveyForecastSales]
           ([SupplierSurveyKey]
           ,[ForecastSalesYear]
           ,[ForecastSales])
     VALUES
           (@SupplierSurveyKey
           ,@ForecastSalesYear
           ,@ForecastSales)

SELECT [SurveyForecastedSalesKey]
  FROM [APQM_DB].[dbo].[SupplierSurveyForecastSales]
WHERE ([SupplierSurveyKey]=@SupplierSurveyKey AND [ForecastSalesYear]=@ForecastSalesYear AND [ForecastSales]=@ForecastSales)

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyForecastSales_EditForecast]    Script Date: 02/28/2014 16:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyForecastSales_EditForecast]
	-- Add the parameters for the stored procedure here
	@SurveyForecastedSalesKey INT
	,@SupplierSurveyKey INT
    ,@ForecastSalesYear nvarchar(4)
    ,@ForecastSales nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [APQM_DB].[dbo].[SupplierSurveyForecastSales]
   SET [SupplierSurveyKey] = @SupplierSurveyKey
      ,[ForecastSalesYear] = @ForecastSalesYear
      ,[ForecastSales] = @ForecastSales
 WHERE [SurveyForecastedSalesKey]=@SurveyForecastedSalesKey

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyContacts_EditContact]    Script Date: 02/28/2014 16:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyContacts_EditContact]
	-- Add the parameters for the stored procedure here
		@SupplierSuveryContactsKey INT
		,@SupplierSurveyKey  INT 
		,@Position  nvarchar(50) 
		,@Name  nvarchar(50) 
		,@Title  nvarchar(50) 
		,@Address  nvarchar(50) 
		,@Phone  nvarchar(50) 
		,@Cell  nvarchar(50) 
		,@Email  nvarchar(50) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [APQM_DB].[dbo].[SupplierSurveyContacts]
   SET [SupplierSurveyKey] = @SupplierSurveyKey 
      ,[Position] = @Position 
      ,[Name] = @Name 
      ,[Title] = @Title 
      ,[Address] = @Address 
      ,[Phone] = @Phone 
      ,[Cell] = @Cell 
      ,[Email] = @Email 
 WHERE [SupplierSuveryContactsKey]=@SupplierSuveryContactsKey
END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyContacts_NewContact]    Script Date: 02/28/2014 16:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurveyContacts_NewContact]
	-- Add the parameters for the stored procedure here
		@SupplierSurveyKey  numeric 
		,@Position  nvarchar(50) 
		,@Name  nvarchar(50) 
		,@Title  nvarchar(50) 
		,@Address  nvarchar(50) 
		,@Phone  nvarchar(50) 
		,@Cell  nvarchar(50) 
		,@Email  nvarchar(50) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [APQM_DB].[dbo].[SupplierSurveyContacts]
           ([SupplierSurveyKey]
           ,[Position]
           ,[Name]
           ,[Title]
           ,[Address]
           ,[Phone]
           ,[Cell]
           ,[Email])
     VALUES
           (@SupplierSurveyKey 
		,@Position   
		,@Name   
		,@Title   
		,@Address   
		,@Phone   
		,@Cell   
		,@Email   )


SELECT [SupplierSuveryContactsKey]
  FROM [APQM_DB].[dbo].[SupplierSurveyContacts]
WHERE [SupplierSurveyKey] = @SupplierSurveyKey 
      AND [Position] = @Position 
      AND [Name] = @Name 
      AND [Title] = @Title 
      AND [Address] = @Address 
      AND [Phone] = @Phone 
      AND [Cell] = @Cell 
      AND [Email] = @Email 

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 02/28/2014 16:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 02/28/2014 16:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 02/28/2014 16:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurvey_NewSurvey]    Script Date: 02/28/2014 16:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurvey_NewSurvey]
	-- Add the parameters for the stored procedure here

@SupplierMasterKey  int 
,@StreetAddress  nvarchar(50) 
,@City  nvarchar(50) 
,@State  nvarchar(50) 
,@ZipCode  nvarchar(50) 
,@Website  nvarchar(50) 
,@SentToVendor  datetime 
,@LastSurvey  datetime 
,@NDARec  datetime 
,@PrimaryBusiness  nvarchar(50) 
,@SecundaryBusiness  nvarchar(50) 
,@UnionYN  bit 
,@Local  nvarchar(50) 
,@ContractExpiration  nvarchar(50) 
,@CurrentCapacity  nvarchar(50) 
,@ManufacturingMetod  nvarchar(max) 
,@ToolingNewInHouseYN  bit 
,@ToolingNewOutsourcedYN  bit 
,@ToolingInHouseYN  bit 
,@ToolingOutsourcedYN  bit 
,@Notes  nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[SupplierSuvey]
           ([SupplierMasterKey]
           ,[StreetAddress]
           ,[City]
           ,[State]
           ,[ZipCode]
           ,[Website]
           ,[LastSurvey]
           ,[NDARec]
           ,[PrimaryBusiness]
           ,[SecundaryBusiness]
           ,[UnionYN]
           ,[Local]
           ,[ContractExpiration]
           ,[CurrentCapacity]
           ,[ManufacturingMetod]
           ,[ToolingNewInHouseYN]
           ,[ToolingNewOutsourcedYN]
           ,[ToolingInHouseYN]
           ,[ToolingOutsourcedYN]
           ,[Notes]
		   ,[SentToVendor])
     VALUES
           (@SupplierMasterKey    
			,@StreetAddress   
			,@City   
			,@State   
			,@ZipCode   
			,@Website   
			,@LastSurvey   
			,@NDARec   
			,@PrimaryBusiness   
			,@SecundaryBusiness   
			,@UnionYN    
			,@Local   
			,@ContractExpiration   
			,@CurrentCapacity   
			,@ManufacturingMetod   
			,@ToolingNewInHouseYN    
			,@ToolingNewOutsourcedYN    
			,@ToolingInHouseYN    
			,@ToolingOutsourcedYN    
			,@Notes
			,@SentToVendor)

SELECT [SupplierSuveyKey]
  FROM [APQM_DB].[dbo].[SupplierSuvey]
  WHERE (
		[SupplierMasterKey]=@SupplierMasterKey 
		AND [StreetAddress]=@StreetAddress
		AND [City]=@City
		AND [State]=@State
		AND [ZipCode]=@ZipCode
		AND [Website]=@Website
		AND [LastSurvey]=@LastSurvey
		AND [NDARec]=@NDARec
		AND [PrimaryBusiness]=@PrimaryBusiness
		AND [SecundaryBusiness]=@SecundaryBusiness
		AND [UnionYN]=@UnionYN
		AND [Local]=@Local
		AND [ContractExpiration]=@ContractExpiration
		AND [CurrentCapacity]=@CurrentCapacity
		AND [ManufacturingMetod]=@ManufacturingMetod
		AND [ToolingNewInHouseYN]=@ToolingNewInHouseYN
		AND [ToolingNewOutsourcedYN]=@ToolingNewOutsourcedYN
		AND [ToolingInHouseYN]=@ToolingInHouseYN
		AND [ToolingOutsourcedYN]=@ToolingOutsourcedYN
		AND [Notes]=@Notes)
		AND [SentToVendor]=@SentToVendor

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurvey_EditSurvey]    Script Date: 02/28/2014 16:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierSurvey_EditSurvey]
	-- Add the parameters for the stored procedure here

@SupplierSuveyKey int
,@SupplierMasterKey  int 
,@StreetAddress  nvarchar(50) 
,@City  nvarchar(50) 
,@State  nvarchar(50) 
,@ZipCode  nvarchar(50) 
,@Website  nvarchar(50) 
,@LastSurvey  datetime 
,@NDARec  datetime 
,@PrimaryBusiness  nvarchar(50) 
,@SecundaryBusiness  nvarchar(50) 
,@UnionYN  bit 
,@Local  nvarchar(50) 
,@ContractExpiration  nvarchar(50) 
,@CurrentCapacity  nvarchar(50) 
,@ManufacturingMetod  nvarchar(max) 
,@ToolingNewInHouseYN  bit 
,@ToolingNewOutsourcedYN  bit 
,@ToolingInHouseYN  bit 
,@ToolingOutsourcedYN  bit 
,@Notes  nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE [APQM_DB].[dbo].[SupplierSuvey]
   SET [SupplierMasterKey]=@SupplierMasterKey 
		,[StreetAddress]=@StreetAddress
		,[City]=@City
		,[State]=@State
		,[ZipCode]=@ZipCode
		,[Website]=@Website		
		,[LastSurvey]=@LastSurvey
		,[NDARec]=@NDARec
		,[PrimaryBusiness]=@PrimaryBusiness
		,[SecundaryBusiness]=@SecundaryBusiness
		,[UnionYN]=@UnionYN
		,[Local]=@Local
		,[ContractExpiration]=@ContractExpiration
		,[CurrentCapacity]=@CurrentCapacity
		,[ManufacturingMetod]=@ManufacturingMetod
		,[ToolingNewInHouseYN]=@ToolingNewInHouseYN
		,[ToolingNewOutsourcedYN]=@ToolingNewOutsourcedYN
		,[ToolingInHouseYN]=@ToolingInHouseYN
		,[ToolingOutsourcedYN]=@ToolingOutsourcedYN
		,[Notes]=@Notes
 WHERE SupplierSuveyKey=@SupplierSuveyKey

END
GO
/****** Object:  StoredProcedure [dbo].[TokenMaster_NewToken]    Script Date: 02/28/2014 16:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TokenMaster_NewToken]
	-- Add the parameters for the stored procedure here
		@Token nvarchar(50)
           ,@Subject nvarchar(50)
           ,@SubjectKey INT
           ,@DeadDate datetime
           ,@Acknowledgement nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[TokenMaster]
           ([Token]
           ,[Subject]
           ,[SubjectKey]
           ,[DeadDate]
           ,[Acknowledgement])
     VALUES
           (@Token
           ,@Subject
           ,@SubjectKey
           ,@DeadDate
           ,@Acknowledgement)

SELECT [TokenKey]
  FROM [APQM_DB].[dbo].[TokenMaster]
WHERE ([Token]=@Token
           AND [Subject]=@Subject
           AND [SubjectKey]=@SubjectKey
           AND [DeadDate]=@DeadDate
           AND [Acknowledgement]=@Acknowledgement)


END
GO
/****** Object:  StoredProcedure [dbo].[TokenMaster_EditToken]    Script Date: 02/28/2014 16:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TokenMaster_EditToken]
	-- Add the parameters for the stored procedure here
@TokenKey INT		
,@Token nvarchar(50)
,@Subject nvarchar(50)
,@SubjectKey INT
,@DeadDate datetime
,@Acknowledgement nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE [APQM_DB].[dbo].[TokenMaster]
   SET [Token] = @Token
      ,[Subject] = @Subject
      ,[SubjectKey] = @SubjectKey
      ,[DeadDate] = @DeadDate
      ,[Acknowledgement] = @Acknowledgement
WHERE [TokenKey]=@TokenKey



END
GO
/****** Object:  StoredProcedure [dbo].[CustomerMaster_EditCustomer]    Script Date: 02/28/2014 16:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustomerMaster_EditCustomer]
	-- Add the parameters for the stored procedure here
		@CustomerKey int,
		@CustomerName nvarchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [APQM_DB].[dbo].[CustomerMaster]
   SET [CustomerName] = @CustomerName
WHERE     (CustomerKey = @CustomerKey)


END
GO
/****** Object:  StoredProcedure [dbo].[CustomerMaster_NewCustomer]    Script Date: 02/28/2014 16:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustomerMaster_NewCustomer]
	-- Add the parameters for the stored procedure here
		@CustomerName nvarchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [APQM_DB].[dbo].[CustomerMaster]
           ([CustomerName])
     VALUES
           (@CustomerName)

SELECT     [CustomerKey]
FROM         CustomerMaster
WHERE     (CustomerName = @CustomerName)

END
GO
/****** Object:  View [dbo].[viewRFQCountBySharedItems]    Script Date: 02/28/2014 16:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQCountBySharedItems]
AS
SELECT     ItemMasterKey, PartNumber, Description, Material, Cost, SUM(QtyRequired) AS QtyRequired, SUM(RFQCount) AS RFQSent
FROM         dbo.viewRFQCountBySharedItemAux
GROUP BY ItemMasterKey, PartNumber, Description, Material, Cost
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[33] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[56] 4[29] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[76] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "viewRFQCountBySharedItemAux"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 177
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1290
         Width = 2205
         Width = 1800
         Width = 1575
         Width = 525
         Width = 1110
         Width = 945
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1200
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountBySharedItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1200
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountBySharedItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountBySharedItems'
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 02/28/2014 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 02/28/2014 16:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[SIFHeader_NewSIF]    Script Date: 02/28/2014 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIFHeader_NewSIF]
	-- Add the parameters for the stored procedure here
	 @CustomerKey INT 
	,@BOMHeaderKey INT 
	,@InquiryNumber nvarchar(50) 
	,@Priority nvarchar(50) 
	,@Revision nvarchar(50) 
	,@SalesPerson nvarchar(50) 
	,@CostModelLoc nvarchar(50) 
	,@Contact nvarchar(50) 
	,@BussinesClass nvarchar(50) 
	,@Product nvarchar(50) 
	,@DivLoc nvarchar(50) 
	,@Department nvarchar(50) 
	,@Reason4Quote nvarchar(50) 
	,@Application nvarchar(50) 
	,@Specification nvarchar(50) 
	,@DrawingLevel nvarchar(50) 
	,@TaskDescription nvarchar(50) 
	,@PartPrint nvarchar(50) 
	,@Sample nvarchar(50) 
	,@ToolingTarget nvarchar(50) 
	,@PrimaryCompetitors nvarchar(50) 
	,@SpecificResourceRequirements nvarchar(50) 
	,@Technical nvarchar(50) 
	,@QuoteDue datetime
	,@Sop datetime
	,@SalesDBID BIGINT
	,@MarketSector  numeric(18,0)
	,@AssignedTo nvarchar(256)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[SIFHeader]
           ([CustomerKey]
           ,[BOMHeaderKey]
		   ,[InquiryNumber]
           ,[Priority]
           ,[Revision]
           ,[SalesPerson]
           ,[CostModelLoc]
           ,[Contact]
           ,[BussinesClass]
           ,[Product]
           ,[DivLoc]
           ,[Department]
           ,[Reason4Quote]
           ,[Application]
           ,[Specification]
           ,[DrawingLevel]
           ,[TaskDescription]
           ,[PartPrint]
           ,[Sample]
           ,[ToolingTarget]
           ,[PrimaryCompetitors]
           ,[SpecificResourceRequirements]
           ,[Technical]
		   ,[QuoteDue]
		   ,[SOP]
		   ,[SalesDBID]
           ,[MarketSector]
           ,[AssignedTo])
     VALUES
           (@CustomerKey 
		   ,@BOMHeaderKey
           ,@InquiryNumber 
           ,@Priority 
           ,@Revision 
           ,@SalesPerson 
           ,@CostModelLoc 
           ,@Contact 
           ,@BussinesClass 
           ,@Product 
           ,@DivLoc 
           ,@Department 
           ,@Reason4Quote 
           ,@Application 
           ,@Specification 
           ,@DrawingLevel 
           ,@TaskDescription 
           ,@PartPrint 
           ,@Sample 
           ,@ToolingTarget 
           ,@PrimaryCompetitors 
           ,@SpecificResourceRequirements 
           ,@Technical
		   ,@QuoteDue
		   ,@Sop
		   ,@SalesDBID
           ,@MarketSector
           ,@AssignedTo)

	Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[SIFHeader_EditSIF]    Script Date: 02/28/2014 16:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIFHeader_EditSIF]
	-- Add the parameters for the stored procedure here
	 @CustomerKey INT 
	,@BOMHeaderKey INT 
	,@InquiryNumber nvarchar(50) 
	,@Priority nvarchar(50) 
	,@Revision nvarchar(50) 
	,@SalesPerson nvarchar(50) 
	,@CostModelLoc nvarchar(50) 
	,@Contact nvarchar(50) 
	,@BussinesClass nvarchar(50) 
	,@Product nvarchar(50) 
	,@DivLoc nvarchar(50) 
	,@Department nvarchar(50) 
	,@Reason4Quote nvarchar(50) 
	,@Application nvarchar(50) 
	,@Specification nvarchar(50) 
	,@DrawingLevel nvarchar(50) 
	,@TaskDescription nvarchar(50) 
	,@PartPrint nvarchar(50) 
	,@Sample nvarchar(50) 
	,@ToolingTarget nvarchar(50) 
	,@PrimaryCompetitors nvarchar(50) 
	,@SpecificResourceRequirements nvarchar(50) 
	,@Technical nvarchar(50) 
	,@SIFHeaderKey INT
	,@QuoteDue datetime
	,@Sop datetime
	,@SalesDBID BIGINT
	,@MarketSector  numeric(18,0)
	,@AssignedTo  nvarchar(256)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[SIFHeader]
   SET [CustomerKey] = @CustomerKey 
	  ,[BOMHeaderKey] = @BOMHeaderKey 
      ,[InquiryNumber] = @InquiryNumber 
      ,[Priority] = @Priority 
      ,[Revision] = @Revision 
      ,[SalesPerson] = @SalesPerson 
      ,[CostModelLoc] = @CostModelLoc 
      ,[Contact] = @Contact 
      ,[BussinesClass] = @BussinesClass 
      ,[Product] = @Product 
      ,[DivLoc] = @DivLoc 
      ,[Department] = @Department 
      ,[Reason4Quote] = @Reason4Quote 
      ,[Application] = @Application 
      ,[Specification] = @Specification 
      ,[DrawingLevel] = @DrawingLevel 
      ,[TaskDescription] = @TaskDescription 
      ,[PartPrint] = @PartPrint 
      ,[Sample] = @Sample 
      ,[ToolingTarget] = @ToolingTarget 
      ,[PrimaryCompetitors] = @PrimaryCompetitors 
      ,[SpecificResourceRequirements] = @SpecificResourceRequirements 
      ,[Technical] = @Technical 
	  ,[QuoteDue] = @QuoteDue 
	  ,[SOP] = @Sop 
	  ,[SalesDBID] = @SalesDBID
	  ,[MarketSector] = @MarketSector
	  ,[AssignedTo] = @AssignedTo

WHERE SIFHeaderKey=@SIFHeaderKey

END
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 02/28/2014 16:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[CommodityMaster_EditCommodity]    Script Date: 02/28/2014 16:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CommodityMaster_EditCommodity]
	-- Add the parameters for the stored procedure here
			 @CommodityKey numeric(18,0)
			,@CommodityCode nvarchar(50)
			,@Commodity nvarchar(70)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




UPDATE    CommodityMaster
SET       CommodityCode = @CommodityCode
		, Commodity = @Commodity
WHERE     (CommodityKey = @CommodityKey)


END
GO
/****** Object:  StoredProcedure [dbo].[CommodityMaster_NewCommodity]    Script Date: 02/28/2014 16:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CommodityMaster_NewCommodity]
	-- Add the parameters for the stored procedure here

			@CommodityCode nvarchar(50)
           ,@Commodity nvarchar(70)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[CommodityMaster]
           ([CommodityCode]
           ,[Commodity])
     VALUES
           (@CommodityCode
           ,@Commodity)


Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 02/28/2014 16:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 02/28/2014 16:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  StoredProcedure [dbo].[SupplierCommodity_Edit]    Script Date: 02/28/2014 16:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierCommodity_Edit]
	-- Add the parameters for the stored procedure here
			 @SupplierCommodityKey numeric(18,0)
			,@SupplierKey numeric(18,0)
			,@CommodityKey numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE    Supplier_Commodity
SET       SupplierKey = @SupplierKey
		, CommodityKey = @CommodityKey
WHERE     (SupplierCommodityKey = @SupplierCommodityKey)


END
GO
/****** Object:  StoredProcedure [dbo].[SupplierCommodity_New]    Script Date: 02/28/2014 16:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierCommodity_New]
	-- Add the parameters for the stored procedure here

			@SupplierKey numeric(18,0)
           ,@CommodityKey numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[Supplier_Commodity]
           ([SupplierKey]
           ,[CommodityKey])
     VALUES
           (@SupplierKey
           ,@CommodityKey)


Select @@Identity

END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 02/28/2014 16:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 02/28/2014 16:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  StoredProcedure [dbo].[BOMDetailVolume_EditVolume]    Script Date: 02/28/2014 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOMDetailVolume_EditVolume]
	-- Add the parameters for the stored procedure here
	 @BOMDetailVolumeKey numeric(18,0)
	,@BOMDetailKey numeric(18,0)
	,@Volume numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


UPDATE [APQM_DB].[dbo].[BOMDetailVolume]
   SET [BOMDetailKey] = @BOMDetailKey
      ,[Volume] = @Volume
 WHERE BOMDetailVolumeKey = @BOMDetailVolumeKey


END
GO
/****** Object:  StoredProcedure [dbo].[BOMDetailVolume_NewVolume]    Script Date: 02/28/2014 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOMDetailVolume_NewVolume]
	-- Add the parameters for the stored procedure here
	 @BOMDetailKey numeric(18,0)
	,@Volume numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


INSERT INTO [APQM_DB].[dbo].[BOMDetailVolume]
           ([BOMDetailKey]
           ,[Volume])
     VALUES
           (@BOMDetailKey
			,@Volume)

Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[RFQDetail_NewDetail]    Script Date: 02/28/2014 16:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQDetail_NewDetail]
	-- Add the parameters for the stored procedure here
		@RFQHeaderKey INT
		,@ItemDescription nvarchar(150)
		,@UM nvarchar(50)
		,@RPCQty float
		,@RPCCostPerUnit FLOAT
		,@OSQty float
		,@OSCostPerUnit FLOAT
		,@ScrapValue FLOAT
		,@DirectHrlyLaborRate FLOAT
		,@StdHrs float
		,@Burden FLOAT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQDetail]
           ([RFQHeaderKey]
           ,[ItemDescription]
		   ,[UM]
           ,[RPCQty]
           ,[RPCCostPerUnit]
           ,[OSQty]
           ,[OSCostPerUnit]
           ,[ScrapValue]
           ,[DirectHrlyLaborRate]
           ,[StdHrs]
           ,[Burden])
     VALUES
           (@RFQHeaderKey  
			,@ItemDescription 
			,@UM
			,@RPCQty  
			,@RPCCostPerUnit  
			,@OSQty  
			,@OSCostPerUnit  
			,@ScrapValue  
			,@DirectHrlyLaborRate  
			,@StdHrs  
			,@Burden)

SELECT     RFQDetailKey
FROM         RFQDetail
WHERE ([RFQHeaderKey] = @RFQHeaderKey 
      AND[ItemDescription] = @ItemDescription 
	  AND[UM] = @UM
      AND[RPCQty] = @RPCQty 
      AND[RPCCostPerUnit] = @RPCCostPerUnit 
      AND[OSQty] = @OSQty 
      AND[OSCostPerUnit] = @OSCostPerUnit 
      AND[ScrapValue] = @ScrapValue 
      AND[DirectHrlyLaborRate] = @DirectHrlyLaborRate 
      AND[StdHrs] = @StdHrs 
      AND[Burden] = @Burden )

END
GO
/****** Object:  StoredProcedure [dbo].[RFQDetail_EditDetail]    Script Date: 02/28/2014 16:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQDetail_EditDetail]
	-- Add the parameters for the stored procedure here
		@RFQHeaderKey INT
		,@ItemDescription nvarchar(150)
		,@UM nvarchar(50)
		,@RPCQty float
		,@RPCCostPerUnit FLOAT
		,@OSQty float
		,@OSCostPerUnit FLOAT
		,@ScrapValue FLOAT
		,@DirectHrlyLaborRate FLOAT
		,@StdHrs float
		,@Burden FLOAT
		,@RFQDetailKey INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [APQM_DB].[dbo].[RFQDetail]
   SET [RFQHeaderKey] = @RFQHeaderKey 
      ,[ItemDescription] = @ItemDescription 
	  ,[UM] = @UM
      ,[RPCQty] = @RPCQty 
      ,[RPCCostPerUnit] = @RPCCostPerUnit 
      ,[OSQty] = @OSQty 
      ,[OSCostPerUnit] = @OSCostPerUnit 
      ,[ScrapValue] = @ScrapValue 
      ,[DirectHrlyLaborRate] = @DirectHrlyLaborRate 
      ,[StdHrs] = @StdHrs 
      ,[Burden] = @Burden 
 WHERE RFQDetailKey = @RFQDetailKey


END
GO
/****** Object:  StoredProcedure [dbo].[RFQHeader_NewRFQ]    Script Date: 02/28/2014 16:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQHeader_NewRFQ]
	-- Add the parameters for the stored procedure here
	 @BOMDetailKey INT
	,@SupplierMasterKey INT
	,@RFQNumberKey INT
	,@DrawingLevel NVARCHAR(50)
	,@EstimatedAnnualVolume INT
	,@ProductionLeadTime NVARCHAR(50)
	,@ProductionToolingLeadTime NVARCHAR(50)
	,@PrototypeToolingLeadTime NVARCHAR(50)	
	,@PrototypePieceLeadTime NVARCHAR(50)
	,@ToolingDetail NVARCHAR(MAX)
	,@ProductionTooling FLOAT
	,@PrototypeTooling FLOAT
	,@PrototypePiece FLOAT
	,@SG_A_Profit FLOAT
	,@PackingPerUnit FLOAT
	,@AssemblyCostPerUnit FLOAT
	,@Status NVARCHAR(15)
	,@DueDate datetime
	,@SentToVendor datetime
	,@FilledUp datetime
	,@PreparedBy NVARCHAR(150)
	,@MOQ nvarchar(50)
	,@TargetPrice float
	,@NoQuote bit
	,@MarketSector numeric(18,0)
	,@IAgree bit
	,@DateFilledOut datetime
	,@Make nvarchar(50)
	,@ReasonNoQuote nvarchar(200)
	,@Weight float
	,@CommentsToBuyer nvarchar(MAX)
	,@CommentsToVendor nvarchar(MAX)
	,@UMWeight nvarchar(50)
	,@AttachmentsFolder nvarchar(50)
	,@LeadTimePPAP nvarchar(50)
	,@AttachmentsFolderVendor nvarchar(50)
	,@CreatedBy nvarchar(256)
	,@Cavitation nvarchar(50)
	,@Material nvarchar(150)
	,@LeadTimeFirstProductionOrder nvarchar(50)
	,@LeadTimePPAP_Fair nvarchar(50)
	,@LeadTimeNormalProductionOrders nvarchar(50)
	,@EAUCalendarYears nvarchar(70)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQHeader]
           ([BOMDetailKey]
           ,[SupplierMasterKey]
           ,[RFQNumberKey]
           ,[DrawingLevel]
           ,[EstimatedAnnualVolume]
           ,[ProductionLeadTime]
           ,[ProductionToolingLeadTime]
		   ,[PrototypeToolingLeadTime]
           ,[PrototypePieceLeadTime]
           ,[ToolingDetail]
           ,[ProductionTooling]
           ,[PrototypeTooling]
           ,[PrototypePiece]
           ,[SG_A_Profit]
           ,[PackingPerUnit]
           ,[AssemblyCostPerUnit]
		   ,[Status]
		   ,[DueDate]
		   ,[SentToVendor]
		   ,[FilledUp]
		   ,[PreparedBy]
		   ,[MOQ]
		   ,[TargetPrice]
		   ,[NoQuote]
		   ,[MarketSector]
		   ,[CommentsToBuyer]
		   ,[CommentsToVendor]
		   ,[IAgree]
		   ,[DateFilledOut]
		   ,[Make]
		   ,[ReasonNoQuote]
		   ,[Weight]
		   ,[UMWeight]
		   ,[AttachmentsFolder]
		   ,[LeadTimePPAP]
		   ,[AttachmentsFolderVendor]
		   ,[CreatedBy]
		   ,[Cavitation]
		   ,[Material]
		   ,[LeadTimeFirstProductionOrder]
		   ,[LeadTimePPAP_Fair]
		   ,[LeadTimeNormalProductionOrders]
		   ,[EAUCalendarYears])
     VALUES
           (@BOMDetailKey
           ,@SupplierMasterKey
           ,@RFQNumberKey
           ,@DrawingLevel
           ,@EstimatedAnnualVolume
           ,@ProductionLeadTime
           ,@ProductionToolingLeadTime
		   ,@PrototypeToolingLeadTime
           ,@PrototypePieceLeadTime
           ,@ToolingDetail
           ,@ProductionTooling
           ,@PrototypeTooling
           ,@PrototypePiece
           ,@SG_A_Profit
           ,@PackingPerUnit
           ,@AssemblyCostPerUnit
		   ,@Status
		   ,@DueDate
		   ,@SentToVendor
		   ,@FilledUp
		   ,@PreparedBy
           ,@MOQ
           ,@TargetPrice
           ,@NoQuote
           ,@MarketSector
           ,@CommentsToBuyer
           ,@CommentsToVendor
           ,@IAgree
           ,@DateFilledOut
           ,@Make
           ,@ReasonNoQuote
           ,@Weight
           ,@UMWeight
           ,@AttachmentsFolder
		   ,@LeadTimePPAP
           ,@AttachmentsFolderVendor
           ,@CreatedBy
           ,@Cavitation
           ,@Material
		   ,@LeadTimeFirstProductionOrder
		   ,@LeadTimePPAP_Fair
		   ,@LeadTimeNormalProductionOrders
		   ,@EAUCalendarYears )

Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[RFQHeader_EditRFQ]    Script Date: 02/28/2014 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQHeader_EditRFQ]
	-- Add the parameters for the stored procedure here
	 @BOMDetailKey INT
	,@SupplierMasterKey INT
	,@DrawingLevel NVARCHAR(50)
	,@EstimatedAnnualVolume INT
	,@ProductionLeadTime NVARCHAR(50)
	,@ProductionToolingLeadTime NVARCHAR(50)
	,@PrototypeToolingLeadTime NVARCHAR (50)
	,@PrototypePieceLeadTime NVARCHAR(50)
	,@ToolingDetail NVARCHAR(MAX)
	,@ProductionTooling FLOAT
	,@PrototypeTooling FLOAT
	,@PrototypePiece FLOAT
	,@SG_A_Profit FLOAT
	,@PackingPerUnit FLOAT
	,@AssemblyCostPerUnit FLOAT
	,@RFQHeaderKey INT
	,@Status NVARCHAR(15)
	,@DueDate datetime	
	,@FilledUp datetime
	,@PreparedBy NVARCHAR(150)
	,@MOQ nvarchar(50)
	,@TargetPrice float
	,@NoQuote bit
	,@MarketSector numeric(18,0)
	,@CommentsToBuyer nvarchar(MAX)
	,@CommentsToVendor nvarchar(MAX)
	,@IAgree bit
	,@DateFilledOut datetime
	,@Make nvarchar(50)
	,@ReasonNoQuote nvarchar(200)
	,@Weight float
	,@UMWeight nvarchar(50)
	,@AttachmentsFolder nvarchar(50)
	,@LeadTimePPAP nvarchar(50)
	,@AttachmentsFolderVendor nvarchar(50)
	,@CreatedBy nvarchar(256)
	,@Cavitation nvarchar(50)
	,@Material nvarchar(150)
	,@SentToVendor datetime
	,@LeadTimeFirstProductionOrder nvarchar(50)
	,@LeadTimePPAP_Fair nvarchar(50)
	,@LeadTimeNormalProductionOrders nvarchar(50)
	,@EAUCalendarYears nvarchar(70)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE    RFQHeader
SET       BOMDetailKey = @BOMDetailKey
, SupplierMasterKey = @SupplierMasterKey
, DrawingLevel = @DrawingLevel
, EstimatedAnnualVolume = @EstimatedAnnualVolume
, ProductionLeadTime = @ProductionLeadTime
, ProductionToolingLeadTime = @ProductionToolingLeadTime
, PrototypeToolingLeadTime = @PrototypeToolingLeadTime
, PrototypePieceLeadTime = @PrototypePieceLeadTime
, ToolingDetail = @ToolingDetail
, ProductionTooling = @ProductionTooling
, PrototypeTooling = @PrototypeTooling
, PrototypePiece = @PrototypePiece
, SG_A_Profit = @SG_A_Profit
, PackingPerUnit = @PackingPerUnit
, AssemblyCostPerUnit = @AssemblyCostPerUnit
, [Status] = @Status
, DueDate = @DueDate
, FilledUp = @FilledUp
, PreparedBy = @PreparedBy
, MOQ = @MOQ
, TargetPrice = @TargetPrice
, NoQuote = @NoQuote
, MarketSector = @MarketSector
, CommentsToBuyer = @CommentsToBuyer
, CommentsToVendor = @CommentsToVendor
, IAgree = @IAgree
, DateFilledOut = @DateFilledOut
, Make = @Make
, ReasonNoQuote = @ReasonNoQuote
, Weight = @Weight
, UMWeight = @UMWeight 
, AttachmentsFolder = @AttachmentsFolder
, LeadTimePPAP = @LeadTimePPAP
, AttachmentsFolderVendor = @AttachmentsFolderVendor
, CreatedBy = @CreatedBy
, Cavitation = @Cavitation
, Material = @Material
, SentToVendor = @SentToVendor
,[LeadTimeFirstProductionOrder] = @LeadTimeFirstProductionOrder
,[LeadTimePPAP_Fair] = @LeadTimePPAP_Fair
,[LeadTimeNormalProductionOrders] = @LeadTimeNormalProductionOrders
,[EAUCalendarYears] = @EAUCalendarYears

WHERE     (RFQHeaderKey = @RFQHeaderKey)

END
GO
/****** Object:  View [dbo].[viewRFQHeader_ReadAll]    Script Date: 02/28/2014 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQHeader_ReadAll]
AS
SELECT     dbo.RFQHeader.RFQHeaderKey, dbo.RFQHeader.BOMDetailKey, dbo.RFQHeader.SupplierMasterKey, dbo.RFQHeader.RFQNumberKey, 
                      dbo.RFQHeader.DrawingLevel, dbo.RFQHeader.EstimatedAnnualVolume, dbo.RFQHeader.ProductionLeadTime, dbo.RFQHeader.ProductionToolingLeadTime, 
                      dbo.RFQHeader.PrototypeToolingLeadTime, dbo.RFQHeader.PrototypePieceLeadTime, dbo.RFQHeader.ToolingDetail, dbo.RFQHeader.ProductionTooling, 
                      dbo.RFQHeader.PrototypeTooling, dbo.RFQHeader.PrototypePiece, dbo.RFQHeader.SG_A_Profit, dbo.RFQHeader.PackingPerUnit, 
                      dbo.RFQHeader.AssemblyCostPerUnit, dbo.RFQHeader.Status, dbo.RFQHeader.DueDate, dbo.RFQHeader.SentToVendor, dbo.RFQHeader.FilledUp, 
                      dbo.ItemMaster.PartNumber, dbo.TokenMaster.Acknowledgement, dbo.SupplierMaster.SupplierName, dbo.SupplierMaster.ManufacturingLocation, 
                      dbo.SupplierMaster.ShipLocation, dbo.RFQHeader.PreparedBy, dbo.viewRFQNumber.RFQGenerated, dbo.RFQHeader.MOQ, dbo.RFQHeader.TargetPrice, 
                      dbo.RFQHeader.NoQuote, dbo.RFQHeader.MarketSector, dbo.RFQHeader.IAgree, dbo.RFQHeader.DateFilledOut, dbo.RFQHeader.Make, 
                      dbo.RFQHeader.ReasonNoQuote, dbo.RFQHeader.Weight, dbo.RFQHeader.CommentsToBuyer, dbo.RFQHeader.CommentsToVendor, dbo.RFQHeader.UMWeight, 
                      dbo.BOMDetail.Material, dbo.viewRFQNumber.SIFHeaderKey, dbo.RFQHeader.AttachmentsFolder, dbo.RFQHeader.LeadTimePPAP, dbo.BOMDetail.[User], 
                      dbo.RFQHeader.AttachmentsFolderVendor, dbo.MarketSector.Name AS MarketSectorName, dbo.RFQHeader.CreatedBy, dbo.TokenMaster.DeadDate, 
                      dbo.RFQHeader.Cavitation, dbo.RFQHeader.Material AS MaterialRFQ, dbo.RFQHeader.LeadTimeFirstProductionOrder, dbo.RFQHeader.LeadTimePPAP_Fair, 
                      dbo.RFQHeader.LeadTimeNormalProductionOrders, dbo.RFQHeader.EAUCalendarYears
FROM         dbo.ItemMaster INNER JOIN
                      dbo.BOMDetail ON dbo.ItemMaster.ItemMasterKey = dbo.BOMDetail.ItemMasterKey INNER JOIN
                      dbo.RFQHeader ON dbo.BOMDetail.BOMDetailKey = dbo.RFQHeader.BOMDetailKey INNER JOIN
                      dbo.SupplierMaster ON dbo.RFQHeader.SupplierMasterKey = dbo.SupplierMaster.SupplierMasterKey INNER JOIN
                      dbo.viewRFQNumber ON dbo.RFQHeader.RFQNumberKey = dbo.viewRFQNumber.RFQNumberKey INNER JOIN
                      dbo.MarketSector ON dbo.RFQHeader.MarketSector = dbo.MarketSector.MarketSectorID LEFT OUTER JOIN
                      dbo.TokenMaster ON dbo.RFQHeader.RFQHeaderKey = dbo.TokenMaster.SubjectKey
WHERE     (dbo.TokenMaster.Subject = N'RFQ') OR
                      (dbo.TokenMaster.Subject IS NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[11] 4[17] 2[52] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[68] 4[32] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[33] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[11] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[76] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[75] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ItemMaster"
            Begin Extent = 
               Top = 187
               Left = 728
               Bottom = 431
               Right = 875
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BOMDetail"
            Begin Extent = 
               Top = 85
               Left = 493
               Bottom = 268
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 0
               Left = 38
               Bottom = 622
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "SupplierMaster"
            Begin Extent = 
               Top = 305
               Left = 274
               Bottom = 485
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "viewRFQNumber"
            Begin Extent = 
               Top = 284
               Left = 547
               Bottom = 431
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MarketSector"
            Begin Extent = 
               Top = 454
               Left = 527
               Bottom = 543
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TokenMaster"
            Begin Extent = 
               Top = 0
               Left = 869
               Bottom = 152
               Right = 1027
            End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQHeader_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 31
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2145
         Alias = 2115
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQHeader_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQHeader_ReadAll'
GO
/****** Object:  View [dbo].[viewRFQ_Summary]    Script Date: 02/28/2014 16:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQ_Summary]
AS
SELECT     dbo.RFQHeader.RFQHeaderKey, dbo.RFQHeader.BOMDetailKey, dbo.viewRFQNumber.RFQGenerated, dbo.RFQHeader.SupplierMasterKey, 
                      ROUND(SUM(ISNULL(dbo.RFQDetail.RPCQty, 0) * ISNULL(dbo.RFQDetail.RPCCostPerUnit, 0)), 4) AS MaterialTotal, ROUND(SUM(ISNULL(dbo.RFQDetail.OSQty, 0) 
                      * ISNULL(dbo.RFQDetail.OSCostPerUnit, 0)), 4) AS ServiceTotal, ROUND(SUM((ISNULL(dbo.RFQDetail.RPCQty, 0) * ISNULL(dbo.RFQDetail.RPCCostPerUnit, 0) 
                      + ISNULL(dbo.RFQDetail.OSQty, 0) * ISNULL(dbo.RFQDetail.OSCostPerUnit, 0)) * ISNULL(dbo.RFQDetail.ScrapValue, 0) / 100), 4) AS ScrapTotal, 
                      ROUND(SUM(ISNULL(dbo.RFQDetail.DirectHrlyLaborRate, 0) * ISNULL(dbo.RFQDetail.StdHrs, 0)), 4) AS LaborTotal, ROUND(SUM(ISNULL(dbo.RFQDetail.Burden, 0)), 4) 
                      AS BurdenTotal, ROUND(dbo.RFQHeader.SG_A_Profit, 4) AS SG_A_Profit, ROUND(dbo.RFQHeader.PackingPerUnit, 4) AS PackingPerUnit, 
                      ROUND(dbo.RFQHeader.AssemblyCostPerUnit, 4) AS AssemblyCostPerUnit, dbo.RFQHeader.EstimatedAnnualVolume, dbo.SupplierMaster.SupplierName, 
                      dbo.RFQSummary.RFQSummaryKey, dbo.RFQSummary.BCost, dbo.RFQSummary.CCost, dbo.RFQSummary.EAV, dbo.RFQHeader.ProductionTooling AS Tooling, 
                      dbo.RFQHeader.Status, dbo.RFQSummary.Sequence, dbo.RFQHeader.CreatedBy, dbo.RFQHeader.Cavitation, dbo.RFQHeader.Material, 
                      dbo.RFQHeader.LeadTimeFirstProductionOrder, dbo.RFQHeader.LeadTimePPAP_Fair, dbo.RFQHeader.LeadTimeNormalProductionOrders
FROM         dbo.RFQHeader INNER JOIN
                      dbo.SupplierMaster ON dbo.RFQHeader.SupplierMasterKey = dbo.SupplierMaster.SupplierMasterKey INNER JOIN
                      dbo.viewRFQNumber ON dbo.RFQHeader.RFQNumberKey = dbo.viewRFQNumber.RFQNumberKey LEFT OUTER JOIN
                      dbo.RFQDetail ON dbo.RFQHeader.RFQHeaderKey = dbo.RFQDetail.RFQHeaderKey LEFT OUTER JOIN
                      dbo.RFQSummary ON dbo.RFQHeader.RFQHeaderKey = dbo.RFQSummary.RFQHeaderKey
GROUP BY dbo.RFQHeader.RFQHeaderKey, dbo.RFQHeader.BOMDetailKey, dbo.RFQHeader.SupplierMasterKey, dbo.RFQHeader.SG_A_Profit, dbo.RFQHeader.PackingPerUnit, 
                      dbo.RFQHeader.AssemblyCostPerUnit, dbo.RFQHeader.EstimatedAnnualVolume, dbo.SupplierMaster.SupplierName, dbo.RFQSummary.RFQSummaryKey, 
                      dbo.RFQSummary.BCost, dbo.RFQSummary.CCost, dbo.RFQSummary.EAV, dbo.viewRFQNumber.RFQGenerated, dbo.RFQHeader.Status, 
                      dbo.RFQSummary.Sequence, dbo.RFQHeader.CreatedBy, dbo.RFQHeader.ProductionTooling, dbo.RFQHeader.Cavitation, dbo.RFQHeader.Material, 
                      dbo.RFQHeader.LeadTimeFirstProductionOrder, dbo.RFQHeader.LeadTimePPAP_Fair, dbo.RFQHeader.LeadTimeNormalProductionOrders
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[4] 2[40] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[40] 4[32] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[64] 2[15] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[39] 2[31] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[68] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[25] 4[19] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[55] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[28] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 15
               Left = 522
               Bottom = 604
               Right = 758
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "SupplierMaster"
            Begin Extent = 
               Top = 229
               Left = 310
               Bottom = 419
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "viewRFQNumber"
            Begin Extent = 
               Top = 78
               Left = 298
               Bottom = 227
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFQDetail"
            Begin Extent = 
               Top = 0
               Left = 109
               Bottom = 242
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFQSummary"
            Begin Extent = 
               Top = 0
               Left = 801
               Bottom = 273
               Right = 989
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 25
         Width = 284
         Width = 1305
         Width = 1200
         Width = 1065
         Width = 1530
         Width = 1125
         Width = 1080
         Width = 960
         Width = 960
         Width = 1065
         Width = 1065
         Width = 1260
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQ_Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1725
         Width = 1905
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 6930
         Alias = 1485
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 2880
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQ_Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQ_Summary'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 02/28/2014 16:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 02/28/2014 16:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 02/28/2014 16:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 02/28/2014 16:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 02/28/2014 16:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 02/28/2014 16:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 02/28/2014 16:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 02/28/2014 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 02/28/2014 16:55:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 02/28/2014 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 02/28/2014 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 02/28/2014 16:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 02/28/2014 16:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 02/28/2014 16:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 02/28/2014 16:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  View [dbo].[viewSalesReportDetail]    Script Date: 02/28/2014 16:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewSalesReportDetail]
AS
SELECT     dbo.ItemMaster.PartNumber, dbo.BOMDetail.CapsonicPN, dbo.BOMDetail.CustomerPN, dbo.BOMDetail.ManufacturePN, dbo.BOMDetail.SupplierPN, 
                      dbo.BOMDetail.CommCode, dbo.BOMDetail.Material, dbo.BOMDetail.VendorQuoteEst, dbo.BOMDetail.Qty, dbo.RFQHeader.EstimatedAnnualVolume AS EAU, 
                      dbo.RFQHeader.MOQ, dbo.SupplierMaster.SupplierName, dbo.BOMDetail.CapComAssm, dbo.BOMDetail.PurchasingComments, dbo.RFQHeader.ToolingDetail, 
                      dbo.RFQHeader.ProductionToolingLeadTime, dbo.RFQHeader.ProductionLeadTime, dbo.BOMDetail.BOMHeaderKey, dbo.BOMDetail.LinePosition, 
                      dbo.BOMDetail.Status, CASE WHEN dbo.BOMDetail.Status = 'No Quote' THEN 'NO QUOTE' ELSE dbo.RFQHeader.Status END AS RFQStatus, 
                      dbo.viewRFQ_Summary.MaterialTotal + dbo.viewRFQ_Summary.ServiceTotal + dbo.viewRFQ_Summary.ScrapTotal + dbo.viewRFQ_Summary.LaborTotal + dbo.viewRFQ_Summary.BurdenTotal
                       + dbo.viewRFQ_Summary.SG_A_Profit + dbo.viewRFQ_Summary.PackingPerUnit + dbo.viewRFQ_Summary.AssemblyCostPerUnit AS TotalACost, 
                      dbo.RFQHeader.LeadTimePPAP, dbo.RFQHeader.ProductionTooling, dbo.BOMDetail.[User], dbo.BOMDetail.BOMDetailKey, 
                      dbo.RFQHeader.LeadTimeFirstProductionOrder, dbo.RFQHeader.LeadTimePPAP_Fair, dbo.RFQHeader.LeadTimeNormalProductionOrders, 
                      dbo.RFQHeader.EAUCalendarYears
FROM         dbo.SupplierMaster INNER JOIN
                      dbo.RFQHeader ON dbo.SupplierMaster.SupplierMasterKey = dbo.RFQHeader.SupplierMasterKey INNER JOIN
                      dbo.viewRFQ_Summary ON dbo.RFQHeader.RFQHeaderKey = dbo.viewRFQ_Summary.RFQHeaderKey RIGHT OUTER JOIN
                      dbo.BOMDetail INNER JOIN
                      dbo.ItemMaster ON dbo.BOMDetail.ItemMasterKey = dbo.ItemMaster.ItemMasterKey ON dbo.RFQHeader.BOMDetailKey = dbo.BOMDetail.BOMDetailKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[11] 2[36] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[79] 4[16] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[52] 2[21] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[32] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[12] 4[44] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[44] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[53] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SupplierMaster"
            Begin Extent = 
               Top = 0
               Left = 1094
               Bottom = 219
               Right = 1292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 0
               Left = 453
               Bottom = 567
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "viewRFQ_Summary"
            Begin Extent = 
               Top = 89
               Left = 794
               Bottom = 499
               Right = 997
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BOMDetail"
            Begin Extent = 
               Top = 16
               Left = 0
               Bottom = 442
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ItemMaster"
            Begin Extent = 
               Top = 221
               Left = 222
               Bottom = 466
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSalesReportDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'00
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 2445
         Alias = 720
         Table = 1260
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSalesReportDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSalesReportDetail'
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__3E1D39E1]    Script Date: 02/28/2014 16:56:54 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__3F115E1A]    Script Date: 02/28/2014 16:56:54 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__6FB49575]    Script Date: 02/28/2014 16:56:57 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__756D6ECB]    Script Date: 02/28/2014 16:56:58 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__793DFFAF]    Script Date: 02/28/2014 16:57:01 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__7A3223E8]    Script Date: 02/28/2014 16:57:02 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__531856C7]    Script Date: 02/28/2014 16:57:04 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__5CA1C101]    Script Date: 02/28/2014 16:57:07 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__2DE6D218]    Script Date: 02/28/2014 16:57:13 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__6166761E]    Script Date: 02/28/2014 16:57:14 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__607251E5]    Script Date: 02/28/2014 16:57:14 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_BOMDetail_BOMHeader]    Script Date: 02/28/2014 16:57:31 ******/
ALTER TABLE [dbo].[BOMDetail]  WITH CHECK ADD  CONSTRAINT [FK_BOMDetail_BOMHeader] FOREIGN KEY([BOMHeaderKey])
REFERENCES [dbo].[BOMHeader] ([BOMHeaderKey])
GO
ALTER TABLE [dbo].[BOMDetail] CHECK CONSTRAINT [FK_BOMDetail_BOMHeader]
GO
/****** Object:  ForeignKey [FK_BOMDetail_ItemMaster]    Script Date: 02/28/2014 16:57:31 ******/
ALTER TABLE [dbo].[BOMDetail]  WITH CHECK ADD  CONSTRAINT [FK_BOMDetail_ItemMaster] FOREIGN KEY([ItemMasterKey])
REFERENCES [dbo].[ItemMaster] ([ItemMasterKey])
GO
ALTER TABLE [dbo].[BOMDetail] CHECK CONSTRAINT [FK_BOMDetail_ItemMaster]
GO
/****** Object:  ForeignKey [FK_BOMDetailVolume_BOMDetail]    Script Date: 02/28/2014 16:57:33 ******/
ALTER TABLE [dbo].[BOMDetailVolume]  WITH CHECK ADD  CONSTRAINT [FK_BOMDetailVolume_BOMDetail] FOREIGN KEY([BOMDetailKey])
REFERENCES [dbo].[BOMDetail] ([BOMDetailKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOMDetailVolume] CHECK CONSTRAINT [FK_BOMDetailVolume_BOMDetail]
GO
/****** Object:  ForeignKey [FK_BOMHeader_SIFHeader]    Script Date: 02/28/2014 16:57:36 ******/
ALTER TABLE [dbo].[BOMHeader]  WITH CHECK ADD  CONSTRAINT [FK_BOMHeader_SIFHeader] FOREIGN KEY([SIFHeaderKey])
REFERENCES [dbo].[SIFHeader] ([SIFHeaderKey])
GO
ALTER TABLE [dbo].[BOMHeader] CHECK CONSTRAINT [FK_BOMHeader_SIFHeader]
GO
/****** Object:  ForeignKey [FK_RFQACR_RFQHeader]    Script Date: 02/28/2014 16:57:47 ******/
ALTER TABLE [dbo].[RFQACR]  WITH CHECK ADD  CONSTRAINT [FK_RFQACR_RFQHeader] FOREIGN KEY([RFQHeaderKey])
REFERENCES [dbo].[RFQHeader] ([RFQHeaderKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RFQACR] CHECK CONSTRAINT [FK_RFQACR_RFQHeader]
GO
/****** Object:  ForeignKey [FK_RFQDetail_RFQHeader]    Script Date: 02/28/2014 16:57:52 ******/
ALTER TABLE [dbo].[RFQDetail]  WITH CHECK ADD  CONSTRAINT [FK_RFQDetail_RFQHeader] FOREIGN KEY([RFQHeaderKey])
REFERENCES [dbo].[RFQHeader] ([RFQHeaderKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RFQDetail] CHECK CONSTRAINT [FK_RFQDetail_RFQHeader]
GO
/****** Object:  ForeignKey [FK_RFQEAV_RFQHeader]    Script Date: 02/28/2014 16:57:54 ******/
ALTER TABLE [dbo].[RFQEAV]  WITH CHECK ADD  CONSTRAINT [FK_RFQEAV_RFQHeader] FOREIGN KEY([RFQHeaderKey])
REFERENCES [dbo].[RFQHeader] ([RFQHeaderKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RFQEAV] CHECK CONSTRAINT [FK_RFQEAV_RFQHeader]
GO
/****** Object:  ForeignKey [FK_RFQHeader_BOMDetail]    Script Date: 02/28/2014 16:58:12 ******/
ALTER TABLE [dbo].[RFQHeader]  WITH CHECK ADD  CONSTRAINT [FK_RFQHeader_BOMDetail] FOREIGN KEY([BOMDetailKey])
REFERENCES [dbo].[BOMDetail] ([BOMDetailKey])
GO
ALTER TABLE [dbo].[RFQHeader] CHECK CONSTRAINT [FK_RFQHeader_BOMDetail]
GO
/****** Object:  ForeignKey [FK_RFQHeader_MarketSector]    Script Date: 02/28/2014 16:58:12 ******/
ALTER TABLE [dbo].[RFQHeader]  WITH CHECK ADD  CONSTRAINT [FK_RFQHeader_MarketSector] FOREIGN KEY([MarketSector])
REFERENCES [dbo].[MarketSector] ([MarketSectorID])
GO
ALTER TABLE [dbo].[RFQHeader] CHECK CONSTRAINT [FK_RFQHeader_MarketSector]
GO
/****** Object:  ForeignKey [FK_RFQHeader_RFQNumber]    Script Date: 02/28/2014 16:58:12 ******/
ALTER TABLE [dbo].[RFQHeader]  WITH CHECK ADD  CONSTRAINT [FK_RFQHeader_RFQNumber] FOREIGN KEY([RFQNumberKey])
REFERENCES [dbo].[RFQNumber] ([RFQNumberKey])
GO
ALTER TABLE [dbo].[RFQHeader] CHECK CONSTRAINT [FK_RFQHeader_RFQNumber]
GO
/****** Object:  ForeignKey [FK_RFQHeader_SupplierMaster]    Script Date: 02/28/2014 16:58:13 ******/
ALTER TABLE [dbo].[RFQHeader]  WITH CHECK ADD  CONSTRAINT [FK_RFQHeader_SupplierMaster] FOREIGN KEY([SupplierMasterKey])
REFERENCES [dbo].[SupplierMaster] ([SupplierMasterKey])
GO
ALTER TABLE [dbo].[RFQHeader] CHECK CONSTRAINT [FK_RFQHeader_SupplierMaster]
GO
/****** Object:  ForeignKey [FK_RFQSummary_RFQHeader]    Script Date: 02/28/2014 16:58:18 ******/
ALTER TABLE [dbo].[RFQSummary]  WITH CHECK ADD  CONSTRAINT [FK_RFQSummary_RFQHeader] FOREIGN KEY([RFQHeaderKey])
REFERENCES [dbo].[RFQHeader] ([RFQHeaderKey])
GO
ALTER TABLE [dbo].[RFQSummary] CHECK CONSTRAINT [FK_RFQSummary_RFQHeader]
GO
/****** Object:  ForeignKey [FK_SIFDetail_SIFHeader]    Script Date: 02/28/2014 16:58:27 ******/
ALTER TABLE [dbo].[SIFDetail]  WITH CHECK ADD  CONSTRAINT [FK_SIFDetail_SIFHeader] FOREIGN KEY([SIFHeaderKey])
REFERENCES [dbo].[SIFHeader] ([SIFHeaderKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SIFDetail] CHECK CONSTRAINT [FK_SIFDetail_SIFHeader]
GO
/****** Object:  ForeignKey [FK_SIFHeader_CustomerMaster]    Script Date: 02/28/2014 16:58:39 ******/
ALTER TABLE [dbo].[SIFHeader]  WITH CHECK ADD  CONSTRAINT [FK_SIFHeader_CustomerMaster] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[CustomerMaster] ([CustomerKey])
GO
ALTER TABLE [dbo].[SIFHeader] CHECK CONSTRAINT [FK_SIFHeader_CustomerMaster]
GO
/****** Object:  ForeignKey [FK_SIFHeader_MarketSector]    Script Date: 02/28/2014 16:58:39 ******/
ALTER TABLE [dbo].[SIFHeader]  WITH CHECK ADD  CONSTRAINT [FK_SIFHeader_MarketSector] FOREIGN KEY([MarketSector])
REFERENCES [dbo].[MarketSector] ([MarketSectorID])
GO
ALTER TABLE [dbo].[SIFHeader] CHECK CONSTRAINT [FK_SIFHeader_MarketSector]
GO
/****** Object:  ForeignKey [FK_Supplier_Commodity_CommodityMaster]    Script Date: 02/28/2014 16:58:41 ******/
ALTER TABLE [dbo].[Supplier_Commodity]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Commodity_CommodityMaster] FOREIGN KEY([CommodityKey])
REFERENCES [dbo].[CommodityMaster] ([CommodityKey])
GO
ALTER TABLE [dbo].[Supplier_Commodity] CHECK CONSTRAINT [FK_Supplier_Commodity_CommodityMaster]
GO
/****** Object:  ForeignKey [FK_Supplier_Commodity_SupplierMaster]    Script Date: 02/28/2014 16:58:41 ******/
ALTER TABLE [dbo].[Supplier_Commodity]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Commodity_SupplierMaster] FOREIGN KEY([SupplierKey])
REFERENCES [dbo].[SupplierMaster] ([SupplierMasterKey])
GO
ALTER TABLE [dbo].[Supplier_Commodity] CHECK CONSTRAINT [FK_Supplier_Commodity_SupplierMaster]
GO
/****** Object:  ForeignKey [FK_SupplierSurveyCertification_SupplierSuvey]    Script Date: 02/28/2014 16:58:49 ******/
ALTER TABLE [dbo].[SupplierSurveyCertification]  WITH CHECK ADD  CONSTRAINT [FK_SupplierSurveyCertification_SupplierSuvey] FOREIGN KEY([SupplierSurveyKey])
REFERENCES [dbo].[SupplierSuvey] ([SupplierSuveyKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierSurveyCertification] CHECK CONSTRAINT [FK_SupplierSurveyCertification_SupplierSuvey]
GO
/****** Object:  ForeignKey [FK_SupplierSurveyContacts_SupplierSuvey]    Script Date: 02/28/2014 16:58:53 ******/
ALTER TABLE [dbo].[SupplierSurveyContacts]  WITH CHECK ADD  CONSTRAINT [FK_SupplierSurveyContacts_SupplierSuvey] FOREIGN KEY([SupplierSurveyKey])
REFERENCES [dbo].[SupplierSuvey] ([SupplierSuveyKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierSurveyContacts] CHECK CONSTRAINT [FK_SupplierSurveyContacts_SupplierSuvey]
GO
/****** Object:  ForeignKey [FK_SupplierSurveyForecastSales_SupplierSuvey]    Script Date: 02/28/2014 16:58:55 ******/
ALTER TABLE [dbo].[SupplierSurveyForecastSales]  WITH CHECK ADD  CONSTRAINT [FK_SupplierSurveyForecastSales_SupplierSuvey] FOREIGN KEY([SupplierSurveyKey])
REFERENCES [dbo].[SupplierSuvey] ([SupplierSuveyKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierSurveyForecastSales] CHECK CONSTRAINT [FK_SupplierSurveyForecastSales_SupplierSuvey]
GO
/****** Object:  ForeignKey [FK_SupplierSurveyIndustriesSupplied_SupplierSuvey]    Script Date: 02/28/2014 16:58:57 ******/
ALTER TABLE [dbo].[SupplierSurveyIndustriesSupplied]  WITH CHECK ADD  CONSTRAINT [FK_SupplierSurveyIndustriesSupplied_SupplierSuvey] FOREIGN KEY([SupplierSurveyKey])
REFERENCES [dbo].[SupplierSuvey] ([SupplierSuveyKey])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierSurveyIndustriesSupplied] CHECK CONSTRAINT [FK_SupplierSurveyIndustriesSupplied_SupplierSuvey]
GO
/****** Object:  ForeignKey [FK_SupplierSuvey_SupplierMaster]    Script Date: 02/28/2014 16:59:06 ******/
ALTER TABLE [dbo].[SupplierSuvey]  WITH CHECK ADD  CONSTRAINT [FK_SupplierSuvey_SupplierMaster] FOREIGN KEY([SupplierMasterKey])
REFERENCES [dbo].[SupplierMaster] ([SupplierMasterKey])
GO
ALTER TABLE [dbo].[SupplierSuvey] CHECK CONSTRAINT [FK_SupplierSuvey_SupplierMaster]
GO
