-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

--************************************** [dbo].[StatusList]

CREATE TABLE [dbo].[StatusList]
(
 [statusID]    INT NOT NULL ,
 [name]        VARCHAR(50) NOT NULL ,
 [code]        VARCHAR(50) NOT NULL ,
 [description] VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_statusList] PRIMARY KEY CLUSTERED ([statusID] ASC)
);
GO



--************************************** [dbo].[AssignSheet]

CREATE TABLE [dbo].[AssignSheet]
(
 [printID]          INT NOT NULL ,
 [expectedDelivery] DATETIME NOT NULL ,

 CONSTRAINT [PK_AssignSheet] PRIMARY KEY CLUSTERED ([printID] ASC)
);
GO



--************************************** [dbo].[ShippingLog]

CREATE TABLE [dbo].[ShippingLog]
(
 [shippingID]     INT NOT NULL ,
 [deliveryAmount] FLOAT NOT NULL ,
 [dateTime]       DATETIME NOT NULL ,
 [trackingNumber] INT NOT NULL ,

 CONSTRAINT [PK_ShippingLog] PRIMARY KEY CLUSTERED ([shippingID] ASC)
);
GO



--************************************** [dbo].[AddressType]

CREATE TABLE [dbo].[AddressType]
(
 [addressTypeID] INT NOT NULL ,
 [typeName]      VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_addressType] PRIMARY KEY CLUSTERED ([addressTypeID] ASC)
);
GO



--************************************** [dbo].[FileType]

CREATE TABLE [dbo].[FileType]
(
 [fileTypeID] INT NOT NULL ,
 [name]       VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_fileType] PRIMARY KEY CLUSTERED ([fileTypeID] ASC)
);
GO



--************************************** [dbo].[BusinessType]

CREATE TABLE [dbo].[BusinessType]
(
 [businessTypeID] INT NOT NULL ,
 [name]           VARCHAR(50) NOT NULL ,
 [loyalty]        INT NOT NULL ,

 CONSTRAINT [PK_businessType] PRIMARY KEY CLUSTERED ([businessTypeID] ASC)
);
GO



--************************************** [dbo].[OrderCost]

CREATE TABLE [dbo].[OrderCost]
(
 [orderCostID] INT NOT NULL ,
 [estimated]   FLOAT NOT NULL ,
 [dealAt]      FLOAT NOT NULL ,

 CONSTRAINT [PK_orderCost] PRIMARY KEY CLUSTERED ([orderCostID] ASC)
);
GO



--************************************** [dbo].[Position]

CREATE TABLE [dbo].[Position]
(
 [positionID] INT NOT NULL ,
 [name]       VARCHAR(50) NOT NULL ,
 [level]      VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED ([positionID] ASC)
);
GO



--************************************** [dbo].[Account]

CREATE TABLE [dbo].[Account]
(
 [accountID] INT NOT NULL ,
 [name]      VARCHAR(50) NOT NULL ,
 [password]  VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([accountID] ASC)
);
GO



--************************************** [dbo].[ContactPerson]

CREATE TABLE [dbo].[ContactPerson]
(
 [contactID] INT NOT NULL ,
 [name]      VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_ContactPerson] PRIMARY KEY CLUSTERED ([contactID] ASC)
);
GO



--************************************** [dbo].[Unit]

CREATE TABLE [dbo].[Unit]
(
 [unitID] INT NOT NULL ,
 [name]   VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED ([unitID] ASC)
);
GO



--************************************** [dbo].[FactorySize]

CREATE TABLE [dbo].[FactorySize]
(
 [cutSizeID] INT NOT NULL ,
 [sizeW]     FLOAT NOT NULL ,
 [sizeH]     FLOAT NOT NULL ,

 CONSTRAINT [PK_cutSize] PRIMARY KEY CLUSTERED ([cutSizeID] ASC)
);
GO



--************************************** [dbo].[OrderStatus]

