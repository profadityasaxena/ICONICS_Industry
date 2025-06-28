Public Sub Engine_WIP(td As TriggerData)
On Error GoTo ErrHandler

    Dim engine_status           As Variant
    Dim running_work_order      As Variant
    Dim actual_quantity         As Variant
    Dim virtual_engine_number   As Variant
    Dim barcode_scan_sg1        As Variant
    Dim barcode_scan_sg2        As Variant
    Dim barcode_scan_sg3        As Variant
    Dim barcode_scan_manual     As Variant
    Dim engine_completion       As Variant
    
    engine_status = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.engine_status")
    running_work_order = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.running_work_order")
    actual_quantity = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.actual_quantity")
    virtual_engine_number = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.virtual_engine_number")
    barcode_scan_sg1 = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.barcode_scan_sg1")
    barcode_scan_sg2 = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.barcode_scan_sg2")
    barcode_scan_sg3 = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.barcode_scan_sg3")
    barcode_scan_manual = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.barcode_scan_manual")
    engine_completion = g.OPC.Read("Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.engine_completion")
    
    ' TODO: add a custom code to use the value 'opcval'

    ' Uncomment the next line to display the value 'opcval' in the MonitorWorX console in the tab Runtime.
    ' g.ConsoleMsg MSG_INFO_VERBOSE, "Kepware.KEPServerEX.V6\SB1_PLC.RJ71EN71.Andon.SB1.EngineWIP.actual_quantity", opcval
    Exit Sub

ErrHandler:
    g.ConsoleMsg MSG_SEVERE_ERROR, "Error in Executing Script", "Error reading the OPC value: " & Err.Description
End Sub