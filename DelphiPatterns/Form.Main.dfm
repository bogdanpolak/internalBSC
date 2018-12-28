object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 340
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 214
    Height = 334
    Align = alLeft
    Caption = 'GroupBox1'
    Padding.Top = 10
    TabOrder = 0
    object btnAnonymousEvent: TButton
      AlignWithMargins = True
      Left = 5
      Top = 28
      Width = 204
      Height = 25
      Align = alTop
      Caption = 'btnAnonymousEvent'
      TabOrder = 0
      OnClick = btnAnonymousEventClick
    end
    object btnCloseAllFrames: TButton
      AlignWithMargins = True
      Left = 5
      Top = 304
      Width = 204
      Height = 25
      Align = alBottom
      Caption = 'btnCloseAllFrames'
      TabOrder = 1
      OnClick = btnCloseAllFramesClick
    end
    object btnDynamicButtonsDemo: TButton
      AlignWithMargins = True
      Left = 5
      Top = 59
      Width = 204
      Height = 25
      Align = alTop
      Caption = 'btnDynamicButtonsDemo'
      TabOrder = 2
      OnClick = btnDynamicButtonsDemoClick
    end
    object btnDAO: TButton
      AlignWithMargins = True
      Left = 5
      Top = 90
      Width = 204
      Height = 25
      Align = alTop
      Caption = 'btnDAO'
      TabOrder = 3
      OnClick = btnDAOClick
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 223
    Top = 3
    Width = 464
    Height = 334
    Align = alClient
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 248
    Top = 80
    Width = 161
    Height = 97
    Caption = 'RadioGroup1'
    ItemIndex = 0
    Items.Strings = (
      'No frame creation'
      'Frame: AnonymousEvent'
      'Frame: DynamicButton')
    TabOrder = 2
    Visible = False
  end
  object tmrAppReady: TTimer
    Interval = 1
    OnTimer = tmrAppReadyTimer
    Left = 241
    Top = 24
  end
end
