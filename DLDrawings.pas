unit DLDrawings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, ExtCtrls, StdCtrls, Mask, Buttons, ToolWin,
  ComCtrls, CNVUtility;

type
  TfrmDrawings = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    dbgDrawings: TDBGrid;
    Panel1: TPanel;
    Panel4: TPanel;
    bbExit: TBitBtn;
    ToolBar1: TToolBar;
    bbFirst: TBitBtn;
    bbPrevious: TBitBtn;
    bbNext: TBitBtn;
    bbLast: TBitBtn;
    bbAdd: TBitBtn;
    bbDelete: TBitBtn;
    bbDetails: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbExitClick(Sender: TObject);
    procedure bbDetailsClick(Sender: TObject);
    procedure bbFirstClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbPreviousClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
    procedure bbLastClick(Sender: TObject);
  end;

var
  frmDrawings: TfrmDrawings;

implementation

uses DLDrawingMaintain, DLLogin, DLDrawingDetail, DLDrawingLocData;

{$R *.DFM}

procedure TfrmDrawings.FormShow(Sender: TObject);
begin
  if checkClassExistence(Application, 'frmDrawingMaintain') = False then
  begin
     Application.CreateForm(TfrmDrawingMaintain, frmDrawingMaintain);
  end;

  if checkClassExistence(Application, 'frmDrawingDetail') = False then
  begin
     Application.CreateForm(TfrmDrawingDetail, frmDrawingDetail);
  end;

  if frmLogin.useradmin = True Then
  begin
     bbAdd.Enabled := True;
     bbDelete.Enabled := True;
  end;

  // Run Query for specific Hospitals only
  if (frmLogin.usercheckforhospital = True) then
  begin
    dmDrawingLoc.taDrawingMaster.Filter := 'hospitalid = ' + inttostr(frmLogin.userhospitalid);
    dmDrawingLoc.taDrawingMaster.Filtered := True;
  end;

end;

procedure TfrmDrawings.bbExitClick(Sender: TObject);
begin
   frmDrawings.Close;
end;

procedure TfrmDrawings.bbDetailsClick(Sender: TObject);
begin
   frmDrawingMaintain.ShowModal;
end;

procedure TfrmDrawings.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingMaster.First;
end;

procedure TfrmDrawings.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingMaster.Next;
end;

procedure TfrmDrawings.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingMaster.Prior;
end;

procedure TfrmDrawings.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingMaster.Insert;
   frmDrawingMaintain.ShowModal;
end;

procedure TfrmDrawings.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingMaster.Delete;
end;

procedure TfrmDrawings.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingMaster.Last;
end;

end.
