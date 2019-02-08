object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 132
  ClientWidth = 326
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
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 96
    Width = 105
    Height = 25
    Caption = 'Panel1'
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 136
    Top = 8
    Width = 81
    Height = 116
    Caption = 'Show On:'
    ItemIndex = 0
    Items.Strings = (
      'Button1'
      'ListBox1'
      'Panel1')
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object ListBox1: TListBox
    Left = 9
    Top = 48
    Width = 104
    Height = 33
    ItemHeight = 13
    TabOrder = 3
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 256
    Top = 48
  end
end
