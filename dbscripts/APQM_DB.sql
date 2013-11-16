USE [master]
GO
/****** Object:  Database [APQM_DB]    Script Date: 11/15/2013 16:15:18 ******/
CREATE DATABASE [APQM_DB] ON  PRIMARY 
( NAME = N'APQM_DB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\APQM_DB.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'APQM_DB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\APQM_DB_log.ldf' , SIZE = 51456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'APQM_DB', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APQM_DB].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [APQM_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APQM_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APQM_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APQM_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APQM_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [APQM_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APQM_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [APQM_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APQM_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APQM_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APQM_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APQM_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APQM_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APQM_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APQM_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APQM_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [APQM_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APQM_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APQM_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APQM_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APQM_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APQM_DB] SET  READ_WRITE 
GO
ALTER DATABASE [APQM_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [APQM_DB] SET  MULTI_USER 
GO
ALTER DATABASE [APQM_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APQM_DB] SET DB_CHAINING OFF 

USE [APQM_DB]
GO
/****** Object:  Table [dbo].[RFQACR]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQACR](
	[RFQACRKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[Year] [nvarchar](4) NOT NULL,
	[Porcentage] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQNumber]    Script Date: 11/15/2013 16:14:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierMaster]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierMaster](
	[SupplierMasterKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactPhoneNumber] [nvarchar](50) NOT NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[ManufacturingLocation] [nvarchar](max) NOT NULL,
	[ShipLocation] [nvarchar](max) NOT NULL,
	[QuotedCurrency] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RFQEAV_NewEAV]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQEAV_EditEAV]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  Table [dbo].[RFQEAV]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQEAV](
	[EAVKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[Year] [nvarchar](50) NOT NULL,
	[Volume] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIFDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
	[AnnualRevenue] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 11/15/2013 16:14:08 ******/
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
	[EAU] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOMDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
	[UserKey] [numeric](18, 0) NOT NULL,
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
	[EAU] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MarketSector_EditMarket]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[MarketSector_NewMarket]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  Table [dbo].[MarketSector]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketSector](
	[MarketSectorID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOMHeader]    Script Date: 11/15/2013 16:14:08 ******/
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
	[AnnualVolume] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQHeader]    Script Date: 11/15/2013 16:14:08 ******/
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
	[UMWeight] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIFHeader]    Script Date: 11/15/2013 16:14:08 ******/
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
	[MarketSector] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyCertification]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyCertification](
	[SupplierCertificationKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[Certifications] [nvarchar](max) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyIndustriesSupplied]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyIndustriesSupplied](
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[SupplierIndustriesSuppliedKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IndustriesSuplied] [nvarchar](max) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyForecastSales]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierSurveyForecastSales](
	[SurveyForecastedSalesKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SupplierSurveyKey] [numeric](18, 0) NOT NULL,
	[ForecastSalesYear] [nvarchar](4) NOT NULL,
	[ForecastSales] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSurveyContacts]    Script Date: 11/15/2013 16:14:08 ******/
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
	[Email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierSuvey]    Script Date: 11/15/2013 16:14:08 ******/
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
	[SentToVendor] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokenMaster]    Script Date: 11/15/2013 16:14:08 ******/
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
	[Acknowledgement] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[CustomerKey] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewRFQDetail_ReadAll]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  View [dbo].[viewRFQCountBySharedItemAux]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserKey] [numeric](18, 0) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](100) NOT NULL,
	[LastAccess] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
	[Burden] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFQSummary]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQSummary](
	[RFQSummaryKey] [numeric](18, 0) NOT NULL,
	[RFQHeaderKey] [numeric](18, 0) NOT NULL,
	[BCost] [float] NOT NULL,
	[CCost] [float] NOT NULL,
	[EAV] [float] NOT NULL,
	[Tooling] [float] NOT NULL,
	[Cavitation] [float] NOT NULL,
	[Material] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SIFDetail_NewDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SIFDetail_EditDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQACR_NewACR]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQACR_EditACR]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  View [dbo].[viewRFQNumber]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQNumber_NewNumber]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierMaster_NewSupplier]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierMaster_NewSupplier]
	-- Add the parameters for the stored procedure here

			@SupplierName nvarchar(50)
           ,@ContactName nvarchar(50) 
           ,@ContactPhoneNumber nvarchar(50) 
           ,@ContactEmail nvarchar(50) 
           ,@ManufacturingLocation nvarchar(max) 
           ,@ShipLocation nvarchar(max) 
           ,@QuotedCurrency nvarchar(50) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [APQM_DB].[dbo].[SupplierMaster]
           ([SupplierName]
           ,[ContactName]
           ,[ContactPhoneNumber]
           ,[ContactEmail]
           ,[ManufacturingLocation]
           ,[ShipLocation]
           ,[QuotedCurrency])
     VALUES
           (@SupplierName
           ,@ContactName
           ,@ContactPhoneNumber
           ,@ContactEmail
           ,@ManufacturingLocation
           ,@ShipLocation
           ,@QuotedCurrency)


