unit DLRecipients;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, Buttons, ToolWin,
  ComCtrls;

type
  TfrmRecipients = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel4: TPanel;
    bbExit: TBitBtn;
    ToolBar1: TToolBar;
    bbFirst: TBitBtn;
    bbPrevious: TBitBtn;
    bbNext: TBitBtn;
    bbLast: TBitBtn;
    bbAdd: TBitBtn;
    bbDelete: TBitBtn;
    procedure bbExitClick(Sender: TObject);
    procedure bbLastClick(Sender: TObject);
    procedure bbFirstClick(Sender: TObject);
    procedure bbPreviousClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
  end;

var
  frmRecipients: TfrmRecipients;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmRecipients.bbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmRecipients.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taRecipient.Last;
end;

procedure TfrmRecipients.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taRecipient.First;
end;

procedure TfrmRecipients.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taRecipient.Prior;
end;

procedure TfrmRecipients.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taRecipient.Next;
end;

procedure TfrmRecipients.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taRecipient.Insert;
end;

procedure TfrmRecipients.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taRecipient.Delete;
end;

end.
