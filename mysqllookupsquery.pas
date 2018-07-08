unit mysqllookupsquery;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, mysql55conn, FileUtil;

type

  { TMySqlLookups }

  TMySqlLookups = class(TDataModule)
    dsBuildScriptLookup: TDataSource;
    dsGetMasterCategoryByMasterPropertyID: TDataSource;
    dsListDetailLookup: TDataSource;
    dsListHeaderLookup: TDataSource;
    dsPropertyGroupLookup: TDataSource;
    dsPropertyTypeLookup: TDataSource;
    dsMasterCategoryLookup: TDataSource;
    dsAttributeTypes: TDataSource;
    dsAssociationTypes: TDataSource;
    dsRelationsLookup: TDataSource;
    SQLBuildScriptLookup: TSQLQuery;
    SQLGetCategoryByMasterPropertyID: TSQLQuery;
    SQLListDetailLookup: TSQLQuery;
    SQLListHeaderLookup: TSQLQuery;
    SQLListHeaderLookupListHeaderID: TLargeintField;
    SQLListHeaderLookupName: TStringField;
    SQLMasterCategoryLookup: TSQLQuery;
    SQLPropertyGroupLookup: TSQLQuery;
    SQLPropertyTypeLookup: TSQLQuery;
    SQLModelLookup: TSQLQuery;
    SQLBuildByModelLookup: TSQLQuery;
    SQLListDetailByID: TSQLQuery;
    SQLGetImportSystemCode: TSQLQuery;
    SQLGetMappingValueBySystemCode: TSQLQuery;
    SQLScreenArtifactPropertyValue: TSQLQuery;
    SQLScreenArtifactPropertyValueARTIFACTPROPERTYVALUEID: TLargeintField;
    SQLScreenArtifactPropertyValueARTIFACTPROPVALUETOPROPERTY: TLargeintField;
    SQLScreenArtifactPropertyValueARTIFACTTOPROPERTYVALUE: TLargeintField;
    SQLScreenArtifactPropertyValueCREATEDBY: TStringField;
    SQLScreenArtifactPropertyValueCREATEDON: TDateTimeField;
    SQLScreenArtifactPropertyValuePROPERTYVALUE: TStringField;
    SQLScreenArtifactPropertyValueUPDATEDBY: TStringField;
    SQLScreenArtifactPropertyValueUPDATEDON: TDateTimeField;
    SQLScreenArtifactPropertyValueVERSION: TDateTimeField;
    SQLScreenChildPropertyValue: TSQLQuery;
    SQLScreenChildPropertyValueCHILDTOSCREENPROPVALUE: TLargeintField;
    SQLScreenChildPropertyValueCREATEDBY: TStringField;
    SQLScreenChildPropertyValueCREATEDON: TDateTimeField;
    SQLScreenChildPropertyValueFAMILYTOSCREENPROPVALUE: TLargeintField;
    SQLScreenChildPropertyValuePROPERTYVALUE: TStringField;
    SQLScreenChildPropertyValueSCREENPROPERTYVALUEID: TLargeintField;
    SQLScreenChildPropertyValueSCREENPROPVALUETOPROPERTY: TLargeintField;
    SQLScreenChildPropertyValueUPDATEDBY: TStringField;
    SQLScreenChildPropertyValueUPDATEDON: TDateTimeField;
    SQLScreenChildPropertyValueVERSION: TDateTimeField;
    SQLScreenFamilyPropertyValue: TSQLQuery;
    SQLScreenFamilyPropertyValueCHILDTOSCREENPROPVALUE: TLargeintField;
    SQLScreenFamilyPropertyValueCREATEDBY: TStringField;
    SQLScreenFamilyPropertyValueCREATEDON: TDateTimeField;
    SQLScreenFamilyPropertyValueFAMILYTOSCREENPROPVALUE: TLargeintField;
    SQLScreenFamilyPropertyValuePROPERTYVALUE: TStringField;
    SQLScreenFamilyPropertyValueSCREENPROPERTYVALUEID: TLargeintField;
    SQLScreenFamilyPropertyValueSCREENPROPVALUETOPROPERTY: TLargeintField;
    SQLScreenFamilyPropertyValueUPDATEDBY: TStringField;
    SQLScreenFamilyPropertyValueUPDATEDON: TDateTimeField;
    SQLScreenFamilyPropertyValueVERSION: TDateTimeField;
    SQLMasterProperties: TSQLQuery;
    SQLAttributeTypes: TSQLQuery;
    SQLAssociationTypes: TSQLQuery;
    SQLGetAssociationsByOwner: TSQLQuery;
    SQLRelationLookup: TSQLQuery;
  private
    { private declarations }
    FDatabase:TMySQL55Connection;
    FTransaction:TSQLTransaction;
  public
    { public declarations }
    property Database: TMySQL55Connection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
  end;

var
  MySqlLookups: TMySqlLookups;

implementation

{$R *.lfm}

end.

