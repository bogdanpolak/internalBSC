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
    Width = 205
    Height = 283
    Align = alLeft
    Caption = 'GroupBox1'
    TabOrder = 0
  end
  object tmrFrameReady: TTimer
    Interval = 1
    OnTimer = tmrFrameReadyTimer
    Left = 320
    Top = 8
  end
end
