�
 TDMDRAWINGLOC 0b9  TPF0TdmDrawingLocdmDrawingLocOldCreateOrderLeft� Top� Height�Widthh TTable
taBuildingActive	DatabaseNamedbDrawingLoc	FieldDefsName
BuildingIDDataType	ftAutoInc NameBuildingDescrDataTypeftStringSized Name
HospitalIDDataType	ftInteger  	IndexDefsNameBuilding#PXFields
BuildingIDOptionsixUnique  Name&{A20E7107-039A-11D5-9579-00A0CC58B41E}Fields
HospitalID Name
HospitalIDFields
HospitalID  IndexFieldNames
HospitalIDMasterFields
HospitalIDMasterSource
dsHospital	StoreDefs		TableNameBuildingLeft� TopP TAutoIncFieldtaBuildingBuildingID	FieldName
BuildingID  TStringFieldtaBuildingBuildingDescr	FieldNameBuildingDescrSized  TIntegerFieldtaBuildingHospitalID	FieldName
HospitalID   TTabletaDrawingTypeActive	DatabaseNamedbDrawingLoc	FieldDefsNameDrawingTypeIDDataType	ftAutoInc NameDrawingTypeDescrDataTypeftStringSized  	IndexDefsNametaDrawingTypeIndex1FieldsDrawingTypeIDOptions	ixPrimaryixUnique   	StoreDefs		TableNameDrawingTypeLeft� Top TAutoIncFieldtaDrawingTypeDrawingTypeID	FieldNameDrawingTypeID  TStringFieldtaDrawingTypeDrawingTypeDescr	FieldNameDrawingTypeDescrSized   TTabletaFileCabinetLocationActive	AutoRefresh	DatabaseNamedbDrawingLoc	FieldDefsNameFileCabinetLocIDDataType	ftAutoInc NameFileCabinetDescrDataTypeftStringSized  	IndexDefsName
PrimaryKeyFieldsFileCabinetLocIDOptionsixUnique  NameFileCabinetLocIDFieldsFileCabinetLocID  	StoreDefs		TableNameFileCabinetLocationLeft0TopP TAutoIncField%taFileCabinetLocationFileCabinetLocID	FieldNameFileCabinetLocID  TStringField%taFileCabinetLocationFileCabinetDescr	FieldNameFileCabinetDescrSized   TTable
taHospitalActive	DatabaseNamedbDrawingLoc	TableNameHospitalLeft� TopP TAutoIncFieldtaHospitalHospitalID	FieldName
HospitalID  TStringFieldtaHospitalHospitalName	FieldNameHospitalNameSized   TTable
taPlanTypeActive	DatabaseNamedbDrawingLoc	TableNamePlanTypeLeft�Top TAutoIncFieldtaPlanTypePlanTypeID	FieldName
PlanTypeID  TStringFieldtaPlanTypePlanDescr	FieldName	PlanDescrSized   TDataSource
dsBuildingDataSet
taBuildingLeft� Top�   TDataSourcedsFileCabinetLocationDataSettaFileCabinetLocationLeftTop�   TDataSource
dsHospitalDataSet
taHospitalLeftTop�   TDataSource
dsPlanTypeDataSet
taPlanTypeLeftxTop�   TDataSourcedsDrawingTypeDataSettaDrawingTypeLeft�Top�   TTabletaDrawingMasterActive	AutoRefresh	DatabaseNamedbDrawingLoc	TableNameDrawingMasterLeft� Top TStringFieldtaDrawingMasterProjectNumber	FieldNameProjectNumberSized  TStringFieldtaDrawingMasterDesigner	FieldNameDesignerSized  TIntegerFieldtaDrawingMasterHospitalID	FieldName
HospitalID  TStringFieldtaDrawingMasterHospitalName	FieldKindfkLookup	FieldNameHospitalNameLookupDataSet
taHospitalLookupKeyFields
HospitalIDLookupResultFieldHospitalName	KeyFields
HospitalIDLookup	  TStringField$taDrawingMasterFacilityProjectNumber	FieldNameFacilityProjectNumberSize2   TDataSourcedsDrawingMasterDataSettaDrawingMasterLeft�Top�   TTabletaDrawingDetailActive	OnNewRecordtaDrawingDetailNewRecordAutoRefresh	DatabaseNamedbDrawingLoc	FieldDefsNameProjectNumberDataTypeftStringSized Name
IssuedDateDataType
ftDateTime Name	IssuedForDataTypeftStringSize< NameSheetNumberDataTypeftStringSize Name
SheetTitleDataTypeftStringSize�  Name
BuildingIDDataType	ftInteger Name
PlanTypeIDDataType	ftInteger NameFileCabinetDataTypeftStringSized NameFileCabinetLocIDDataType	ftInteger NameDrawerDataTypeftStringSize NameAsBuild
Attributes
faRequired DataType	ftBoolean Name
CheckedOut
Attributes
faRequired DataType	ftBoolean Name	BluePrint
Attributes
faRequired DataType	ftBoolean NameDrawingTypeIDDataType	ftInteger NameUserIdDataTypeftStringSized NameCheckedOutDateDataType
ftDateTime NameReturnedDateDataType
ftDateTime NameRecipientIDDataType	ftInteger Name	CreatedOnDataType
ftDateTime NameImageLocationDataTypeftStringSize�  NameCAD
Attributes
faRequired DataType	ftBoolean NameCommentsDataTypeftStringSize�  NameDesignerDataTypeftStringSized Name
HospitalIDDataType	ftInteger NameFacilityProjectNumberDataTypeftStringSized  	IndexDefsName
PrimaryKeyFields.ProjectNumber;IssuedDate;IssuedFor;SheetNumberOptionsixUnique  Name	BuildingsFields
BuildingID NameDrawingTypesFieldsDrawingTypeID Name	HospitalsFields
HospitalID Name	PlanTypesFields
PlanTypeID NameProjectNumbersFieldsProjectNumber NameRecipientIDFieldsRecipientID NameUserIdFieldsUserId  	IndexName
PrimaryKeyMasterFieldsProjectNumberMasterSourcedsDrawingMaster	StoreDefs		TableNameDrawingDetailLeft@TopP TStringFieldtaDrawingDetailProjectNumber	FieldNameProjectNumberSized  TStringFieldtaDrawingDetailSheetNumber	FieldNameSheetNumber  TStringFieldtaDrawingDetailSheetTitle	FieldName
SheetTitleSize�   TDateTimeFieldtaDrawingDetailIssuedDate	FieldName
IssuedDateEditMask!99/99/00;1;_  TStringFieldtaDrawingDetailIssuedFor	FieldName	IssuedForSize<  TIntegerFieldtaDrawingDetailBuildingID	FieldName
BuildingID  TIntegerFieldtaDrawingDetailPlanTypeID	FieldName
PlanTypeID  TStringFieldtaDrawingDetailFileCabinet	FieldNameFileCabinetSized  TIntegerFieldtaDrawingDetailFileCabinetLocID	FieldNameFileCabinetLocID  TBooleanFieldtaDrawingDetailAsBuild	FieldNameAsBuildDisplayValuesYes;No  TBooleanFieldtaDrawingDetailCheckedOut	FieldName
CheckedOutDisplayValuesYes;No  TBooleanFieldtaDrawingDetailBluePrint	FieldName	BluePrintDisplayValuesYes;No  TStringFieldtaDrawingDetailBuildingName	FieldKindfkLookup	FieldNameBuildingNameLookupDataSet
taBuildingLookupKeyFields
BuildingIDLookupResultFieldBuildingDescr	KeyFields
BuildingIDLookup	  TIntegerFieldtaDrawingDetailDrawingTypeID	FieldNameDrawingTypeID  TStringFieldtaDrawingDetailPlanType	FieldKindfkLookup	FieldNamePlanTypeLookupDataSet
taPlanTypeLookupKeyFields
PlanTypeIDLookupResultField	PlanDescr	KeyFields
PlanTypeIDLookup	  TStringField"taDrawingDetailFileCabinetLocation	FieldKindfkLookup	FieldNameFileCabinetLocationLookupDataSettaFileCabinetLocationLookupKeyFieldsFileCabinetLocIDLookupResultFieldFileCabinetDescr	KeyFieldsFileCabinetLocIDLookup	  TStringFieldtaDrawingDetailDrawingType	FieldKindfkLookup	FieldNameDrawingTypeLookupDataSettaDrawingTypeLookupKeyFieldsDrawingTypeIDLookupResultFieldDrawingTypeDescr	KeyFieldsDrawingTypeIDLookup	  TDateTimeFieldtaDrawingDetailCheckedOutDate	FieldNameCheckedOutDateEditMask!99/99/00;1;_  TDateTimeFieldtaDrawingDetailReturnedDate	FieldNameReturnedDateEditMask!99/99/00;1;_  TStringFieldtaDrawingDetailUserId	FieldNameUserIdSized  TStringFieldtaDrawingDetailUser	FieldKindfkLookup	FieldNameUserLookupDataSettaPersonLookupKeyFieldsUserIdLookupResultFieldLastName	KeyFieldsUserIdLookup	  TIntegerFieldtaDrawingDetailRecipientID	FieldNameRecipientID  TDateTimeFieldtaDrawingDetailCreatedOn	FieldName	CreatedOn  TStringFieldtaDrawingDetailRecipientLast	FieldKindfkLookup	FieldNameRecipientLastLookupDataSettaRecipientLookupKeyFieldsRecipientIDLookupResultFieldRecipientLastname	KeyFieldsRecipientIDLookup	  TStringFieldtaDrawingDetailImageLocation	FieldNameImageLocationSize�   TBooleanFieldtaDrawingDetailCAD	FieldNameCAD  TStringFieldtaDrawingDetailComments	FieldNameCommentsSize�   TStringFieldtaDrawingDetailDrawer	FieldNameDrawerRequired	Size
  TStringFieldtaDrawingDetailDesigner	FieldNameDesignerSize2  TIntegerFieldtaDrawingDetailHospitalID	FieldName
