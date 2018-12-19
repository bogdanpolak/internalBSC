object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 397
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 378
    Align = alClient
    Caption = ' '
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = GroupBox1
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    ExplicitHeight = 397
    DesignSize = (
      681
      378)
    object GroupBox1: TGroupBox
      Tag = 1
      Left = 240
      Top = 98
      Width = 201
      Height = 182
      Anchors = []
      Caption = 'Start'
      TabOrder = 0
      ExplicitTop = 107
      object btnOrders: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 191
        Height = 31
        Align = alTop
        Caption = 'btnOrders'
        TabOrder = 0
        OnClick = btnOrdersClick
      end
      object btnHashesAndCiphers: TButton
        AlignWithMargins = True
        Left = 5
        Top = 55
        Width = 191
        Height = 31
        Align = alTop
        Caption = 'btnHashesAndCiphers'
        TabOrder = 1
        OnClick = btnHashesAndCiphersClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 378
    Width = 681
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitLeft = 352
    ExplicitTop = 208
    ExplicitWidth = 0
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=IB_Demo')
    Left = 184
    Top = 8
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 280
    Top = 8
  end
  object tmrIdle: TTimer
    Interval = 100
    OnTimer = tmrIdleTimer
    Left = 24
    Top = 80
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 24
    Top = 16
  end
end
