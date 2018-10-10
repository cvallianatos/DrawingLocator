unit DLDrawingMaintain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Grids, DBGrids, Db, ToolWin,
  ComCtrls;

type
  TfrmDrawingMaintain = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    bbCancel: TBitBtn;
    DBEdit4: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  public
    hospitalid: Integer;
    HDesigner: String;
    HHospitalID: String;
    HFacilityProjNum: String;
  end;

var
  frmDrawingMaintain: TfrmDrawingMaintain;

implementation

uses DLDrawingLocData, DLLogin, DLDrawingDetail, Main;

{$R *.DFM}

procedure TfrmDrawingMaintain.FormShow(Sender: TObject);
begin
  if frmLogin.useradmin = False Then
  begin
     DBEdit1.Enabled := False;
     DBLookupComboBox1.Enabled := False;
     DBEdit2.Enabled := False;
     DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast, nbEdit];
  end;
  frmMain.global_Designer := DBEdit2.Text;
  frmMain.global_HospitalID :=  DBEdit4.Text;
  frmMain.global_FacilityProjNum := DBEdit3.Text;
end;

procedure TfrmDrawingMaintain.bbCancelClick(Sender: TObject);
begin
   Close;
end;


procedure TfrmDrawingMaintain.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 if frmLogin.useradmin = True Then
  begin
   with dmDrawingLoc.taDrawingMaster do
      if (State in [dsEdit, dsInsert]) and (Modified) then
      begin
         Post;
         Edit;
      end;
   with DBNavigator1.DataSource.DataSet do
      case Button of
         nbEdit:
         begin
            hospitalid := dmDrawingLoc.taDrawingMasterHospitalid.Value;
            Edit;
            frmDrawingDetail.Showmodal;
         end;
         nbInsert:
         begin
           Insert;
           frmDrawingDetail.Showmodal;
         end;
      end;
   end
   else
     frmDrawingDetail.Showmodal;
end;

end.
