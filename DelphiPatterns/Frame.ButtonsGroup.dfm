object FrameButtonsGroup: TFrameButtonsGroup
  Left = 0
  Top = 0
  Width = 384
  Height = 289
  TabOrder = 0
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 57
    Height = 289
    Align = alLeft
    ExplicitHeight = 240
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 60
    Top = 3
    Width = 189
    Height = 278
    Margins.Bottom = 8
    Align = alLeft
    Caption = 'GroupBox1'
    Padding.Top = 10
    TabOrder = 0
    object btnStaticTop: TButton
      AlignWithMargins = True
      Left = 5
      Top = 28
      Width = 179
      Height = 25
      Align = alTop
      Caption = 'btnStaticTop'
      TabOrder = 0
      OnClick = btnStaticTopClick
    end
    object btnStaticBottom: TButton
      AlignWithMargins = True
      Left = 5
      Top = 248
      Width = 179
      Height = 25
      Align = alBottom
      Caption = 'btnStaticBottom'
      TabOrder = 1
    end
  end
  object tmrFrameReady: TTimer
    Interval = 1
    OnTimer = tmrFrameReadyTimer
    Left = 320
    Top = 8
  end
end
