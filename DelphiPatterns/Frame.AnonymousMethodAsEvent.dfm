object FrameAnonyMethodAsEvent: TFrameAnonyMethodAsEvent
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 113
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object tmrFrameReady: TTimer
    Interval = 1
    OnTimer = tmrFrameReadyTimer
    Left = 144
    Top = 16
  end
end
