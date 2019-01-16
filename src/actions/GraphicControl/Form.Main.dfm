object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 243
  ClientWidth = 567
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
  object Splitter1: TSplitter
    Left = 346
    Top = 0
    Width = 5
    Height = 243
    ExplicitTop = 56
    ExplicitHeight = 187
  end
  object grbxOptions: TGroupBox
    AlignWithMargins = True
    Left = 456
    Top = 3
    Width = 108
    Height = 237
    Align = alRight
    Caption = 'Options:'
    Padding.Top = 4
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 22
      Width = 98
      Height = 13
      Margins.Bottom = 0
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'On click increase:'
      WordWrap = True
      ExplicitLeft = 108
      ExplicitTop = 18
      ExplicitWidth = 83
    end
    object edtIncrease: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 38
      Width = 98
      Height = 26
      Align = alTop
      Alignment = taCenter
      BevelKind = bkFlat
      BevelWidth = 3
      BorderStyle = bsNone
      TabOrder = 0
      Text = '1234'
      ExplicitLeft = 3
    end
    object CheckBox1: TCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 70
      Width = 98
      Height = 17
      Align = alTop
      Caption = 'Enabled'
      TabOrder = 1
      OnClick = CheckBox1Click
      ExplicitLeft = 8
      ExplicitTop = 112
      ExplicitWidth = 97
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 342
    Height = 237
    Margins.Right = 1
    Align = alLeft
    Caption = 'GroupBox2'
    TabOrder = 1
    ExplicitTop = 59
    ExplicitHeight = 150
  end
  object ActionList1: TActionList
    Left = 384
    Top = 16
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
  end
end
