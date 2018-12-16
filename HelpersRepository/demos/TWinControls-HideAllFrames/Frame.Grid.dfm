object GridFrame: TGridFrame
  Left = 0
  Top = 0
  Width = 637
  Height = 356
  TabOrder = 0
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 631
    Height = 350
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.dsCustomers
    Left = 304
    Top = 168
  end
end
