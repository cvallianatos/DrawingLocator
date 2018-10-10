///////////////////////////////////////////////////////////////////////////////
//
// Build of the Check In / Out process
//
// Purpose: Check In/Out of Drawings
//
// Developer         Change         Date
// ----------------- -------------- --------
// CNV               Initial design 1/3/2000
// CNV               Added reset of
//                   workbook after
//                   search         3/19/2000
///////////////////////////////////////////////////////////////////////////////

unit DLCheckInOut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, Buttons, Grids, DBGrids, AxCtrls,
  OleCtrls, vcf1;

type
  TfrmCheckInOut = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    cbHospitals: TComboBox;
    GroupBox2: TGroupBox;
    cbProjects: TComboBox;
    Panel4: TPanel;
    bbExit: TBitBtn;
    GroupBox3: TGroupBox;
    cbBuildings: TComboBox;
    GroupBox4: TGroupBox;
    cbPlantypes: TComboBox;
    bbApply: TBitBtn;
    Panel5: TPanel;
    bbSelectAll: TBitBtn;
    wbook: TF1Book;
    bbCheckOut: TBitBtn;
    bbCheckIn: TBitBtn;
    cbRecipients: TComboBox;
    Label1: TLabel;
    btnPrint: TButton;
    Label2: TLabel;
    cbCompanies: TComboBox;
    GroupBox5: TGroupBox;
    cbDrawingTypes: TComboBox;
    bbViewImage: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbExitClick(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
    procedure fillComboBoxes;
    procedure configWorkBook;
    procedure setUpQuery;
    procedure loadWorkBook;
    procedure bbSelectAllClick(Sender: TObject);
    procedure bbCheckOutClick(Sender: TObject);
    procedure wbookClick(Sender: TObject; nRow, nCol: Integer);
    procedure clearWorkBook;
    procedure checkOut;
    procedure validateSelection(checkStr: String);
    procedure executeSearch;
    procedure loadHospitals;
    procedure loadProjects;
    procedure loadBuildings;
    procedure loadPlanTypes;
    procedure loadRecipients;
    procedure loadCompanies;
    procedure bbCheckInClick(Sender: TObject);
    procedure checkIn;
    procedure cbHospitalsChange(Sender: TObject);
    procedure cbCompaniesChange(Sender: TObject);
    procedure loadDrawingTypes;
    procedure btnPrintClick(Sender: TObject);
    procedure boolShowStyle(fieldId: integer; row: Integer; col: Integer; PosStr: String; PosColor: TColor; NegStr: String; NegColor:TColor; apply: Boolean);
    procedure bbViewImageClick(Sender: TObject);
 end;

var
  frmCheckInOut: TfrmCheckInOut;
  validSelection: Boolean;
  hospitalArray: array[0..100] of Integer;
  buildingArray: array[0..100] of Integer;
  planTypeArray: array[0..100] of Integer;
  drawingTypeArray: array[0..100] of Integer;
  recipientIDArray: array[0..1000] of Integer;
  recipientNameArray: array[0..1000] of String;
  companyIDArray: array[0..100] of Integer;
  companyNameArray: array[0..100] of String;
  singQStr: String;

Const
  noColumns = 16;

implementation

uses DLDrawingLocData, DLLogin, DLReportCheckOut, DLSearching,
  DLImageViewer, CNVUtility;

{$R *.DFM}


procedure TfrmCheckInOut.boolShowStyle(fieldId: integer; row: Integer; col: Integer; PosStr: String; PosColor: TColor; NegStr: String; NegColor:TColor; Apply: Boolean);
var
  s: String;
  fgColor: TColor;
begin
   fgColor := clBlack;
   s := dmDrawingLoc.qryCheckInOut.Fields[fieldId].Value;
   wbook.SetSelection(row,col,row,col);
   if s = '-1' then
   begin
     wbook.TextRC[row,col] := PosStr;
     if Apply = True then
        fgColor := ColorToRGB(PosColor);
   end
   else
   begin
     wbook.TextRC[row,col] := NegStr;
     if Apply = True then
        fgColor := ColorToRGB(NegColor);
   end;

   if Apply = True then
     wbook.SetFont ('Arial',8,False,False,False,False,fgColor,False,False);
end;

procedure TfrmCheckInOut.validateSelection(checkStr: String);
var
   pRow1, pCol1, pRow2, pCol2: Integer;
   i,j : Integer;
begin
   validSelection := True;
   pRow1 := 0;
   pCol1 := 0;
   pRow2 := 0;
   pCol2 := 0;
   for i := 0 to wbook.SelectionCount - 1 do
   begin
      wbook.GetSelection(i, pRow1, pCol1, pRow2, pCol2);
      for j:= pRow1 to pRow2 do
      begin
         if wbook.TextRC[j,1] = checkStr then
         begin
            validSelection := False;
            exit;
         end;
      end;
   end;
end;

procedure TfrmCheckInOut.FormShow(Sender: TObject);
begin
   singQStr := '''';
//   singQStr := '"';
   bbCheckOut.Enabled := False;
   bbCheckIn.Enabled := False;
   btnPrint.Enabled := False;
   bbViewImage.Enabled := False;
   fillComboBoxes;
   configWorkBook;
   if checkClassExistence(Application, 'frmSearch') = False then
   begin
      Application.CreateForm(TfrmSearch, frmSearch);
   end;
end;

procedure TfrmCheckInOut.configWorkBook;
begin

    // In order to be able entire rows by selecting just one cell.
    // Is used when we color the grid.

    wbook.RowMode := True;
    wbook.ShowGridLines := True;
end;

procedure TfrmCheckInOut.loadHospitals;
var
  s: String;
  i: Integer;
begin

   // Hospitals

   i := 0;
   cbHospitals.Clear;
   dmDrawingLoc.qryHospital.SQL.Clear;
   if frmLogin.usercheckforhospital = False then
   begin
      dmDrawingLoc.qryHospital.SQL.Add('Select hospitalname, hospitalid from hospital order by hospitalname');
      dmDrawingLoc.qryHospital.Open;
      while dmDrawingLoc.qryHospital.Eof = False do
      begin
        s := dmDrawingLoc.qryHospital.Fields[0].AsString;
        cbHospitals.Items.Add(s);
        hospitalArray[i] := dmDrawingLoc.qryHospital.Fields[1].AsInteger;
        dmDrawingLoc.qryHospital.Next;
        i := i + 1;
      end;
   end
   else
      cbHospitals.Enabled := False;
end;

procedure TfrmCheckInOut.loadProjects;
var
  s: String;
begin

   // Projects

   cbProjects.Clear;
   dmDrawingLoc.qryProject.SQL.Clear;
   dmDrawingLoc.qryProject.SQL.Add('Select projectnumber from drawingmaster ');
   if frmLogin.usercheckforhospital = True then
   begin
      dmDrawingLoc.qryProject.SQL.Add(' where hospitalid = :userhospitalidmber');
      dmDrawingLoc.qryProject.Params[0].AsInteger := frmLogin.userhospitalid;
   end;
   dmDrawingLoc.qryProject.SQL.Add(' order by projectnumber');
   dmDrawingLoc.qryProject.Open;
   while dmDrawingLoc.qryProject.Eof = False do
   begin
     s := dmDrawingLoc.qryProject.Fields[0].AsString;
     cbProjects.Items.Add(s);
     dmDrawingLoc.qryProject.Next;
   end;
end;

procedure TfrmCheckInOut.loadBuildings;
var
  s: String;
  i: Integer;
begin

   // Buildings

   i := 0;
   cbBuildings.Clear;
   dmDrawingLoc.qryBuilding.SQL.Clear;
   if cbHospitals.Text = '' then
      dmDrawingLoc.qryBuilding.SQL.Add('Select buildingdescr, buildingid from building')
   else
   begin
      dmDrawingLoc.qryBuilding.SQL.Add('SELECT buildingdescr, buildingid FROM hospital, building');
      dmDrawingLoc.qryBuilding.SQL.Add('WHERE hospital.hospitalid = building.hospitalid');
      dmDrawingLoc.qryBuilding.SQL.Add('AND building.hospitalid = ' + IntToStr(hospitalArray[cbHospitals.itemindex]));
   end;
   dmDrawingLoc.qryBuilding.SQL.Add('order by buildingdescr');
   dmDrawingLoc.qryBuilding.Open;
   while dmDrawingLoc.qryBuilding.Eof = False do
   begin
     s := dmDrawingLoc.qryBuilding.Fields[0].AsString;
     cbBuildings.Items.Add(s);
     buildingArray[i] := dmDrawingLoc.qryBuilding.Fields[1].AsInteger;
     dmDrawingLoc.qryBuilding.Next;
     i := i + 1;
   end;
end;

procedure TfrmCheckInOut.loadDrawingTypes;
var
  s: String;
  i: Integer;
begin

   // Drawing Types

   i := 0;
   cbDrawingTypes.Clear;
   dmDrawingLoc.qryDrawingType.SQL.Clear;
   dmDrawingLoc.qryDrawingType.SQL.Add('Select drawingtypedescr, drawingtypeid from drawingtype order by drawingtypedescr');
   dmDrawingLoc.qryDrawingType.Open;
   while dmDrawingLoc.qryDrawingType.Eof = False do
   begin
     s := dmDrawingLoc.qryDrawingType.Fields[0].AsString;
     cbDrawingTypes.Items.Add(s);
     drawingTypeArray[i] := dmDrawingLoc.qryDrawingType.Fields[1].AsInteger;
     dmDrawingLoc.qryDrawingType.Next;
     i := i + 1;
   end;
end;

procedure TfrmCheckInOut.loadPlanTypes;
var
  s: String;
  i: Integer;
begin

   // Plan Types

   i := 0;
   cbPlanTypes.Clear;
   dmDrawingLoc.qryPlanType.SQL.Clear;
   dmDrawingLoc.qryPlanType.SQL.Add('Select plandescr, plantypeid from plantype order by plandescr');
   dmDrawingLoc.qryPlanType.Open;
   while dmDrawingLoc.qryPlanType.Eof = False do
   begin
     s := dmDrawingLoc.qryPlanType.Fields[0].AsString;
     cbPlanTypes.Items.Add(s);
     planTypeArray[i] := dmDrawingLoc.qryPlanType.Fields[1].AsInteger;
     dmDrawingLoc.qryPlanType.Next;
     i := i + 1;
   end;
end;

procedure TfrmCheckInOut.loadCompanies;
var
  s: String;
  i: Integer;
begin

   // Companies

   i := 0;
   cbCompanies.Clear;
   dmDrawingLoc.qryCompany.SQL.Clear;
   dmDrawingLoc.qryCompany.SQL.Add('select companyName, companyrID from company');
   dmDrawingLoc.qryCompany.SQL.Add('order by companyname');
   dmDrawingLoc.qryCompany.Open;
   while dmDrawingLoc.qryCompany.Eof = False do
   begin
     s := dmDrawingLoc.qryCompany.Fields[0].AsString;
     cbCompanies.Items.Add(s);
     companyIDArray[i] := dmDrawingLoc.qryCompany.Fields[1].AsInteger;
     companyNameArray[i] := s;
     dmDrawingLoc.qryCompany.Next;
     i := i + 1;
   end;
end;

procedure TfrmCheckInOut.loadRecipients;
var
  s: String;
  i: Integer;
begin

   // Recipients

   i := 0;
   cbRecipients.Clear;
   dmDrawingLoc.qryRecipient.SQL.Clear;
   dmDrawingLoc.qryRecipient.SQL.Add('select recipientlastname, recipientfirstname, recipientID from recipient');
   if cbCompanies.Text <> '' then
   begin
      dmDrawingLoc.qryRecipient.SQL.Add(', company WHERE recipient.companyID = company.companyrid');
      dmDrawingLoc.qryRecipient.SQL.Add('AND recipient.companyID = ' + IntToStr(companyIDArray[cbCompanies.itemindex]));
   end;
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

procedure TfrmCheckInOut.fillComboBoxes;
begin

   // Load the ComboBoxes with data.

   loadHospitals;
   loadProjects;
   loadBuildings;
   loadPlanTypes;
   loadDrawingTypes;
   loadCompanies;
   loadRecipients;
end;

procedure TfrmCheckInOut.bbExitClick(Sender: TObject);
begin
   clearWorkbook;
   frmCheckInOut.Close;
end;

procedure TfrmCheckInOut.executeSearch;
begin
  if (cbBuildings.Text = '') AND (cbPlanTypes.Text = '') AND (cbDrawingTypes.Text = '') AND (cbProjects.Text = '') AND (cbHospitals.Text = '') then
     ShowMessage('You must select a Project # or Facility or Building or Plan Type or Drawing Type')
  else
  begin
     frmSearch.Show;
     bbCheckOut.Enabled := False;
     frmSearch.ProgressBar1.StepBy(5);
     bbCheckIn.Enabled := False;
     bbViewImage.Enabled := False;
     frmSearch.ProgressBar1.StepBy(5);
     setUpQuery;
     frmSearch.ProgressBar1.StepBy(25);
     loadWorkBook;
     frmSearch.ProgressBar1.StepBy(5);
     frmSearch.Hide;
  end;
end;

procedure TfrmCheckInOut.bbApplyClick(Sender: TObject);
begin
   executeSearch;
end;

procedure TfrmCheckInOut.setUpQuery;
var
  i: Integer;
begin

  // Build and execute the query based on the selections made with the comboboxes.

  dmDrawingLoc.qryCheckInOut.SQL.Clear;
  dmDrawingLoc.qryCheckInOut.SQL.Add('SELECT');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.CheckedOut,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.ProjectNumber,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.SheetNumber,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.SheetTitle,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.IssuedDate,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.IssuedFor,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.Designer,');
//  dmDrawingLoc.qryCheckInOut.SQL.Add('"Designer",');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.FileCabinet,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.Drawer,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.CheckedOutDate,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.ReturnedDate,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.UserId,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.RecipientId,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.AsBuild,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.BluePrint,');
  dmDrawingLoc.qryCheckInOut.SQL.Add('DrawingDetail.CAD');
//  dmDrawingLoc.qryCheckInOut.SQL.Add('FROM DrawingDetail, DrawingMaster');
  dmDrawingLoc.qryCheckInOut.SQL.Add('FROM DrawingDetail ');
//  dmDrawingLoc.qryCheckInOut.SQL.Add('WHERE DrawingDetail.ProjectNumber = DrawingMaster.ProjectNumber');
  dmDrawingLoc.qryCheckInOut.SQL.Add('WHERE 1=1 ');

  i := 0;

  if cbBuildings.Text <> '' then
  begin
     dmDrawingLoc.qryCheckInOut.SQL.Add('AND DrawingDetail.buildingid = :bldg');
     dmDrawingLoc.qryCheckInOut.Params[i].AsInteger := buildingArray[cbBuildings.itemIndex];
     i := i + 1;
  end;

  if cbPlanTypes.Text <> '' then
  begin
     dmDrawingLoc.qryCheckInOut.SQL.Add('AND DrawingDetail.plantypeid = :pltype');
     dmDrawingLoc.qryCheckInOut.Params[i].AsInteger := planTypeArray[cbPlanTypes.ItemIndex];
     i := i + 1;
  end;

  if cbDrawingTypes.Text <> '' then
  begin
     dmDrawingLoc.qryCheckInOut.SQL.Add('AND DrawingDetail.drawingtypeid = :drwtype');
     dmDrawingLoc.qryCheckInOut.Params[i].AsInteger := drawingTypeArray[cbDrawingTypes.ItemIndex];
     i := i + 1;
  end;

  if cbProjects.Text <> '' then
  begin
     dmDrawingLoc.qryCheckInOut.SQL.Add('AND DrawingDetail.projectnumber = :projno');
     dmDrawingLoc.qryCheckInOut.Params[i].AsString := cbProjects.Text;
     i := i + 1;
  end;

  if (frmLogin.usercheckforhospital =  False) AND (cbHospitals.Text <> '') then
  begin
     dmDrawingLoc.qryCheckInOut.SQL.Add('AND DrawingDetail.hospitalid = :hospid');
     dmDrawingLoc.qryCheckInOut.Params[i].AsInteger := hospitalArray[cbHospitals.ItemIndex];
  end;

  if frmLogin.usercheckforhospital = True then
  begin
     dmDrawingLoc.qryCheckInOut.SQL.Add('AND DrawingDetail.hospitalid = :hospid');
     dmDrawingLoc.qryCheckInOut.Params[i].AsInteger := frmLogin.userhospitalid;
  end;

  dmDrawingLoc.qryCheckInOut.SQL.Add('ORDER BY DrawingDetail.ProjectNumber, DrawingDetail.IssuedDate');
  frmSearch.ProgressBar1.StepBy(5);
  dmDrawingLoc.qryCheckInOut.Open;
end;

procedure TfrmCheckInOut.clearWorkBook;
begin
      wbook.ClearRange(-1,-1,-1,-1,F1ClearAll);
      wbook.SetActiveCell(1,1);
      wbook.ShowActiveCell;
end;

procedure TfrmCheckInOut.loadWorkBook;
var
  i,j: Integer;
  fieldValue: Variant;
begin
  clearWorkBook;
  if dmDrawingLoc.qryCheckInOut.RecordCount > 0 then
     bbSelectAll.Enabled := True
  else
     bbSelectAll.Enabled := False;
  j := 1;
  while dmDrawingLoc.qryCheckInOut.Eof = False do
  begin

      // Special treatment of the CheckedOut column

      boolShowStyle(0, j, 1, 'Yes', clRed, 'No', clBlack, True);

      // Special treatment of the Asbuild column

      boolShowStyle(13, j, 14, 'Yes', clRed, 'No', clBlack, False);

      // Special treatment of the BluePrint column

      boolShowStyle(14, j, 15, 'Yes', clRed, 'No', clBlack, false);

      // Special treatment of the Asbuild column

      boolShowStyle(15, j, 16, 'Yes', clRed, 'No', clBlack, False);

      // For the rest of the columns

      for i := 2 to noColumns - 3 do
      begin
         fieldValue := dmDrawingLoc.qryCheckInOut.Fields[i-1].Value;

         // Workbook does not like NULL values from the database.

         if VarIsNull(fieldValue) = False then
            wbook.TextRC[j,i] := fieldValue
         else
            wbook.TextRC[j,i] := '';
      end;
      dmDrawingLoc.qryCheckInOut.Next;
      j := j + 1;
  end;
  if j = 1 then
     ShowMessage('No data found. Please try again...')
end;

procedure TfrmCheckInOut.bbSelectAllClick(Sender: TObject);
begin
if dmDrawingLoc.qryCheckInOut.RecordCount > 0 then
begin
   wbook.SetSelection(1,1,dmDrawingLoc.qryCheckInOut.RecordCount ,noColumns);
   wbook.SetFocus;
   bbCheckOut.Enabled := True;
   bbCheckIn.Enabled := True;
   btnPrint.Enabled := True;
   bbViewImage.Enabled := True;
end;
end;

procedure TfrmCheckInOut.checkOut;
var
   pRow1, pCol1, pRow2, pCol2: Integer;
   i,j : Integer;

begin
   pRow1 := 0;
   pCol1 := 0;
   pRow2 := 0;
   pCol2 := 0;
   for i := 0 to wbook.SelectionCount - 1 do
   begin
      wbook.GetSelection(i, pRow1, pCol1, pRow2, pCol2);
      for j:= pRow1 to pRow2 do
      begin
        dmDrawingLoc.qryUpdCheckInOut.Close;
        dmDrawingLoc.qryUpdCheckInOut.SQL.Clear;
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('UPDATE DrawingDetail ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('SET ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('CheckedOut = 1');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add(', RecipientID = ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add( IntToStr(recipientIDArray[cbRecipients.ItemIndex]));
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add(', UserId = ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add( singQstr + frmLogin.userid + singQstr);
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add(', CheckedOutDate = ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add(singQstr + DateTimeToStr(Now) + singQstr);

        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('WHERE ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('ProjectNumber =' + singQStr + wbook.TextRC[j,2] + singQStr + ' AND ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('IssuedDate = ' + '#' + wbook.TextRC[j,5] + '#' + ' AND ' );
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('IssuedFor =' + singQstr + wbook.TextRC[j,6] + singQstr + ' AND ');
        dmDrawingLoc.qryUpdCheckInOut.SQL.Add('SheetNumber =' + singQstr + wbook.TextRC[j,3] + singQstr );

        dmDrawingLoc.qryUpdCheckInOut.ExecSQL;
      end;
   end;

   // Execute the update


   executeSearch;
end;

procedure TfrmCheckInOut.bbCheckOutClick(Sender: TObject);
begin
  if cbRecipients.Text = '' then
     ShowMessage('Please select a recipient.')
  else
  begin
     validateSelection('Yes');
     if validSelection = True then
        checkOut
     else
        ShowMessage('Your selection contains items already checked out. Please try again.');
  end;
end;

procedure TfrmCheckInOut.wbookClick(Sender: TObject; nRow, nCol: Integer);
begin
   bbCheckOut.Enabled := True;
   bbCheckIn.Enabled := True;
   btnPrint.Enabled := True;
   bbViewImage.Enabled := True;
end;

procedure TfrmCheckInOut.bbCheckInClick(Sender: TObject);
begin
  validateSelection('No');
  if validSelection = True then
     checkIn
  else
     ShowMessage('Your selection contains items NOT checked out. Please try again.');

end;

procedure TfrmCheckInOut.checkIn;
var
   pRow1, pCol1, pRow2, pCol2: Integer;
   i,j : Integer;
begin
   pRow1 := 0;
   pCol1 := 0;
   pRow2 := 0;
   pCol2 := 0;
    for i := 0 to wbook.SelectionCount - 1 do
   begin
      wbook.GetSelection(i, pRow1, pCol1, pRow2, pCol2);
      for j:= pRow1 to pRow2 do
      begin

           dmDrawingLoc.qryUpdCheckInOut.Close;
           dmDrawingLoc.qryUpdCheckInOut.SQL.Clear;
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('UPDATE DrawingDetail ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('SET ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('CheckedOut = 0');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add(', UserId = ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add( singQstr + frmLogin.userid + singQstr);
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add(', ReturnedDate = ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add(singQstr + DateTimeToStr(Now) + singQstr);

           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('WHERE ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('ProjectNumber =' + singQStr + wbook.TextRC[j,2] + singQStr + ' AND ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('IssuedDate = ' + '#' + wbook.TextRC[j,5] + '#' + ' AND ' );
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('IssuedFor =' + singQstr + wbook.TextRC[j,6] + singQstr + ' AND ');
           dmDrawingLoc.qryUpdCheckInOut.SQL.Add('SheetNumber =' + singQstr + wbook.TextRC[j,3] + singQstr );
           dmDrawingLoc.qryUpdCheckInOut.ExecSQL;
      end;
   end;

   // Execute the update


   executeSearch;
end;

procedure TfrmCheckInOut.cbHospitalsChange(Sender: TObject);
begin
   loadBuildings;
end;

procedure TfrmCheckInOut.cbCompaniesChange(Sender: TObject);
begin
   loadRecipients;
end;

procedure TfrmCheckInOut.btnPrintClick(Sender: TObject);
var
  i: Integer;
begin

  // Build and execute the query based on the selections made with the comboboxes.

  if checkClassExistence(Application, 'TfrmCheckOutReport') = False then
  begin
      Application.CreateForm(TfrmCheckOutReport, frmCheckOutReport);
  end;
  frmCheckOutReport.Table1.SQL.Clear;
  // Build and execute the query based on the selections made with the comboboxes.

  frmCheckOutReport.Table1.SQL.Add('SELECT');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.CheckedOut,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.ProjectNumber,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.SheetNumber,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.SheetTitle,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.IssuedDate,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.IssuedFor,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.Designer,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.FileCabinet,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.Drawer,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.CheckedOutDate,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.ReturnedDate,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.UserId,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.RecipientId,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.AsBuild,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.BluePrint,');
  frmCheckOutReport.Table1.SQL.Add('DrawingDetail.CAD');
  frmCheckOutReport.Table1.SQL.Add('FROM DrawingDetail ');
  frmCheckOutReport.Table1.SQL.Add('WHERE 1=1 ');

  i := 0;

  if cbBuildings.Text <> '' then
  begin
     frmCheckOutReport.Table1.SQL.Add('AND DrawingDetail.buildingid = :bldg');
     frmCheckOutReport.Table1.Params[i].AsInteger := buildingArray[cbBuildings.itemIndex];
     i := i + 1;
  end;

  if cbPlanTypes.Text <> '' then
  begin
     frmCheckOutReport.Table1.SQL.Add('AND DrawingDetail.plantypeid = :pltype');
     frmCheckOutReport.Table1.Params[i].AsInteger := planTypeArray[cbPlanTypes.ItemIndex];
     i := i + 1;
  end;

  if cbDrawingTypes.Text <> '' then
  begin
     frmCheckOutReport.Table1.SQL.Add('AND DrawingDetail.drawingtypeid = :drwtype');
     frmCheckOutReport.Table1.Params[i].AsInteger := drawingTypeArray[cbDrawingTypes.ItemIndex];
     i := i + 1;
  end;

  if cbProjects.Text <> '' then
  begin
     frmCheckOutReport.Table1.SQL.Add('AND DrawingDetail.projectnumber = :projno');
     frmCheckOutReport.Table1.Params[i].AsString := cbProjects.Text;
     i := i + 1;
  end;

  if cbHospitals.Text <> '' then
  begin
     frmCheckOutReport.Table1.SQL.Add('AND DrawingDetail.hospitalid = :hospid');
     frmCheckOutReport.Table1.Params[i].AsInteger := hospitalArray[cbHospitals.ItemIndex];
  end;

  frmCheckOutReport.Table1.SQL.Add('ORDER BY DrawingDetail.ProjectNumber, DrawingDetail.IssuedDate');

  frmCheckOutReport.Table1.Open;
  frmCheckOutReport.QuickRep1.Preview;
end;

procedure TfrmCheckInOut.bbViewImageClick(Sender: TObject);
//var
//   pRow1, pCol1, pRow2, pCol2: Integer;
//   imageLocationValue: String;
begin
   ShowMessage('Viewing of various types of image or CAD files is NOT included in your version of the application. Please contact your vendor for details.');
//   pRow1 := 0;
//   pCol1 := 0;
//   pRow2 := 0;
//   pCol2 := 0;
//
//   if wbook.SelectionCount = 1 then
//   begin
//      wbook.GetSelection(0, pRow1, pCol1, pRow2, pCol2);
//      if (abs(Prow2 - pRow1) = 0 ) Then
//      begin
//
//        // One row has been selected. So proceed.
//
//        dmDrawingLoc.qryGetImage.Close;
//        dmDrawingLoc.qryGetImage.SQL.Clear;
//        dmDrawingLoc.qryGetImage.SQL.Add('SELECT  ImageLocation ');
//        dmDrawingLoc.qryGetImage.SQL.Add('FROM DrawingDetail WHERE ');
//        dmDrawingLoc.qryGetImage.SQL.Add('(ProjectNumber =' + singQStr + wbook.TextRC[pRow1,2] + singQStr + ' AND ');
//        dmDrawingLoc.qryGetImage.SQL.Add('IssuedDate = ' + singQStr + wbook.TextRC[pRow1,5] + singQStr + ' AND ');
//        dmDrawingLoc.qryGetImage.SQL.Add('IssuedFor = ' + singQStr + wbook.TextRC[pRow1,6] + singQStr + ' AND ');
//        dmDrawingLoc.qryGetImage.SQL.Add('SheetNumber =' + singQStr + wbook.TextRC[pRow1,3] + singQStr + ')');
//        dmDrawingLoc.qryGetImage.Open;
//
//        imageLocationValue := dmDrawingLoc.qryGetImage.Fields[0].AsString;
//
//        // Assemble the key field for the record
//
//        if imageLocationValue <> '' then
//        begin
//         frmImageViewer.ImageLoc := imageLocationValue;
//         frmImageViewer.ShowModal;
//        end
//        else
//         ShowMessage('This record does not have any on-line drawings attached');
//
//
//
//      end
//     else
//        ShowMessage('Please select only ONE row');
//   end
//   else
//       ShowMessage('Please select only ONE row');

end;

end.


