USE [BajajMEA]
GO

/****** Object:  View [dbo].[View_Maintenance_Tool_Life]    Script Date: 22-08-2022 17:15:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Maintenance_Tool_Life]
AS
SELECT        dbo.Config_Plant.plant_name, dbo.Config_Shop.shop_name, dbo.Config_Line.line_id, dbo.Config_Line.line_name, dbo.Config_Stage.stage_id, dbo.Config_Stage.stage_name, dbo.Config_Equipment.equipment_id, 
                         dbo.Config_Equipment.equipment_name, dbo.Config_Sub_Unit.sub_unit_id, dbo.Config_Sub_Unit.sub_unit_name, dbo.Maintenance_Tool_Life.uid, dbo.Maintenance_Tool_Life.tool_id, dbo.Maintenance_Tool_Life.tool_name, 
                         dbo.Maintenance_Tool_Life.tool_life_value_estimated, dbo.Maintenance_Tool_Life.tool_life_value_actual, dbo.Maintenance_Tool_Life.tool_life_units, dbo.Maintenance_Tool_Life.change_reason, 
                         dbo.Maintenance_Tool_Life.remarks, dbo.Maintenance_Tool_Life.alert_value_1, dbo.Maintenance_Tool_Life.alert_value_2, dbo.Maintenance_Tool_Life.line_stop, dbo.Maintenance_Tool_Life.sms, 
                         dbo.Maintenance_Tool_Life.email, dbo.Maintenance_Tool_Life.alert_user_1, dbo.Maintenance_Tool_Life.alert_user_2, dbo.Maintenance_Tool_Life.created_by, dbo.Maintenance_Tool_Life.created_on, 
                         dbo.Maintenance_Tool_Life.updated_by, dbo.Maintenance_Tool_Life.updated_on
FROM            dbo.Config_Plant INNER JOIN
                         dbo.Config_Shop ON dbo.Config_Plant.plant_name = dbo.Config_Shop.plant_name INNER JOIN
                         dbo.Config_Line ON dbo.Config_Shop.shop_name = dbo.Config_Line.shop_name INNER JOIN
                         dbo.Config_Stage ON dbo.Config_Line.line_id = dbo.Config_Stage.line_id INNER JOIN
                         dbo.Config_Equipment ON dbo.Config_Stage.stage_id = dbo.Config_Equipment.stage_id INNER JOIN
                         dbo.Config_Sub_Unit ON dbo.Config_Equipment.equipment_id = dbo.Config_Sub_Unit.equipment_id INNER JOIN
                         dbo.Maintenance_Tool_Life ON dbo.Config_Sub_Unit.sub_unit_id = dbo.Maintenance_Tool_Life.sub_unit_id
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[82] 4[5] 2[5] 3) )"
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
         Begin Table = "Config_Plant"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Shop"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Line"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Stage"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Equipment"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Sub_Unit"
            Begin Extent = 
               Top = 138
               Left = 258
               Bottom = 268
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Tool_Life"
            Begin Extent = 
               Top = 0
               Left = 494
               Bottom = 415
               Right = 715
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Tool_Life'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      End
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Tool_Life'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Tool_Life'
GO


