object SecondFrame: TSecondFrame
  Left = 0
  Top = 0
  Width = 373
  Height = 240
  TabOrder = 0
  object StringGrid1: TStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 367
    Height = 234
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 64
    ExplicitWidth = 320
    ExplicitHeight = 120
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 328
    Top = 16
  end
end
