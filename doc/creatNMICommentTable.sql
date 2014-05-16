/****** Object:  Table [dbo].[NMIComment]    Script Date: 16/05/2014 3:24:28 PM ******/

CREATE TABLE [dbo].[NMIComment](
	[id] [nvarchar](50) NOT NULL,
	[NMI_number] [nvarchar](10) NOT NULL,
	[comment] [nvarchar](max) NULL,
	[comment_time] [datetime] NOT NULL,
 CONSTRAINT [PK_NMIComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


