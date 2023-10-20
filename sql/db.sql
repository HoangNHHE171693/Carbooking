USE [CarBooking]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 10/20/2023 7:04:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seats] [int] NULL,
	[departureTime] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[destination] [varchar](100) NULL,
	[arrivalTime] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 10/20/2023 7:04:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[busId] [int] NULL,
	[seatNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/20/2023 7:04:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](100) NOT NULL,
	[dob] [date] NULL,
	[email] [varchar](320) NULL,
	[full_name] [varchar](100) NULL,
	[gender] [int] NULL,
	[password] [varchar](100) NULL,
	[role] [int] NULL,
	[img] [nvarchar](max) default N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Aline', CAST(N'2023-07-19' AS Date), N'phasellus.dolor@yahoo.org', N'Kadeem', 0, N'202cb962ac59075b964b07152d234b70', 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 0)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Branden', CAST(N'2023-08-15' AS Date), N'consequat.purus@google.com', N'Yuli', 0, N'202cb962ac59075b964b07152d234b70', 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Chiquita', CAST(N'2023-04-29' AS Date), N'tellus.justo.sit@google.com', N'Ulysses', 1, N'202cb962ac59075b964b07152d234b70', 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Christian', CAST(N'2023-05-26' AS Date), N'eu.erat@google.net', N'Damian', 0, N'202cb962ac59075b964b07152d234b70', 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Clio', CAST(N'2023-08-17' AS Date), N'fusce@icloud.com', N'Elvis Nam', 0, N'e10adc3949ba59abbe56e057f20f883e', 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'David', CAST(N'2023-05-26' AS Date), N'malesuada@hotmail.net', N'Castor', 0, N'202cb962ac59075b964b07152d234b70', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([busId])
REFERENCES [dbo].[Bus] ([id])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO

-- Sample data for the "Bus" table
INSERT INTO [dbo].[Bus] ([seats], [departureTime], [source], [destination], [arrivalTime])
VALUES
(45, '2023-10-21 08:30 AM', 'Hanoi', 'Ho Chi Minh City', '2023-10-21 03:30 PM'),
(30, '2023-10-21 10:00 AM', 'Hanoi', 'Da Nang', '2023-10-21 04:30 PM'),
(40, '2023-10-21 09:00 AM', 'Hanoi', 'Nha Trang', '2023-10-21 05:00 PM');

-- Sample data for the "Ticket" table
-- Tickets for passengers traveling from Hanoi to Ho Chi Minh City
INSERT INTO [dbo].[ticket] ([username], [busId], [seatNumber])
VALUES
('Aline', 1, 1), -- Aline booked a ticket on Bus 1, Seat 1
('Branden', 1, 2), -- Branden booked a ticket on Bus 1, Seat 2

-- Tickets for passengers traveling from Hanoi to Da Nang
('Chiquita', 2, 1), -- Chiquita booked a ticket on Bus 2, Seat 1
('Christian', 2, 2), -- Christian booked a ticket on Bus 2, Seat 2

-- Tickets for passengers traveling from Hanoi to Nha Trang
('Clio', 3, 1), -- Clio booked a ticket on Bus 3, Seat 1
('David', 3, 2); -- David booked a ticket on Bus 3, Seat 2

