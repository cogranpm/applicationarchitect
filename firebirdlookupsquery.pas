unit firebirdlookupsquery;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, IBConnection, FileUtil;

type

  { TFirebirdLookups }

  TFirebirdLookups = class(TDataModule)
    dsListDetailLookup: TDataSource;
    dsListHeaderLookup: TDataSource;
    dsBuildScriptLookup: TDataSource;
    dsGetCategoryByMasterPropertyID: TDataSource;
    dsPropertyGroupLookup: TDataSource;
    dsPropertyTypeLookup: TDataSource;
    dsMasterCategoryLookup: TDataSource;
    dsAttributeTypes: TDataSource;
    dsRelationsLookup: TDataSource;
    dsAssociationTypes: TDataSource;
    SQLAttributeTypes: TSQLQuery;
    SQLAttributeTypesCODE: TLongintField;
    SQLAttributeTypesLABEL: TStringField;
    SQLAssociationTypes: TSQLQuery;
    SQLBuildByModelLookup: TSQLQuery;
    SQLGetAssociationsByOwner: TSQLQuery;
    SQLGetCategoryByMasterPropertyID: TSQLQuery;
    SQLGetImportSystemCode: TSQLQuery;
    SQLGetMappingValueBySystemCode: TSQLQuery;
    SQLListDetailByID: TSQLQuery;
    SQLMasterCategoryLookup: TSQLQuery;
    SQLMasterProperties: TSQLQuery;
    SQLGetUnsavedArtifactsByScreenFamily: TSQLQuery;
    SQLGetUnsavedArtifactsByScreenChild: TSQLQuery;
    SQLModelLookup: TSQLQuery;
    SQLModelLookupMODELID: TLargeintField;
    SQLModelLookupNAME: TStringField;
    SQLPropertyGroupLookup: TSQLQuery;
    SQLPropertyTypeLookup: TSQLQuery;
    SQLBuildScriptLookup: TSQLQuery;
    SQLListHeaderLookup: TSQLQuery;
    SQLListDetailLookup: TSQLQuery;
    SQLRelationLookup: TSQLQuery;
  private
    { private declarations }
    FDatabase:TIBConnection;
    FTransaction:TSQLTransaction;
  public
    { public declarations }
    property Database: TIBConnection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
  end;

var
  FirebirdLookups: TFirebirdLookups;

implementation

{$R *.lfm}

end.