Select @@Identity

END
GO
/****** Object:  View [dbo].[viewSalesReportDetail]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewSalesReportDetail]
AS
SELECT     dbo.ItemMaster.PartNumber, dbo.BOMDetail.CapsonicPN, dbo.BOMDetail.CustomerPN, dbo.BOMDetail.ManufacturePN, dbo.BOMDetail.SupplierPN, 
                      dbo.BOMDetail.CommCode, dbo.BOMDetail.Material, dbo.BOMDetail.VendorQuoteEst, dbo.BOMDetail.Qty, dbo.BOMDetail.EAU, dbo.RFQHeader.MOQ, 
                      dbo.SupplierMaster.SupplierName, dbo.BOMDetail.CapComAssm, dbo.BOMDetail.PurchasingComments, dbo.RFQHeader.ToolingDetail, 
                      dbo.RFQHeader.ProductionToolingLeadTime, dbo.RFQHeader.ProductionLeadTime
FROM         dbo.BOMDetail INNER JOIN
                      dbo.ItemMaster ON dbo.BOMDetail.ItemMasterKey = dbo.ItemMaster.ItemMasterKey INNER JOIN
                      dbo.SupplierMaster INNER JOIN
                      dbo.RFQHeader ON dbo.SupplierMaster.SupplierMasterKey = dbo.RFQHeader.SupplierMasterKey ON dbo.BOMDetail.BOMDetailKey = dbo.RFQHeader.BOMDetailKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[30] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[23] 3) )"
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
         Configuration = "(H (1[32] 4) )"
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
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 0
               Left = 453
               Bottom = 530
               Right = 672
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
         Begin Table = "SupplierMaster"
            Begin Extent = 
               Top = 30
               Left = 751
               Bottom = 249
               Right = 949
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSalesReportDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSalesReportDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSalesReportDetail'
GO
/****** Object:  View [dbo].[viewRFQ_Summary]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQ_Summary]
AS
SELECT     dbo.RFQHeader.RFQHeaderKey, dbo.RFQHeader.BOMDetailKey, dbo.viewRFQNumber.RFQGenerated, dbo.RFQHeader.SupplierMasterKey, 
                      SUM(dbo.RFQDetail.RPCQty * dbo.RFQDetail.RPCCostPerUnit) AS MaterialTotal, SUM(dbo.RFQDetail.OSQty * dbo.RFQDetail.OSCostPerUnit) AS ServiceTotal, 
                      SUM((dbo.RFQDetail.RPCQty * dbo.RFQDetail.RPCCostPerUnit + dbo.RFQDetail.OSQty * dbo.RFQDetail.OSCostPerUnit) * dbo.RFQDetail.ScrapValue) AS ScrapTotal, 
                      SUM(dbo.RFQDetail.DirectHrlyLaborRate * dbo.RFQDetail.StdHrs) AS LaborTotal, SUM(dbo.RFQDetail.Burden) AS BurdenTotal, dbo.RFQHeader.SG_A_Profit, 
                      dbo.RFQHeader.PackingPerUnit, dbo.RFQHeader.AssemblyCostPerUnit, dbo.RFQHeader.EstimatedAnnualVolume, dbo.SupplierMaster.SupplierName, 
                      dbo.RFQSummary.RFQSummaryKey, dbo.RFQSummary.BCost, dbo.RFQSummary.CCost, dbo.RFQSummary.EAV, dbo.RFQSummary.Tooling, 
                      dbo.RFQSummary.Cavitation, dbo.RFQSummary.Material
FROM         dbo.RFQHeader INNER JOIN
                      dbo.RFQDetail ON dbo.RFQHeader.RFQHeaderKey = dbo.RFQDetail.RFQHeaderKey INNER JOIN
                      dbo.SupplierMaster ON dbo.RFQHeader.SupplierMasterKey = dbo.SupplierMaster.SupplierMasterKey INNER JOIN
                      dbo.viewRFQNumber ON dbo.RFQHeader.RFQNumberKey = dbo.viewRFQNumber.RFQNumberKey LEFT OUTER JOIN
                      dbo.RFQSummary ON dbo.RFQHeader.RFQHeaderKey = dbo.RFQSummary.RFQHeaderKey
GROUP BY dbo.RFQHeader.RFQHeaderKey, dbo.RFQHeader.BOMDetailKey, dbo.RFQHeader.SupplierMasterKey, dbo.RFQHeader.SG_A_Profit, dbo.RFQHeader.PackingPerUnit, 
                      dbo.RFQHeader.AssemblyCostPerUnit, dbo.RFQHeader.EstimatedAnnualVolume, dbo.SupplierMaster.SupplierName, dbo.RFQSummary.RFQSummaryKey, 
                      dbo.RFQSummary.BCost, dbo.RFQSummary.CCost, dbo.RFQSummary.EAV, dbo.RFQSummary.Tooling, dbo.RFQSummary.Cavitation, dbo.RFQSummary.Material, 
                      dbo.viewRFQNumber.RFQGenerated
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[13] 4[20] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[41] 4[27] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[39] 2[31] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[51] 3) )"
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
         Configuration = "(H (1[19] 4[38] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[65] 4) )"
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
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 15
               Left = 522
               Bottom = 420
               Right = 724
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
         Begin Table = "RFQSummary"
            Begin Extent = 
               Top = 0
               Left = 801
               Bottom = 187
               Right = 989
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
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
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
         Width = 1725
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQ_Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1905
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 5010
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
/****** Object:  StoredProcedure [dbo].[SupplierMaster_EditSupplier]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupplierMaster_EditSupplier]
	-- Add the parameters for the stored procedure here

@SupplierName nvarchar(50)
           ,@ContactName nvarchar(50) 
           ,@ContactPhoneNumber nvarchar(50) 
           ,@ContactEmail nvarchar(50) 
           ,@ManufacturingLocation nvarchar(max) 
           ,@ShipLocation nvarchar(max) 
           ,@QuotedCurrency nvarchar(50) 
		   ,@SupplierKey INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




UPDATE    SupplierMaster
SET       SupplierName = @SupplierName
		, ContactName = @ContactName
		, ContactPhoneNumber = @ContactPhoneNumber
		, ContactEmail = @ContactEmail
		, ManufacturingLocation = @ManufacturingLocation
		, ShipLocation = @ShipLocation
		, QuotedCurrency = @QuotedCurrency
WHERE     (SupplierMasterKey = @SupplierKey)


END
GO
/****** Object:  View [dbo].[viewRFQCompleted]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQCompleted]
AS
SELECT     dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Revision, dbo.BOMHeader.PartDescription, b.BOMDetailKey, dbo.ItemMaster.PartNumber, b.Material, b.Qty,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.RFQHeader AS r
                            WHERE      (Status = 'COMPLETED') AND (BOMDetailKey = b.BOMDetailKey)) AS [RFQ COMPLETED], COUNT(*) AS [RFQ Sent]
FROM         dbo.SIFHeader INNER JOIN
                      dbo.BOMHeader ON dbo.SIFHeader.SIFHeaderKey = dbo.BOMHeader.SIFHeaderKey INNER JOIN
                      dbo.BOMDetail AS b ON dbo.BOMHeader.BOMHeaderKey = b.BOMHeaderKey INNER JOIN
                      dbo.ItemMaster ON b.ItemMasterKey = dbo.ItemMaster.ItemMasterKey INNER JOIN
                      dbo.RFQHeader ON b.BOMDetailKey = dbo.RFQHeader.BOMDetailKey INNER JOIN
                      dbo.SupplierMaster ON dbo.RFQHeader.SupplierMasterKey = dbo.SupplierMaster.SupplierMasterKey
GROUP BY dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Revision, dbo.BOMHeader.PartDescription, b.BOMDetailKey, dbo.ItemMaster.PartNumber, b.Material, b.Qty
HAVING      ((SELECT     COUNT(*) AS Expr1
                         FROM         dbo.RFQHeader AS r
                         WHERE     (Status = 'COMPLETED') AND (BOMDetailKey = b.BOMDetailKey)) > 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[30] 2[21] 3) )"
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
         Configuration = "(H (1[56] 4[18] 2) )"
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
/****** Object:  View [dbo].[viewRFQCountPerBOMDetail]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRFQCountPerBOMDetail]
AS
SELECT     dbo.BOMHeader.SIFHeaderKey, dbo.SIFHeader.InquiryNumber, dbo.SIFHeader.Revision, dbo.BOMDetail.BOMHeaderKey, dbo.BOMHeader.TopPartNumber, 
                      dbo.BOMHeader.PartDescription, dbo.BOMHeader.AnnualVolume, dbo.BOMDetail.BOMDetailKey, dbo.BOMDetail.ItemMasterKey, dbo.ItemMaster.PartNumber, 
                      dbo.ItemMaster.CapsonicPN, dbo.ItemMaster.CustomerPN, dbo.ItemMaster.ManufacturePN, dbo.ItemMaster.SupplierPN, dbo.ItemMaster.CommCode, 
                      dbo.BOMDetail.Material, dbo.BOMDetail.VendorQuoteEst, dbo.BOMDetail.Qty, dbo.BOMDetail.Cost, dbo.BOMDetail.CapComAssm, dbo.BOMDetail.DirectedBuy, 
                      dbo.BOMDetail.PurchasingStatus, dbo.BOMDetail.PurchasingComments, dbo.BOMDetail.SalesComments, COUNT(dbo.RFQHeader.RFQHeaderKey) AS RFQCount, 
                      dbo.MarketSector.Name AS MarketSector
FROM         dbo.BOMDetail INNER JOIN
                      dbo.BOMHeader ON dbo.BOMDetail.BOMHeaderKey = dbo.BOMHeader.BOMHeaderKey INNER JOIN
                      dbo.SIFHeader ON dbo.BOMHeader.SIFHeaderKey = dbo.SIFHeader.SIFHeaderKey INNER JOIN
                      dbo.ItemMaster ON dbo.BOMDetail.ItemMasterKey = dbo.ItemMaster.ItemMasterKey LEFT OUTER JOIN
                      dbo.MarketSector ON dbo.SIFHeader.MarketSector = dbo.MarketSector.MarketSectorID LEFT OUTER JOIN
                      dbo.RFQHeader ON dbo.BOMDetail.BOMDetailKey = dbo.RFQHeader.BOMDetailKey
GROUP BY dbo.BOMDetail.BOMDetailKey, dbo.BOMDetail.BOMHeaderKey, dbo.BOMDetail.ItemMasterKey, dbo.BOMDetail.Qty, dbo.BOMDetail.Cost, 
                      dbo.BOMHeader.TopPartNumber, dbo.BOMHeader.PartDescription, dbo.ItemMaster.PartNumber, dbo.SIFHeader.InquiryNumber, dbo.BOMHeader.SIFHeaderKey, 
                      dbo.SIFHeader.Revision, dbo.BOMDetail.Material, dbo.BOMHeader.AnnualVolume, dbo.ItemMaster.CapsonicPN, dbo.ItemMaster.CustomerPN, 
                      dbo.ItemMaster.ManufacturePN, dbo.ItemMaster.SupplierPN, dbo.ItemMaster.CommCode, dbo.BOMDetail.PurchasingStatus, dbo.BOMDetail.PurchasingComments, 
                      dbo.BOMDetail.CapComAssm, dbo.BOMDetail.VendorQuoteEst, dbo.BOMDetail.SalesComments, dbo.BOMDetail.DirectedBuy, dbo.MarketSector.Name
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[13] 4[64] 2[2] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[70] 4[13] 3) )"
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
         Configuration = "(H (1 [56] 3))"
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
         Configuration = "(H (1[44] 4) )"
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
         Width = 284
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQCountPerBOMDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
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
      Begin ColumnWidths = 12
         Column = 3720
         Alias = 1125
         Table = 2355
         Output = 675
         Append = 1400
         NewValue = 1170
         SortType = 885
         SortOrder = 930
         GroupBy = 1920
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
/****** Object:  View [dbo].[viewBOMDetail_ReadAll]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewBOMDetail_ReadAll]
AS
SELECT     dbo.BOMDetail.BOMDetailKey, dbo.BOMDetail.BOMHeaderKey, dbo.BOMDetail.ItemMasterKey, dbo.BOMDetail.Qty, dbo.BOMDetail.Cost, dbo.BOMDetail.Status, 
                      dbo.BOMDetail.Description, dbo.ItemMaster.PartNumber, dbo.BOMDetail.LinePosition, dbo.BOMDetail.SalesStatus, dbo.BOMDetail.UserKey, 
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
      ActivePaneConfig = 9
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
      PaneHidden = 
      Begin ParameterDefaults = ""
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
/****** Object:  StoredProcedure [dbo].[BOMDetail_EditDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
	,@UserKey numeric(18,0)
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
	,@EAU numeric(18,0)

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
	  ,[UserKey] = @UserKey
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
	  ,[EAU] = @EAU
 WHERE BOMDetailKey = @BOMDetailKey


END
GO
/****** Object:  StoredProcedure [dbo].[BOMDetail_NewDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
	,@UserKey numeric(18,0)
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
	,@EAU numeric(18,0)

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
		   ,[UserKey]
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
		   ,[CommCode]
		   ,[EAU])
     VALUES
           (@BOMHeaderKey 
			,@ItemMasterKey 
			,@Qty  
			,@Cost  
			,@Status
			,@Description
			,@LinePosition
			,@SalesStatus
			,@UserKey
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
			,@CommCode
			,@EAU)

Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[ItemMaster_NewItem]    Script Date: 11/15/2013 16:14:08 ******/
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
	,@EAU float

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
		   ,[CommCode]
		   ,[EAU])
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
           ,@CommCode
           ,@EAU)


Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[ItemMaster_EditItem]    Script Date: 11/15/2013 16:14:08 ******/
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
	,@EAU float
	
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
	  ,[EAU] = @EAU
	  
 WHERE [ItemMasterKey] = @ItemMasterKey

