unit DLReportCheckOut;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Db, DBTables;

type
  TfrmCheckOutReport = class(TForm)
    QuickRep1 : TQuickRep;
    PageFooterBand1 : TQRBand;
    QRExpr1 : TQRExpr;
    ColumnHeaderBand1 : TQRBand;
    DetailBand1 : TQRBand;
    QRLabel1 : TQRLabel;
    QRExpr2 : TQRExpr;
    QRLabel2 : TQRLabel;
    QRExpr3 : TQRExpr;
    QRLabel3 : TQRLabel;
    QRExpr4 : TQRExpr;
    QRLabel4 : TQRLabel;
    QRExpr5 : TQRExpr;
    Table1: TQuery;
    Table1CheckedOut: TBooleanField;
    Table1ProjectNumber: TStringField;
    Table1SheetNumber: TStringField;
    Table1SheetTitle: TStringField;
    Table1IssuedDate: TDateTimeField;
    Table1IssuedFor: TStringField;
    Table1FileCabinet: TStringField;
    Table1CheckedOutDate: TDateTimeField;
    Table1ReturnedDate: TDateTimeField;
    Table1UserId: TStringField;
    Table1RecipientId: TIntegerField;
    QRExpr6: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr7: TQRExpr;
    Table1Designer: TStringField;
    QRLabel6: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    Table1Drawer: TStringField;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Database1: TDatabase;
  end;

var
  frmCheckOutReport: TfrmCheckOutReport;

implementation

{$R *.DFM}

end.
