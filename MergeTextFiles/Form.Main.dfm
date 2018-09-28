object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Text Files Merger 2.0'
  ClientHeight = 567
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 377
    Top = 0
    Width = 5
    Height = 567
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 2
    Width = 374
    Height = 562
    Margins.Top = 2
    Margins.Right = 0
    Align = alLeft
    Caption = 'Pliki:'
    Padding.Left = 2
    Padding.Right = 2
    TabOrder = 0
    ExplicitLeft = 6
    ExplicitTop = 7
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
      ExplicitWidth = 126
    end
    object lbTitleImport: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 470
      Width = 360
      Height = 13
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Adres URL do importu wyrejestrowanych:'
      ExplicitWidth = 200
    end
    object lbWebImport: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 544
      Width = 360
      Height = 13
      Align = alBottom
      Caption = 'Nie zaimportowano listy do usuni'#281'cie'
      ExplicitWidth = 175
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
      OnDblClick = lbxFilesToAddDblClick
    end
    object lbxFilesToRemove: TListBox
      AlignWithMargins = True
      Left = 7
      Top = 277
      Width = 360
      Height = 187
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
      OnDblClick = lbxFilesToRemoveDblClick
    end
    object edtImportURL: TEdit
      AlignWithMargins = True
      Left = 7
      Top = 486
      Width = 360
      Height = 21
      Align = alBottom
      TabOrder = 2
    end
    object btnImportFromWeb: TButton
      AlignWithMargins = True
      Left = 7
      Top = 513
      Width = 360
      Height = 25
      Align = alBottom
      Caption = 'Importuj elementy do usuni'#281'cia z Internetu'
      TabOrder = 3
      OnClick = btnImportFromWebClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 382
    Top = 3
    Width = 429
    Height = 561
    Margins.Left = 0
    Align = alClient
    Caption = 'Wyniki scalania'
    TabOrder = 1
    ExplicitLeft = 383
    ExplicitWidth = 428
    object btnMergeAllFiles: TButton
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 419
      Height = 25
      Margins.Top = 6
      Align = alTop
      Caption = 'btnMergeAllFiles'
      TabOrder = 0
      OnClick = btnMergeAllFilesClick
      ExplicitWidth = 418
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 52
      Width = 419
      Height = 504
      Align = alClient
      Lines.Strings = (
        'Memo1')
      PopupMenu = PopupMenu1
      ScrollBars = ssVertical
      TabOrder = 1
      ExplicitLeft = 7
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
  object ActionManager1: TActionManager
    Left = 536
    Top = 168
    StyleName = 'Platform Default'
    object actEditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object actEditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object actFileSaveAs1: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
      OnAccept = actFileSaveAs1Accept
    end
    object actEditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object actEditUndo1: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object actEditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 5
      ShortCut = 46
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 256
    object Copy1: TMenuItem
      Action = actEditCopy1
    end
    object Cut1: TMenuItem
      Action = actEditCut1
    end
    object SelectAll1: TMenuItem
      Action = actEditSelectAll1
    end
    object Delete1: TMenuItem
      Action = actEditDelete1
    end
    object Undo1: TMenuItem
      Action = actEditUndo1
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SaveAs1: TMenuItem
      Action = actFileSaveAs1
    end
  end
end
