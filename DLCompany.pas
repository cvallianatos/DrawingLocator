//*****************************************************************************
// DLCompany
//
// Purpose: Track drawings at hospitals
//
// Developer         Change                                            Date
// ----------------- ------------------------------------------------ --------
// CNV               Initial design                                   1/3/2000
// CNV               Close form when OK or Cancel are clicked         1/27/2000
//*****************************************************************************

unit DLCompany;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons, Db, ToolWin,
  ComCtrls, CNVUtility;

type
  TfrmCompany = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBMemo1: TDBMemo;
    Panel4: TPanel;
    bbCancel: TBitBtn;
    bbOK: TBitBtn;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    bbFirst: TBitBtn;
    bbPrevious: TBitBtn;
    bbNext: TBitBtn;
    bbLast: TBitBtn;
    bbAdd: TBitBtn;
    bbDelete: TBitBtn;
    bbRecipients: TBitBtn;
    procedure bbCancelClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbRecipientsClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbLastClick(Sender: TObject);
    procedure bbPreviousClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbFirstClick(Sender: TObject);
  end;

var
  frmCompany: TfrmCompany;

implementation

uses DLDrawingLocData, DLRecipients;

{$R *.DFM}

procedure TfrmCompany.bbCancelClick(Sender: TObject);
begin
  dmDrawingLoc.dsCompany.DataSet.Cancel;
  Close;
end;

procedure TfrmCompany.bbOKClick(Sender: TObject);
begin
  if dmDrawingLoc.dsCompany.DataSet.State in [dsEdit, dsInsert] then
     dmDrawingLoc.dsCompany.DataSet.Post;
  Close;
end;

procedure TfrmCompany.FormShow(Sender: TObject);
begin
   dmDrawingLoc.taCompany.Active := True;
   if checkClassExistence(Application, 'TfrmRecipients') = False then
   begin
      Application.CreateForm(TfrmRecipients, frmRecipients);
   end;
end;

procedure TfrmCompany.bbRecipientsClick(Sender: TObject);
begin
   frmRecipients.ShowModal;
end;

procedure TfrmCompany.bbDeleteClick(Sender: TObject);
begin
  dmDrawingLoc.taCompany.Delete;
end;

procedure TfrmCompany.bbAddClick(Sender: TObject);
begin
  dmDrawingLoc.taCompany.Insert;
end;

procedure TfrmCompany.bbLastClick(Sender: TObject);
begin
  dmDrawingLoc.taCompany.Last;
end;

procedure TfrmCompany.bbPreviousClick(Sender: TObject);
begin
  dmDrawingLoc.taCompany.Prior;
end;

procedure TfrmCompany.bbNextClick(Sender: TObject);
begin
  dmDrawingLoc.taCompany.Next;
end;

procedure TfrmCompany.bbFirstClick(Sender: TObject);
begin
  dmDrawingLoc.taCompany.First;
end;

end.
