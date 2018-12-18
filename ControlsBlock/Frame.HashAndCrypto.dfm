object FrameHashes: TFrameHashes
  Tag = 1
  Left = 0
  Top = 0
  Width = 604
  Height = 357
  TabOrder = 0
  object grbxTopBar: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 598
    Height = 48
    Align = alTop
    Caption = 'Commands'
    TabOrder = 0
    ExplicitLeft = 6
    ExplicitTop = 11
    ExplicitWidth = 630
    object btnClose: TButton
      AlignWithMargins = True
      Left = 489
      Top = 18
      Width = 104
      Height = 25
      Align = alRight
      Caption = 'btnClose'
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 521
    end
  end
  object pnLeftBar: TPanel
    Left = 0
    Top = 54
    Width = 209
    Height = 303
    Align = alLeft
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    ExplicitHeight = 368
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 203
      Height = 88
      Align = alTop
      Caption = 'Hash SHA1'
      TabOrder = 0
      ExplicitWidth = 234
      object btnExecuteSHA1: TButton
        AlignWithMargins = True
        Left = 5
        Top = 51
        Width = 193
        Height = 25
        Align = alTop
        Caption = 'btnExecuteSHA1'
        TabOrder = 0
        OnClick = btnExecuteSHA1Click
        ExplicitWidth = 224
      end
      object edtSha1: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 193
        Height = 21
        Margins.Top = 6
        Margins.Bottom = 6
        Align = alTop
        TabOrder = 1
        Text = 'admin'
        ExplicitWidth = 224
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 97
      Width = 203
      Height = 172
      Align = alTop
      Caption = 'Encrypt And Decrypt AES128'
      TabOrder = 1
      ExplicitLeft = 7
      ExplicitTop = 22
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 95
        Width = 193
        Height = 13
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Cipher Key:'
        ExplicitWidth = 56
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 193
        Height = 13
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Text to encrypt:'
        ExplicitWidth = 79
      end
      object mmUsers: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 34
        Width = 193
        Height = 55
        Align = alTop
        Lines.Strings = (
          '### Has'#322'a u'#380'ytkownik'#243'w SQL'
          'STD_USERS=masterkey')
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitWidth = 224
      end
      object edtKey: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 111
        Width = 193
        Height = 21
        Align = alTop
        TabOrder = 1
        Text = 'Moje-super-tajne-Has'#322'o'
        ExplicitWidth = 224
      end
      object btnEncrypt: TButton
        AlignWithMargins = True
        Left = 5
        Top = 138
        Width = 193
        Height = 25
        Align = alTop
        Caption = 'btnEncrypt'
        TabOrder = 2
        OnClick = btnEncryptClick
        ExplicitWidth = 224
      end
    end
  end
  object mmResults: TMemo
    AlignWithMargins = True
    Left = 224
    Top = 208
    Width = 249
    Height = 129
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object tmrFrameReady: TTimer
    Interval = 1
    OnTimer = tmrFrameReadyTimer
    Left = 248
    Top = 64
  end
end
