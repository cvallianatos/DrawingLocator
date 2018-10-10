unit DLPassMaint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmPassMaint = class(TForm)
    sb: TStatusBar;
    Panel1: TPanel;
    edtOldPass: TEdit;
    edtNewPass: TEdit;
    edtNewPassConfirm: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure bbCancelClick(Sender: TObject);
    procedure changePassword;
    procedure validateInput;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  end;

var
  frmPassMaint: TfrmPassMaint;

implementation

uses DLLogin, DLDrawingLocData;

{$R *.DFM}


procedure TfrmPassMaint.changePassword;
begin
   dmDrawingLoc.qryPassChg.SQL.Clear;
   dmDrawingLoc.qryPassChg.SQL.Add('UPDATE person');
   dmDrawingLoc.qryPassChg.SQL.Add('SET pass = :pass');
   dmDrawingLoc.qryPassChg.SQL.Add('WHERE userid = :user');
   dmDrawingLoc.qryPassChg.Params[0].AsString := edtNewPass.Text;
   dmDrawingLoc.qryPassChg.Params[1].AsString := frmLogin.userid;
   dmDrawingLoc.qryPassChg.ExecSQL;
end;

procedure TfrmPassMaint.validateInput;
begin
  if edtNewPass.Text = edtNewPassConfirm.Text Then
      if edtOldPass.Text = frmLogin.userpass Then
      begin
         changePassword;
         sb.simpleText := 'Password Changed';
      end
      else
         sb.simpleText := 'Old password is in-correct'
  else
      sb.simpleText := 'New password is not confirmed';
end;

procedure TfrmPassMaint.bbCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPassMaint.BitBtn1Click(Sender: TObject);
begin
   validateInput;
end;

procedure TfrmPassMaint.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

end.
