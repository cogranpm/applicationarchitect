unit MySQLDataProvider;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, appinterfacesunit, MySQLDataModule, MySQLQueryModule, MySqlBuildQueryModule, mysqllookupsquery, mysqlimportquery,
  AppSettingsUnit, AssociationTree, CommonDataProvider;

type
  TMySQLDataProvider = class(TInterfacedObject, IDataProvider)
  private
    FMySql : TMySQLDataModule;
    FMySqlQuery : TMySQLQueryModule;
    FMySqlBuildQuery: TMySqlBuildQuery;
    FMySqlQueryLookups: TMySqlLookups;
    FMySqlImportQuery: TMYSQLImportQuery;

    FCommonProvider:TCommonDataProvider;

    {events }
    FRelationAfterScrollEvent:TRelationAfterScroll;
    FScreenFamilyAfterScrollEvent:TScreenFamilyAfterScroll;
    FMasterPropertyAfterScrollEvent: TMasterPropertyAfterScroll;
    FMasterPropertyAfterPostEvent: TMasterPropertyAfterPost;

  public
    constructor Create();
    destructor Destroy(); override;
    procedure Connect(PName : String; PUser : String; PPassword: String);
    procedure Connect(PHost:String; PPort:Integer; PName : String; PUser: String; PPassword: String);

    {model entity}
    function GetModels() : TSQLQuery;
    procedure AppendModel(PName:String);
    procedure DeleteModel(PModelId : LongInt);
    function GetLoadModel(): TSQLQuery;
    function GetModelsDataSource(): TDataSource;

    {relation entity}
    function GetRelations(): TSQLQuery;
    function GetChildAssociations(): TSQLQuery;
    function GetParentAssociations(): TSQLQuery;
    function GetLoadRelation(): TSQLQuery;
    function GetRelationsByModel(): TSQLQuery;
    function GetRelationsDataSource(): TDataSource;
    property OnRelationAfterScroll: TRelationAfterScroll read FRelationAfterScrollEvent write FRelationAfterScrollEvent;
    function GetNameByRelationId(RelationId : LongInt) : string;
    function GetRelationPropertyValue(): TSQLQuery;
    function GetRelationPropertyValueDataSource(): TDataSource;


    {attribute entity}
    function GetAttributes(): TSQLQuery;
    function GetAttributesDataSource(): TDataSource;
    function GetAttributeTypesDataSource(): TDataSource;
    function GetAttributePropertyValue(): TSQLQuery;
    function GetAttributePropertyValueDataSource(): TDataSource;


    {build entity}
    function GetLoadBuild(): TSQLQuery;
    function GetBuilds(): TSQLQuery;
    function GetBuildsDataSource(): TDataSource;
    function GetBuildPropertyValue(): TSQLQuery;
    function GetBuildPropertyValueDataSource(): TDataSource;


    { associations entity }
    function GetAssociations(): TSQLQuery;
    function GetAssociationsDataSource(): TDataSource;
    function GetRelationsLookup(): TSQLQuery;
    function GetAssociationTypeLookupDataSource(): TDataSource;
    function GetRelationsLookupDataSource(): TDataSource;
    function GetAssociationsByOwner(): TSQLQuery;
    function GetAssociationPropertyValue(): TSQLQuery;
    function GetAssociationPropertyValueDataSource(): TDataSource;


    { forms entity }
    function GetScreenFamilies(): TSQLQuery;
    function GetScreenFamiliesDataSource(): TDataSource;
    property OnScreenFamilyAfterScroll: TScreenFamilyAfterScroll read FScreenFamilyAfterScrollEvent write FScreenFamilyAfterScrollEvent;
    function GetScreenPropertyValue(): TSQLQuery;
    function GetScreenChildPropertyValue(): TSQLQuery;
    function GetArtifactPropertyValue(): TSQLQuery;

    { screen children }
    function InsertScreenChild(PTreeData : TAssociationTree; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
    procedure RefreshFamilyArtifacts(PScreenFamilyId : LongInt);
    procedure GetArtifactsByScreenFamily(PScreenFamilyId : LongInt; var list:TList);
    procedure GetArtifactsByScreenChild(PScreenChildId : LongInt; var list:TList);
    procedure GetListOfMasterPropertyLookups(PMasterPropertyId: LongInt; var list: TStringList);

    {master properties}
    function GetMasterPropertiesLookup(): TSQLQuery;
    function GetPropertyType() : TSQLQuery;
    function GetPropertytypeDataSource(): TDataSource;

    function GetListHeader() : TSQLQuery;
    function GetListDetail() : TSQLQuery;
    function GetListHeaderDataSource(): TDataSource;
    function GetListDetailDataSource(): TDataSource;

    function GetListHeaderLookup() : TSQLQuery;
    function GetListDetailLookup() : TSQLQuery;
    function GetListHeaderLookupDataSource(): TDataSource;
    function GetListDetailLookupDataSource(): TDataSource;
    function GetListDetailByID(): TSQLQuery;

    function GetPropertyGroup() : TSQLQuery;
    function GetPropertyGroupDataSource(): TDataSource;
    function GetMasterCategory() : TSQLQuery;
    function GetMasterCategoryDataSource(): TDataSource;
    function GetMasterProperty() : TSQLQuery;
    function GetMasterPropertyDataSource(): TDataSource;
    function GetMasterPropertyValueList() : TSQLQuery;
    function GetMasterPropertyValueListDataSource(): TDataSource;
    function GetMasterPropertyToCategory(): TSQLQuery;
    function GetPropertyTypeLookupDataSource(): TDataSource;
    function GetPropertyGroupLookupDataSource(): TDataSource;
    function GetMasterCategoryLookupDataSource(): TDataSource;
    function GetMasterCategoryByMasterPropertyIDDataSource(): TDataSource;

    function GetOnMasterPropertyAfterScroll():TMasterPropertyAfterScroll;
    procedure SetOnMasterPropertyAfterScroll(PEvent:TMasterPropertyAfterScroll);

    function GetOnMasterPropertyAfterPost():TMasterPropertyAfterPost;
    procedure SetOnMasterPropertyAfterPost(PEvent:TMasterPropertyAfterPost);

    property OnMasterPropertyAfterScroll: TMasterPropertyAfterScroll read GetOnMasterPropertyAfterScroll write SetOnMasterPropertyAfterScroll;
    property OnMasterPropertyAfterPost: TMasterPropertyAfterPost read GetOnMasterPropertyAfterScroll write SetOnMasterPropertyAfterPost;

    {scripting }
    function GetBuildTemplate() : TSQLQuery;
    function GetBuildScript() : TSQLQuery;
    function GetBuildController() : TSQLQuery;
    function GetBuildTemplateDataSource() : TDataSource;
    function GetBuildScriptDataSource() : TDataSource;
    function GetBuildControllerDataSource() : TDataSource;
    function GetBuildTemplateByName() : TSQLQuery;
    function GetBuildScriptsForController():TSQLQuery;
    function GetBuildScriptByID():TSQLQuery;
    function GetBuildByModelLookup():TSQLQuery;
    function GetModellookup():TSQLQuery;
    function GetLoadAttribute():TSQLQuery;
    function GetBuildScriptLookup():TSQLQuery;
    function GetBuildScriptLookupDatasource():TDataSource;
    function GetBuildControllerScript(): TSQLQuery;
    function GetBuildControllerScriptDataSource(): TDataSource;
    function GetBuildScriptParameter(): TSQLQuery;
    function GetBuildScriptParameterDataSource(): TDataSource;
    function GetBuildScriptParameters():TSQLQuery;


    {imports}
    function GetConnection() : TSQLQuery;
    function GetConnectionDataSource(): TDataSource;

    {mapping}
    function GetMapping() : TSQLQuery;
    function GetMappingDataSource(): TDataSource;
    function GetMappingValue() : TSQLQuery;
    function GetMappingValueDataSource(): TDataSource;
    function GetImportMappingSystemCode(PDatabaseType:databaseType):String;
    function GetMappingDataSetBySystemCode(PSystemCode:String):TDataSet;

private
  procedure CreateDatabaseObjects();
  procedure RelationAfterScroll(DataSet:TDataSet);
  function GetOnRelationAfterScroll():TRelationAfterScroll;
  procedure SetOnRelationAfterScroll(PRelationAfterScroll:TRelationAfterScroll);

  procedure ScreenFamilyAfterScroll(DataSet:TDataSet);
  function GetOnScreenFamilyAfterScroll():TScreenFamilyAfterScroll;
  procedure SetOnScreenFamilyAfterScroll(PScreenFamilyAfterScroll:TScreenFamilyAfterScroll);

  { Screen Children }
  function GetExistingScreenChildId(PAssociationId : LongInt; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
  function CreateNewScreenChildRecord(PTreeData : TAssociationTree; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
  procedure RefreshScreenChildArtifacts(PScreenChildId : LongInt);

  {master properties}
  procedure MasterPropertyAfterScroll(DataSet:TDataSet);

  procedure MasterPropertyAfterPost(DataSet:TDataSet);


  end;

implementation

constructor TMySQLDataProvider.Create();
begin
  inherited.Create();
  FCommonProvider:=TCommonDataProvider.Create;
end;

destructor TMySQLDataProvider.Destroy();
begin
  if Assigned(FMySql) then
  begin
    if Assigned(FMySql.Connection) then
    begin
      FMySql.Connection.Close(true);
      FMySql.Connection.Free;
    end;
    FMySql.Free;
  end;

  if Assigned(FMySqlQuery) then
  begin
    FMySql.Free;
  end;

  if Assigned(FMySqlBuildQuery) then
  begin
    FMySqlBuildQuery.Free;
  end;

  if Assigned(FMySqlQueryLookups) then
  begin
    FMySqlQueryLookups.Free;
  end;

  if Assigned(FMySqlImportQuery) then
  begin
    FMySqlImportQuery.Free;
  end;

  inherited;
end;

procedure TMySQLDataProvider.Connect(PName : String; PUser : String; PPassword: String);
begin
    Raise Exception.Create('Wrong Connect method called, Host and Port not passed.');
end;

procedure TMySQLDataProvider.Connect(PHost:String; PPort:Integer; PName : String; PUser: String; PPassword: String);
begin
   FMySql:= TMySQLDataModule.Create(Nil);
   FMySql.Connection.HostName:=PHost;
   FMySql.Connection.DatabaseName:=PName;
   FMySql.Connection.Port:=PPort;
   FMySql.Connection.UserName:=PUser;
   FMySql.Connection.Password:=PPassword;
   try
      FMySql.Connection.Connected:=True;
   Except
    On E: Exception do Raise ;
   end;
   FMySql.Transaction.Active:=True;
   self.CreateDatabaseObjects();

   FMySqlQuery:=TMySQLQueryModule.Create(Nil);
   FMySqlQuery.Database:=FMySql.Connection;
   FMySqlQuery.Transaction:=FMySql.Transaction;

   FMySqlBuildQuery:=TMySqlBuildQuery.Create(Nil);
   FMySqlBuildQuery.Database:=FMySql.Connection;
   FMySqlBuildQuery.Transaction:=FMySql.Transaction;

   FMySqlQueryLookups:=TMySqlLookups.Create(Nil);
   FMySqlQueryLookups.Database:=FMySql.Connection;
   FMySqlQueryLookups.Transaction:=FMySql.Transaction;

   FMySqlImportQuery:=TMYSQLImportQuery.Create(Nil);
   FMySqlImportQuery.Database:=FMySql.Connection;
   FMySqlImportQuery.Transaction:=FMySql.Transaction;

   FMySqlQuery.SQLRelation.AfterScroll:=@RelationAfterScroll;
   FMySqlQuery.SQLScreenFamily.AfterScroll:=@ScreenFamilyAfterScroll;
   FMySqlQuery.SQLMasterProperty.AfterScroll:=@MasterPropertyAfterScroll;
   FMySqlQuery.SQLMasterProperty.AfterPost:=@MasterPropertyAfterPost;


end;

function TMySQLDataProvider.GetModels() : TSQLQuery;
begin
     GetModels:=FMySqlQuery.SQLModel;
end;

procedure TMySQLDataProvider.AppendModel(PName:String);
begin
  FMySqlQuery.SQLModel.Active:=True;
  FMySqlQuery.SQLModel.Append;
  FMySqlQuery.SQLModel.FieldByName('NAME').AsString:=PName;
  FMySqlQuery.SQLModel.Post;
end;

procedure TMySQLDataProvider.DeleteModel(PModelId : LongInt);
begin
  FMySqlQuery.SQLModel.Active:=True;
  FMySqlQuery.SQLModel.Locate('MODELID', PModelId, [loCaseInsensitive] );
  FMySqlQuery.SQLModel.Delete;
end;

function TMySQLDataProvider.GetLoadModel(): TSQLQuery;
begin
     GetLoadModel:=FMySqlBuildQuery.SQLLoadModel;
end;

function TMySQLDataProvider.GetModelsDataSource(): TDataSource;
begin
     GetModelsDataSource:=FMySqlQuery.dsModel;
end;

function TMySQLDataProvider.GetRelations(): TSQLQuery;
begin
   GetRelations:=FMySqlQuery.SQLRelation;
end;

function TMySQLDataProvider.GetLoadRelation(): TSQLQuery;
begin
   GetLoadRelation:=FMySqlBuildQuery.SQLLoadRelation;
end;

function TMySQLDataProvider.GetNameByRelationId(RelationId : LongInt) : string;
var
   relationNameQuery : TSQLQuery;
begin
  relationNameQuery := TSQLQuery.Create(Nil);
  relationNameQuery.DataBase := self.FMySql.Connection;
  relationNameQuery.SQL.Text := 'select name from relation where relationid = :relationid;';
  relationNameQuery.ParamByName('relationid').AsLargeInt:=RelationId;
  relationNameQuery.Open;
   while not relationNameQuery.EOF do
   begin
     GetNameByRelationId := relationNameQuery.FieldByName('name').AsString;
     relationNameQuery.Next;
   end;
   relationNameQuery.Close;
   relationNameQuery.Free;

end;

function TMySQLDataProvider.GetRelationsByModel(): TSQLQuery;
begin
   GetRelationsByModel:=FMySqlBuildQuery.SQLRelationsByModel;
end;

function TMySQLDataProvider.GetRelationsDataSource(): TDataSource;
begin
  GetRelationsDataSource:=FMySqlQuery.dsRelation;
end;

function TMySQLDataProvider.GetRelationPropertyValue() : TSQLQuery;
begin
  GetRelationPropertyValue:=FMySqlQuery.SQLRelationPropertyValue;
end;

function TMySQLDataProvider.GetRelationPropertyValueDataSource(): TDataSource;
begin
  GetRelationPropertyValueDataSource:=FMySqlQuery.dsRelationPropertyValue;
end;



procedure TMySQLDataProvider.RelationAfterScroll(DataSet:TDataSet);
begin
   if Assigned(FRelationAfterScrollEvent) then
      FRelationAfterScrollEvent(DataSet);
end;

function TMySQLDataProvider.GetOnRelationAfterScroll():TRelationAfterScroll;
begin
  GetOnRelationAfterScroll:=FRelationAfterScrollEvent;
end;

procedure TMySQLDataProvider.SetOnRelationAfterScroll(PRelationAfterScroll:TRelationAfterScroll);
begin
  FRelationAfterScrollEvent:=PRelationAfterScroll;
end;

function TMySQLDataProvider.GetChildAssociations(): TSQLQuery;
begin
    GetChildAssociations:=FMySqlBuildQuery.SQLChildAssociation;
end;

function TMySQLDataProvider.GetParentAssociations(): TSQLQuery;
begin
  GetParentAssociations:=FMySqlBuildQuery.SQLParentAssociation;
end;

function TMySQLDataProvider.GetAttributes(): TSQLQuery;
begin
  GetAttributes:=FMySqlQuery.SQLAttribute;
end;

function TMySQLDataProvider.GetAttributesDataSource(): TDataSource;
begin
  GetAttributesDataSource:=FMySqlQuery.dsAttribute;
end;

function TMySQLDataProvider.GetAttributePropertyValue() : TSQLQuery;
begin
  GetAttributePropertyValue:=FMySqlQuery.SQLAttributePropertyValue;
end;

function TMySQLDataProvider.GetAttributePropertyValueDataSource(): TDataSource;
begin
  GetAttributePropertyValueDataSource:=FMySqlQuery.dsAttributePropertyValue;
end;


function TMySQLDataProvider.GetAttributeTypesDataSource(): TDataSource;
begin
   GetAttributeTypesDataSource:=FMySqlQueryLookups.dsAttributeTypes;
end;

function TMySQLDataProvider.GetLoadBuild(): TSQLQuery;
begin
  GetLoadBuild:=FMySqlBuildQuery.SQLLoadBuild;
end;

function TMySQLDataProvider.GetBuilds(): TSQLQuery;
begin
  GetBuilds:=FMySqlQuery.SQLBuild;
end;

function TMySQLDataProvider.GetBuildsDataSource(): TDataSource;
begin
   GetBuildsDataSource:=FMySqlQuery.dsBuild;
end;

function TMySQLDataProvider.GetBuildPropertyValue() : TSQLQuery;
begin
  GetBuildPropertyValue:=FMySqlQuery.SQLBuildPropertyValue;
end;

function TMySQLDataProvider.GetBuildPropertyValueDataSource(): TDataSource;
begin
  GetBuildPropertyValueDataSource:=FMySqlQuery.dsBuildPropertyValue;
end;


function TMySQLDataProvider.GetAssociations(): TSQLQuery;
begin
     GetAssociations:=FMySqlQuery.SQLAssociation;
end;

function TMySQLDataProvider.GetAssociationsDataSource(): TDataSource;
begin
     GetAssociationsDataSource:=FMySqlQuery.dsAssociation;
end;

function TMySQLDataProvider.GetAssociationPropertyValue() : TSQLQuery;
begin
  GetAssociationPropertyValue:=FMySqlQuery.SQLAssociationPropertyValue;
end;

function TMySQLDataProvider.GetAssociationPropertyValueDataSource(): TDataSource;
begin
  GetAssociationPropertyValueDataSource:=FMySqlQuery.dsAssociationPropertyValue;
end;

function TMySQLDataProvider.GetRelationsLookup(): TSQLQuery;
begin
     GetRelationsLookup:=FMySqlQueryLookups.SQLRelationLookup;
end;

function TMySQLDataProvider.GetAssociationTypeLookupDataSource(): TDataSource;
begin
  GetAssociationTypeLookupDataSource:=FMySqlQueryLookups.dsAssociationTypes;
end;

function TMySQLDataProvider.GetRelationsLookupDataSource(): TDataSource;
begin
    GetRelationsLookupDataSource:=FMySqlQueryLookups.dsRelationsLookup;
end;

function TMySQLDataProvider.GetAssociationsByOwner(): TSQLQuery;
begin
   GetAssociationsByOwner:=FMySqlQueryLookups.SQLGetAssociationsByOwner;
end;

{master properties}
function TMySQLDataProvider.GetMasterPropertiesLookup(): TSQLQuery;
begin
    GetMasterPropertiesLookup:=FMySqlQueryLookups.SQLMasterProperties;

end;

function TMySQLDataProvider.GetPropertyType() : TSQLQuery;
begin
   GetPropertyType:=FMySqlQuery.SQLPropertyType;
end;

function TMySQLDataProvider.GetPropertytypeDataSource(): TDataSource;
begin
   GetPropertytypeDataSource:=FMySqlQuery.dsPropertyType;
end;

function TMySQLDataProvider.GetListHeader() : TSQLQuery;
begin
     GetListHeader:=FMySqlQuery.SQLListHeader;
end;

function TMySQLDataProvider.GetListDetail() : TSQLQuery;
begin
    GetListDetail:=FMySqlQuery.SQLListDetail;
end;

function TMySQLDataProvider.GetListHeaderDataSource(): TDataSource;
begin
     GetListHeaderDataSource:=FMySqlQuery.dsListHeader;
end;

function TMySQLDataProvider.GetListDetailDataSource(): TDataSource;
begin
   GetListDetailDataSource:=FMySqlQuery.dsListDetail;
end;

function TMySQLDataProvider.GetListHeaderLookup() : TSQLQuery;
begin
  Result:=FMySqlQueryLookups.SQLListHeaderLookup;
end;

function TMySQLDataProvider.GetListDetailLookup() : TSQLQuery;
begin
     Result:=FMySqlQueryLookups.SQLListDetailLookup;
end;

function TMySQLDataProvider.GetListHeaderLookupDataSource(): TDataSource;
begin
     Result:=FMySqlQueryLookups.dsListHeaderLookup;
end;

function TMySQLDataProvider.GetListDetailLookupDataSource(): TDataSource;
begin
     Result:=FMySqlQueryLookups.dsListDetailLookup;
end;

function TMySQLDataProvider.GetListDetailByID(): TSQLQuery;
begin
     Result:=FMySqlQueryLookups.SQLListDetailByID;
end;

function TMySQLDataProvider.GetPropertyGroup() : TSQLQuery;
begin
    GetPropertyGroup:=FMySqlQuery.SQLPropertyGroup;
end;

function TMySQLDataProvider.GetPropertyGroupDataSource(): TDataSource;
begin
   GetPropertyGroupDataSource:=FMySqlQuery.dsPropertyGroup;
end;

function TMySQLDataProvider.GetMasterCategory() : TSQLQuery;
begin
  GetMasterCategory:=FMySqlQuery.SQLMasterCategory;
end;

function TMySQLDataProvider.GetMasterCategoryDataSource(): TDataSource;
begin
   GetMasterCategoryDataSource:=FMySqlQuery.dsMasterCategory;
end;

function TMySQLDataProvider.GetMasterProperty() : TSQLQuery;
begin
   GetMasterProperty:=FMySqlQuery.SQLMasterProperty;
end;

function TMySQLDataProvider.GetMasterPropertyDataSource(): TDataSource;
begin
   GetMasterPropertyDataSource:=FMySqlQuery.dsMasterProperty;
end;

function TMySQLDataProvider.GetMasterPropertyValueList() : TSQLQuery;
begin
   GetMasterPropertyValueList:=FMySqlQuery.SQLMasterPropertyValueList;
end;

function TMySQLDataProvider.GetMasterPropertyValueListDataSource(): TDataSource;
begin
   GetMasterPropertyValueListDataSource:=FMySqlQuery.dsMasterPropertyValueList;
end;

function TMySQLDataProvider.GetMasterPropertyToCategory(): TSQLQuery;
begin
   GetMasterPropertyToCategory:=FMySqlQuery.SQLMasterPropertyToCategory;
end;

function TMySQLDataProvider.GetPropertyTypeLookupDataSource(): TDataSource;
begin
   GetPropertyTypeLookupDataSource:=self.FMySqlQueryLookups.dsPropertyTypeLookup;
end;

function TMySQLDataProvider.GetPropertyGroupLookupDataSource(): TDataSource;
begin
  GetPropertyGroupLookupDataSource:=self.FMySqlQueryLookups.dsPropertyGroupLookup;
end;

function TMySQLDataProvider.GetMasterCategoryLookupDataSource(): TDataSource;
begin
     GetMasterCategoryLookupDataSource:=self.FMySqlQueryLookups.dsMasterCategoryLookup;
end;

procedure TMySQLDataProvider.MasterPropertyAfterScroll(DataSet:TDataSet);
begin
   FMySqlQuery.SQLMasterPropertyValueList.Active:=False;
   FMySqlQuery.SQLMasterPropertyValueList.ParamByName('MasterPropertyId').AsLargeInt:=DataSet.FieldByName('MasterPropertyId').AsLargeInt;
   FMySqlQuery.SQLMasterPropertyValueList.Active:=True;

   if Assigned(FMasterPropertyAfterScrollEvent) then
     FMasterPropertyAfterScrollEvent(DataSet);
end;

function TMySQLDataProvider.GetOnMasterPropertyAfterScroll():TMasterPropertyAfterScroll;
begin
   GetOnMasterPropertyAfterScroll:=FMasterPropertyAfterScrollEvent;
end;

procedure TMySQLDataProvider.SetOnMasterPropertyAfterScroll(PEvent:TMasterPropertyAfterScroll);
begin
    FMasterPropertyAfterScrollEvent:=PEvent;
end;

procedure TMySQLDataProvider.MasterPropertyAfterPost(DataSet:TDataSet);
begin

   FMySqlQuery.SQLMasterProperty.ApplyUpdates(-1);
   FMySqlQuery.Transaction.CommitRetaining;

   if Assigned(FMasterPropertyAfterPostEvent) then
     FMasterPropertyAfterPostEvent(DataSet);
end;

function TMySQLDataProvider.GetOnMasterPropertyAfterPost():TMasterPropertyAfterPost;
begin
    GetOnMasterPropertyAfterPost:=FMasterPropertyAfterPostEvent;
end;

procedure TMySQLDataProvider.SetOnMasterPropertyAfterPost(PEvent:TMasterPropertyAfterPost);
begin
    FMasterPropertyAfterPostEvent:=PEvent;
end;


{scripting }
function TMySQLDataProvider.GetBuildTemplate() : TSQLQuery;
begin
    GetBuildTemplate:=self.FMySqlQuery.SQLBuildTemplate;
end;

function TMySQLDataProvider.GetBuildScript() : TSQLQuery;
begin
    GetBuildScript:=self.FMySqlQuery.SQLBuildScript;
end;

function TMySQLDataProvider.GetBuildController() : TSQLQuery;
begin
    GetBuildController:=self.FMySqlQuery.SQLBuildController;
end;

function TMySQLDataProvider.GetBuildTemplateDataSource() : TDataSource;
begin
  GetBuildTemplateDataSource:=self.FMySqlQuery.dsBuildTemplate;
end;

function TMySQLDataProvider.GetBuildScriptDataSource() : TDataSource;
begin
  GetBuildScriptDataSource:=self.FMySqlQuery.dsBuildScript;
end;

function TMySQLDataProvider.GetBuildControllerDataSource() : TDataSource;
begin
   GetBuildControllerDataSource:=self.FMySqlQuery.dsBuildController;
end;

function TMySQLDataProvider.GetBuildTemplateByName() : TSQLQuery;
begin
   GetBuildTemplateByName:=FMySqlBuildQuery.SQLGetBuildTemplateByName;
end;

function TMySQLDataProvider.GetBuildScriptsForController():TSQLQuery;
begin
     GetBuildScriptsForController:=FMySqlBuildQuery.SQLGetBuildScriptsForController;
end;

function TMySQLDataProvider.GetBuildByModelLookup():TSQLQuery;
begin
   GetBuildByModelLookup:=FMySqlQueryLookups.SQLBuildByModelLookup;
end;

function TMySQLDataProvider.GetModellookup():TSQLQuery;
begin
    GetModellookup:=FMySqlQueryLookups.SQLModelLookup;
end;

function TMySQLDataProvider.GetBuildScriptByID():TSQLQuery;
begin
  GetBuildScriptByID:=FMySqlBuildQuery.SQLGetBuildScriptByID;
end;

function TMySQLDataProvider.GetLoadAttribute():TSQLQuery;
begin
   GetLoadAttribute:=FMySqlBuildQuery.SQLLoadAttribute;
end;

function TMySQLDataProvider.GetBuildScriptLookup():TSQLQuery;
begin
   GetBuildScriptLookup:=FMySqlQueryLookups.SQLBuildScriptLookup;
end;

function TMySQLDataProvider.GetBuildScriptLookupDatasource():TDataSource;
begin
     GetBuildScriptLookupDatasource:=FMySqlQueryLookups.dsBuildScriptLookup;
end;

function TMySQLDataProvider.GetBuildControllerScript() : TSQLQuery;
begin
  GetBuildControllerScript:=FMySqlQuery.SQLBuildControllerScript;
end;

function TMySQLDataProvider.GetBuildControllerScriptDataSource(): TDataSource;
begin
  GetBuildControllerScriptDataSource:=FMySqlQuery.dsBuildControllerScript;
end;

function TMySQLDataProvider.GetBuildScriptParameter() : TSQLQuery;
begin
  GetBuildScriptParameter:=FMySqlQuery.SQLBuildScriptParameter;
end;

function TMySQLDataProvider.GetBuildScriptParameterDataSource(): TDataSource;
begin
  GetBuildScriptParameterDataSource:=FMySqlQuery.dsBuildScriptParameter;
end;

function TMySQLDataProvider.GetBuildScriptParameters():TSQLQuery;
begin
   GetBuildScriptParameters:=FMySqlBuildQuery.SQLGetBuildScriptParameters;
end;


{ forms entity }
function TMySQLDataProvider.GetScreenFamilies(): TSQLQuery;
begin
    GetScreenFamilies:=FMySqlQuery.SQLScreenFamily;
end;

function TMySQLDataProvider.GetScreenFamiliesDataSource(): TDataSource;
begin
     GetScreenFamiliesDataSource:=FMySqlQuery.dsScreenFamily;
end;

function TMySQLDataProvider.GetScreenPropertyValue(): TSQLQuery;
begin
     GetScreenPropertyValue:=FMySqlQuery.SQLScreenPropertyValue;
end;

function TMySQLDataProvider.GetScreenChildPropertyValue(): TSQLQuery;
begin
     GetScreenChildPropertyValue:=FMySqlQuery.SQLScreenChildPropertyValue;
end;

function TMySQLDataProvider.GetArtifactPropertyValue(): TSQLQuery;
begin
    GetArtifactPropertyValue:=FMySqlQuery.SQLArtifactPropertyValue;
end;

function TMySQLDataProvider.GetMasterCategoryByMasterPropertyIDDataSource(): TDataSource;
begin
   GetMasterCategoryByMasterPropertyIDDataSource:=FMySqlQueryLookups.dsGetMasterCategoryByMasterPropertyID;
end;

procedure TMySQLDataProvider.ScreenFamilyAfterScroll(DataSet:TDataSet);
begin
   if Assigned(FScreenFamilyAfterScrollEvent) then
      FScreenFamilyAfterScrollEvent(DataSet);
end;

function TMySQLDataProvider.GetOnScreenFamilyAfterScroll():TScreenFamilyAfterScroll;
begin
     GetOnScreenFamilyAfterScroll:=FScreenFamilyAfterScrollEvent;
end;

procedure TMySQLDataProvider.SetOnScreenFamilyAfterScroll(PScreenFamilyAfterScroll:TScreenFamilyAfterScroll);
begin
   FScreenFamilyAfterScrollEvent:=PScreenFamilyAfterScroll;
end;

{ Screen Children }
function TMySQLDataProvider.GetExistingScreenChildId(PAssociationId : LongInt; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
var
  query : TSQLQuery;
  screenChildId : LongInt;
begin
   {
    screenchild where screenfamilyid =-x and associationid = y and screenchildtoself is null limit 1
   }
   screenChildId := -1;
   query := TSQLQuery.Create(Nil);
   query.DataBase := self.FMySql.Connection;
   if PScreenFamilyId > 0 then
      begin
        query.SQL.Text := 'SELECT ifnull(screenchildid, 0) as ScreenChildId FROM ScreenChild' +
                      ' WHERE ScreenChild.SCREENFAMILYTOSCREENCHILD=:ScreenFamilyId and ' +
                      ' screenchild.SCREENCHILDTOASSOCIATION=:AssociationId and ' +
                      ' screenchild.screenchildtoself is null limit 1;';
        query.ParamByName('ScreenFamilyId').AsLargeInt:=PScreenFamilyId;
      end

   else
       begin
         query.SQL.Text := 'SELECT ifnull(screenchildid, 0) as ScreenChildId  FROM ScreenChild' +
                    ' WHERE ScreenChild.screenchildtoself=:ScreenChildId and ' +
                    ' screenchild.SCREENCHILDTOASSOCIATION=:AssociationId and ' +
                    ' screenchild.SCREENFAMILYTOSCREENCHILD is null limit 1;';
         query.ParamByName('ScreenChildId').AsLargeInt:=PScreenChildId;
       end;
   query.ParamByName('AssociationId').AsLargeInt:=PAssociationId;
   query.Open;
   while not query.EOF do
   begin
     screenChildId := query.FieldByName('ScreenChildId').AsLargeInt;
     query.Next;
   end;
   query.Close;
   query.Free;

   GetExistingScreenChildId:=screenChildId;
end;

function TMySQLDataProvider.CreateNewScreenChildRecord(PTreeData : TAssociationTree; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
var
  query : TSQLQuery;
  newId : LongInt;
begin
   newId := 0;
   try
     try
     query := TSQLQuery.Create(Nil);
     query.Transaction := self.FMySql.Transaction;
     query.DataBase := self.FMySql.Connection;
     query.SQL.Text := 'call pScreenChildInsert (:SCREENCHILDTOASSOCIATION, :SCREENFAMILYTOSCREENCHILD, :SCREENCHILDTOSELF, :NAME, :CREATEDBY)';
     query.ParamByName('SCREENCHILDTOASSOCIATION').AsLargeInt:=PTreeData.FAssociationId;
     if PScreenFamilyId > 0 then
        begin
             query.ParamByName('SCREENFAMILYTOSCREENCHILD').AsLargeInt:=PScreenFamilyId;
             query.ParamByName('SCREENCHILDTOSELF').Clear;
        end
     else
         begin
           query.ParamByName('SCREENCHILDTOSELF').AsLargeInt:=PScreenChildId;
           query.ParamByName('SCREENFAMILYTOSCREENCHILD').Clear;
         end;
      query.ParamByName('NAME').AsString:=PTreeData.FName;
      query.ParamByName('CREATEDBY').AsString:='system';
      query.Open;
      while not query.EOF do
      begin
        newId := query.FieldByName('ScreenChildId').AsLargeInt;
        query.Next;
      end;
      self.FMySql.Transaction.CommitRetaining;
     finally
            query.Close;
            query.Free;
     end;
    except
     On E: Exception do ;
   end;
   CreateNewScreenChildRecord:=newId;

end;

procedure TMySQLDataProvider.RefreshScreenChildArtifacts(PScreenChildId : LongInt);
var
  query : TSQLQuery;
begin
   {
     call stored procedure that checks if screen family entity already has all the screen artifact
     records in place, if not then add them
   }

   try
      try
        query := TSQLQuery.Create(Nil);
        query.Transaction := self.FMySql.Transaction;
        query.DataBase := self.FMySql.Connection;
        query.SQL.Text := 'call pScreenChildCreateArtifacts (:ScreenChildId, :CREATEDBY)';
        query.ParamByName('ScreenChildId').AsLargeInt:=PScreenChildId;
        query.ParamByName('CREATEDBY').AsString:='system';
        query.ExecSQL;
        self.FMySql.Transaction.CommitRetaining;
      except
            On E: Exception do ;
      end;
   finally
          query.Close;
          query.Free;
   end;

end;

function TMySQLDataProvider.InsertScreenChild(PTreeData : TAssociationTree; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
var
  screenChildId : LongInt;
begin
   {
    if screen child does not already exist / might be for parent of screenfamily or another screen child id
     call the insert stored procedure to create it and return the primary key in this function.
     Also as part of the process create all the screenartifact records based on the association entity the screen child is based on
     the attributes of the owned relation of the association makes up the screenartifact records
     }
     screenChildId:=self.GetExistingScreenChildId(PTreeData.FAssociationId, PScreenFamilyId, PScreenChildId);
     if screenChildId > 0 then

     else
       screenChildId:=self.CreateNewScreenChildRecord(PTreeData, PScreenFamilyId, PScreenChildId);

     self.RefreshScreenChildArtifacts(screenChildId);

   InsertScreenChild := screenChildId;
end;

procedure TMySQLDataProvider.RefreshFamilyArtifacts(PScreenFamilyId : LongInt);
var
  query : TSQLQuery;
begin
   {
     call stored procedure that checks if screen family entity already has all the screen artifact
     records in place, if not then add them
   }

   try
      try
        query := TSQLQuery.Create(Nil);
        query.Transaction := self.FMySql.Transaction;
        query.DataBase := self.FMySql.Connection;
        query.SQL.Text := 'call pScreenFamilyCreateArtifacts (:ScreenFamilyId, :CREATEDBY)';
        query.ParamByName('ScreenFamilyId').AsLargeInt:=PScreenFamilyId;
        query.ParamByName('CREATEDBY').AsString:='system';
        query.ExecSQL;
        self.FMySql.Transaction.CommitRetaining;
      except
            On E: Exception do ;
      end;
   finally
          query.Close;
          query.Free;
   end;
end;

procedure TMySQLDataProvider.GetArtifactsByScreenFamily(PScreenFamilyId : LongInt; var list:TList);
var
  query : TSQLQuery;
  data : TAssociationTree;
begin
       try
         try
         query := TSQLQuery.Create(Nil);
         query.Transaction := self.FMySql.Transaction;
         query.DataBase := self.FMySql.Connection;
         query.SQL.Text := 'SELECT s.SCREENARTIFACTID, s.ARTIFACTTOATTRIBUTE, s.FAMILYTOARTIFACT, a.Name FROM ScreenArtifact s ' +
         'INNER JOIN Attribute a ON a.AttributeId = s.ARTIFACTTOATTRIBUTE WHERE s.FAMILYTOARTIFACT=:ScreenFamilyId ORDER BY a.Name';
         query.ParamByName('ScreenFamilyId').AsLargeInt:=PScreenFamilyId;
         query.Open;
         while not query.EOF do
         begin
           data:=TAssociationTree.Create();
           data.FName:=query.FieldByName('Name').AsString;
           data.FScreenArtifactId:=query.FieldByName('SCREENARTIFACTID').AsLargeInt;
           list.Add(data);
           query.Next;
         end;
         finally
                query.Close;
                query.Free;
         end;
        except
         On E: Exception do ;
       end;
end;

procedure TMySQLDataProvider.GetArtifactsByScreenChild(PScreenChildId : LongInt; var list:TList);
var
  query : TSQLQuery;
  data : TAssociationTree;
begin
       try
         try
         query := TSQLQuery.Create(Nil);
         query.Transaction := self.FMySql.Transaction;
         query.DataBase := self.FMySql.Connection;
         query.SQL.Text := 'SELECT s.SCREENARTIFACTID, s.ARTIFACTTOATTRIBUTE, s.CHILDTOARTIFACT, a.Name FROM ScreenArtifact s ' +
         'INNER JOIN Attribute a ON a.AttributeId = s.ARTIFACTTOATTRIBUTE WHERE s.CHILDTOARTIFACT=:ScreenChildId ORDER BY a.Name';
         query.ParamByName('ScreenChildId').AsLargeInt:=PScreenChildId;
         query.Open;
         while not query.EOF do
         begin
           data:=TAssociationTree.Create();
           data.FName:=query.FieldByName('Name').AsString;
           data.FScreenArtifactId:=query.FieldByName('SCREENARTIFACTID').AsLargeInt;
           list.Add(data);
           query.Next;
         end;
         finally
                query.Close;
                query.Free;
         end;
        except
         On E: Exception do ;
       end;
end;

procedure TMySQLDataProvider.GetListOfMasterPropertyLookups(PMasterPropertyId: LongInt; var list: TStringList);
var
   query : TSQLQuery;
begin
   try
     try
     query := TSQLQuery.Create(Nil);
     query.Transaction := self.FMySql.Transaction;
     query.DataBase := self.FMySql.Connection;
     query.SQL.Text := 'SELECT Name, Code, Display FROM masterpropertyvaluelist WHERE MASTERPROPERYTOVALUELIST = :MasterPropertyId ';
     query.ParamByName('MasterPropertyId').AsLargeInt:=PMasterPropertyId;
     query.Open;
     while not query.EOF do
     begin
       list.Add(query.FieldByName('Name').AsString);
       query.Next;
     end;
     finally
            query.Close;
            query.Free;
     end;
    except
     On E: Exception do ;
   end;
end;

procedure TMySQLDataProvider.CreateDatabaseObjects();
begin

end;

{imports}
function TMySQLDataProvider.GetConnection() : TSQLQuery;
begin
     GetConnection:=FMySqlImportQuery.SQLConnection;
end;

function TMySQLDataProvider.GetConnectionDataSource(): TDataSource;
begin
   GetConnectionDataSource:=FMySqlImportQuery.dsConnection;
end;

function TMySQLDataProvider.GetMapping() : TSQLQuery;
begin
     Result:=FMySqlQuery.SQLMapping;
end;

function TMySQLDataProvider.GetMappingDataSource(): TDataSource;
begin
   Result:=FMySqlQuery.dsMapping;
end;

function TMySQLDataProvider.GetMappingValue() : TSQLQuery;
begin
     Result:=FMySqlQuery.SQLMappingValue;
end;

function TMySQLDataProvider.GetMappingValueDataSource(): TDataSource;
begin
   Result:=FMySqlQuery.dsMappingValue;
end;

function TMySQLDataProvider.GetImportMappingSystemCode(PDatabaseType:databaseType):String;
begin
     Result:=FCommonProvider.GetImportMappingSystemCode(PDatabaseType, self.FMySqlQueryLookups.SQLGetImportSystemCode);
end;

function TMySQLDataProvider.GetMappingDataSetBySystemCode(PSystemCode:String):TDataSet;
begin
   self.FMySqlQueryLookups.SQLGetMappingValueBySystemCode.Active:=False;
   self.FMySqlQueryLookups.SQLGetMappingValueBySystemCode.ParamByName('SystemCode').AsString:=PSystemCode;
   self.FMySqlQueryLookups.SQLGetMappingValueBySystemCode.Active:=True;
   Result:=self.FMySqlQueryLookups.SQLGetMappingValueBySystemCode;
end;

end.

