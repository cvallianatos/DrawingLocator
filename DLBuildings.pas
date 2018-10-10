unit DLBuildings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Db, ToolWin, ComCtrls,
  Buttons;

type
  TfrmBuildings = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    ToolBar1: TToolBar;
    bbFirst: TBitBtn;
    bbPrevious: TBitBtn;
    bbNext: TBitBtn;
    bbLast: TBitBtn;
    bbAdd: TBitBtn;
    bbDelete: TBitBtn;
    bbEdit: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure bbFirstClick(Sender: TObject);
    procedure bbPreviousClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbLastClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
    procedure bbEditClick(Sender: TObject);
  end;

var
  frmBuildings: TfrmBuildings;

implementation

uses DLDrawingLocData;

{$R *.DFM}

//ocedure TfrmBuildings.DBNavigator1Click(Sender: TObject;
//Button: TNavigateBtn);
//gin
// with dmDrawingLoc.taHospital do
//      if (State in [dsEdit, dsInsert]) and (Modified) then
//      begin
//         Post;
//         Edit;
//      end;
//   with DBNavigator1.DataSource.DataSet do
//      case Button of
//         nbEdit: Edit;
//         nbInsert: Insert;
//      end;
//end;

procedure TfrmBuildings.BitBtn1Click(Sender: TObject);
begin
   frmBuildings.Close;
end;

procedure TfrmBuildings.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.First;
end;

procedure TfrmBuildings.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.Prior;
end;

procedure TfrmBuildings.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.Next;
end;

procedure TfrmBuildings.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.Last;
end;

procedure TfrmBuildings.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.Insert;
end;

procedure TfrmBuildings.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.Delete;
end;

procedure TfrmBuildings.bbEditClick(Sender: TObject);
begin
   dmDrawingLoc.taBuilding.Edit;
end;

end.
