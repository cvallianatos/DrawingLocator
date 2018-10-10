unit DLLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TfrmLogIn = class(TForm)
    bbLogin: TBitBtn;
    bbCancel: TBitBtn;
    GroupBox1: TGroupBox;
    edtName: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    sbMsg: TStatusBar;
    procedure bbCancelClick(Sender: TObject);
    procedure bbLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    userid: String;
    useradmin: Boolean;
    usercompanyid: Integer;
    userpass: String;
    userhospitalid: Integer;
    usercheckforhospital: Boolean;
    glbVersion: String;
  end;

var
  frmLogIn: TfrmLogIn;

implementation

uses Main, DLDrawingLocData, CNVUtility;

{$R *.DFM}

procedure TfrmLogIn.bbCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLogIn.bbLoginClick(Sender: TObject);
begin

   //
   // Check if user has tried to login before.
   //

   if checkClassExistence(Application, 'TdmDrawingLoc') = False then
   begin
      Application.CreateForm(TdmDrawingLoc, dmDrawingLoc);
   end;

   dmDrawingLoc.qryLogon.SQL.Clear;
   dmDrawingLoc.qryLogon.SQL.Add('Select userid, pass, administrator, companyid, hospitalid, checkforhospital from person');
   dmDrawingLoc.qryLogon.SQL.Add('where userid = :user and pass = :pass');
   dmDrawingLoc.qryLogon.Params[0].AsString := edtName.Text;
   dmDrawingLoc.qryLogon.Params[1].AsString := edtPassword.Text;
   dmDrawingLoc.qryLogon.Open;

   if dmDrawingLoc.qryLogon.RecordCount <> 0 then
   begin
      userid := dmDrawingLoc.qryLogon.Fields[0].AsString;
      userpass := dmDrawingLoc.qryLogon.Fields[1].AsString;
      useradmin := dmDrawingLoc.qryLogon.Fields[2].AsBoolean;
      usercompanyid := dmDrawingLoc.qryLogon.Fields[3].AsInteger;
      userhospitalid := dmDrawingLoc.qryLogon.Fields[4].AsInteger;
      usercheckforhospital := dmDrawingLoc.qryLogon.Fields[5].AsBoolean;
      Application.CreateForm(TfrmMain, frmMain);
      dmDrawingLoc.qryLogon.Free;
      frmLogin.Hide;
      frmMain.show;
   end
   else
      sbMsg.SimpleText := 'Incorrect user name or password - Try again';
end;

procedure TfrmLogIn.FormShow(Sender: TObject);
begin
   glbVersion := '1.00.8';
   frmLogin.Caption := frmLogin.caption + ' rev. ' + glbVersion;
end;

end.
