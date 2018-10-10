unit DLPlanTypes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TfrmPlanTypes = class(TForm)
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
    procedure bbExitClick(Sender: TObject);
    procedure bbFirstClick(Sender: TObject);
    procedure bbPreviousClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbLastClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
  end;

var
  frmPlanTypes: TfrmPlanTypes;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmPlanTypes.bbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPlanTypes.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taPlanType.First;
end;

procedure TfrmPlanTypes.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taPlanType.Prior;
end;

procedure TfrmPlanTypes.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taPlanType.Next;
end;

procedure TfrmPlanTypes.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taPlanType.Last;
end;

procedure TfrmPlanTypes.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taPlanType.Insert;
end;

procedure TfrmPlanTypes.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taPlanType.Delete;
end;

end.
