unit DLUserMnt;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, Mask, ExtCtrls, ToolWin, ComCtrls, Buttons;

type
  TfrmUserMnt = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EditUserId: TDBEdit;
    EditLastName: TDBEdit;
    EditFirstName: TDBEdit;
    EditPassword: TDBEdit;
    EditAdministrator: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    bbExit: TBitBtn;
    Label9: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    Label8: TLabel;
    ToolBar1: TToolBar;
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
  frmUserMnt: TfrmUserMnt;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmUserMnt.bbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmUserMnt.bbFirstClick(Sender: TObject);
begin
   dmDrawingLoc.taPerson.First;
end;

procedure TfrmUserMnt.bbPreviousClick(Sender: TObject);
begin
   dmDrawingLoc.taPerson.Prior;
end;

procedure TfrmUserMnt.bbNextClick(Sender: TObject);
begin
   dmDrawingLoc.taPerson.Next;
end;

procedure TfrmUserMnt.bbLastClick(Sender: TObject);
begin
   dmDrawingLoc.taPerson.Last;
end;

procedure TfrmUserMnt.bbAddClick(Sender: TObject);
begin
   dmDrawingLoc.taPerson.Insert;
end;

procedure TfrmUserMnt.bbDeleteClick(Sender: TObject);
begin
   dmDrawingLoc.taPerson.Delete;
end;

end.
