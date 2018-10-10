unit DLDrawingDetail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Buttons, CNVUtility;

type
  TfrmDrawingDetail = class(TForm)
    Label2: TLabel;
    dbEdtSheetNo: TDBEdit;
    Label3: TLabel;
    dbEdtSheetTitle: TDBEdit;
    Label4: TLabel;
    dbEdtIssuedDate: TDBEdit;
    Label5: TLabel;
    dbEdtIssuedFor: TDBEdit;
    Label6: TLabel;
    dbLCbBuildingName: TDBLookupComboBox;
    Label7: TLabel;
    dbLCbPlanType: TDBLookupComboBox;
    Label8: TLabel;
    dbEdtFileCabinet: TDBEdit;
    Label9: TLabel;
    dbEdtDrawer: TDBEdit;
    Label10: TLabel;
    dbLCbDrawingType: TDBLookupComboBox;
    Label11: TLabel;
    dbLCbFileCabinetLocation: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    dbLCbUser: TDBLookupComboBox;
    Label14: TLabel;
    dbEdtCreatedOn: TDBEdit;
    Label15: TLabel;
    dbLCbRecipientLastname: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    dbCAsBuild: TDBCheckBox;
    dbCBBluePrint: TDBCheckBox;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    OpenDialog: TOpenDialog;
    dbCbCheckedOut: TDBCheckBox;
    dbCBCAD: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    dbEdtLocation: TDBEdit;
    bbViewImage: TBitBtn;
    sbImageLocation: TSpeedButton;
    GroupBox3: TGroupBox;
    dbMComments: TDBMemo;
    HiddenDesigner: TDBEdit;
    HiddenHospitalID: TDBEdit;
    HiddenFacilityProjNum: TDBEdit;
    procedure bbOKClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure sbImageLocationClick(Sender: TObject);
    procedure bbViewImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure saveValues;
    procedure defaultValues;
    procedure enableControls;
  end;

var
  frmDrawingDetail: TfrmDrawingDetail;

implementation

uses DLDrawingLocData, db, DLImageViewer, DLLogin, Main, DLDrawingMaintain;

{$R *.DFM}

procedure TfrmDrawingDetail.saveValues;
begin
     frmMain.global_SheetTitle := dbEdtSheetTitle.Text;
     frmMain.global_IssuedDate := dbEdtIssuedDate.Text;
     frmMain.global_IssuedFor := dbEdtIssuedFor.Text;
     frmMain.global_BuildingName := dbLCbBuildingName.Text;
     frmMain.global_PlanType := dbLCbPlanType.Text;
     frmMain.global_FileCabinet := dbEdtFileCabinet.Text;
     frmMain.global_Drawer := dbEdtDrawer.Text;
     frmMain.global_DrawingType := dbLCbDrawingType.Text;
     frmMain.global_FileCabinetLocation := dbLCbFileCabinetLocation.Text;
     frmMain.global_AsBuild := dbCAsBuild.Checked;
     frmMain.global_BluePrint := dbCBBluePrint.Checked;
     frmMain.global_CheckedOut := dbCbCheckedOut.Checked;
     frmMain.global_CAD := dbCBCAD.Checked;
     frmMain.global_Location := dbEdtLocation.Text;
     frmMain.global_Comments := dbMComments.Text;
end;

procedure TfrmDrawingDetail.defaultValues;
begin
      dbEdtSheetTitle.Text := frmMain.global_SheetTitle;
      dbEdtIssuedDate.Text := frmMain.global_IssuedDate;
      dbEdtIssuedFor.Text := frmMain.global_IssuedFor;
      dbEdtFileCabinet.Text := frmMain.global_FileCabinet;
      dbEdtDrawer.Text := frmMain.global_Drawer;
      dbCAsBuild.Checked := frmMain.global_AsBuild;
      dbCBBluePrint.Checked := frmMain.global_BluePrint;
      dbCbCheckedOut.Checked := frmMain.global_CheckedOut;
      dbCBCAD.Checked := frmMain.global_CAD;
      dbEdtLocation.Text := frmMain.global_Location;
      dbMComments.Text := frmMain.global_Comments;

end;

procedure TfrmDrawingDetail.bbOKClick(Sender: TObject);
begin
  if dmDrawingLoc.dsDrawingDetail.DataSet.State in [dsEdit, dsInsert] then
  begin
       HiddenDesigner.Text := frmMain.global_Designer;
       HiddenHospitalID.Text := frmMain.global_HospitalID;
       HiddenFacilityProjNum.Text := frmMain.global_FacilityProjNum;
       dmDrawingLoc.dsDrawingDetail.DataSet.Post;
       saveValues;
   end;
  Close;
end;

procedure TfrmDrawingDetail.bbCancelClick(Sender: TObject);
begin
 if frmLogin.useradmin = True Then
    dmDrawingLoc.dsDrawingDetail.DataSet.Cancel;
 Close;
end;

procedure TfrmDrawingDetail.sbImageLocationClick(Sender: TObject);
begin
   OpenDialog.Execute;
   if OpenDialog.FileName <> '' then
      dbEdtLocation.Text := OpenDialog.Filename;
end;

procedure TfrmDrawingDetail.bbViewImageClick(Sender: TObject);
begin
   ShowMessage('Viewing of various types of image or CAD files is NOT included in your version of the application. Please contact your vendor for details.');
//   if dbEdtLocation.Text <> '' then
//   begin
//      frmImageViewer.ImageLoc := dbEdtLocation.Text;
//      frmImageViewer.ShowModal;
//   end;
end;

procedure TfrmDrawingDetail.enableControls;
begin
    dbEdtSheetNo.Enabled := True;
    dbEdtSheetTitle.Enabled := True;
    dbEdtIssuedDate.Enabled := True;
    dbEdtIssuedFor.Enabled := True;
    dbLCbBuildingName.Enabled := True;
    dbLCbPlanType.Enabled := True;
    dbEdtFileCabinet.Enabled := True;
    dbEdtDrawer.Enabled := True;
    dbLCbDrawingType.Enabled := True;
    dbLCbFileCabinetLocation.Enabled := True;
    dbCAsBuild.Enabled := True;
    dbCBBluePrint.Enabled := True;
    bbOK.Enabled := True;
    dbEdtLocation.Enabled := True;
    sbImageLocation.Enabled := True;
    dbMComments.Enabled := True;
    dbCBCAD.Enabled := True;
end;

procedure TfrmDrawingDetail.FormShow(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmImageViewer') = False then
   begin
      Application.CreateForm(TfrmImageViewer, frmImageViewer);
   end;

  if frmLogin.useradmin = True Then
  begin
    if dmDrawingLoc.dsDrawingDetail.DataSet.State in [dsInsert] then
       defaultValues;

    enableControls;
  end;
end;

end.
