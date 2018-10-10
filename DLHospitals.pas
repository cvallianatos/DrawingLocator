unit DLHospitals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Mask, Buttons, ToolWin,
  ComCtrls, CNVUtility;

type
  TfrmHospitals = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    bbExit: TBitBtn;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    bbFirst: TBitBtn;
    bbPrevious: TBitBtn;
    bbNext: TBitBtn;
    bbLast: TBitBtn;
    bbAdd: TBitBtn;
    bbDelete: TBitBtn;
    bbDetails: TBitBtn;
    procedure bbExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbFirstClick(Sender: TObject);
    procedure bbPreviousClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbLastClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
    procedure bbDetailsClick(Sender: TObject);
  end;

var
  frmHospitals: TfrmHospitals;

implementation

uses DLDrawingLocData, DLBuildings;

{$R *.DFM}

procedure TfrmHospitals.bbExitClick(Sender: TObject);
begin
   frmHospitals.Close;
end;

procedure TfrmHospitals.FormShow(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmBuildings') = False then
   begin
      Application.CreateForm(TfrmBuildings, frmBuildings);
   end;
end;

procedure TfrmHospitals.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.First;
end;

procedure TfrmHospitals.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.Prior;
end;

procedure TfrmHospitals.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.Next;
end;

procedure TfrmHospitals.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.Last;
end;

procedure TfrmHospitals.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.Insert;
   frmBuildings.ShowModal;
end;

procedure TfrmHospitals.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.Delete;
end;

procedure TfrmHospitals.bbDetailsClick(Sender: TObject);
begin
   dmDrawingLoc.taHospital.Edit;
   frmBuildings.ShowModal;
end;

end.
