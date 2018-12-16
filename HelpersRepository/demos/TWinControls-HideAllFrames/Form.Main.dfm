object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 352
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 346
    Align = alClient
    Caption = 'MainPanel'
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 32
    Top = 24
  end
end
