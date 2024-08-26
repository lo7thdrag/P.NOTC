object frmStartExerciseWizard: TfrmStartExerciseWizard
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = 'Exercise Start Wizard'
  ClientHeight = 698
  ClientWidth = 894
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 104
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 65
    Width = 894
    Height = 2
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlExerciseName: TPanel
    Left = 0
    Top = 67
    Width = 894
    Height = 631
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 159
      Top = 175
      Width = 359
      Height = 64
      Caption = 
        'Type a name for your exercise. '#13#10'The name can contain up to 60 c' +
        'haracters ( including space ), '#13#10'but cannot contain any of the f' +
        'ollowing characters: '#13#10'\/ . " : * ? < > | .'
    end
    object Label2: TLabel
      Left = 159
      Top = 278
      Width = 33
      Height = 16
      Caption = 'Name'
    end
    object edExerciseName: TEdit
      Left = 219
      Top = 274
      Width = 507
      Height = 24
      MaxLength = 60
      TabOrder = 0
      Text = 'Exercise Name'
    end
    object Panel2: TPanel
      Left = 0
      Top = 566
      Width = 894
      Height = 65
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        894
        65)
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 894
        Height = 2
        Align = alTop
      end
      object btnExcName_Cancel: TButton
        Left = 781
        Top = 19
        Width = 85
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '&Cancel'
        TabOrder = 0
        OnClick = btnExcName_CancelClick
      end
      object btnExcName_Next: TButton
        Left = 640
        Top = 19
        Width = 86
        Height = 29
        Align = alCustom
        Anchors = [akTop, akRight]
        Caption = '&Next >'
        TabOrder = 1
        OnClick = btnExcName_NextClick
      end
    end
  end
  object pnlRecordOption: TPanel
    Left = 0
    Top = 67
    Width = 894
    Height = 631
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 27
      Top = 18
      Width = 224
      Height = 16
      Caption = 'Would you like to record this exercise ?'
    end
    object rbtnRecordYes: TRadioButton
      Left = 27
      Top = 40
      Width = 85
      Height = 19
      Caption = 'Yes'
      TabOrder = 0
      OnClick = rbtnRecordYesClick
    end
    object rbtnRecordNo: TRadioButton
      Left = 27
      Top = 66
      Width = 85
      Height = 20
      Caption = 'No'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbtnRecordNoClick
    end
    object gbAudioOption: TGroupBox
      Left = 27
      Top = 93
      Width = 844
      Height = 452
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Audio Track Settings'
      TabOrder = 2
      DesignSize = (
        844
        452)
      object btnAddAudio: TButton
        Left = 18
        Top = 387
        Width = 119
        Height = 52
        Anchors = [akLeft, akBottom]
        Caption = '&Add Audio  Track Pair'
        TabOrder = 0
        WordWrap = True
        OnClick = btnAddAudioClick
      end
      object btnRemoveAudio: TButton
        Left = 155
        Top = 387
        Width = 119
        Height = 52
        Anchors = [akLeft, akBottom]
        Caption = '&Remove Audio Track Pair'
        TabOrder = 1
        WordWrap = True
        OnClick = btnRemoveAudioClick
      end
      object btnClearAudio: TButton
        Left = 677
        Top = 384
        Width = 152
        Height = 51
        Anchors = [akRight, akBottom]
        Caption = '&Clear Audio Track Reservation'
        TabOrder = 2
        WordWrap = True
        OnClick = btnClearAudioClick
      end
      object tvAudioOption: TTreeView
        Left = 18
        Top = 23
        Width = 811
        Height = 354
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Indent = 19
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 566
      Width = 894
      Height = 65
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        894
        65)
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 894
        Height = 2
        Align = alTop
      end
      object btnAudio_Next: TButton
        Left = 645
        Top = 19
        Width = 85
        Height = 29
        Align = alCustom
        Anchors = [akTop, akRight]
        Caption = '&Next >'
        TabOrder = 0
        OnClick = btnAudio_NextClick
      end
      object btnAudio_Cancel: TButton
        Left = 785
        Top = 19
        Width = 86
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = btnExcName_CancelClick
      end
      object btnAudio_Back: TButton
        Left = 552
        Top = 19
        Width = 86
        Height = 29
        Align = alCustom
        Anchors = [akTop, akRight]
        Caption = '< &Back'
        TabOrder = 2
        OnClick = btnAudio_BackClick
      end
    end
  end
  object pnlCubicleMapping: TPanel
    Left = 0
    Top = 67
    Width = 894
    Height = 631
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Label4: TLabel
      Left = 465
      Top = 18
      Width = 391
      Height = 102
      AutoSize = False
      Caption = 
        'This screen will allow you to map cubicle groups to cubicles,'#13#10'r' +
        'eserve cubicles for Cubicle Groups, and assign briefing'#13#10'rooms t' +
        'o Cubicle Groups that have been assigned to '#13#10'cubicles.'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 465
      Top = 137
      Width = 391
      Height = 47
      AutoSize = False
      Caption = 
        'Right Click on the Cubicle Group to assign or clear cubicle'#13#10'or ' +
        'a Controller Station'
    end
    object Label6: TLabel
      Left = 465
      Top = 207
      Width = 391
      Height = 60
      AutoSize = False
      Caption = 
        'Right Click on '#39'Reserved Cubicles'#39' and select the cubicle(s)'#13#10'yo' +
        'u would like to reserve from the list of available cubicles.'
    end
    object Label7: TLabel
      Left = 465
      Top = 289
      Width = 391
      Height = 50
      AutoSize = False
      Caption = 
        'Right Click on '#39'Reserved Cubicles'#39' and select the cubicle(s)'#13#10'yo' +
        'u would like to reserve from the list of available cubicles.'
    end
    object Label8: TLabel
      Left = 465
      Top = 361
      Width = 391
      Height = 52
      AutoSize = False
      Caption = 
        'Click '#39'&Map unassigned Cubicle Groups to Controllers'#39' to map '#13#10'a' +
        'll the unassigned Cubible Groups to Controllers'#13#10
    end
    object Label9: TLabel
      Left = 465
      Top = 438
      Width = 377
      Height = 48
      AutoSize = False
      Caption = 
        #39'&Clear All configurations'#39'  will unassign all Cubicle Groups.'#13#10 +
        #13#10
    end
    object Panel4: TPanel
      Left = 0
      Top = 566
      Width = 894
      Height = 65
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        894
        65)
      object Bevel4: TBevel
        Left = 0
        Top = 0
        Width = 894
        Height = 2
        Align = alTop
      end
      object btnMapping_Finish: TButton
        Left = 643
        Top = 19
        Width = 86
        Height = 29
        Align = alCustom
        Anchors = [akTop, akRight]
        Caption = '&Finish'
        TabOrder = 0
        OnClick = btnMapping_FinishClick
      end
      object btnMapping_Cancel: TButton
        Left = 785
        Top = 19
        Width = 86
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = btnExcName_CancelClick
      end
      object btnMapping_Back: TButton
        Left = 551
        Top = 19
        Width = 86
        Height = 29
        Align = alCustom
        Anchors = [akTop, akRight]
        Caption = '< &Back'
        TabOrder = 2
        OnClick = btnMapping_BackClick
      end
    end
    object tvMapping: TTreeView
      Left = 27
      Top = 18
      Width = 395
      Height = 431
      Align = alCustom
      Anchors = [akLeft, akTop, akBottom]
      Indent = 19
      PopupMenu = pmAssignt
      TabOrder = 1
      OnChange = tvMappingChange
      OnContextPopup = tvMappingContextPopup
    end
    object btnMapToControllers: TButton
      Left = 51
      Top = 477
      Width = 141
      Height = 68
      Align = alCustom
      Anchors = [akLeft, akBottom]
      Caption = '&Map unassigned Cubicle Groups to Controllers'
      TabOrder = 2
      WordWrap = True
      OnClick = btnMapToControllersClick
    end
    object btnClearAllConfig: TButton
      Left = 235
      Top = 477
      Width = 142
      Height = 68
      Align = alCustom
      Anchors = [akLeft, akBottom]
      Caption = '&Clear All configurations'
      TabOrder = 3
      WordWrap = True
      OnClick = btnClearAllConfigClick
    end
  end
  object pmAssignt: TPopupMenu
    Left = 200
    Top = 120
    object mnAssign1: TMenuItem
      Caption = 'Assign'
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
  end
end
