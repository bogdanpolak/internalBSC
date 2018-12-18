object FrameHashes: TFrameHashes
  Tag = 1
  Left = 0
  Top = 0
  Width = 636
  Height = 422
  TabOrder = 0
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 56
    Width = 630
    Height = 363
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object mmResults: TMemo
      AlignWithMargins = True
      Left = 223
      Top = 4
      Width = 403
      Height = 355
      Align = alClient
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitLeft = 195
      ExplicitWidth = 482
      ExplicitHeight = 116
    end
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 213
      Height = 355
      Align = alLeft
      Caption = 'Demos'
      Padding.Top = 5
      TabOrder = 1
      ExplicitHeight = 463
      object btnClose: TButton
        AlignWithMargins = True
        Left = 5
        Top = 325
        Width = 203
        Height = 25
        Align = alBottom
        Caption = 'btnClose'
        TabOrder = 0
        OnClick = btnCloseClick
        ExplicitLeft = 56
        ExplicitTop = 113
        ExplicitWidth = 75
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 203
        Height = 88
        Align = alTop
        Caption = 'Hash SHA1'
        TabOrder = 1
        ExplicitTop = 153
        ExplicitWidth = 243
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
          ExplicitWidth = 243
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
          ExplicitWidth = 243
        end
      end
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 117
        Width = 203
        Height = 172
        Align = alTop
        Caption = 'Encrypt And Decrypt AES128'
        TabOrder = 2
        object Label1: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 95
          Width = 193
          Height = 13
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Cipher Key:'
          ExplicitTop = 79
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
          ExplicitLeft = 10
          ExplicitTop = 26
          ExplicitWidth = 233
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
          ExplicitLeft = 7
          ExplicitTop = 114
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
          ExplicitTop = 82
          ExplicitWidth = 175
        end
      end
    end
  end
  object tmrFrameReady: TTimer
    Interval = 1
    OnTimer = tmrFrameReadyTimer
    Left = 40
    Top = 8
  end
end
