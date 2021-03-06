object FrameOrderEdit: TFrameOrderEdit
  Left = 0
  Top = 0
  Width = 600
  Height = 340
  TabOrder = 0
  OnResize = FrameResize
  object GridPanel1: TGridPanel
    Left = 59
    Top = 57
    Width = 497
    Height = 216
    BevelOuter = bvNone
    Caption = ' '
    ColumnCollection = <
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.333333333333340000
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
      end
      item
        Column = 2
        Control = GroupBox3
        Row = 0
      end>
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 151
      Height = 198
      Align = alClient
      Caption = 'GroupBox1'
      Padding.Top = 5
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 141
        Height = 13
        Align = alTop
        Caption = 'Order ID:'
        FocusControl = DBEdit1
        ExplicitWidth = 46
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 115
        Width = 141
        Height = 13
        Align = alTop
        Caption = 'Customer ID:'
        FocusControl = DBEdit2
        ExplicitWidth = 64
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 69
        Width = 141
        Height = 13
        Align = alTop
        Caption = 'Employee:'
        ExplicitWidth = 50
      end
      object DBEdit1: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 42
        Width = 141
        Height = 21
        TabStop = False
        Align = alTop
        Color = clBtnFace
        DataField = 'ORDERID'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 134
        Width = 141
        Height = 21
        Align = alTop
        DataField = 'CUSTOMERID'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        AlignWithMargins = True
        Left = 5
        Top = 88
        Width = 141
        Height = 21
        Align = alTop
        DataField = 'EMPLOYEEID'
        DataSource = DataSource1
        KeyField = 'EMPLOYEEID'
        ListField = 'EMPLOYEENAME'
        ListSource = DataSource2
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 172
      Top = 9
      Width = 151
      Height = 198
      Align = alClient
      Caption = 'GroupBox2'
      Padding.Top = 5
      TabOrder = 1
      object DateTimePicker1: TDateTimePicker
        AlignWithMargins = True
        Left = 5
        Top = 41
        Width = 141
        Height = 21
        Margins.Top = 1
        Align = alTop
        Date = 43456.000000000000000000
        Time = 43456.000000000000000000
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 141
        Height = 17
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Order date'
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 70
        Width = 141
        Height = 17
        Margins.Top = 5
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Required date:'
        TabOrder = 2
      end
      object DateTimePicker2: TDateTimePicker
        AlignWithMargins = True
        Left = 5
        Top = 88
        Width = 141
        Height = 21
        Margins.Top = 1
        Align = alTop
        Date = 43458.000000000000000000
        Time = 43458.000000000000000000
        TabOrder = 3
      end
      object CheckBox3: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 117
        Width = 141
        Height = 17
        Margins.Top = 5
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Shipped date:'
        TabOrder = 4
      end
      object DateTimePicker3: TDateTimePicker
        AlignWithMargins = True
        Left = 5
        Top = 135
        Width = 141
        Height = 21
        Margins.Top = 1
        Align = alTop
        Date = 43458.000000000000000000
        Time = 43458.000000000000000000
        TabOrder = 5
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 335
      Top = 9
      Width = 153
      Height = 198
      Align = alClient
      Caption = 'GroupBox3'
      Padding.Top = 5
      TabOrder = 2
      object Label7: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 143
        Height = 13
        Align = alTop
        Caption = 'FREIGHT'
        FocusControl = DBEdit7
        ExplicitWidth = 43
      end
      object DBEdit7: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 42
        Width = 143
        Height = 21
        Align = alTop
        DataField = 'FREIGHT'
        DataSource = DataSource1
        TabOrder = 0
      end
      object btnCalcFreight: TButton
        AlignWithMargins = True
        Left = 5
        Top = 69
        Width = 143
        Height = 25
        Align = alTop
        Caption = 'btnCalcFreight'
        TabOrder = 1
      end
    end
  end
  object grbxCommands: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 594
    Height = 48
    Align = alTop
    Caption = 'Order Editor Commands:'
    TabOrder = 1
    object btnClose: TButton
      AlignWithMargins = True
      Left = 514
      Top = 18
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Close'
      TabOrder = 4
      OnClick = btnCloseClick
      ExplicitLeft = 529
    end
    object btnEdit: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 60
      Height = 25
      Align = alLeft
      Caption = 'Edit'
      TabOrder = 0
      OnClick = btnEditClick
      ExplicitLeft = 91
    end
    object btnPost: TButton
      AlignWithMargins = True
      Left = 71
      Top = 18
      Width = 60
      Height = 25
      Align = alLeft
      Caption = 'Post'
      TabOrder = 1
      OnClick = btnPostClick
      ExplicitLeft = 157
      ExplicitTop = 20
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 137
      Top = 18
      Width = 60
      Height = 25
      Align = alLeft
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
      ExplicitLeft = 223
    end
    object btnRefresh: TButton
      AlignWithMargins = True
      Left = 203
      Top = 18
      Width = 60
      Height = 25
      Align = alLeft
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = btnRefreshClick
      ExplicitLeft = 289
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 16
    Top = 120
  end
  object DataSource2: TDataSource
    Left = 16
    Top = 176
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 16
    Top = 64
  end
end
