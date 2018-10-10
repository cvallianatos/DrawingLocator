//*****************************************************************************
// Main
//
// Purpose: Track drawings at hospitals
//
// Developer         Change         Date
// ----------------- -------------- --------
// CNV               Initial design 1/3/2000
//*****************************************************************************

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,
  DLFrameData, DLDrawings, Menus,DLCheckInOut, CNVUtility;

type
  TfrmMain = class(TForm)
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Administration: TMenuItem;
    UserMaintenance: TMenuItem;
    Panel1: TPanel;
    PrinterSetupDialog: TPrinterSetupDialog;
    PrintDialog: TPrintDialog;
    PrintSetup1: TMenuItem;
    Data1: TMenuItem;
    N2: TMenuItem;
    DrawingTypes1: TMenuItem;
    FileCabinetLocations1: TMenuItem;
    HospitalsBuildings1: TMenuItem;
    PlanTypes1: TMenuItem;
    Companies1: TMenuItem;
    CheckInOut1: TMenuItem;
    Reports1: TMenuItem;
    DrawingsCheckedOutByRecipient1: TMenuItem;
    Drawings1: TMenuItem;
    Tools1: TMenuItem;
    MaintainYourPassword1: TMenuItem;
    RecordaRequest1: TMenuItem;
    Help2: TMenuItem;
    N3: TMenuItem;
    ProjectsByDesigner1: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UserMaintenanceClick(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure CheckInOut1Click(Sender: TObject);
    procedure Companies1Click(Sender: TObject);
    procedure DrawingTypes1Click(Sender: TObject);
    procedure FileCabinetLocations1Click(Sender: TObject);
    procedure HospitalsBuildings1Click(Sender: TObject);
    procedure PlanTypes1Click(Sender: TObject);
    procedure Drawings1Click(Sender: TObject);
    procedure MaintainYourPassword1Click(Sender: TObject);
    procedure DrawingsCheckedOutByRecipient1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure ProjectsByDesigner1Click(Sender: TObject);
  public
    global_SheetTitle: String;
    global_IssuedDate: String;
    global_IssuedFor: String;
    global_BuildingName: String;
    global_PlanType: String;
    global_FileCabinet: String;
    global_Drawer: String;
    global_DrawingType: String;
    global_FileCabinetLocation: String;
    global_AsBuild: Boolean;
    global_BluePrint: Boolean;
    global_CheckedOut: Boolean;
    global_CAD: Boolean;
    global_Location: String;
    global_Comments: String;
    global_Designer: String;
    global_HospitalID: String;
    global_FacilityProjNum: String;
  end;

var
  frmMain: TfrmMain;

implementation

uses DLDrawingLocData, DLAbout, DLLogin, DLUserMnt, DLCompany, DLHospitals,
  DLDrawingTypes, DLFileCabinetLocations, DLPlanTypes, DLPassMaint,
  DLReport1, DLCompanyList, DLHelp, DLReportProjectsByDesigner;

{$R *.DFM}

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmMain.About1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmAboutBox') = False then
   begin
      Application.CreateForm(TfrmAboutBox, frmAboutBox);
   end;

   frmAboutBox.ShowModal;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frmLogin.Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

   //
   // If user has administration status, enable the Administration menu.
   //

   frmMain.Administration.Visible := frmLogin.useradmin;
   frmmain.Caption := frmMain.caption + ' ' + frmLogin.glbVersion;
end;

procedure TfrmMain.UserMaintenanceClick(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmUserMnt') = False then
   begin
      Application.CreateForm(TfrmUserMnt, frmUserMnt);
   end;

   frmUserMnt.ShowModal;
end;

procedure TfrmMain.PrintSetup1Click(Sender: TObject);
begin
   PrinterSetupDialog.Execute;
end;

procedure TfrmMain.Print1Click(Sender: TObject);
begin
   PrintDialog.Execute;
end;

procedure TfrmMain.CheckInOut1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmCheckInOut') = False then
   begin
      Application.CreateForm(TfrmCheckInOut, frmCheckInOut);
   end;

   frmCheckInOut.ShowModal;;
end;

procedure TfrmMain.Companies1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmCompanyList') = False then
   begin
      Application.CreateForm(TfrmCompanyList, frmCompanyList);
   end;

   frmCompanyList.ShowModal;
end;

procedure TfrmMain.DrawingTypes1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmDrawingTypes') = False then
   begin
      Application.CreateForm(TfrmDrawingTypes, frmDrawingTypes);
   end;

  frmDrawingTypes.ShowModal;
end;

procedure TfrmMain.FileCabinetLocations1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmFileCabinetLocations') = False then
   begin
      Application.CreateForm(TfrmFileCabinetLocations, frmFileCabinetLocations);
   end;

   frmFileCabinetLocations.showmodal;
end;

procedure TfrmMain.HospitalsBuildings1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmHospitals') = False then
   begin
      Application.CreateForm(TfrmHospitals, frmHospitals);
   end;

   frmHospitals.Showmodal;
end;

procedure TfrmMain.PlanTypes1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmPlanTypes') = False then
   begin
      Application.CreateForm(TfrmPlanTypes, frmPlanTypes);
   end;

   frmPlanTypes.showmodal;
end;

procedure TfrmMain.Drawings1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmDrawings') = False then
   begin
      Application.CreateForm(TfrmDrawings, frmDrawings);
   end;

   frmDrawings.showmodal;
end;

procedure TfrmMain.MaintainYourPassword1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmPassMaint') = False then
   begin
      Application.CreateForm(TfrmPassMaint, frmPassMaint);
   end;

   frmPassMaint.ShowModal;
end;

procedure TfrmMain.DrawingsCheckedOutByRecipient1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmReport1') = False then
   begin
      Application.CreateForm(TfrmReport1, frmReport1);
   end;

   frmReport1.Table1.SQL.Clear;

   frmReport1.Table1.SQL.Add('SELECT drawingmaster.projectnumber,');
   frmReport1.Table1.SQL.Add('drawingmaster.designer,');
   frmReport1.Table1.SQL.Add('drawingmaster.hospitalid,');
   frmReport1.Table1.SQL.Add('hospital.hospitalname,');
   frmReport1.Table1.SQL.Add('drawingdetail.sheettitle,');
   frmReport1.Table1.SQL.Add('recipient.recipientlastname,');
   frmReport1.Table1.SQL.Add('drawingdetail.checkedoutdate');
   frmReport1.Table1.SQL.Add('FROM drawingmaster, drawingdetail, hospital, recipient');
   frmReport1.Table1.SQL.Add('WHERE drawingmaster.hospitalid = hospital.hospitalid');
   frmReport1.Table1.SQL.Add('AND drawingmaster.projectnumber = drawingdetail.projectnumber');
   frmReport1.Table1.SQL.Add('AND drawingdetail.recipientid = recipient.recipientid');
   frmReport1.Table1.SQL.Add('AND drawingdetail.checkedout = True');
   frmReport1.Table1.SQL.Add('ORDER BY recipient.recipientlastname');
   frmReport1.Table1.Open;
   frmReport1.QuickRep1.Preview;
end;

procedure TfrmMain.Help2Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmHelp') = False then
   begin
      Application.CreateForm(TfrmHelp, frmHelp);
   end;

   frmHelp.ShowModal;
end;


procedure TfrmMain.ProjectsByDesigner1Click(Sender: TObject);
begin
   if checkClassExistence(Application, 'TfrmReportProjectsByDesigner') = False then
   begin
      Application.CreateForm(TfrmReportProjectsByDesigner, frmReportProjectsByDesigner);
   end;
   frmReportProjectsByDesigner.ShowModal;
end;

end.
