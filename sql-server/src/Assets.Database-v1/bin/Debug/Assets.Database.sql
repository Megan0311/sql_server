/*
Assets.Database 的部署指令碼

這段程式碼由工具產生。
變更這個檔案可能導致不正確的行為，而且如果重新產生程式碼，
變更將會遺失。
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Assets.Database"
:setvar DefaultFilePrefix "Assets.Database"
:setvar DefaultDataPath "C:\Users\happy.DESKTOP-7VOR5SQ\AppData\Local\Microsoft\VisualStudio\SSDT\Assets.Database"
:setvar DefaultLogPath "C:\Users\happy.DESKTOP-7VOR5SQ\AppData\Local\Microsoft\VisualStudio\SSDT\Assets.Database"

GO
:on error exit
GO
/*
偵測 SQLCMD 模式，如果不支援 SQLCMD 模式，則停用指令碼執行。
若要在啟用 SQLCMD 模式後重新啟用指令碼，請執行以下:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'必須啟用 SQLCMD 模式才能成功執行此指令碼。';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO

USE [$(DatabaseName)];

IF NOT EXISTS (SELECT TOP 1 1 FROM AssetTypes)
BEGIN

    INSERT INTO [dbo].[AssetTypes] (AssetTypeDescription)
    VALUES ('Laptop')

    INSERT INTO [dbo].[AssetTypes] (AssetTypeDescription)
    VALUES ('Monitor')

    INSERT INTO [dbo].[AssetTypes] (AssetTypeDescription)
    VALUES ('Phone')

END
GO
IF NOT EXISTS (SELECT TOP 1 1 FROM Locations)
BEGIN

    INSERT INTO [dbo].[Locations] (Country, PostalCode, AddressLine1)
    VALUES ('USA', 'DC 20500', '1600 Pennsylvania Ave NW')

    INSERT INTO [dbo].[Locations] (Country, PostalCode, AddressLine1)
    VALUES ('UK', 'SW1A 0AA', 'Houses of Parliament')

END
GO

GO
PRINT N'更新完成。';


GO
