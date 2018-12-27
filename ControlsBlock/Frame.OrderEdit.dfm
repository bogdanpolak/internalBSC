object FrameOrderEdit: TFrameOrderEdit
  Left = 0
  Top = 0
  Width = 673
  Height = 375
  TabOrder = 0
  object GridPanel1: TGridPanel
    Left = 16
    Top = 59
    Width = 497
    Height = 238
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
      Height = 220
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
        Caption = 'ORDERID'
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
        Caption = 'CUSTOMERID'
        FocusControl = DBEdit2
        ExplicitWidth = 66
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 69
        Width = 141
        Height = 13
        Align = alTop
        Caption = 'EMPLOYEEID'
        ExplicitWidth = 62
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
      Height = 220
      Align = alClient
      Caption = 'GroupBox2'
      Padding.Top = 5
      TabOrder = 1
      object Label5: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 68
        Width = 141
        Height = 13
        Align = alTop
        Caption = 'REQUIREDDATE'
        FocusControl = DBEdit5
        ExplicitWidth = 78
      end
      object Label6: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 114
        Width = 141
        Height = 13
        Align = alTop
        Caption = 'SHIPPEDDATE'
        FocusControl = DBEdit6
        ExplicitWidth = 68
      end
      object DBEdit5: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 87
        Width = 141
        Height = 21
        Align = alTop
        DataField = 'REQUIREDDATE'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 133
        Width = 141
        Height = 21
        Align = alTop
        DataField = 'SHIPPEDDATE'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DateTimePicker1: TDateTimePicker
        AlignWithMargins = True
        Left = 5
        Top = 41
        Width = 141
        Height = 21
        Margins.Top = 1
        Align = alTop
        Date = 43456.011368877310000000
        Time = 43456.011368877310000000
        TabOrder = 2
        OnChange = DateTimePicker1Change
      end
      object CheckBox1: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 141
        Height = 17
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Order Date'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 335
      Top = 9
      Width = 153
      Height = 220
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
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 667
    Height = 48
    Align = alTop
    Caption = 'GroupBox4'
    TabOrder = 1
    object btnClose: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'btnClose'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 86
      Top = 18
      Width = 240
      Height = 25
      DataSource = DataSource1
      Align = alLeft
      TabOrder = 1
    end
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      
        'select OrderID,CustomerID, EmployeeID, OrderDate, RequiredDate, ' +
        'ShippedDate, Freight from {id Orders}'
      'where OrderID = :OrderID')
    Left = 512
    Top = 56
    ParamData = <
      item
        Name = 'ORDERID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '10248'
      end>
    object FDQuery1ORDERID: TIntegerField
      FieldName = 'ORDERID'
      Origin = 'ORDERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1CUSTOMERID: TStringField
      FieldName = 'CUSTOMERID'
      Origin = 'CUSTOMERID'
      Size = 5
    end
    object FDQuery1EMPLOYEEID: TIntegerField
      FieldName = 'EMPLOYEEID'
      Origin = 'EMPLOYEEID'
    end
    object FDQuery1ORDERDATE: TDateField
      FieldName = 'ORDERDATE'
      Origin = 'ORDERDATE'
    end
    object FDQuery1REQUIREDDATE: TDateField
      FieldName = 'REQUIREDDATE'
      Origin = 'REQUIREDDATE'
    end
    object FDQuery1SHIPPEDDATE: TDateField
      FieldName = 'SHIPPEDDATE'
      Origin = 'SHIPPEDDATE'
    end
    object FDQuery1FREIGHT: TBCDField
      FieldName = 'FREIGHT'
      Origin = 'FREIGHT'
      Precision = 18
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 576
    Top = 56
  end
  object FDQuery2: TFDQuery
    SQL.Strings = (
      
        'select EmployeeID, FirstName||'#39' '#39'||LastName||'#39'  (ID:'#39'||EmployeeI' +
        'D||'#39')'#39' as EmployeeName '
      'from {id Employees} '
      'order by EmployeeID')
    Left = 512
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 576
    Top = 104
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 544
    Top = 168
  end
end
