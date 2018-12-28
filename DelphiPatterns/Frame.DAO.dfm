object FrameDAO: TFrameDAO
  Left = 0
  Top = 0
  Width = 511
  Height = 267
  TabOrder = 0
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 267
    Align = alClient
    Caption = ' '
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = GroupBox1
        Row = 0
      end
      item
        Column = 1
        Control = GroupBox2
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    ExplicitLeft = 344
    ExplicitWidth = 453
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 248
      Height = 259
      Align = alClient
      Caption = 'GroupBox1'
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 243
      ExplicitHeight = 261
      object Button1: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 238
        Height = 25
        Align = alTop
        Caption = 'Button1'
        TabOrder = 0
        OnClick = Button1Click
        ExplicitWidth = 233
      end
      object ListBox1: TListBox
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 238
        Height = 205
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        ExplicitWidth = 233
        ExplicitHeight = 207
      end
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 258
      Top = 4
      Width = 249
      Height = 259
      Align = alClient
      Caption = 'GroupBox2'
      TabOrder = 1
      ExplicitLeft = 290
      ExplicitTop = 81
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Button2: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 239
        Height = 25
        Align = alTop
        Caption = 'Button2'
        TabOrder = 0
        OnClick = Button2Click
        ExplicitLeft = 56
        ExplicitWidth = 75
      end
      object ListBox2: TListBox
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 239
        Height = 205
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        ExplicitLeft = 56
        ExplicitTop = 80
        ExplicitWidth = 121
        ExplicitHeight = 97
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=IB_Demo')
    Connected = True
    LoginPrompt = False
    Left = 237
    Top = 102
  end
  object Customers: TFDQuery
    Connection = FDConnection1
    Left = 101
    Top = 166
  end
end
