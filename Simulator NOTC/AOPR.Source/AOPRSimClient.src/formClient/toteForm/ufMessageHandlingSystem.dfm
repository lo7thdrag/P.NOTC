object fMessageHandlingSystem: TfMessageHandlingSystem
  Left = 0
  Top = 0
  Caption = 'Message Handling System'
  ClientHeight = 686
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbMessageHandlingSystem: TPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 686
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 60
    ExplicitTop = -34
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 931
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Message Handling System'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 798
    end
    object Panel25: TPanel
      Left = 1
      Top = 39
      Width = 931
      Height = 646
      Align = alClient
      BorderWidth = 4
      TabOrder = 1
      ExplicitWidth = 798
      ExplicitHeight = 680
      object pcReceived: TPageControl
        Left = 5
        Top = 5
        Width = 921
        Height = 636
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 788
        ExplicitHeight = 670
        object TabSheet1: TTabSheet
          Caption = 'Received'
          ExplicitWidth = 780
          ExplicitHeight = 642
          object Panel74: TPanel
            Left = 0
            Top = 0
            Width = 913
            Height = 608
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 0
            ExplicitWidth = 780
            ExplicitHeight = 642
            object StringGrid5: TStringGrid
              Left = 10
              Top = 10
              Width = 893
              Height = 126
              Align = alClient
              ColCount = 4
              FixedCols = 0
              TabOrder = 0
              ExplicitWidth = 760
              ExplicitHeight = 160
              ColWidths = (
                232
                376
                427
                543)
            end
            object Panel75: TPanel
              Left = 10
              Top = 564
              Width = 893
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              ExplicitTop = 598
              ExplicitWidth = 760
              object Button4: TButton
                Left = 421
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Send'
                TabOrder = 0
              end
              object Button5: TButton
                Left = 501
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Edit'
                TabOrder = 1
              end
              object Button6: TButton
                Left = 581
                Top = 9
                Width = 75
                Height = 25
                Caption = 'New...'
                TabOrder = 2
              end
              object Button7: TButton
                Left = 661
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Reply...'
                TabOrder = 3
              end
              object Button8: TButton
                Left = 741
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Forward...'
                TabOrder = 4
              end
              object Button9: TButton
                Left = 821
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Print'
                TabOrder = 5
              end
              object Button10: TButton
                Left = 902
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Remove'
                TabOrder = 6
              end
            end
            object Panel76: TPanel
              Left = 10
              Top = 150
              Width = 893
              Height = 414
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              TabOrder = 2
              ExplicitTop = 184
              ExplicitWidth = 760
              object ListBox1: TListBox
                Left = 1
                Top = 1
                Width = 891
                Height = 412
                Align = alClient
                ItemHeight = 13
                TabOrder = 0
                ExplicitWidth = 758
              end
            end
            object Panel77: TPanel
              Left = 10
              Top = 136
              Width = 893
              Height = 14
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 3
              ExplicitTop = 170
              ExplicitWidth = 760
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Sent'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel78: TPanel
            Left = 0
            Top = 0
            Width = 780
            Height = 642
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 0
            object StringGrid6: TStringGrid
              Left = 10
              Top = 10
              Width = 760
              Height = 160
              Align = alClient
              ColCount = 4
              FixedCols = 0
              TabOrder = 0
              ColWidths = (
                189
                99
                149
                309)
            end
            object Panel79: TPanel
              Left = 10
              Top = 598
              Width = 760
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Button11: TButton
                Left = 914
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Remove'
                TabOrder = 0
              end
              object Button12: TButton
                Left = 833
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Print'
                TabOrder = 1
              end
              object Button13: TButton
                Left = 752
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Forward...'
                TabOrder = 2
              end
              object Button14: TButton
                Left = 671
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Reply...'
                TabOrder = 3
              end
              object Button15: TButton
                Left = 590
                Top = 6
                Width = 75
                Height = 25
                Caption = 'New...'
                TabOrder = 4
              end
              object Button16: TButton
                Left = 509
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Edit'
                TabOrder = 5
              end
              object Button17: TButton
                Left = 428
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Send'
                TabOrder = 6
              end
            end
            object Panel80: TPanel
              Left = 10
              Top = 186
              Width = 760
              Height = 412
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              TabOrder = 2
              object ListBox2: TListBox
                Left = 1
                Top = 1
                Width = 758
                Height = 410
                Align = alClient
                ItemHeight = 13
                TabOrder = 0
              end
            end
            object Panel81: TPanel
              Left = 10
              Top = 136
              Width = 893
              Height = 16
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 3
              ExplicitTop = 170
              ExplicitWidth = 760
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Draft'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel82: TPanel
            Left = 0
            Top = 0
            Width = 780
            Height = 642
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 0
            object StringGrid7: TStringGrid
              Left = 10
              Top = 10
              Width = 760
              Height = 158
              Align = alClient
              ColCount = 3
              FixedCols = 0
              TabOrder = 0
              ColWidths = (
                189
                99
                149)
            end
            object Panel83: TPanel
              Left = 10
              Top = 597
              Width = 760
              Height = 35
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object btnRemove: TButton
                Left = 911
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Remove'
                TabOrder = 0
              end
              object btnPrint: TButton
                Left = 830
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Print'
                TabOrder = 1
              end
              object btnForward: TButton
                Left = 749
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Forward...'
                TabOrder = 2
              end
              object btnReply: TButton
                Left = 668
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Reply...'
                TabOrder = 3
              end
              object btnNew: TButton
                Left = 587
                Top = 6
                Width = 75
                Height = 25
                Caption = 'New...'
                TabOrder = 4
              end
              object btnEdit: TButton
                Left = 506
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Edit'
                TabOrder = 5
              end
              object btnSend: TButton
                Left = 425
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Send'
                TabOrder = 6
              end
            end
            object Panel84: TPanel
              Left = 10
              Top = 185
              Width = 760
              Height = 412
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              TabOrder = 2
              object ListBox3: TListBox
                Left = 1
                Top = 1
                Width = 758
                Height = 410
                Align = alClient
                ItemHeight = 13
                TabOrder = 0
              end
            end
            object Panel85: TPanel
              Left = 10
              Top = 134
              Width = 893
              Height = 17
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 3
              ExplicitTop = 168
              ExplicitWidth = 760
            end
          end
        end
      end
    end
  end
end