END
GO
/****** Object:  View [dbo].[viewBOMHeader_ReadAll]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewBOMHeader_ReadAll]
AS
SELECT     dbo.BOMHeader.BOMHeaderKey, dbo.BOMHeader.SIFHeaderKey, dbo.BOMHeader.TopPartNumber, dbo.BOMHeader.PartDescription, dbo.SIFHeader.InquiryNumber, 
                      dbo.SIFHeader.Revision, dbo.BOMHeader.AnnualVolume, dbo.SIFHeader.SalesPerson, dbo.CustomerMaster.CustomerName, 
                      dbo.MarketSector.Name AS MarketSector
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
            TopColumn = 15
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
/****** Object:  StoredProcedure [dbo].[BOMHeader_NewBOM]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[BOMHeader_EditBOM]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  View [dbo].[viewSIF_ReadAll]    Script Date: 11/15/2013 16:14:08 ******/
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
                      dbo.CustomerMaster.CustomerName, dbo.SIFHeader.QuoteDue, dbo.SIFHeader.SOP, dbo.SIFHeader.SalesDBID, dbo.SIFHeader.MarketSector
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
            TopColumn = 2
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
/****** Object:  StoredProcedure [dbo].[RFQHeader_NewRFQ]    Script Date: 11/15/2013 16:14:08 ******/
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
		   ,[UMWeight])
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
           ,@UMWeight)

Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[RFQHeader_EditRFQ]    Script Date: 11/15/2013 16:14:08 ******/
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

