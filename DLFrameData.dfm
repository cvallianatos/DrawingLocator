object fData: TfData
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  Visible = False
  object DBNavigator: TDBNavigator
    Left = 0
    Top = 0
    Width = 320
    Height = 25
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 25
    Width = 320
    Height = 215
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
