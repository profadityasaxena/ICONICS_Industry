USE [BajajMEA]
GO
/****** Object:  Table [dbo].[Config_JH]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config_JH](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[line_id] [int] NOT NULL,
	[line_name] [varchar](50) NOT NULL,
	[stage_id] [int] NOT NULL,
	[stage_name] [varchar](50) NOT NULL,
	[equipment_id] [int] NOT NULL,
	[equipment_name] [varchar](50) NOT NULL,
	[sequence] [int] NOT NULL,
	[check_point] [varchar](50) NOT NULL,
	[c_l_i_rt] [varchar](50) NOT NULL,
	[related_to] [varchar](50) NOT NULL,
	[if_not_ok] [varchar](50) NOT NULL,
	[standard_condition] [varchar](50) NOT NULL,
	[item] [varchar](50) NOT NULL,
	[machine_condition] [varchar](50) NOT NULL,
	[method] [varchar](50) NOT NULL,
	[frequency] [varchar](50) NOT NULL,
	[duration] [int] NOT NULL,
	[start_point] [datetime] NOT NULL,
	[due_date] [datetime] NULL,
	[time] [varchar](50) NOT NULL,
	[inform_to_pm] [int] NOT NULL,
	[activity_enable] [int] NOT NULL,
	[status] [int] NULL,
	[created_by] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config_JH_History]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config_JH_History](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[line_name] [varchar](50) NOT NULL,
	[stgae_name] [varchar](50) NOT NULL,
	[equipment_name] [varchar](50) NOT NULL,
	[check_point] [varchar](50) NOT NULL,
	[related_to] [varchar](50) NOT NULL,
	[c_l_i_rt] [varchar](50) NOT NULL,
	[if_not_ok] [varchar](50) NOT NULL,
	[item] [varchar](50) NOT NULL,
	[machine_condition] [varchar](50) NOT NULL,
	[standard_condition] [varchar](50) NOT NULL,
	[method] [varchar](50) NOT NULL,
	[time] [varchar](50) NOT NULL,
	[start_point] [datetime] NOT NULL,
	[due_date] [datetime] NOT NULL,
	[current_date_time] [datetime] NOT NULL,
	[operator] [varchar](50) NOT NULL,
	[actual_value] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[remarks] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config_PM]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config_PM](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[line_id] [int] NOT NULL,
	[line_name] [varchar](50) NOT NULL,
	[stage_id] [int] NOT NULL,
	[stage_name] [varchar](50) NOT NULL,
	[equipment_id] [int] NOT NULL,
	[equipment_name] [varchar](50) NOT NULL,
	[sub_unit_id] [int] NOT NULL,
	[sub_unit_name] [varchar](50) NOT NULL,
	[check_point] [varchar](50) NOT NULL,
	[standard_condition] [varchar](50) NOT NULL,
	[frequency] [varchar](50) NOT NULL,
	[duration] [int] NOT NULL,
	[start_point] [datetime] NOT NULL,
	[due_date] [datetime] NULL,
	[activity_enable] [int] NOT NULL,
	[status] [int] NULL,
	[created_by] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config_PM_History]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config_PM_History](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[line_name] [varchar](50) NOT NULL,
	[stage_name] [varchar](50) NOT NULL,
	[assembly] [varchar](50) NOT NULL,
	[sub_assembly] [varchar](50) NOT NULL,
	[check_point] [varchar](50) NOT NULL,
	[standard_condition] [varchar](50) NOT NULL,
	[start_point] [date] NOT NULL,
	[due_date] [date] NOT NULL,
	[current_date_time] [date] NOT NULL,
	[operator] [varchar](50) NOT NULL,
	[actual_value] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[remarks] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Config_JH] ON 

INSERT [dbo].[Config_JH] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sequence], [check_point], [c_l_i_rt], [related_to], [if_not_ok], [standard_condition], [item], [machine_condition], [method], [frequency], [duration], [start_point], [due_date], [time], [inform_to_pm], [activity_enable], [status], [created_by]) VALUES (1, 1, N'Sub Group 1', 1, N'Stage 0', 1819, N' ST-0 RET LINE', 1, N'Robot gripper pad', N'Inspect', N'Leads to Defect	', N'Tight & Replace it ', N'Gripper pad no loose / no wear', N'Gripper pad', N'Idle', N'Eye/Hand', N'Daily', 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'45', 0, 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_JH] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sequence], [check_point], [c_l_i_rt], [related_to], [if_not_ok], [standard_condition], [item], [machine_condition], [method], [frequency], [duration], [start_point], [due_date], [time], [inform_to_pm], [activity_enable], [status], [created_by]) VALUES (2, 1, N'Sub Group 1', 1, N'Stage 0', 1819, N' ST-0 RET LINE', 2, N'Robot gripper pad', N'Inspect', N'Leads to Defect	', N'Tight & Replace it ', N'Gripper pad no loose / no wear', N'Gripper pad', N'Idle', N'Eye/Hand', N'Daily', 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), CAST(N'2022-11-19T00:00:00.000' AS DateTime), N'45', 0, 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_JH] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sequence], [check_point], [c_l_i_rt], [related_to], [if_not_ok], [standard_condition], [item], [machine_condition], [method], [frequency], [duration], [start_point], [due_date], [time], [inform_to_pm], [activity_enable], [status], [created_by]) VALUES (3, 1, N'Sub Group 1', 1, N'Stage 0', 1819, N' ST-0 RET LINE', 3, N'Robot gripper pad', N'Inspect', N'Leads to Defect	', N'Tight & Replace it ', N'Gripper pad no loose / no wear', N'Gripper pad', N'Idle', N'Eye/Hand', N'Daily', 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), CAST(N'2022-11-19T00:00:00.000' AS DateTime), N'45', 0, 0, 0, N'DESKTOP-J9I6E9I\DTPL')
SET IDENTITY_INSERT [dbo].[Config_JH] OFF
GO
SET IDENTITY_INSERT [dbo].[Config_JH_History] ON 

INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (1, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:12:30.250' AS DateTime), CAST(N'2022-12-16T16:30:00.000' AS DateTime), CAST(N'2022-12-16T06:12:25.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (2, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:16:54.423' AS DateTime), CAST(N'2022-12-16T16:30:00.000' AS DateTime), CAST(N'2022-12-16T06:16:49.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (3, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Robot gripper pad', N'Leads to Defect	', N'Inspect', N'Tight & Replace it ', N'Gripper pad', N'Idle', N'Gripper pad no loose / no wear', N'Eye/Hand', N'45', CAST(N'2022-12-16T17:41:55.853' AS DateTime), CAST(N'2022-12-17T17:41:55.853' AS DateTime), CAST(N'2022-12-16T06:16:52.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (6, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Cable & Pneumatic pipe', N'Leads to Break down', N'Inspect', N'Insert cable in fins of drag chain ', N'Drag Chain', N'Idle', N'No cable projecting out from chain', N'Hand', N'45', CAST(N'2022-12-16T17:42:17.797' AS DateTime), CAST(N'2022-12-17T17:42:17.797' AS DateTime), CAST(N'2022-12-16T06:17:01.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (8, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Robot gripper pad', N'Leads to Defect	', N'Inspect', N'Tight & Replace it ', N'Gripper pad', N'Idle', N'Gripper pad no loose / no wear', N'Eye/Hand', N'45', CAST(N'2022-12-16T18:17:05.983' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-12-16T06:21:55.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (9, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:16:57.470' AS DateTime), CAST(N'2022-12-16T16:30:00.000' AS DateTime), CAST(N'2022-12-16T06:22:09.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (10, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:16:57.470' AS DateTime), CAST(N'2022-12-16T16:30:00.000' AS DateTime), CAST(N'2022-12-16T06:26:28.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (12, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:27:33.847' AS DateTime), CAST(N'2022-12-16T16:30:00.000' AS DateTime), CAST(N'2022-12-16T06:27:29.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (13, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:28:25.760' AS DateTime), CAST(N'2022-12-16T23:30:00.000' AS DateTime), CAST(N'2022-12-16T06:28:21.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (15, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:30:46.090' AS DateTime), CAST(N'2022-12-17T00:30:00.000' AS DateTime), CAST(N'2022-12-16T06:31:31.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (16, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Robot gripper pad', N'Leads to Defect	', N'Inspect', N'Tight & Replace it ', N'Gripper pad', N'Idle', N'Gripper pad no loose / no wear', N'Eye/Hand', N'45', CAST(N'2022-12-16T18:17:05.983' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-12-16T06:31:43.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (11, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:26:43.127' AS DateTime), CAST(N'2023-03-16T15:30:00.000' AS DateTime), CAST(N'2022-12-16T06:26:38.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (14, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Panel Keyboard and touch screen', N'Leads to Defect	', N'Clean', N'Should be clean with socked cotten cloth by using ', N'Machine Panel', N'Idle', N'Free from Covid-19 antipathy', N'Hand', N'60', CAST(N'2022-12-16T18:30:31.697' AS DateTime), CAST(N'2022-12-17T00:30:00.000' AS DateTime), CAST(N'2022-12-16T06:30:27.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_JH_History] ([uid], [line_name], [stgae_name], [equipment_name], [check_point], [related_to], [c_l_i_rt], [if_not_ok], [item], [machine_condition], [standard_condition], [method], [time], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (17, N'Sub Group 1', N'Stage 0', N'ROBOT-0', N'Cable & Pneumatic pipe', N'Leads to Break down', N'Inspect', N'Insert cable in fins of drag chain ', N'Drag Chain', N'Idle', N'No cable projecting out from chain', N'Hand', N'45', CAST(N'2022-12-16T18:17:13.867' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-12-16T06:31:49.000' AS DateTime), N'bajaj@bajaj.co.in', N'', N'OK', N'')
SET IDENTITY_INSERT [dbo].[Config_JH_History] OFF
GO
SET IDENTITY_INSERT [dbo].[Config_PM] ON 

INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (1, 1, N'Sub Group 1', 1, N'Stage 0', 1113, N'Pneumatic System', 3001, N'Air Filter', N'Check Cleaness of filter', N'Clean', N'Quarterly', 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 0, 1, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (2, 1, N'Sub Group 1', 1, N'Stage 0', 1113, N'Pneumatic System', 3003, N'All pipes', N'Check piping condition', N'No leak / cut', N'Quarterly', 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (3, 1, N'Sub Group 1', 1, N'Stage 0', 1113, N'Pneumatic System', 3002, N'FLR Adjusting knobs', N'Adjusting knobs', N'No breakage', N'Quarterly', 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (4, 1, N'Sub Group 1', 1, N'Stage 0', 1113, N'Pneumatic System', 3004, N'Valve silencer', N'Clean silencer', N'Clean', N'Quarterly', 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (5, 1, N'Sub Group 1', 13, N'SG1 - Common', 1901, N'SG1-Common-Alarms', 1901, N'SG1-Common-Alarms', N'CH 1', N'STD', N'Daily', 5, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (6, 1, N'Sub Group 1', 13, N'SG1 - Common', 1901, N'SG1-Common-Alarms', 1901, N'SG1-Common-Alarms', N'CH 2', N'STD', N'Daily', 5, CAST(N'2022-12-10T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), 0, 1, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (7, 1, N'Sub Group 1', 13, N'SG1 - Common', 1901, N'SG1-Common-Alarms', 1901, N'SG1-Common-Alarms', N'CH 3', N'STD', N'Daily', 5, CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-12-10T00:00:00.000' AS DateTime), 0, 0, N'DESKTOP-J9I6E9I\DTPL')
INSERT [dbo].[Config_PM] ([uid], [line_id], [line_name], [stage_id], [stage_name], [equipment_id], [equipment_name], [sub_unit_id], [sub_unit_name], [check_point], [standard_condition], [frequency], [duration], [start_point], [due_date], [activity_enable], [status], [created_by]) VALUES (8, 1, N'Sub Group 1', 13, N'SG1 - Common', 1901, N'SG1-Common-Alarms', 1901, N'SG1-Common-Alarms', N'CH 4', N'STD', N'Daily', 3, CAST(N'2022-12-10T00:00:00.000' AS DateTime), CAST(N'2022-12-13T00:00:00.000' AS DateTime), 0, 1, N'DESKTOP-J9I6E9I\DTPL')
SET IDENTITY_INSERT [dbo].[Config_PM] OFF
GO
SET IDENTITY_INSERT [dbo].[Config_PM_History] ON 

INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (1, N'Sub Group 1', N'Stage 0', N'Pneumatic System', N'Air Filter', N'Check Cleaness of filter', N'Clean', CAST(N'2022-12-12' AS Date), CAST(N'2023-03-12' AS Date), CAST(N'2022-12-12' AS Date), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (2, N'Sub Group 1', N'Stage 0', N'Pneumatic System', N'FLR Adjusting knobs', N'Adjusting knobs', N'No breakage', CAST(N'2022-12-12' AS Date), CAST(N'2023-03-12' AS Date), CAST(N'2022-12-12' AS Date), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (3, N'Sub Group 1', N'Stage 0', N'Pneumatic System', N'All pipes', N'Check piping condition', N'No leak / cut', CAST(N'2022-12-12' AS Date), CAST(N'2023-03-12' AS Date), CAST(N'2022-12-12' AS Date), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (4, N'Sub Group 1', N'Stage 0', N'Pneumatic System', N'Valve silencer', N'Clean silencer', N'Clean', CAST(N'2022-12-12' AS Date), CAST(N'2023-03-12' AS Date), CAST(N'2022-12-12' AS Date), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (5, N'Sub Group 1', N'Stage 0', N'Pneumatic System', N'Air Filter', N'Check Cleaness of filter', N'Clean', CAST(N'2022-12-12' AS Date), CAST(N'2023-03-12' AS Date), CAST(N'2022-12-15' AS Date), N'bajaj@bajaj.co.in', N'', N'Not OK', N'remark ')
INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (6, N'Sub Group 1', N'SG1 - Common', N'SG1-Common-Alarms', N'SG1-Common-Alarms', N'CH 2', N'STD', CAST(N'2022-12-10' AS Date), CAST(N'2022-12-15' AS Date), CAST(N'2022-12-15' AS Date), N'bajaj@bajaj.co.in', N'', N'OK', N'')
INSERT [dbo].[Config_PM_History] ([uid], [line_name], [stage_name], [assembly], [sub_assembly], [check_point], [standard_condition], [start_point], [due_date], [current_date_time], [operator], [actual_value], [status], [remarks]) VALUES (7, N'Sub Group 1', N'SG1 - Common', N'SG1-Common-Alarms', N'SG1-Common-Alarms', N'CH 4', N'STD', CAST(N'2022-12-10' AS Date), CAST(N'2022-12-13' AS Date), CAST(N'2022-12-15' AS Date), N'bajaj@bajaj.co.in', N'', N'OK', N'')
SET IDENTITY_INSERT [dbo].[Config_PM_History] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_JH]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Avinash>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================




CREATE   PROCEDURE [dbo].[SP_Config_JH]
-- Add the parameters for the stored procedure here

@line_name varchar(50),
@stage_name varchar(50),
@equipment_name varchar(50),
@sequence int,
@check_point varchar(50),
@c_l_i_rt varchar(50),
@related_to varchar(50),
@if_not_ok varchar(50),
@standard_condition varchar(50),
@item varchar(50),
@machine_condition varchar(50),
@method varchar(50),
@frequency varchar(50),
@duration int,
@start_point datetime,
--@DueDate date,
@time varchar(50),
@inform_to_pm int,
@activity_enable int,
@status int,
@created_by varchar(50),
@ActionOp varchar(10)

AS
BEGIN
DECLARE @line_id as int = (SELECT distinct line_id from Config_Line where line_name = @line_name);
DECLARE @stage_id as int = (SELECT distinct stage_id from Config_Stage where stage_name = @stage_name and line_id=(SELECT line_id FROM Config_Line WHERE line_name =@line_name));
DECLARE @equipment_id as int   = (SELECT equipment_id FROM Config_Equipment WHERE equipment_name=@equipment_name AND stage_id = (SELECT stage_id from Config_Stage WHERE stage_name = @stage_name AND line_id = (SELECT line_id from Config_Line where line_name = @line_name)));

DECLARE @due_date as datetime


DECLARE @isExist int = (select count(1) from [dbo].[Config_JH]  WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sequence] = @sequence)
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
IF(@created_by = '')
BEGIN
SELECT '[ERROR] User must be logged in' as Response;
END
ELSE IF(@created_by != '')
BEGIN

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
  -- Declare a cursor to fetch each row in the table one at a time and for each row in the table perform the below
--calculation
select * from Config_JH order by line_id,stage_id,equipment_id asc
if @frequency = 'Yearly'
set @due_date = DATEADD(YEAR,@duration,@start_point)
if @frequency = 'Monthly'
set @due_date = DATEADD(MONTH,@duration,@start_point)
else if @frequency = 'Daily'
set @due_date = DATEADD(DAY,@duration,@start_point)
else if @frequency = 'Weekly'
set @due_date = DATEADD(WEEK,@duration,@start_point)
else if @frequency = 'Quarterly'
set @due_date = DATEADD(QUARTER,@duration,@start_point)
--Print @DueDate

BEGIN TRY
INSERT INTO [dbo].[Config_JH] (
--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
[sequence],[check_point],[line_name],[line_id],[stage_name],[stage_id],[equipment_name],[equipment_id],
[c_l_i_rt],[related_to],[if_not_ok],[standard_condition],[item],[machine_condition],[method],[frequency],[duration],[start_point],[due_date],
[time],[inform_to_pm],[activity_enable],[status],[created_by]
) VALUES (
--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
@sequence,@check_point,@line_name,@line_id,@stage_name,@stage_id,@equipment_name,@equipment_id,
@c_l_i_rt,@related_to,@if_not_ok,@standard_condition,@item,@machine_condition,@method,@frequency,@duration,@start_point,@due_date,
@time,@inform_to_pm,@activity_enable,0,@created_by  );

SELECT 'Inserted Successfully' AS Response
 
END TRY
BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
SELECT '[Error]-CheckPoint ID needs to be unique. This Checkpoint ID already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).'
 AS Response
END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.
-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
   BEGIN
if(@isExist > 0)
-- Declare a cursor to fetch each row in the table one at a time and for each row in the table perform the below
--calculation
select @start_point=[start_point] from Config_JH
WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sequence] = @sequence order by line_id,stage_id,equipment_id asc
if @frequency = 'Yearly'
set @due_date = DATEADD(YEAR,@duration,@start_point)
if @frequency = 'Monthly'
set @due_date = DATEADD(MONTH,@duration,@start_point)
else if @frequency = 'Daily'
set @due_date = DATEADD(DAY,@duration,@start_point)
else if @frequency = 'Weekly'
set @due_date = DATEADD(WEEK,@duration,@start_point)
else if @frequency = 'Quarterly'
set @due_date = DATEADD(QUARTER,@duration,@start_point)
--Print @DueDate

BEGIN
UPDATE [dbo].[Config_JH] SET
[check_point] = @check_point,
[c_l_i_rt] = @c_l_i_rt,
[related_to] = @related_to,
[if_not_ok] = @if_not_ok,
[standard_condition] = @standard_condition,
[item] = @item,
[machine_condition] = @machine_condition,
[method] = @method,
[frequency] = @frequency,
[duration] = @duration,
[time] = @time,
[due_date]=@due_date,
[inform_to_pm]= @inform_to_pm,
[activity_enable]=@activity_enable,
[status]=0,
[created_by]=@created_by
WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sequence] = @sequence
select ' Modified successfully.' AS Response
END
       
          BEGIN
                select '[Error]-There is no such value in the database. Hence modification is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).' AS Response
          END
    END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
DELETE FROM [dbo].[Config_JH]
WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sequence] = @sequence
SELECT ' Deleted successfully.' AS Response
END
    END
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_JH_History]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE      PROCEDURE [dbo].[SP_Config_JH_History]
-- Add the parameters for the stored procedure here
@check_point			varchar(50),
@standard_condition		varchar(50), 
@check_point_number		varchar(50),
@related_to				varchar(50),
@frequency				varchar(50),
@c_l_i_rt				varchar(50),
@item					varchar(50),
@route					varchar(50),
@if_not_ok				varchar(50),
@method					varchar(50),
@day					varchar(50),
@machine_condition		varchar(50),
@time					varchar(50),
@remark					varchar(50),
@created_by				varchar(50),
@ActionOp				varchar(10)

AS
BEGIN
--DECLARE @line_id as int			= (SELECT distinct line_id from Config_Line where line_name = @line_name);
--DECLARE @stage_id as int		= (SELECT distinct stage_id from Config_Stage where stage_name = @stage_name and line_id=(SELECT line_id FROM Config_Line WHERE line_name =@line_name));
--DECLARE @route_id as int		= (SELECT distinct route_id from Config_Route where route_name = @route_name);

DECLARE @isExist int			= (select count(1) from [dbo].[Config_JH]  WHERE [check_point_number] = @check_point_number)
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;


    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 	BEGIN TRY
		INSERT INTO [dbo].[Config_JH_History] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		[check_point],[standard_condition],[check_point_number],[related_to],[frequency],[c_l_i_rt],[item],[route],[if_not_ok],
		[method],[day],[machine_condition],[time],[remark],[created_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @check_point,@standard_condition,@check_point_number,@related_to,@frequency,@c_l_i_rt,@item,@route,@if_not_ok,
		 @method,@day,@machine_condition,@time,@remark,@created_by
		);

		SELECT 'Inserted Successfully' AS Response
 
	END TRY

	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-CheckPoint ID needs to be unique. This Checkpoint ID already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).'
 AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
   BEGIN
      if(@isExist > 0)
         BEGIN
			UPDATE [dbo].[Config_JH_History] SET
			[check_point] = @check_point,
			[standard_condition] = @standard_condition,
			[check_point_number] = @check_point_number,
			[related_to] = @related_to,
			[frequency] = @frequency,
			[c_l_i_rt] = @c_l_i_rt,
			[item] = @item,
			[route] = @route,
			[if_not_ok] = @if_not_ok,
			[method] = @method,
			[day] = @day,
			[machine_condition] = @machine_condition,
			[time] = @time,
			[remark] = @remark,
			[created_by] =@created_by

			WHERE [check_point_number] = @check_point_number 
			select ' Modified successfully.' AS Response
          END
       else
          BEGIN
                select '[Error]-There is no such value in the database. Hence modification is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).' AS Response
          END
    END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Config_JH_History]
			WHERE [check_point_number]	= @check_point_number
			SELECT ' Deleted successfully.' AS Response
		END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_PM]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE       PROCEDURE [dbo].[SP_Config_PM]
-- Add the parameters for the stored procedure here
@line_name				varchar(50),
@stage_name				varchar(50),
@equipment_name			varchar(50),
@check_point			varchar(50),
@sub_unit_name		    varchar(50),
@frequency				varchar(50),
@duration				int,
@start_point			datetime,
--@status					int,
@standard_condition		varchar(50),
@activity_enable		int,
@created_by				varchar(50),
@ActionOp				varchar(10)

AS
BEGIN

DECLARE @line_id as int				= (SELECT distinct line_id from Config_Line where line_name = @line_name);
DECLARE @stage_id as int			= (SELECT stage_id FROM Config_Stage WHERE stage_name=@stage_name AND line_id = (SELECT line_id from Config_Line WHERE line_name = @line_name))
DECLARE @equipment_id as int        = (SELECT equipment_id FROM Config_Equipment WHERE equipment_name=@equipment_name AND stage_id = (SELECT stage_id from Config_Stage WHERE stage_name = @stage_name AND line_id = (SELECT line_id from Config_Line where line_name = @line_name)));
DECLARE @sub_unit_id as int         = (SELECT sub_unit_id FROM Config_Sub_Unit WHERE sub_unit_name=@sub_unit_name AND equipment_id = ( Select equipment_id from  Config_Equipment WHERE equipment_name=@equipment_name AND stage_id = (SELECT stage_id from Config_Stage WHERE stage_name = @stage_name AND line_id = (SELECT line_id from Config_Line where line_name = @line_name))));
DECLARE @due_date as datetime
DECLARE @isExist int = (select count(1) from [dbo].[Config_PM]  WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sub_unit_id]=@sub_unit_id and [check_point] =@check_point)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
IF(@created_by = '')
BEGIN
SELECT '[ERROR] User must be logged in' as Response;
END
ELSE IF(@created_by != '')
BEGIN

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN

 -- Declare a cursor to fetch each row in the table one at a time and for each row in the table perform the below
--calculation
select * from Config_PM
if @frequency = 'Yearly'
set @due_date = DATEADD(YEAR,@duration,@start_point)
if @frequency = 'Monthly'
set @due_date = DATEADD(MONTH,@duration,@start_point)
else if @frequency = 'Daily'
set @due_date = DATEADD(DAY,@duration,@start_point)
else if @frequency = 'Weekly'
set @due_date = DATEADD(WEEK,@duration,@start_point)
else if @frequency = 'Quarterly'
set @due_date = DATEADD(QUARTER,@duration,@start_point)
else if @frequency = 'Shift'
set @due_date = DATEADD(HOUR,@duration*8,@start_point)

  BEGIN TRY
INSERT INTO [dbo].[Config_PM] (
--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
   [line_id],[line_name],[stage_id],[stage_name],[equipment_id],[equipment_name],[check_point],[sub_unit_id],[sub_unit_name],[frequency],[duration],[start_point],[standard_condition],[activity_enable],[due_date],[status],[created_by]
) VALUES (
--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
@line_id,@line_name,@stage_id,@stage_name,@equipment_id,@equipment_name,@check_point,@sub_unit_id,@sub_unit_name,@frequency,@duration,@start_point, @standard_condition,@activity_enable,@due_date,0,@created_by
);

SELECT 'Inserted Successfully' AS Response
 
END TRY
BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
SELECT '[Error]-ID needs to be unique. This ID already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).'
 AS Response
END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
   BEGIN
      if(@isExist > 0)
-- Declare a cursor to fetch each row in the table one at a time and for each row in the table perform the below
--calculation
select @start_point=[start_point] from Config_PM
WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id 

if @frequency = 'Yearly'
set @due_date = DATEADD(YEAR,@duration,@start_point)
if @frequency = 'Monthly'
set @due_date = DATEADD(MONTH,@duration,@start_point)
else if @frequency = 'Daily'
set @due_date = DATEADD(DAY,@duration,@start_point)
else if @frequency = 'Weekly'
set @due_date = DATEADD(WEEK,@duration,@start_point)
else if @frequency = 'Quarterly'
set @due_date = DATEADD(QUARTER,@duration,@start_point)
--Print @DueDate

BEGIN
UPDATE [dbo].[Config_PM] SET

[frequency] =@frequency,
[duration] =@duration,
[due_date]=@due_date,
[status]=0,
[standard_condition]=@standard_condition,
[activity_enable] =@activity_enable,
[created_by] =@created_by
WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sub_unit_id]=@sub_unit_id and [check_point] =@check_point
select ' Modified successfully.' AS Response
          END
       
          BEGIN
                select '[Error]-There is no such value in the database. Hence modification is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).' AS Response
          END
    END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
DELETE FROM [dbo].[Config_PM]
WHERE [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id and [sub_unit_id]=@sub_unit_id and [check_point] =@check_point
SELECT ' Deleted successfully.' AS Response
END
    END
END

END


GO
/****** Object:  StoredProcedure [dbo].[SP_Config_PM_Assembly]    Script Date: 17-12-2022 14:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE            PROCEDURE [dbo].[SP_Config_PM_Assembly]
-- Add the parameters for the stored procedure here
@line_name varchar(50),
@stage_name varchar(50),
@equipment_name varchar(50),
@assembly_name varchar(50),
@created_by    varchar(50),
@ActionOp      varchar(10)


AS
BEGIN
DECLARE @line_id as int = (SELECT distinct line_id from Config_Line where line_name = @line_name);
DECLARE @stage_id as int            = (SELECT stage_id FROM Config_Stage WHERE stage_name=@stage_name AND line_id = (SELECT line_id from Config_Line WHERE line_name = @line_name))
DECLARE @equipment_id as int        = (SELECT equipment_id FROM Config_Equipment WHERE equipment_name=@equipment_name AND stage_id = (SELECT stage_id from Config_Stage WHERE stage_name = @stage_name AND line_id = (SELECT line_id from Config_Line where line_name = @line_name)));


DECLARE @isExist int = (select count(1) from [dbo].[Config_PM_Assembly]  WHERE [line_id] = @line_id and [stage_id]=@stage_id )

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
IF(@created_by = '')
BEGIN
SELECT '[ERROR] User must be logged in' as Response;
END
ELSE IF(@created_by != '')
BEGIN
    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
BEGIN TRY
INSERT INTO [dbo].[Config_PM_Assembly]  (
--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
        [line_id],[line_name],[stage_id],[stage_name],[equipment_id],[equipment_name],[assembly_name],[created_by]
        ) VALUES (
        --@user_id field is not needed since this is an auto-increment column. Rest fields have been added
        @line_id,@line_name,@stage_id,@stage_name, @equipment_id,@equipment_name,@assembly_name,@created_by
        );
SELECT ' Inserted successfully.' AS Response
    END TRY
BEGIN CATCH
-- statement to handle errors
    IF  ERROR_NUMBER()=2627
SELECT '[Error]-Route ID needs to be unique. This Route ID already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
    BEGIN
        if(@isExist > 0)
                BEGIN
                UPDATE [dbo].[Config_PM_Assembly] SET
[assembly_name] = @assembly_name,
[created_by]        = @created_by  
                WHERE  [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id
                select ' Modified successfully.' AS Response
            END
        else
            BEGIN
                select '[Error]-There is no such value in the database. Hence modification is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).' AS Response
            END
END
-- Building the Delete Statement

ELSE IF (@ActionOp = 'Delete')
   BEGIN
      if(@isExist>0)
BEGIN
DELETE FROM [dbo].[Config_PM_Assembly]
                WHERE  [line_id] = @line_id and [stage_id] = @stage_id and [equipment_id] = @equipment_id
select ' Deleted successfully.' AS Response
END
END
END
END

GO
