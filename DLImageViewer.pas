unit DLImageViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OleCtrls, StdCtrls;

type
  TfrmImageViewer = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  public
    ImageLoc: String;
  end;

var
  frmImageViewer: TfrmImageViewer;

implementation

{$R *.DFM}

procedure TfrmImageViewer.FormShow(Sender: TObject);
begin
//   if ImageLoc <> '' then
//   begin
//      frmImageViewer.Caption := frmImageViewer.Caption + ' ' + ImageLoc;
//      DwgX.Src := ImageLoc;
//   end;
end;

end.
