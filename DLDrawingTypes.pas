unit DLDrawingTypes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TfrmDrawingTypes = class(TForm)
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
  frmDrawingTypes: TfrmDrawingTypes;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmDrawingTypes.bbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDrawingTypes.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingType.First;
end;

procedure TfrmDrawingTypes.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingType.Prior;
end;

procedure TfrmDrawingTypes.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingType.Next;
end;

procedure TfrmDrawingTypes.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingType.Last;
end;

procedure TfrmDrawingTypes.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingType.Insert;
end;

procedure TfrmDrawingTypes.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taDrawingType.Delete;
end;

end.
