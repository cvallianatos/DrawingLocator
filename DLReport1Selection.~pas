unit DLreport1Selection;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmReport1Selection = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    cbRecipients: TComboBox;
    procedure bbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  frmReport1Selection: TfrmReport1Selection;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmReport1Selection.bbCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmReport1Selection.FormShow(Sender: TObject);
var
  s: String;
  i: Integer;
  recipientIDArray: array[1..500] of Integer;
  recipientNameArray: array[1..500] of String;

begin

   // Recipients

   i := 0;
   cbRecipients.Clear;
   dmDrawingLoc.qryRecipient.SQL.Clear;
   dmDrawingLoc.qryRecipient.SQL.Add('select recipientlastname, recipientfirstname, recipientID from recipient');
   dmDrawingLoc.qryRecipient.SQL.Add('order by recipientlastname');
   dmDrawingLoc.qryRecipient.Open;
   while dmDrawingLoc.qryRecipient.Eof = False do
   begin
     s := dmDrawingLoc.qryRecipient.Fields[0].AsString + ', ' + dmDrawingLoc.qryRecipient.Fields[1].AsString;
     cbRecipients.Items.Add(s);
     recipientIDArray[i] := dmDrawingLoc.qryRecipient.Fields[2].AsInteger;
     recipientNameArray[i] := s;
     dmDrawingLoc.qryRecipient.Next;
     i := i + 1;
   end;
end;

end.