WHERE     (RFQHeaderKey = @RFQHeaderKey)

END
GO
/****** Object:  StoredProcedure [dbo].[SIFHeader_NewSIF]    Script Date: 11/15/2013 16:14:08 ******/
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
           ,[MarketSector])
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
           ,@MarketSector)

	Select @@Identity

END
GO
/****** Object:  StoredProcedure [dbo].[SIFHeader_EditSIF]    Script Date: 11/15/2013 16:14:08 ******/
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
	  , MarketSector = @MarketSector

WHERE SIFHeaderKey=@SIFHeaderKey

END
GO
/****** Object:  StoredProcedure [dbo].[SupplierSurveyCertification_NewCertification]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyCertification_EditCertification]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyIndustriesSupplied_NewIndustry]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyIndustriesSupplied_EditIndustry]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyForecastSales_NewForecast]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyForecastSales_EditForecast]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyContacts_NewContact]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurveyContacts_EditContact]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurvey_NewSurvey]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SupplierSurvey_EditSurvey]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[TokenMaster_NewToken]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[TokenMaster_EditToken]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[CustomerMaster_NewCustomer]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[CustomerMaster_EditCustomer]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  View [dbo].[viewRFQCountBySharedItems]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQDetail_EditDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQDetail_NewDetail]    Script Date: 11/15/2013 16:14:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RFQSummary_EditSummary]    Script Date: 11/15/2013 16:14:08 ******/
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
	,@Tooling FLOAT
	,@Cavitation FLOAT
	,@Material NVARCHAR(100)

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
, Tooling = @Tooling
, Cavitation = @Cavitation
, Material = @Material

