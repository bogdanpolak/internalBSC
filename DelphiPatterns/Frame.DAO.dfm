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
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 248
      Height = 259
      Align = alClient
      Caption = 'GroupBox1'
      TabOrder = 0
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
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 239
        Height = 13
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Pobierz zam'#243'wienia z roku:'
        ExplicitWidth = 129
      end
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
      end
      object ListBox2: TListBox
        AlignWithMargins = True
        Left = 5
        Top = 92
        Width = 239
        Height = 162
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        ExplicitTop = 49
        ExplicitHeight = 205
      end
      object Edit2: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 65
        Width = 239
        Height = 21
        Align = alTop
        TabOrder = 2
        Text = '2019'
        ExplicitLeft = 64
        ExplicitTop = 120
        ExplicitWidth = 121
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
