object fSettings: TfSettings
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 717
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbSettings: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 717
    Align = alClient
    TabOrder = 0
    object Panel43: TPanel
      Left = 1
      Top = 1
      Width = 800
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Settings'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel44: TPanel
      Left = 1
      Top = 39
      Width = 800
      Height = 675
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Panel45: TPanel
        Left = 5
        Top = 585
        Width = 788
        Height = 90
        BorderStyle = bsSingle
        TabOrder = 0
        object gbSetEnDis: TGroupBox
          Left = 10
          Top = 13
          Width = 759
          Height = 67
          TabOrder = 0
          object cbSetEnDis: TCheckBox
            Left = 21
            Top = 18
            Width = 97
            Height = 17
            Caption = 'Enable'
            TabOrder = 0
          end
        end
        object gbSetTime: TGroupBox
          Left = 10
          Top = 13
          Width = 759
          Height = 67
          TabOrder = 1
          object edtSetTime: TEdit
            Left = 14
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = 'hh:mm:ss'
          end
          object Button1: TButton
            Left = 150
            Top = 22
            Width = 75
            Height = 25
            Caption = 'Apply'
            TabOrder = 1
          end
          object btnSetXML: TButton
            Left = 586
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Collapse All'
            TabOrder = 2
            OnClick = btnSetXMLClick
          end
          object btnGetXML: TButton
            Left = 664
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Expand All'
            TabOrder = 3
            OnClick = btnGetXMLClick
          end
        end
      end
      object tvSettings: TTreeView
        Left = 2
        Top = 1
        Width = 793
        Height = 578
        Indent = 19
        TabOrder = 1
        Items.NodeData = {
          0301000000380000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          0007000000010D470061006D0065002000530065007400740069006E00670073
          002E0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000060000
          00010845006E00740069007400690065007300680000000000000000000000FF
          FFFFFFFFFFFFFF00000000000000000000000001255200650070006F00720074
          002000630068006100660066002000720065006D006F00760061006C00200065
          00760065006E007400730020005B00440069007300610062006C0065005D006E
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          285200650070006F0072007400200073006F006E006F00620075006F00790020
          00720065006D006F00760061006C0020006500760065006E007400730020005B
          00440069007300610062006C0065005D00720000000000000000000000FFFFFF
          FFFFFFFFFF000000000000000000000000012A5200650070006F007200740020
          00610069007200200062007500620062006C0065002000720065006D006F0076
          0061006C0020006500760065006E007400730020005B00440069007300610062
          006C0065005D00900000000000000000000000FFFFFFFFFFFFFFFF0000000000
          0000000000000001396100750074006F006D00610074006900630061006C006C
          0079002000720065006D006F0076006500200070006C006100740066006F0072
          006D0020006C0065006100760069006E0067002000670061006D006500200061
          0072006500610020005B00440069007300610062006C0065005D005600000000
          00000000000000FFFFFFFFFFFFFFFF000000000000000000000000011C500072
          006F0062006100620069006C0069007400790020006F00660020006B0069006C
          006C0020005B004E006F0072006D0061006C005D006C00000000000000000000
          00FFFFFFFFFFFFFFFF0000000000000000000000000127540069006D00650020
          0074006F002000720065006D006F007600650020007300750072006600610063
          006500200077007200650063006B0020005B00300030003A00300030003A0030
          0030005D002E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          00060000000108470075006900640061006E0063006500580000000000000000
          000000FFFFFFFFFFFFFFFF000000000000000000000000011D43006F00610073
          0074006C0069006E006500200063006F006C006C006900730069006F006E0073
          0020005B0045006E00610062006C0065005D00700000000000000000000000FF
          FFFFFFFFFFFFFF00000000000000000000000001294100690072006300720061
          0066007400200063006F006C006C006900730069006F006E0020007700690074
          00680020007400650072007200610069006E0020005B00440069007300610062
          006C0065005D006A0000000000000000000000FFFFFFFFFFFFFFFF0000000000
          00000000000000012654006900640061006C002000730074007200650061006D
          002000650066006600650063007400730020006F006E00200073006800690070
          0020005B00440069007300610062006C0065005D006200000000000000000000
          00FFFFFFFFFFFFFFFF0000000000000000000000000122570069006E00640020
          00650066006600650063007400730020006F006E002000610069007200630072
          0061006600740020005B00440069007300610062006C0065005D003400000000
          00000000000000FFFFFFFFFFFFFFFF000000000000000002000000010B43006F
          006E00740072006F006C006C00650072007300580000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000000000000011D470075006900640061006E
          0063006500200063006F006D006D0061006E006400730020005B005200650061
          006C00690073007400690063005D00620000000000000000000000FFFFFFFFFF
          FFFFFF0000000000000000000000000122530069006D0070006C006900660069
          00650064002000730065006E0073006F007200200063006800650063006B0073
          0020005B00440069007300610062006C0065005D004000000000000000000000
          00FFFFFFFFFFFFFFFF00000000000000000200000001114C00610075006E0063
          00680069006E0067002F004C0061006E00640069006E00670072000000000000
          0000000000FFFFFFFFFFFFFFFF000000000000000000000000012A5300740075
          00640065006E00740020004C00610075006E00630068002F004C0061006E0064
          0020007200650073007400720069006300740069006F006E00730020005B0044
          0069007300610062006C0065005D007E0000000000000000000000FFFFFFFFFF
          FFFFFF0000000000000000000000000130530074007500640065006E00740020
          00630061006E0020006C00610075006E00630068002000660069007800650064
          002000770069006E00670020006100690072006300720061006600740020005B
          00440069007300610062006C0065005D002C0000000000000000000000FFFFFF
          FFFFFFFFFF0000000000000000050000000107530065006E0073006F00720073
          00540000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
          00011B4C0061006E0064006D0061007300730020006F006300630075006C0074
          0069006E00670020005B0045006E00610062006C0065005D0066000000000000
          0000000000FFFFFFFFFFFFFFFF00000000000000000000000001244300680061
          0066006600200061007400740065006E0075006100740069006F006E0020006F
          006E0020007200610064006100720020005B00440069007300610062006C0065
          005D007A0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
          000000012E4100750074006F006D0061007400690063002000730065006E0073
          006F00720020006900640065006E007400690074007900200061007300730065
          00730065006D0065006E00740020005B00440069007300610062006C0065005D
          00640000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
          000123500072006F0063006500730073002000730065006E0073006F00720020
          00620069006E00640020007A006F006E006500730020005B0044006900730061
          0062006C0065005D004C0000000000000000000000FFFFFFFFFFFFFFFF000000
          0000000000060000000117440061007400610020006C0069006E006B00200073
          0065006E0073006F00720020006D006F00640065006C00730032000000000000
          0000000000FFFFFFFFFFFFFFFF000000000000000005000000010A4400610074
          0061006C0069006E006B00200031003C0000000000000000000000FFFFFFFFFF
          FFFFFF000000000000000000000000010F5200610064006100720020005B0044
          0069007300610062006C0065005D003C0000000000000000000000FFFFFFFFFF
          FFFFFF000000000000000000000000010F53006F006E006100720020005B0044
          0069007300610062006C0065005D00380000000000000000000000FFFFFFFFFF
          FFFFFF000000000000000000000000010D450053004D0020005B004400690073
          00620061006C0065005D00360000000000000000000000FFFFFFFFFFFFFFFF00
          0000000000000000000000010C45004F0020005B00440069007300610062006C
          0065005D00380000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          0000000000010D49004600460020005B00440069007300610062006C0065005D
          00320000000000000000000000FFFFFFFFFFFFFFFF0000000000000000050000
          00010A44006100740061006C0069006E006B00200032003C0000000000000000
          000000FFFFFFFFFFFFFFFF000000000000000000000000010F52006100640061
          00720020005B00440069007300610062006C0065005D003C0000000000000000
          000000FFFFFFFFFFFFFFFF000000000000000000000000010F53006F006E0061
          00720020005B00440069007300610062006C0065005D00380000000000000000
          000000FFFFFFFFFFFFFFFF000000000000000000000000010D450053004D0020
          005B00440069007300620061006C0065005D00360000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000000000000010C45004F0020005B00440069
          007300610062006C0065005D00380000000000000000000000FFFFFFFFFFFFFF
          FF000000000000000000000000010D49004600460020005B0044006900730061
          0062006C0065005D00320000000000000000000000FFFFFFFFFFFFFFFF000000
          000000000005000000010A44006100740061006C0069006E006B00200033003C
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          0F5200610064006100720020005B00440069007300610062006C0065005D003C
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          0F53006F006E006100720020005B00440069007300610062006C0065005D0038
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          0D450053004D0020005B00440069007300620061006C0065005D003600000000
          00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010C45004F
          0020005B00440069007300610062006C0065005D003800000000000000000000
          00FFFFFFFFFFFFFFFF000000000000000000000000010D49004600460020005B
          00440069007300610062006C0065005D006E0000000000000000000000FFFFFF
          FFFFFFFFFF0000000000000000000000000128560069007300750061006C0020
          007600690073006900620069006C006900740079002000640065007400650063
          00740069006F006E00200066006100630074006F00720020005B003900300025
          005D00460000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
          00000001144900460046002000660069006C0074006500720020005B00440069
          007300610062006C0065005D00820000000000000000000000FFFFFFFFFFFFFF
          FF00000000000000000000000001324100750074006F006D0061007400690063
          00200073006F006E00610072002000740061007200670065007400200064006F
          006D00610069006E002000610073007300690067006E006D0065006E00740020
          005B00440069007300610062006C0065005D002A0000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000002000000010657006500610070006F006E
          00640000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
          000123500072006F006300650073007300200077006500610070006F006E0020
          0062006C0069006E00640020007A006F006E006500730020005B0045006E0061
          0062006C0065005D003E0000000000000000000000FFFFFFFFFFFFFFFF000000
          0000000000030000000110500072006F006300650064007500720061006C0020
          006D006F00640065002000700000000000000000000000FFFFFFFFFFFFFFFF00
          0000000000000000000000012941006E00740069002D00730075007200660061
          006300650020007700610072006600610072006500200065006E006700610067
          0065006D0065006E00740020005B00440069007300610062006C0065005D0076
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          2C41006E00740069002D00730075006200730075007200660061006300650020
          007700610072006600610072006500200065006E0067006100670065006D0065
          006E00740020005B00440069007300610062006C0065005D006A000000000000
          0000000000FFFFFFFFFFFFFFFF0000000000000000000000000126410063006F
          0075007300740069006300200074006F0072007000650064006F002000640065
          0063006F00790020007300650074007500700020005B00440069007300610062
          006C0065005D002A0000000000000000000000FFFFFFFFFFFFFFFF0000000000
          00000003000000010654007200610063006B0073005600000000000000000000
          00FFFFFFFFFFFFFFFF000000000000000005000000011C540069006D00650020
          0074006F00200064006900730070006C006100790020006C006F007300740020
          0063006F006E0074006100630074003A0000000000000000000000FFFFFFFFFF
          FFFFFF000000000000000000000000010E41006900720020005B00300030003A
          00300030003A00330030005D004C0000000000000000000000FFFFFFFFFFFFFF
          FF000000000000000000000000011753007500720066006100630065002F004C
          0061006E00640020005B00300030003A00300030003A00330030005D00480000
          000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000011553
          0075006200730075007200660061006300650020005B00300030003A00300030
          003A00330030005D004A0000000000000000000000FFFFFFFFFFFFFFFF000000
          0000000000000000000116450053004D002000620065006100720069006E0067
          0020005B00300030003A00300030003A00330030005D00540000000000000000
          000000FFFFFFFFFFFFFFFF000000000000000000000000011B410063006F0075
          0073007400690063002000620065006100720069006E00670020005B00300030
          003A00300030003A00330030005D00420000000000000000000000FFFFFFFFFF
          FFFFFF0000000000000000050000000112540069006D006500200074006F0020
          00640072006F007000200074007200610063006B003A00000000000000000000
          00FFFFFFFFFFFFFFFF000000000000000000000000010E41006900720020005B
          00300030003A00300031003A00300030005D00420000000000000000000000FF
          FFFFFFFFFFFFFF00000000000000000000000001125300750072006600610063
          00650020005B00300030003A00300031003A00300030005D0048000000000000
          0000000000FFFFFFFFFFFFFFFF00000000000000000000000001155300750062
          00730075007200760061006300650020005B00300030003A00300031003A0030
          0030005D004A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          00000000000116450053004D002000620065006100720069006E00670020005B
          00300030003A00300031003A00300030005D00540000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000000000000011B410063006F007500730074
          00690063002000620065006100720069006E00670020005B00300030003A0030
          0031003A00300030005D00A00000000000000000000000FFFFFFFFFFFFFFFF00
          000000000000000000000001414300750062006900630061006C002000670072
          006F0075007000200063006C0075007400740065007200200072006500640075
          006300740069006F006E0020006D0069006E0069006D0075006D002000640069
          00730070006C006100790020007300630061006C00650020005B003100350030
          002E003000300020006E006D005D00380000000000000000000000FFFFFFFFFF
          FFFFFF000000000000000001000000010D540065007800740020004D00650073
          0073006100670065007300440000000000000000000000FFFFFFFFFFFFFFFF00
          000000000000000400000001135400720061006E0073006D0069007300730069
          006F006E002000640065006C006100790073003E0000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000000000000011046004C0041005300480020
          005B00300030003A00300030003A00300032005D003E00000000000000000000
          00FFFFFFFFFFFFFFFF000000000000000000000000011049004D004D00450044
          0020005B00300030003A00300030003A00300033005D00440000000000000000
          000000FFFFFFFFFFFFFFFF00000000000000000000000001135000520049004F
          00520049005400590020005B00300030003A00300030003A00300034005D0042
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          1252004F005500540049004E00450020005B00300030003A00300030003A0030
          0035005D00300000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          0002000000010949006E00740065007200660061006300650048000000000000
          0000000000FFFFFFFFFFFFFFFF000000000000000002000000011543006F006E
          00740072006F006C006C006500720020004D006F006E00690074006F00720069
          006E0067004C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          0000000000011753006F0075006E006400200065006600660065006300740073
          0020005B00440069007300610062006C0065005D006600000000000000000000
          00FFFFFFFFFFFFFFFF00000000000000000000000001245200650063006F0072
          0064002F007200650070006C0061007900200069006E00740065007200660065
          00720065006E006300650020005B00440069007300610062006C0065005D004A
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000100000001
          1649006E0074006500720066006500720065006E006300650020005200650063
          006F007200640069006E0067004C0000000000000000000000FFFFFFFFFFFFFF
          FF000000000000000000000000011753006F0075006E00640020006500660066
          00650063007400730020005B00440069007300610062006C0065005D00}
      end
    end
  end
end