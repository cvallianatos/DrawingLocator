object frmSearch: TfrmSearch
  Left = 395
  Top = 476
  BorderStyle = bsSingle
  Caption = 'Accessing the Data...Please Wait...'
  ClientHeight = 25
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 25
    Align = alClient
    TabOrder = 0
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 1
      Width = 385
      Height = 23
      Align = alClient
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
end