CREATE TABLE [dbo].[OrderStatus]
(
 [orderStatusID] INT NOT NULL ,
 [statusID]      INT NOT NULL ,
 [createdDate]   DATETIME NOT NULL ,
 [createdBy]     VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED ([orderStatusID] ASC, [statusID] ASC),
 CONSTRAINT [FK_350] FOREIGN KEY ([statusID])
  REFERENCES [dbo].[StatusList]([statusID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_350] ON [dbo].[OrderStatus]
 (
  [statusID] ASC
 )

GO


--************************************** [dbo].[Files]

CREATE TABLE [dbo].[Files]
(
 [fileID]      INT NOT NULL ,
 [fileTypeID]  INT NOT NULL ,
 [filePath]    VARCHAR(50) NOT NULL ,
 [last_update] VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED ([fileID] ASC, [fileTypeID] ASC),
 CONSTRAINT [FK_219] FOREIGN KEY ([fileTypeID])
  REFERENCES [dbo].[FileType]([fileTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_219] ON [dbo].[Files]
 (
  [fileTypeID] ASC
 )

GO


--************************************** [dbo].[Address]

CREATE TABLE [dbo].[Address]
(
 [addressID]      INT NOT NULL ,
 [addressTypeID]  INT NOT NULL ,
 [detailsAddress] VARCHAR(50) NOT NULL ,
 [email]          VARCHAR(50) NOT NULL ,
 [tel1]           INT NOT NULL ,
 [tel2]           INT NOT NULL ,
 [fax_1]          INT NOT NULL ,
 [LineID_others]  VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([addressID] ASC, [addressTypeID] ASC),
 CONSTRAINT [FK_228] FOREIGN KEY ([addressTypeID])
  REFERENCES [dbo].[AddressType]([addressTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_228] ON [dbo].[Address]
 (
  [addressTypeID] ASC
 )

GO


--************************************** [dbo].[Staff]

CREATE TABLE [dbo].[Staff]
(
 [staffID]    INT NOT NULL ,
 [positionID] INT NOT NULL ,
 [accountID]  INT NOT NULL ,
 [name]       VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([staffID] ASC, [positionID] ASC, [accountID] ASC),
 CONSTRAINT [FK_122] FOREIGN KEY ([positionID])
  REFERENCES [dbo].[Position]([positionID]),
 CONSTRAINT [FK_128] FOREIGN KEY ([accountID])
  REFERENCES [dbo].[Account]([accountID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_122] ON [dbo].[Staff]
 (
  [positionID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_128] ON [dbo].[Staff]
 (
  [accountID] ASC
 )

GO


--************************************** [dbo].[PaperType]

CREATE TABLE [dbo].[PaperType]
(
 [paperTypeID] INT NOT NULL ,
 [cutSizeID]   INT NOT NULL ,
 [unitID]      INT NOT NULL ,
 [name]        VARCHAR(50) NOT NULL ,
 [gram]        INT NOT NULL ,

 CONSTRAINT [PK_PaperType] PRIMARY KEY CLUSTERED ([paperTypeID] ASC, [cutSizeID] ASC, [unitID] ASC),
 CONSTRAINT [FK_26] FOREIGN KEY ([cutSizeID])
  REFERENCES [dbo].[FactorySize]([cutSizeID]),
 CONSTRAINT [FK_30] FOREIGN KEY ([unitID])
  REFERENCES [dbo].[Unit]([unitID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_26] ON [dbo].[PaperType]
 (
  [cutSizeID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_30] ON [dbo].[PaperType]
 (
  [unitID] ASC
 )

GO


--************************************** [dbo].[Providers]

CREATE TABLE [dbo].[Providers]
(
 [providerID]    INT NOT NULL ,
 [addressID]     INT NOT NULL ,
 [addressTypeID] INT NOT NULL ,
 [name]          VARCHAR(50) NOT NULL ,
 [type]          VARCHAR(50) NOT NULL ,
 [is_active]     INT NOT NULL ,

 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED ([providerID] ASC, [addressID] ASC, [addressTypeID] ASC),
 CONSTRAINT [FK_376] FOREIGN KEY ([addressID], [addressTypeID])
  REFERENCES [dbo].[Address]([addressID], [addressTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_376] ON [dbo].[Providers]
 (
  [addressID] ASC,
  [addressTypeID] ASC
 )

GO


--************************************** [dbo].[Customer]

CREATE TABLE [dbo].[Customer]
(
 [customerID]     INT NOT NULL ,
 [contactID]      INT NOT NULL ,
 [businessTypeID] INT NOT NULL ,
 [addressID]      INT NOT NULL ,
 [addressTypeID]  INT NOT NULL ,
 [name]           VARCHAR(50) NOT NULL ,
 [last_update]    DATETIME NOT NULL ,
 [is_active]      INT NOT NULL ,

 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([customerID] ASC, [contactID] ASC, [businessTypeID] ASC, [addressID] ASC, [addressTypeID] ASC),
 CONSTRAINT [FK_189] FOREIGN KEY ([contactID])
  REFERENCES [dbo].[ContactPerson]([contactID]),
 CONSTRAINT [FK_203] FOREIGN KEY ([businessTypeID])
  REFERENCES [dbo].[BusinessType]([businessTypeID]),
 CONSTRAINT [FK_316] FOREIGN KEY ([addressID], [addressTypeID])
  REFERENCES [dbo].[Address]([addressID], [addressTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_189] ON [dbo].[Customer]
 (
  [contactID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_203] ON [dbo].[Customer]
 (
  [businessTypeID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_316] ON [dbo].[Customer]
 (
  [addressID] ASC,
  [addressTypeID] ASC
 )

GO


--************************************** [dbo].[OrderPaper]

CREATE TABLE [dbo].[OrderPaper]
(
 [orderPaperID]   INT NOT NULL ,
 [paperTypeID]    INT NOT NULL ,
 [cutSizeID]      INT NOT NULL ,
 [unitID]         INT NOT NULL ,
 [amountperOrder] INT NOT NULL ,

 CONSTRAINT [PK_OrderPaper] PRIMARY KEY CLUSTERED ([orderPaperID] ASC, [paperTypeID] ASC, [cutSizeID] ASC, [unitID] ASC),
 CONSTRAINT [FK_383] FOREIGN KEY ([paperTypeID], [cutSizeID], [unitID])
  REFERENCES [dbo].[PaperType]([paperTypeID], [cutSizeID], [unitID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_383] ON [dbo].[OrderPaper]
 (
  [paperTypeID] ASC,
  [cutSizeID] ASC,
  [unitID] ASC
 )

GO


--************************************** [dbo].[Supplier]

CREATE TABLE [dbo].[Supplier]
(
 [supplierID]    INT NOT NULL ,
 [contactID]     INT NOT NULL ,
 [addressID]     INT NOT NULL ,
 [addressTypeID] INT NOT NULL ,
 [name]          VARCHAR(50) NOT NULL ,
 [supplierType]  VARCHAR(50) NOT NULL ,
 [last_update]   DATETIME NOT NULL ,
 [is_active]     INT NOT NULL ,

 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED ([supplierID] ASC, [contactID] ASC, [addressID] ASC, [addressTypeID] ASC),
 CONSTRAINT [FK_105] FOREIGN KEY ([contactID])
  REFERENCES [dbo].[ContactPerson]([contactID]),
 CONSTRAINT [FK_323] FOREIGN KEY ([addressID], [addressTypeID])
  REFERENCES [dbo].[Address]([addressID], [addressTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_105] ON [dbo].[Supplier]
 (
  [contactID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_323] ON [dbo].[Supplier]
 (
  [addressID] ASC,
  [addressTypeID] ASC
 )

GO


--************************************** [dbo].[PaperPrice]

CREATE TABLE [dbo].[PaperPrice]
(
 [priceID]       INT NOT NULL ,
 [staffID]       INT NOT NULL ,
 [positionID]    INT NOT NULL ,
 [accountID]     INT NOT NULL ,
 [priceperReam]  INT NOT NULL ,
 [priceperKg]    INT NOT NULL ,
 [priceperPack]  INT NOT NULL ,
 [priceperSheet] INT NOT NULL ,
 [discount]      INT NOT NULL ,
 [lastUpdate]    DATETIME NOT NULL ,

 CONSTRAINT [PK_PaperPrice] PRIMARY KEY CLUSTERED ([priceID] ASC, [staffID] ASC, [positionID] ASC, [accountID] ASC),
 CONSTRAINT [FK_71] FOREIGN KEY ([staffID], [positionID], [accountID])
  REFERENCES [dbo].[Staff]([staffID], [positionID], [accountID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_71] ON [dbo].[PaperPrice]
 (
  [staffID] ASC,
  [positionID] ASC,
  [accountID] ASC
 )

GO


--************************************** [dbo].[Machines]

CREATE TABLE [dbo].[Machines]
(
 [machineID]     INT NOT NULL ,
 [providerID]    INT NOT NULL ,
 [addressID]     INT NOT NULL ,
 [addressTypeID] INT NOT NULL ,
 [name]          VARCHAR(50) NOT NULL ,
 [model]         VARCHAR(50) NOT NULL ,
 [MFID]          INT NOT NULL ,
 [expiryDate]    DATETIME NOT NULL ,

 CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED ([machineID] ASC, [providerID] ASC, [addressID] ASC, [addressTypeID] ASC),
 CONSTRAINT [FK_333] FOREIGN KEY ([providerID], [addressID], [addressTypeID])
  REFERENCES [dbo].[Providers]([providerID], [addressID], [addressTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_333] ON [dbo].[Machines]
 (
  [providerID] ASC,
  [addressID] ASC,
  [addressTypeID] ASC
 )

GO


--************************************** [dbo].[OrderDetails]

CREATE TABLE [dbo].[OrderDetails]
(
 [orderDetailsID] INT NOT NULL ,
 [orderCostID]    INT NOT NULL ,
 [printID]        INT NOT NULL ,
 [shippingID]     INT NOT NULL ,
 [orderPaperID]   INT NOT NULL ,
 [paperTypeID]    INT NOT NULL ,
 [cutSizeID]      INT NOT NULL ,
 [unitID]         INT NOT NULL ,
 [fileID]         INT NOT NULL ,
 [fileTypeID]     INT NOT NULL ,
 [remarks]        VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED ([orderDetailsID] ASC, [orderCostID] ASC, [printID] ASC, [shippingID] ASC, [orderPaperID] ASC, [paperTypeID] ASC, [cutSizeID] ASC, [unitID] ASC, [fileID] ASC, [fileTypeID] ASC),
 CONSTRAINT [FK_150] FOREIGN KEY ([orderCostID])
  REFERENCES [dbo].[OrderCost]([orderCostID]),
 CONSTRAINT [FK_252] FOREIGN KEY ([printID])
  REFERENCES [dbo].[AssignSheet]([printID]),
 CONSTRAINT [FK_337] FOREIGN KEY ([shippingID])
  REFERENCES [dbo].[ShippingLog]([shippingID]),
 CONSTRAINT [FK_389] FOREIGN KEY ([orderPaperID], [paperTypeID], [cutSizeID], [unitID])
  REFERENCES [dbo].[OrderPaper]([orderPaperID], [paperTypeID], [cutSizeID], [unitID]),
 CONSTRAINT [FK_400] FOREIGN KEY ([fileID], [fileTypeID])
  REFERENCES [dbo].[Files]([fileID], [fileTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_150] ON [dbo].[OrderDetails]
 (
  [orderCostID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_252] ON [dbo].[OrderDetails]
 (
  [printID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_337] ON [dbo].[OrderDetails]
 (
  [shippingID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_389] ON [dbo].[OrderDetails]
 (
  [orderPaperID] ASC,
  [paperTypeID] ASC,
  [cutSizeID] ASC,
  [unitID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_400] ON [dbo].[OrderDetails]
 (
  [fileID] ASC,
  [fileTypeID] ASC
 )

GO


--************************************** [dbo].[PaperStock]

CREATE TABLE [dbo].[PaperStock]
(
 [stockID]         INT NOT NULL ,
 [paperTypeID]     INT NOT NULL ,
 [cutSizeID]       INT NOT NULL ,
 [unitID]          INT NOT NULL ,
 [priceID]         INT NOT NULL ,
 [supplierID]      INT NOT NULL ,
 [staffID]         INT NOT NULL ,
 [contactID]       INT NOT NULL ,
 [positionID]      INT NOT NULL ,
 [accountID]       INT NOT NULL ,
 [addressID]       INT NOT NULL ,
 [addressTypeID]   INT NOT NULL ,
 [amount]          INT NOT NULL ,
 [remainingAmount] INT NOT NULL ,

 CONSTRAINT [PK_PaperStock] PRIMARY KEY CLUSTERED ([stockID] ASC, [paperTypeID] ASC, [cutSizeID] ASC, [unitID] ASC, [priceID] ASC, [supplierID] ASC, [staffID] ASC, [contactID] ASC, [positionID] ASC, [accountID] ASC, [addressID] ASC, [addressTypeID] ASC),
 CONSTRAINT [FK_34] FOREIGN KEY ([paperTypeID], [cutSizeID], [unitID])
  REFERENCES [dbo].[PaperType]([paperTypeID], [cutSizeID], [unitID]),
 CONSTRAINT [FK_50] FOREIGN KEY ([priceID], [staffID], [positionID], [accountID])
  REFERENCES [dbo].[PaperPrice]([priceID], [staffID], [positionID], [accountID]),
 CONSTRAINT [FK_60] FOREIGN KEY ([supplierID], [contactID], [addressID], [addressTypeID])
  REFERENCES [dbo].[Supplier]([supplierID], [contactID], [addressID], [addressTypeID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_34] ON [dbo].[PaperStock]
 (
  [paperTypeID] ASC,
  [cutSizeID] ASC,
  [unitID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_50] ON [dbo].[PaperStock]
 (
  [priceID] ASC,
  [staffID] ASC,
  [positionID] ASC,
  [accountID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_60] ON [dbo].[PaperStock]
 (
  [supplierID] ASC,
  [contactID] ASC,
  [addressID] ASC,
  [addressTypeID] ASC
 )

GO


--************************************** [dbo].[Order]

CREATE TABLE [dbo].[Order]
(
 [orderID]        INT NOT NULL ,
 [orderDetailsID] INT NOT NULL ,
 [orderCostID]    INT NOT NULL ,
 [customerID]     INT NOT NULL ,
 [contactID]      INT NOT NULL ,
 [businessTypeID] INT NOT NULL ,
 [printID]        INT NOT NULL ,
 [orderStatusID]  INT NOT NULL ,
 [addressID]      INT NOT NULL ,
 [addressTypeID]  INT NOT NULL ,
 [shippingID]     INT NOT NULL ,
 [statusID]       INT NOT NULL ,
 [orderPaperID]   INT NOT NULL ,
 [paperTypeID]    INT NOT NULL ,
 [cutSizeID]      INT NOT NULL ,
 [unitID]         INT NOT NULL ,
 [fileID]         INT NOT NULL ,
 [fileTypeID]     INT NOT NULL ,
 [lastUpdate]     DATETIME NOT NULL ,
 [status]         INT NOT NULL ,

 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([orderID] ASC, [orderDetailsID] ASC, [orderCostID] ASC, [customerID] ASC, [contactID] ASC, [businessTypeID] ASC, [printID] ASC, [orderStatusID] ASC, [addressID] ASC, [addressTypeID] ASC, [shippingID] ASC, [statusID] ASC, [orderPaperID] ASC, [paperTypeID] ASC, [cutSizeID] ASC, [unitID] ASC, [fileID] ASC, [fileTypeID] ASC),
 CONSTRAINT [FK_154] FOREIGN KEY ([orderDetailsID], [orderCostID], [printID], [shippingID], [orderPaperID], [paperTypeID], [cutSizeID], [unitID], [fileID], [fileTypeID])
  REFERENCES [dbo].[OrderDetails]([orderDetailsID], [orderCostID], [printID], [shippingID], [orderPaperID], [paperTypeID], [cutSizeID], [unitID], [fileID], [fileTypeID]),
 CONSTRAINT [FK_193] FOREIGN KEY ([customerID], [contactID], [businessTypeID], [addressID], [addressTypeID])
  REFERENCES [dbo].[Customer]([customerID], [contactID], [businessTypeID], [addressID], [addressTypeID]),
 CONSTRAINT [FK_295] FOREIGN KEY ([orderStatusID], [statusID])
  REFERENCES [dbo].[OrderStatus]([orderStatusID], [statusID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_154] ON [dbo].[Order]
 (
  [orderDetailsID] ASC,
  [orderCostID] ASC,
  [printID] ASC,
  [shippingID] ASC,
  [orderPaperID] ASC,
  [paperTypeID] ASC,
  [cutSizeID] ASC,
  [unitID] ASC,
  [fileID] ASC,
  [fileTypeID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_193] ON [dbo].[Order]
 (
  [customerID] ASC,
  [contactID] ASC,
  [businessTypeID] ASC,
  [addressID] ASC,
  [addressTypeID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_295] ON [dbo].[Order]
 (
  [orderStatusID] ASC,
  [statusID] ASC
 )

GO
