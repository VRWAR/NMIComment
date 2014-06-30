/****** Object:  Table [dbo].[NMIComment]    Script Date: 16/05/2014 3:24:28 PM ******/

CREATE TABLE [dbo].[NMIComment](
	[id] [nvarchar](50) NOT NULL,
	[Column0001] [nvarchar](10) NOT NULL,
	[Column0002] [nvarchar](max) NULL,
	[Column0003] [datetime] NOT NULL,
	[Column0004] [nvarchar](100) NULL,
	[Column0005] [nvarchar](100) NULL,
	[Column0006] [nvarchar](100) NULL,
 CONSTRAINT [PK_NMIComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

