program DrawingLocator;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  DLDrawingLocData in 'DLDrawingLocData.pas' {dmDrawingLoc: TDataModule},
  DLAbout in 'DLAbout.pas' {frmAboutBox},
  DLLogin in 'DLLogin.pas' {frmLogIn},
  DLDrawingMaintain in 'DLDrawingMaintain.pas' {frmDrawingMaintain},
  DLCheckInOut in 'DLCheckInOut.pas' {frmCheckInOut},
  DLSplash in 'DLSplash.pas' {SplashForm},
  DLUserMnt in 'DLUserMnt.pas' {frmUserMnt},
  DLCompany in 'DLCompany.pas' {frmCompany},
  DLDrawings in 'DLDrawings.pas' {frmDrawings},
  DLHospitals in 'DLHospitals.pas' {frmHospitals},
  DLBuildings in 'DLBuildings.pas' {frmBuildings},
  DLDrawingTypes in 'DLDrawingTypes.pas' {frmDrawingTypes},
  DLFileCabinetLocations in 'DLFileCabinetLocations.pas' {frmFileCabinetLocations},
  DLPlanTypes in 'DLPlanTypes.pas' {frmPlanTypes},
  DLRecipients in 'DLRecipients.pas' {frmRecipients},
  DLPassMaint in 'DLPassMaint.pas' {frmPassMaint},
  DLDrawingDetail in 'DLDrawingDetail.pas' {frmDrawingDetail},
  DLReport1 in 'DLReport1.pas' {frmReport1},
  DLReport1Selection in 'DLReport1Selection.pas' {frmReport1Selection},
  DLImageViewer in 'DLImageViewer.pas' {frmImageViewer},
  DLCompanyList in 'DLCompanyList.pas' {frmCompanyList},
  DLReportCheckOut in 'DLReportCheckOut.pas' {frmCheckOutReport},
  DLReleaseNotes in 'DLReleaseNotes.pas' {frmReleaseNotes},
  DLSearching in 'DLSearching.pas' {frmSearch},
  CNVUtility in 'CNVUtility.pas',
  DLHelp in 'DLHelp.pas' {frmHelp},
  DLReportProjectsByDesigner in 'DLReportProjectsByDesigner.pas' {frmReportProjectsByDesigner};

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Initialize;
  Application.Title := 'Drawing Locator';
  Application.CreateForm(TfrmLogIn, frmLogIn);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
