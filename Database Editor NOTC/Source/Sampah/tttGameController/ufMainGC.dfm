object frmMainGC: TfrmMainGC
  Left = 174
  Top = 180
  Caption = 'Game Controller'
  ClientHeight = 615
  ClientWidth = 874
  Color = clNavy
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 104
  TextHeight = 16
  object MainMenu1: TMainMenu
    Left = 88
    Top = 40
    object mnSession: TMenuItem
      Caption = '&Session'
      object mnStart1: TMenuItem
        Caption = '&Start'
        OnClick = mnStart1Click
      end
      object mnConnect1: TMenuItem
        Caption = '&Connect'
        OnClick = mnConnect1Click
      end
      object mnTerminate1: TMenuItem
        Caption = '&Terminate'
        OnClick = mnTerminate1Click
      end
      object mnDelete1: TMenuItem
        Caption = '&Delete'
        OnClick = mnDelete1Click
      end
    end
    object mnDevelopment1: TMenuItem
      Caption = '&Development'
      object mnStartDatabaseDeveloper1: TMenuItem
        Caption = '&Start Database Developer'
      end
      object mnPreplay1: TMenuItem
        Caption = '&Preplay'
        object mnStartStudentpreplay1: TMenuItem
          Caption = 'Start Student &Preplay'
        end
        object mnStudentPreplayStatus1: TMenuItem
          Caption = 'Student Preplay &Status'
        end
      end
    end
    object mnExplorer1: TMenuItem
      Caption = 'E&xplorer'
      object mnStartExplorer1: TMenuItem
        Caption = 'Start &Explorer'
      end
    end
    object mnLogOut1: TMenuItem
      Caption = '&Logout'
      object mnLogout2: TMenuItem
        Caption = '&Logout'
      end
    end
    object mnHelp: TMenuItem
      Caption = 'Help'
      object mnContent1: TMenuItem
        Caption = '&Content'
      end
      object mnAbout: TMenuItem
        Caption = '&About Trainer'
      end
    end
  end
end
