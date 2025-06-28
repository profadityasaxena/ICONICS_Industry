USE [BajajMEA]
GO

/****** Object:  Table [dbo].[Alerts_User_Config]    Script Date: 31-05-2022 12:29:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Alerts_User_Config](
	[sr_no] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[department] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[created_on] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Alerts_User_Config] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Alerts_User_Config] ADD  CONSTRAINT [DF_Alerts_User_Config_created_on]  DEFAULT (getdate()) FOR [created_on]
GO


