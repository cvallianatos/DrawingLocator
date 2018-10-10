unit DLDrawingLocData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmDrawingLoc = class(TDataModule)
    taBuilding: TTable;
    taDrawingType: TTable;
    taFileCabinetLocation: TTable;
    taHospital: TTable;
    taPlanType: TTable;
    dsBuilding: TDataSource;
    dsFileCabinetLocation: TDataSource;
    dsHospital: TDataSource;
    dsPlanType: TDataSource;
    taHospitalHospitalID: TAutoIncField;
    taHospitalHospitalName: TStringField;
    taBuildingBuildingID: TAutoIncField;
    taBuildingBuildingDescr: TStringField;
    taDrawingTypeDrawingTypeID: TAutoIncField;
    taDrawingTypeDrawingTypeDescr: TStringField;
    taPlanTypePlanTypeID: TAutoIncField;
    taPlanTypePlanDescr: TStringField;
    dsDrawingType: TDataSource;
    taDrawingMaster: TTable;
    dsDrawingMaster: TDataSource;
    taDrawingMasterProjectNumber: TStringField;
    taDrawingMasterDesigner: TStringField;
    taDrawingMasterHospitalID: TIntegerField;
    taDrawingMasterHospitalName: TStringField;
    taDrawingDetail: TTable;
    dsDrawingDetail: TDataSource;
    taDrawingDetailProjectNumber: TStringField;
    taDrawingDetailSheetNumber: TStringField;
    taDrawingDetailSheetTitle: TStringField;
    taDrawingDetailIssuedDate: TDateTimeField;
    taDrawingDetailIssuedFor: TStringField;
    taDrawingDetailBuildingID: TIntegerField;
    taDrawingDetailPlanTypeID: TIntegerField;
    taDrawingDetailFileCabinet: TStringField;
    taDrawingDetailFileCabinetLocID: TIntegerField;
    taDrawingDetailAsBuild: TBooleanField;
    taDrawingDetailCheckedOut: TBooleanField;
    taDrawingDetailBluePrint: TBooleanField;
    taDrawingDetailBuildingName: TStringField;
    taDrawingDetailDrawingTypeID: TIntegerField;
    taDrawingDetailPlanType: TStringField;
    taDrawingDetailFileCabinetLocation: TStringField;
    taDrawingDetailDrawingType: TStringField;
    taPerson: TTable;
    dsPerson: TDataSource;
    taPersonLastName: TStringField;
    taPersonFirstName: TStringField;
    taPersonPhoneNumber: TStringField;
    taDrawingDetailCheckedOutDate: TDateTimeField;
    taDrawingDetailReturnedDate: TDateTimeField;
    taPersonUserId: TStringField;
    taDrawingDetailUserId: TStringField;
    taDrawingDetailUser: TStringField;
    qryLogon: TQuery;
    taPersonAdministrator: TBooleanField;
    qryHospital: TQuery;
    qryProject: TQuery;
    qryBuilding: TQuery;
    qryPlanType: TQuery;
    qryCheckInOut: TQuery;
    dsCheckInOut: TDataSource;
    taBuildingHospitalID: TIntegerField;
    taCompany: TTable;
    taCompanyCompanyrID: TAutoIncField;
    taCompanyCompanyName: TStringField;
    taCompanyContactFirstName: TStringField;
    taCompanyContactLastName: TStringField;
    taCompanyCompanyOrDepartment: TStringField;
    taCompanyCity: TStringField;
    taCompanyStateOrProvince: TStringField;
    taCompanyPostalCode: TStringField;
    taCompanyCountry: TStringField;
    taCompanyContactTitle: TStringField;
    taCompanyPhoneNumber: TStringField;
    taCompanyExtension: TStringField;
    taCompanyFaxNumber: TStringField;
    taCompanyEmailAddress: TStringField;
    taCompanyNotes: TMemoField;
    dsCompany: TDataSource;
    taRecipient: TTable;
    taRecipientRecipientID: TAutoIncField;
    taRecipientRecipientLastname: TStringField;
    taRecipientRecipientFirstName: TStringField;
    taRecipientRecipientPhone: TStringField;
    taRecipientCompanyID: TIntegerField;
    dsRecipient: TDataSource;
    qryUpdCheckInOut: TQuery;
    taPersonCompanyID: TIntegerField;
    taPersonCompanyName: TStringField;
    qryRecipient: TQuery;
    taFileCabinetLocationFileCabinetLocID: TAutoIncField;
    taFileCabinetLocationFileCabinetDescr: TStringField;
    dbDrawingLoc: TDatabase;
    taPersonPass: TStringField;
    taDrawingDetailRecipientID: TIntegerField;
    taDrawingDetailCreatedOn: TDateTimeField;
    qryPassChg: TQuery;
    taDrawingDetailRecipientLast: TStringField;
    taDrawingDetailImageLocation: TStringField;
    qryCompany: TQuery;
    qryDrawingType: TQuery;
    taDrawingDetailCAD: TBooleanField;
    taDrawingDetailComments: TStringField;
    taDrawingDetailDrawer: TStringField;
    taDrawingMasterFacilityProjectNumber: TStringField;
    qryGetImage: TQuery;
    taPersonHospitalID: TIntegerField;
    taPersonHospital: TStringField;
    taPersonCheckForHospital: TBooleanField;
    taDrawingDetailDesigner: TStringField;
    taDrawingDetailHospitalID: TIntegerField;
    taDrawingDetailFacilityProjectNumber: TStringField;
    procedure taDrawingDetailNewRecord(DataSet: TDataSet);
  end;

var
  dmDrawingLoc: TdmDrawingLoc;

implementation

{$R *.DFM}



procedure TdmDrawingLoc.taDrawingDetailNewRecord(DataSet: TDataSet);
begin
   taDrawingDetailProjectNumber.Value := taDrawingMasterProjectNumber.Value;
end;

end.
