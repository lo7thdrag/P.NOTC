object fmDetailsRouteLogistic: TfmDetailsRouteLogistic
  Left = 360
  Top = 394
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Details Route Logistic'
  ClientHeight = 168
  ClientWidth = 666
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object lvDetailsRouteLogistic: TListView
    Left = 8
    Top = 8
    Width = 649
    Height = 153
    Color = clWhite
    Columns = <
      item
        Caption = '+'
        Width = 25
      end
      item
        Alignment = taCenter
        Caption = 'Rute'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Distance'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Personel'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Speed'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Time'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Fuel'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'ML'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'AT'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Food'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Water'
        Width = 60
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
  end
end