WHERE (RFQSummaryKey = @RFQSummaryKey)

END
GO
/****** Object:  StoredProcedure [dbo].[RFQSummary_NewSummary]    Script Date: 11/15/2013 16:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RFQSummary_NewSummary]
	-- Add the parameters for the stored procedure here
	 @RFQSummaryKey INT
	,@RFQHeaderKey INT
	,@BCost FLOAT
	,@CCost FLOAT
	,@EAV FLOAT
	,@Tooling FLOAT
	,@Cavitation FLOAT
	,@Material NVARCHAR(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [APQM_DB].[dbo].[RFQSummary]
           ([RFQSummaryKey]
           ,[RFQHeaderKey]
           ,[BCost]
           ,[CCost]
           ,[EAV]
           ,[Tooling]
           ,[Cavitation]
		   ,[Material])
     VALUES
           (@RFQSummaryKey
           ,@RFQHeaderKey
           ,@BCost
           ,@CCost
           ,@EAV
           ,@Tooling
           ,@Cavitation
		   ,@Material)

Select @@Identity

END
GO
/****** Object:  View [dbo].[viewRFQHeader_ReadAll]    Script Date: 11/15/2013 16:14:08 ******/
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
                      dbo.ItemMaster.PartNumber, dbo.TokenMaster.DeadDate, dbo.TokenMaster.Acknowledgement, dbo.SupplierMaster.SupplierName, 
                      dbo.SupplierMaster.ManufacturingLocation, dbo.SupplierMaster.ShipLocation, dbo.RFQHeader.PreparedBy, dbo.viewRFQNumber.RFQGenerated, 
                      dbo.RFQHeader.MOQ, dbo.RFQHeader.TargetPrice, dbo.RFQHeader.NoQuote, dbo.RFQHeader.MarketSector, dbo.RFQHeader.IAgree, dbo.RFQHeader.DateFilledOut, 
                      dbo.RFQHeader.Make, dbo.RFQHeader.ReasonNoQuote, dbo.RFQHeader.Weight, dbo.RFQHeader.CommentsToBuyer, dbo.RFQHeader.CommentsToVendor, 
                      dbo.RFQHeader.UMWeight, dbo.BOMDetail.Material, dbo.viewRFQNumber.SIFHeaderKey
