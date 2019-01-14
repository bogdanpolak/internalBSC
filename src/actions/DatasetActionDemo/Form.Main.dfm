object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 336
  ClientWidth = 635
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
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 40
    Width = 240
    Height = 25
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 71
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 270
    Top = 8
    Width = 171
    Height = 65
    Caption = 'Number of HandlesTarget calls:'
    TabOrder = 3
    object lblHandlesTarget: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 161
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'lblHandlesTarget'
      ExplicitWidth = 80
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 98
    Width = 619
    Height = 230
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    LoginPrompt = False
    Left = 223
    Top = 91
  end
  object fdqCustomers: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Customers')
    Left = 223
    Top = 139
  end
  object DataSource1: TDataSource
    Left = 224
    Top = 200
  end
end
