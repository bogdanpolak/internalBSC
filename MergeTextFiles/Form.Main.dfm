object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 567
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 41
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Caption = 'Panel1'
    Color = clHighlightText
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 555
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 43
    Width = 374
    Height = 521
    Margins.Top = 2
    Align = alLeft
    Caption = 'Pliki:'
    Padding.Left = 2
    Padding.Right = 2
    TabOrder = 1
    object lbTitleFilesToAdd: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 21
      Width = 360
      Height = 13
      Margins.Top = 6
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Dodawne (folder add):'
      ExplicitWidth = 109
    end
    object Splitter1: TSplitter
      Left = 4
      Top = 254
      Width = 366
      Height = 7
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 125
      ExplicitWidth = 190
    end
    object lbTitleFilesToRemove: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 261
      Width = 360
      Height = 13
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Usuwane (folder remove):'
      ExplicitTop = 208
      ExplicitWidth = 126
    end
    object lbTitleImport: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 429
      Width = 360
      Height = 13
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Adres URL do importu wyrejestrowanych:'
      ExplicitWidth = 200
    end
    object lbUnsubscribed: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 503
      Width = 360
      Height = 13
      Align = alBottom
      Caption = 'Nie zaimportowano listy wyrejestrowanych'
      ExplicitWidth = 205
    end
    object lbxFilesToAdd: TListBox
      AlignWithMargins = True
      Left = 7
      Top = 37
      Width = 360
      Height = 217
      Margins.Bottom = 0
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
      ExplicitWidth = 272
      ExplicitHeight = 148
    end
    object lbxFilesToRemove: TListBox
      AlignWithMargins = True
      Left = 7
      Top = 277
      Width = 360
      Height = 146
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
      ExplicitLeft = 9
    end
    object edtUnsubsrcribedURL: TEdit
      AlignWithMargins = True
      Left = 7
      Top = 445
      Width = 360
      Height = 21
      Align = alBottom
      TabOrder = 2
      Text = 'http://embarcadero.com.pl/newsletter/export.php?format=raw'
      ExplicitLeft = 3
      ExplicitTop = 543
      ExplicitWidth = 742
    end
    object btnImportUnsubscribed: TButton
      AlignWithMargins = True
      Left = 7
      Top = 472
      Width = 360
      Height = 25
      Align = alBottom
      Caption = 'Importuj [Unsubscribed]'
      TabOrder = 3
      OnClick = btnImportUnsubscribedClick
      ExplicitLeft = 3
      ExplicitTop = 503
      ExplicitWidth = 366
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 383
    Top = 44
    Width = 222
    Height = 520
    Align = alClient
    Caption = 'GroupBox2'
    TabOrder = 2
    ExplicitLeft = 96
    ExplicitTop = 208
    ExplicitWidth = 185
    ExplicitHeight = 105
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 212
      Height = 25
      Margins.Top = 6
      Align = alTop
      Caption = 'Button1'
      TabOrder = 0
      ExplicitLeft = 7
      ExplicitTop = 8
      ExplicitWidth = 114
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 52
      Width = 212
      Height = 463
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      ExplicitLeft = 3
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 40
    Top = 104
  end
end
