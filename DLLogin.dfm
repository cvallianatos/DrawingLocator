object frmLogIn: TfrmLogIn
  Left = 370
  Top = 237
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login - DETROIT MEDICAL CENTER'
  ClientHeight = 119
  ClientWidth = 356
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
  object bbLogin: TBitBtn
    Left = 267
    Top = 13
    Width = 72
    Height = 36
    TabOrder = 1
    OnClick = bbLoginClick
    Kind = bkOK
  end
  object bbCancel: TBitBtn
    Left = 267
    Top = 56
    Width = 72
    Height = 36
    TabOrder = 2
    OnClick = bbCancelClick
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 7
    Width = 241
    Height = 85
    Caption = 'User Information'
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 26
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label2: TLabel
      Left = 20
      Top = 46
      Width = 49
      Height = 13
      Caption = 'Password:'
    end
    object edtName: TEdit
      Left = 78
      Top = 20
      Width = 124
      Height = 21
      TabOrder = 0
    end
    object edtPassword: TEdit
      Left = 78
      Top = 46
      Width = 124
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object sbMsg: TStatusBar
    Left = 0
    Top = 98
    Width = 356
    Height = 21
    Panels = <>
    SimplePanel = True
    SimpleText = 'Ready'
  end
end
