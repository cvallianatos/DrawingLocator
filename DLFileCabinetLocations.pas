unit DLFileCabinetLocations;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, StdCtrls, ToolWin, ComCtrls;

type
  TfrmFileCabinetLocations = class(TForm)
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
  frmFileCabinetLocations: TfrmFileCabinetLocations;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmFileCabinetLocations.bbExitClick(Sender: TObject);
begin
   frmFileCabinetLocations.Close;
end;

procedure TfrmFileCabinetLocations.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taFileCabinetLocation.First;
end;

procedure TfrmFileCabinetLocations.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taFileCabinetLocation.Prior;
end;

procedure TfrmFileCabinetLocations.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taFileCabinetLocation.Next;
end;

procedure TfrmFileCabinetLocations.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taFileCabinetLocation.Last;
end;

procedure TfrmFileCabinetLocations.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taFileCabinetLocation.Insert;
end;

procedure TfrmFileCabinetLocations.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taFileCabinetLocation.Delete;
end;

end.
