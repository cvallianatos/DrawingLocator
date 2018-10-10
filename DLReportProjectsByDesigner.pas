unit DLReportProjectsByDesigner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ppDB, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDBPipe, Db, DBTables, ppPrnabl, ppCtrls, ppModule,
  daDataModule, ppBands, ppCache, ppVar;

type
  TfrmReportProjectsByDesigner = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbCancel: TBitBtn;
    bbOK: TBitBtn;
    DataSource1: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    qryMain: TQuery;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    Label1: TLabel;
    edDesigner: TEdit;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel6: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    procedure bbOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportProjectsByDesigner: TfrmReportProjectsByDesigner;

implementation

uses DLDrawingLocData;

{$R *.DFM}

procedure TfrmReportProjectsByDesigner.bbOKClick(Sender: TObject);
begin
   if edDesigner.Text = '' then
      edDesigner.Text := '%';

   qryMain.SQL.Clear;
   qryMain.SQL.Add('SELECT Drawingmaster.ProjectNumber, Drawingmaster.Designer,');
   qryMain.SQL.Add('Hospital.HospitalName, Drawingmaster.FacilityProjectNumber');
   qryMain.SQL.Add('FROM DrawingMaster Drawingmaster, Hospital Hospital');
   qryMain.SQL.Add('WHERE  Drawingmaster.HospitalID = Hospital.HospitalID');
   qryMain.SQL.Add(' AND Drawingmaster.Designer like :designer');
   qryMain.SQL.Add('ORDER BY Drawingmaster.ProjectNumber');
   qryMain.Params[0].AsString := edDesigner.Text;
   qryMain.Open;
   ppReport1.Print;

end;

end.
