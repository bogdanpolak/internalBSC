object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'TComponent Demo'
  ClientHeight = 396
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 277
    Height = 322
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 277
    Height = 62
    Align = alTop
    Caption = 'GroupBox1'
    TabOrder = 0
    object btnCreateTFooClass1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 267
      Height = 25
      Align = alTop
      Caption = 'Create TFoo with auto-destructing'
      TabOrder = 0
      OnClick = btnCreateTFooClass1Click
    end
  end
end
