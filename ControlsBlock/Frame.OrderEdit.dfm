object FrameOrderEdit: TFrameOrderEdit
  Left = 0
  Top = 0
  Width = 642
  Height = 375
  TabOrder = 0
  object GridPanel1: TGridPanel
    Left = 16
    Top = 59
    Width = 481
    Height = 198
    Caption = 'GridPanel1'
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
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 153
      Height = 190
      Align = alClient
      Caption = 'GroupBox1'
      Padding.Top = 5
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 8
      ExplicitWidth = 162
      ExplicitHeight = 105
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 143
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
        Width = 143
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
        Width = 143
        Height = 13
        Align = alTop
        Caption = 'EMPLOYEEID'
        ExplicitWidth = 62
      end
      object DBEdit1: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 42
        Width = 143
        Height = 21
        TabStop = False
        Align = alTop
        Color = clBtnFace
        DataField = 'ORDERID'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
        ExplicitWidth = 152
      end
      object DBEdit2: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 134
        Width = 143
        Height = 21
        Align = alTop
        DataField = 'CUSTOMERID'
        DataSource = DataSource1
        TabOrder = 1
        ExplicitWidth = 152
      end
      object DBLookupComboBox1: TDBLookupComboBox
        AlignWithMargins = True
        Left = 5
        Top = 88
        Width = 143
        Height = 21
        Align = alTop
        DataField = 'EMPLOYEEID'
        DataSource = DataSource1
        KeyField = 'EMPLOYEEID'
        ListField = 'EMPLOYEENAME'
        ListSource = DataSource2
        TabOrder = 2
        ExplicitLeft = 7
        ExplicitWidth = 175
      end
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 163
      Top = 4
      Width = 153
      Height = 190
      Align = alClient
      Caption = 'GroupBox2'
      Padding.Top = 5
      TabOrder = 1
      ExplicitTop = 8
      ExplicitWidth = 162
      ExplicitHeight = 105
      object Label4: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 143
        Height = 13
        Align = alTop
        Caption = 'ORDERDATE'
        FocusControl = DBEdit4
        ExplicitWidth = 61
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 69
        Width = 143
        Height = 13
        Align = alTop
        Caption = 'REQUIREDDATE'
        FocusControl = DBEdit5
        ExplicitWidth = 78
      end
      object Label6: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 115
        Width = 143
        Height = 13
        Align = alTop
        Caption = 'SHIPPEDDATE'
        FocusControl = DBEdit6
        ExplicitWidth = 68
      end
      object DBEdit4: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 42
        Width = 143
        Height = 21
        Align = alTop
        DataField = 'ORDERDATE'
        DataSource = DataSource1
        TabOrder = 0
        ExplicitWidth = 152
      end
      object DBEdit5: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 88
        Width = 143
        Height = 21
        Align = alTop
        DataField = 'REQUIREDDATE'
        DataSource = DataSource1
        TabOrder = 1
        ExplicitWidth = 152
      end
      object DBEdit6: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 134
        Width = 143
        Height = 21
        Align = alTop
        DataField = 'SHIPPEDDATE'
        DataSource = DataSource1
        TabOrder = 2
        ExplicitWidth = 152
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 322
      Top = 4
      Width = 155
      Height = 190
      Align = alClient
      Caption = 'GroupBox3'
      Padding.Top = 5
      TabOrder = 2
      ExplicitLeft = 80
      ExplicitTop = 48
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Label7: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 145
        Height = 13
        Align = alTop
        Caption = 'FREIGHT'
        FocusControl = DBEdit7
        ExplicitLeft = 66
        ExplicitTop = 69
        ExplicitWidth = 43
      end
      object DBEdit7: TDBEdit
        AlignWithMargins = True
        Left = 5
        Top = 42
        Width = 145
        Height = 21
        Align = alTop
        DataField = 'FREIGHT'
        DataSource = DataSource1
        TabOrder = 0
        ExplicitLeft = -69
        ExplicitTop = 107
        ExplicitWidth = 194
      end
      object btnCalcFreight: TButton
        AlignWithMargins = True
        Left = 5
        Top = 69
        Width = 145
        Height = 25
        Align = alTop
        Caption = 'btnCalcFreight'
        TabOrder = 1
        ExplicitLeft = 16
        ExplicitTop = 80
        ExplicitWidth = 75
      end
    end
  end
  object btnClose: TButton
    Left = 3
    Top = 3
    Width = 75
    Height = 25
    Caption = 'btnClose'
    TabOrder = 1
    OnClick = btnCloseClick
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
end