HospitalID  TStringField$taDrawingDetailFacilityProjectNumber	FieldNameFacilityProjectNumberSize2   TDataSourcedsDrawingDetailDataSettaDrawingDetailLeft� TopP  TTabletaPersonActive	DatabaseNamedbDrawingLoc	FieldDefsNameUserIdDataTypeftStringSized NameLastNameDataTypeftStringSize( Name	FirstNameDataTypeftStringSize( NamePhoneNumberDataTypeftStringSize NamePassDataTypeftStringSize NameAdministrator
Attributes
faRequired DataType	ftBoolean Name	CompanyIDDataType	ftInteger Name
HospitalIDDataType	ftInteger NameCheckForHospital
Attributes
faRequired DataType	ftBoolean  	IndexDefsNametaPersonIndex1FieldsUserIdOptions	ixPrimaryixUnique   	StoreDefs		TableNamePersonLeft0Top TStringFieldtaPersonUserId	FieldNameUserIdSized  TStringFieldtaPersonLastName	FieldNameLastNameSize(  TStringFieldtaPersonFirstName	FieldName	FirstNameSize(  TStringFieldtaPersonPhoneNumber	FieldNamePhoneNumberEditMask!\(999\)000-0000;1;_Size  TBooleanFieldtaPersonAdministrator	FieldNameAdministratorRequired	DisplayValuesYes;No  TIntegerFieldtaPersonCompanyID	FieldName	CompanyID  TStringFieldtaPersonCompanyName	FieldKindfkLookup	FieldNameCompanyNameLookupDataSet	taCompanyLookupKeyFields
CompanyrIDLookupResultFieldCompanyName	KeyFields	CompanyIDLookup	  TStringFieldtaPersonPass	FieldNamePassSize  TIntegerFieldtaPersonHospitalID	FieldName
HospitalID  TStringFieldtaPersonHospital	FieldKindfkLookup	FieldNameHospitalLookupDataSet
taHospitalLookupKeyFields
HospitalIDLookupResultFieldHospitalName	KeyFields
HospitalIDLookup	  TBooleanFieldtaPersonCheckForHospital	FieldNameCheckForHospital   TDataSourcedsPersonDataSettaPersonLeftxTop�   TQueryqryLogonDatabaseNamedbDrawingLoc
DataSourcedsPersonLeftTop  TQueryqryHospitalDatabaseNamedbDrawingLocLeft� TopP  TQuery
qryProjectDatabaseNamedbDrawingLocLeft0TopP  TQueryqryBuildingDatabaseNamedbDrawingLocLeftxTopP  TQueryqryPlanTypeDatabaseNamedbDrawingLocLeft�TopP  TQueryqryCheckInOutCachedUpdates	AutoRefresh	DatabaseNamedbDrawingLocLeft Top�  TDataSourcedsCheckInOutDataSetqryCheckInOutLeft� Top�   TTable	taCompanyActive	DatabaseNamedbDrawingLoc	FieldDefsName
CompanyrIDDataType	ftAutoInc NameCompanyNameDataTypeftStringSized NameContactFirstNameDataTypeftStringSize< NameContactLastNameDataTypeftStringSized NameCompanyOrDepartmentDataTypeftStringSized NameCityDataTypeftStringSized NameStateOrProvinceDataTypeftStringSize( Name
PostalCodeDataTypeftStringSize( NameCountryDataTypeftStringSized NameContactTitleDataTypeftStringSized NamePhoneNumberDataTypeftStringSize< Name	ExtensionDataTypeftStringSize< Name	FaxNumberDataTypeftStringSize< NameEmailAddressDataTypeftStringSized NameNotesDataTypeftMemoSize  	IndexDefsNametaCompanyIndex1Fields
CompanyrIDOptions	ixPrimaryixUnique   	StoreDefs		TableNameCompanyLeft�Top( TAutoIncFieldtaCompanyCompanyrIDDisplayLabelCompanyr ID	FieldName
CompanyrID  TStringFieldtaCompanyCompanyNameDisplayLabelCompany Name	FieldNameCompanyNameSized  TStringFieldtaCompanyContactFirstNameDisplayLabelContact First Name	FieldNameContactFirstNameSize<  TStringFieldtaCompanyContactLastNameDisplayLabelContact Last Name	FieldNameContactLastNameSized  TStringFieldtaCompanyContactTitleDisplayLabelContact Title	FieldNameContactTitleSized  TStringFieldtaCompanyCompanyOrDepartmentDisplayLabel
Department	FieldNameCompanyOrDepartmentSized  TStringFieldtaCompanyCity	FieldNameCitySized  TStringFieldtaCompanyStateOrProvinceDisplayLabelState / Province	FieldNameStateOrProvinceSize(  TStringFieldtaCompanyPostalCodeDisplayLabelPostal Code	FieldName
PostalCodeEditMask00000\-9999;1;_Size(  TStringFieldtaCompanyCountryDefaultExpression'U.S.A.'	FieldNameCountrySized  TStringFieldtaCompanyPhoneNumberDisplayLabelPhone Number	FieldNamePhoneNumberEditMask!\(999\)000-0000;1;_Size<  TStringFieldtaCompanyExtension	FieldName	ExtensionEditMask
!99999;1;_Size<  TStringFieldtaCompanyFaxNumberDisplayLabel
Fax Number	FieldName	FaxNumberEditMask!\(999\)000-0000;1;_Size<  TStringFieldtaCompanyEmailAddressDisplayLabelEmail Address	FieldNameEmailAddressSized  
TMemoFieldtaCompanyNotes	FieldNameNotesBlobTypeftMemoSize   TDataSource	dsCompanyDataSet	taCompanyLeft�Top�   TTabletaRecipientActive	DatabaseNamedbDrawingLoc	FieldDefsNameRecipientIDDataType	ftAutoInc NameRecipientLastnameDataTypeftStringSized NameRecipientFirstNameDataTypeftStringSized NameRecipientPhoneDataTypeftStringSize( Name	CompanyIDDataType	ftInteger  	IndexDefsNameRecipient#PXFieldsRecipientIDOptionsixUnique  Name	CompanyIDFields	CompanyID  IndexFieldNames	CompanyIDMasterFields
CompanyrIDMasterSource	dsCompany	StoreDefs		TableName	RecipientLeft�TopP TAutoIncFieldtaRecipientRecipientID	FieldNameRecipientID  TStringFieldtaRecipientRecipientLastnameDisplayLabel	Last Name	FieldNameRecipientLastnameSized  TStringFieldtaRecipientRecipientFirstNameDisplayLabel
First Name	FieldNameRecipientFirstNameSized  TStringFieldtaRecipientRecipientPhoneDisplayLabelPhoneDisplayWidth<	FieldNameRecipientPhoneEditMask!\(999\)000-0000;1;_Size(  TIntegerFieldtaRecipientCompanyID	FieldName	CompanyID   TDataSourcedsRecipientDataSettaRecipientLeftTop  TQueryqryUpdCheckInOutDatabaseNamedbDrawingLoc
DataSourcedsDrawingDetailLeft0Top�  TQueryqryRecipientDatabaseNamedbDrawingLocSQL.Strings  Left� Top�  	TDatabasedbDrawingLoc	AliasNameDrawingLocator	Connected	DatabaseNamedbDrawingLocLoginPromptParams.StringsDATABASE NAME=
USER NAME=ODBC DSN=DrawingLocatorOPEN MODE=READ/WRITESCHEMA CACHE SIZE=8SQLQRYMODE=LANGDRIVER="SQLPASSTHRU MODE=SHARED AUTOCOMMITSCHEMA CACHE TIME=-1MAX ROWS=-1BATCH COUNT=200ENABLE SCHEMA CACHE=FALSESCHEMA CACHE DIR=ENABLE BCD=FALSEROWSET SIZE=20BLOBS TO CACHE=64PASSWORD=xnbcnv01 SessionNameDefaultLeft(Top  TQuery
qryPassChgDatabaseNamedbDrawingLoc
DataSourcedsPersonLeft`Top  TQuery
qryCompanyDatabaseNamedbDrawingLoc
DataSource	dsCompanyLeftTop�  TQueryqryDrawingTypeDatabaseNamedbDrawingLoc
DataSourcedsDrawingTypeLeftxTop�  TQueryqryGetImageDatabaseNamedbDrawingLoc
DataSourcedsDrawingDetailLeft�Top�   