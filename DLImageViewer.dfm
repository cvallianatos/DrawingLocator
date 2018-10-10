object frmImageViewer: TfrmImageViewer
  Left = 232
  Top = 187
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Image Viewer'
  ClientHeight = 417
  ClientWidth = 630
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
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 417
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 390
      Width = 628
      Height = 26
      Align = alBottom
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 7
        Width = 182
        Height = 14
        Caption = 'Use right  mouse key to display menu '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
