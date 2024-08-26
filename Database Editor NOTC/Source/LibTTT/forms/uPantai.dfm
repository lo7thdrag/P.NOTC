object frmPantai: TfrmPantai
  Left = 0
  Top = 0
  Caption = 'Pantai'
  ClientHeight = 299
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lv1: TListView
    Left = 8
    Top = 8
    Width = 433
    Height = 233
    Columns = <
      item
        Caption = 'NO'
      end
      item
        Caption = 'PNT_NAME'
      end
      item
        Caption = 'PNT_LONGITUDE'
      end
      item
        Caption = 'PNT_LATITUDE'
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
end
