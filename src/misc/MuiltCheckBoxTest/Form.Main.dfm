object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 599
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 684
    Height = 54
    Align = alTop
    Caption = 'GroupBox1'
    Padding.Top = 2
    Padding.Bottom = 1
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 175
      Top = 23
      Width = 58
      Height = 22
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = 'Liczba grup:'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 424
      Top = 20
      Width = 34
      Height = 28
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 287
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 272
      Top = 23
      Width = 26
      Height = 22
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = 'Tryb:'
      Layout = tlCenter
      ExplicitLeft = 268
      ExplicitHeight = 13
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 164
      Height = 28
      Align = alLeft
      Caption = 'Dodaj zestaw CheckBox-'#243'w'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitTop = 18
      ExplicitHeight = 31
    end
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 239
      Top = 23
      Width = 27
      Height = 22
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alLeft
      Alignment = taCenter
      TabOrder = 1
      Text = '6'
      ExplicitLeft = 254
      ExplicitHeight = 21
    end
    object btnClearAll: TButton
      AlignWithMargins = True
      Left = 464
      Top = 20
      Width = 138
      Height = 28
      Align = alLeft
      Caption = 'btnClearAll'
      TabOrder = 2
      OnClick = btnClearAllClick
      ExplicitLeft = 327
    end
    object ComboBox1: TComboBox
      AlignWithMargins = True
      Left = 304
      Top = 23
      Width = 114
      Height = 21
      Margins.Top = 6
      Align = alLeft
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'Standardowy'
      Items.Strings = (
        'Standardowy'
        'Szybki (No REDRAW)')
    end
  end
end
