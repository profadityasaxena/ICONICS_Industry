USE [BajajMEA]
GO

/****** Object:  Table [dbo].[OrderManagement_Kitrack_Locations]    Script Date: 25-08-2022 12:36:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderManagement_Kitrack_Locations](
	[line_id] [int] NOT NULL,
	[line_name] [varchar](50) NOT NULL,
	[location_id] [int] NOT NULL,
	[location_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderManagement_Kitrack_Locations] PRIMARY KEY CLUSTERED 
(
	[line_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


