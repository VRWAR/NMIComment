USE [VRSailor]
GO

/****** Object:  Table [dbo].[NMIComment]    Script Date: 13/05/2014 5:20:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NMIComment](
	[id] [nvarchar](50) NOT NULL,
	[NMI_number] [nvarchar](10) NOT NULL,
	[comment] [nvarchar](max) NULL,
	[comment_time] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

