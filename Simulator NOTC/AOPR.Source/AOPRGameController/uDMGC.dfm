object DMGC: TDMGC
  OldCreateOrder = False
  Height = 190
  Width = 429
  object zConn: TZConnection
    ControlsCodePage = cCP_UTF16
    Port = 0
    Left = 24
    Top = 40
  end
  object zQ: TZQuery
    Params = <>
    Left = 96
    Top = 40
  end
  object zTable: TZTable
    Connection = zConn
    Left = 192
    Top = 80
  end
  object dsTable: TDataSource
    DataSet = zTable
    Left = 256
    Top = 72
  end
end
