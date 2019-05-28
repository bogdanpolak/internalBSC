object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 162
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 209
    Height = 156
    Align = alClient
    Caption = 'Create TBar object:'
    TabOrder = 0
    object btnCreateTBarClass: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 199
      Height = 25
      Align = alTop
      Caption = 'btnCreateTBarClass'
      TabOrder = 0
      OnClick = btnCreateTBarClassClick
    end
    object btnTBarOwnerSelf: TButton
      AlignWithMargins = True
      Left = 5
      Top = 49
      Width = 199
      Height = 25
      Align = alTop
      Caption = 'btnTBarOwnerSelf'
      TabOrder = 1
      OnClick = btnTBarOwnerSelfClick
    end
    object btnTBarOwnerReceiver: TButton
      AlignWithMargins = True
      Left = 5
      Top = 80
      Width = 199
      Height = 25
      Align = alTop
      Caption = 'btnTBarOwnerReceiver'
      TabOrder = 2
      OnClick = btnTBarOwnerReceiverClick
    end
  end
end
