object CommandFrame: TCommandFrame
  Left = 0
  Top = 0
  Width = 517
  Height = 61
  TabOrder = 0
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 511
    Height = 55
    Align = alClient
    Caption = 'GroupBox1'
    TabOrder = 0
    ExplicitHeight = 62
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 208
      Top = 18
      Width = 18
      Height = 32
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 167
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 92
      Height = 32
      Align = alLeft
      Caption = 'Button1'
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 103
      Top = 18
      Width = 99
      Height = 32
      Align = alLeft
      Caption = 'Button2'
      TabOrder = 1
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 232
      Top = 18
      Width = 130
      Height = 32
      Align = alLeft
      Caption = 'Wybierz kraj ...'
      DropDownMenu = PopupMenu1
      Style = bsSplitButton
      TabOrder = 2
      OnClick = Button3Click
      ExplicitLeft = 167
      ExplicitHeight = 27
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 360
    Top = 16
    object pmCountryUSA: TMenuItem
      Caption = 'U.S.A.'
      OnClick = pmCountryClick
    end
    object pmCountryGreatBritain: TMenuItem
      Caption = 'Great Britain'
      OnClick = pmCountryClick
    end
    object pmCountryGermany: TMenuItem
      Caption = 'Germany'
      OnClick = pmCountryClick
    end
    object pmCountryFrance: TMenuItem
      Caption = 'France'
      OnClick = pmCountryClick
    end
    object pmCountryItally: TMenuItem
      Caption = 'Itally'
      OnClick = pmCountryClick
    end
    object pmCountrySpain: TMenuItem
      Caption = 'Spain'
      OnClick = pmCountryClick
    end
    object pmCountryPoland: TMenuItem
      Caption = 'Poland'
      OnClick = pmCountryClick
    end
  end
end
