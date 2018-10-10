object frmReport1Selection: TfrmReport1Selection
  Left = 441
  Top = 345
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Select Options'
  ClientHeight = 116
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 66
    Width = 269
    Height = 50
    Align = alBottom
    TabOrder = 0
    object bbOK: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 33
      TabOrder = 0
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 33
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 66
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 57
      Height = 16
      Caption = 'Recipient'
    end
    object cbRecipients: TComboBox
      Left = 80
      Top = 16
      Width = 177
      Height = 24
      ItemHeight = 16
      TabOrder = 0
    end
  end
end
