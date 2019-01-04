object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 408
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grbxAppCommands: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 663
    Height = 49
    Align = alTop
    Caption = 'Generator Commands'
    TabOrder = 0
    ExplicitLeft = 248
    ExplicitTop = 168
    ExplicitWidth = 185
    object btnConnectWithDB: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 148
      Height = 26
      Align = alLeft
      Caption = 'btnConnectWithDB'
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 144
    Top = 58
    Width = 522
    Height = 347
    ActivePage = tshDataSet
    Align = alRight
    TabOrder = 1
    object tshDataSet: TTabSheet
      Caption = 'SQL Statement'
      ExplicitLeft = 0
      ExplicitWidth = 474
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 508
        Height = 13
        Margins.Bottom = 0
        Align = alTop
        Caption = 'SQL statement:'
        ExplicitWidth = 75
      end
      object Splitter1: TSplitter
        Left = 0
        Top = 111
        Width = 514
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 169
      end
      object mmSqlStatement: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 19
        Width = 508
        Height = 89
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        Lines.Strings = (
          'mmSqlStatement')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitLeft = 144
        ExplicitTop = 112
        ExplicitWidth = 185
      end
      object GridPanel1: TGridPanel
        Left = 0
        Top = 280
        Width = 514
        Height = 39
        Align = alBottom
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
            Column = 1
            Control = btnGenerateDAO
            Row = 0
          end
          item
            Column = 0
            Control = Label1
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end>
        TabOrder = 1
        object btnGenerateDAO: TButton
          AlignWithMargins = True
          Left = 174
          Top = 4
          Width = 164
          Height = 31
          Action = actGenerateDAO
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 56
          ExplicitTop = 8
          ExplicitWidth = 75
          ExplicitHeight = 25
        end
        object Label1: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 164
          Height = 31
          Align = alClient
          Alignment = taCenter
          Caption = 'Ctrl+Enter to generate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 111
          ExplicitHeight = 13
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 117
        Width = 508
        Height = 160
        Align = alClient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tshDaoCode: TTabSheet
      Caption = 'Generated DAO Code'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object mmDaoCode: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 508
        Height = 158
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        Lines.Strings = (
          'mmDaoCode')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=IB_Demo')
    Connected = True
    Left = 48
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,Ship' +
        'pedDate,ShipVia,Freight FROM {id Orders}')
    Left = 48
    Top = 112
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 48
    Top = 168
  end
  object ActionList1: TActionList
    Left = 48
    Top = 216
    object actGenerateDAO: TAction
      Caption = 'Generate DAO Code'
      ShortCut = 16397
      OnExecute = actGenerateDAOExecute
    end
  end
end