FROM         dbo.ItemMaster INNER JOIN
                      dbo.BOMDetail ON dbo.ItemMaster.ItemMasterKey = dbo.BOMDetail.ItemMasterKey INNER JOIN
                      dbo.RFQHeader ON dbo.BOMDetail.BOMDetailKey = dbo.RFQHeader.BOMDetailKey INNER JOIN
                      dbo.SupplierMaster ON dbo.RFQHeader.SupplierMasterKey = dbo.SupplierMaster.SupplierMasterKey INNER JOIN
                      dbo.viewRFQNumber ON dbo.RFQHeader.RFQNumberKey = dbo.viewRFQNumber.RFQNumberKey LEFT OUTER JOIN
                      dbo.TokenMaster ON dbo.RFQHeader.RFQHeaderKey = dbo.TokenMaster.SubjectKey
WHERE     (dbo.TokenMaster.Subject = N'RFQ')
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
         Configuration = "(H (1[53] 4[47] 3) )"
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
         Configuration = "(H (1[56] 3) )"
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
         Configuration = "(V (4) )"
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
            TopColumn = 0
         End
         Begin Table = "RFQHeader"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 382
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 13
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
         Begin Table = "TokenMaster"
            Begin Extent = 
               Top = 0
               Left = 869
               Bottom = 148
               Right = 1027
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
      Begin ColumnWidths = 30
         Width = 284
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQHeader_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQHeader_ReadAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewRFQHeader_ReadAll'
GO
