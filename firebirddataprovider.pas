unit FirebirdDataProvider;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, appinterfacesunit, firebirdDataModule, FirebirdQueryModule, FirebirdBuildQueryModule, firebirdlookupsquery, FirebirdImportQuery,
  AppSettingsUnit, AssociationTree, CommonDataProvider;

type
  TFirebirdDataProvider = class(TInterfacedObject, IDataProvider)
  private
    FFireBirdMod : TFirebirdDataModule;
    FFirebirdQueryMod : TFirebirdQueryModule;
    FFirebirdBuildQueryMod : TFirebirdBuildQuery;
    FFirebirdLookupQueryMod : TFirebirdLookups;
    FFirebirdImportQuery : TFirebirdImportQuery;

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
    function GetRelations() : TSQLQuery;
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


    {build entity }
    function GetLoadBuild(): TSQLQuery;
    function GetBuilds(): TSQLQuery;
    function GetBuildsDataSource(): TDataSource;
    function GetBuildPropertyValue(): TSQLQuery;
    function GetBuildPropertyValueDataSource(): TDataSource;

    {association entity}
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

    function GetOnMasterPropertyAfterPost():TMasterPropertyAfterPost;
    procedure SetOnMasterPropertyAfterPost(PEvent:TMasterPropertyAfterPost);

    function GetOnMasterPropertyAfterScroll():TMasterPropertyAfterScroll;
    procedure SetOnMasterPropertyAfterScroll(PEvent:TMasterPropertyAfterScroll);

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
    procedure CreateArtifacts(PQuery: TSQLQuery; PForeignKey:LongInt; PForeignKeyName: String; PForeignKeyParameterName: String);

    {master properties}
    procedure MasterPropertyAfterScroll(DataSet:TDataSet);
    procedure MasterPropertyAfterPost(DataSet:TDataSet);


  end;

implementation

constructor TFirebirdDataProvider.Create();
begin
  inherited.Create();
  FCommonProvider:=TCommonDataProvider.Create;
end;

destructor TFirebirdDataProvider.Destroy();
begin
  if Assigned(FFireBirdMod) then
  begin
    if Assigned(FFireBirdMod.IBConnection1) then
    begin
      FFireBirdMod.IBConnection1.Close(true);
      FreeAndNil(FFireBirdMod.IBConnection1);
    end;
  end;
  if Assigned(FFirebirdQueryMod) then
  begin
    FreeAndNil(FFirebirdQueryMod);
  end;

  if Assigned(FFirebirdLookupQueryMod) then
  begin
    FreeAndNil(FFirebirdLookupQueryMod)
  end;

  if Assigned(FFirebirdBuildQueryMod) then
  begin
    FreeAndNil(FFirebirdBuildQueryMod);
  end;

  if Assigned(FFirebirdImportQuery) then
  begin
    FreeAndNil(FFirebirdImportQuery);
  end;
  inherited;
end;

procedure TFirebirdDataProvider.Connect(PHost:String; PPort:Integer; PName : String; PUser: String; PPassword: String);
begin
     self.Connect(PName, PUser, PPassword);
end;

procedure TFirebirdDataProvider.Connect(PName : String; PUser : String; PPassword: String);
begin
   FFireBirdMod:=TFirebirdDataModule.Create(Nil);
   FFireBirdMod.IBConnection1.DatabaseName:=PName;
   FFireBirdMod.IBConnection1.UserName:=PUser;
   FFireBirdMod.IBConnection1.Password:=PPassword;

   //FFireBirdMod.IBConnection1.Charset := 'UTF8'; //Send and receive string data in UTF8 encoding
   //FFireBirdMod.IBConnection1.Dialect := 3; //Nobody uses 1 or 2 anymore.
   //FFireBirdMod.IBConnection1.Params.Add('PAGE_SIZE=16384');

  if FileExists(FFireBirdMod.IBConnection1.DatabaseName)=False then
    begin
        try
          FFireBirdMod.IBConnection1.CreateDB;
        except
          on E: Exception do
          begin
            Raise E;
          end;
        end;
    end;
   FFireBirdMod.IBConnection1.Connected:=True;
   FFireBirdMod.SQLTransaction1.Active:=True;
   self.CreateDatabaseObjects();

   FFirebirdQueryMod:=TFirebirdQueryModule.Create(Nil);
   FFirebirdQueryMod.Database:=FFireBirdMod.IBConnection1;
   FFirebirdQueryMod.Transaction:=FFireBirdMod.SQLTransaction1;
   FFirebirdQueryMod.SQLRelation.AfterScroll:=@RelationAfterScroll;
   FFirebirdQueryMod.SQLScreenFamily.AfterScroll:=@ScreenFamilyAfterScroll;
   FFirebirdQueryMod.SQLMasterProperty.AfterScroll:=@MasterPropertyAfterScroll;
   FFirebirdQueryMod.SQLMasterProperty.AfterPost:=@MasterPropertyAfterPost;

   FFirebirdLookupQueryMod:=TFirebirdLookups.Create(Nil);
   FFirebirdLookupQueryMod.Database:=FFireBirdMod.IBConnection1;
   FFirebirdLookupQueryMod.Transaction:=FFireBirdMod.SQLTransaction1;

   FFirebirdBuildQueryMod:=TFirebirdBuildQuery.Create(Nil);
   FFirebirdBuildQueryMod.Database:=FFireBirdMod.IBConnection1;
   FFirebirdBuildQueryMod.Transaction:=FFireBirdMod.SQLTransaction1;

   FFirebirdImportQuery:=TFirebirdImportQuery.Create(Nil);
   FFirebirdImportQuery.Database:=FFireBirdMod.IBConnection1;
   FFirebirdImportQuery.Transaction:=FFireBirdMod.SQLTransaction1;
end;

function TFirebirdDataProvider.GetModels() : TSQLQuery;
begin
  GetModels:=FFirebirdQueryMod.SQLModel;
end;

function TFirebirdDataProvider.GetModelsDataSource(): TDataSource;
begin
  GetModelsDataSource:=FFirebirdQueryMod.dsModel;
end;

procedure TFirebirdDataProvider.AppendModel(PName:String);
begin
   FFirebirdQueryMod.SQLModel.Active:=True;
   FFirebirdQueryMod.SQLModel.Append;
   FFirebirdQueryMod.SQLModel.FieldByName('NAME').AsString:=PName;
   FFirebirdQueryMod.SQLModel.Post;
end;

procedure TFirebirdDataProvider.DeleteModel(PModelId : LongInt);
begin
   FFirebirdQueryMod.SQLModel.Active:=True;
   FFirebirdQueryMod.SQLModel.Locate('MODELID', PModelId, [loCaseInsensitive] );
   FFirebirdQueryMod.SQLModel.Delete;
end;


function TFirebirdDataProvider.GetRelations() : TSQLQuery;
begin
  GetRelations:=FFirebirdQueryMod.SQLRelation;
end;

function TFirebirdDataProvider.GetRelationsDataSource(): TDataSource;
begin
  GetRelationsDataSource:=FFirebirdQueryMod.dsRelation;
end;

function TFirebirdDataProvider.GetRelationPropertyValue() : TSQLQuery;
begin
  GetRelationPropertyValue:=FFirebirdQueryMod.SQLRelationPropertyValue;
end;

function TFirebirdDataProvider.GetRelationPropertyValueDataSource(): TDataSource;
begin
  GetRelationPropertyValueDataSource:=FFirebirdQueryMod.dsRelationPropertyValue;
end;

function TFirebirdDataProvider.GetLoadRelation(): TSQLQuery;
begin
     GetLoadRelation:=FFirebirdBuildQueryMod.SQLLoadRelation;
end;

function TFirebirdDataProvider.GetNameByRelationId(RelationId : LongInt) : string;
var
   relationNameQuery : TSQLQuery;
begin
  relationNameQuery := TSQLQuery.Create(Nil);
  relationNameQuery.DataBase := self.FFireBirdMod.IBConnection1;
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

function TFirebirdDataProvider.GetRelationsByModel(): TSQLQuery;
begin
   GetRelationsByModel:=FFirebirdBuildQueryMod.SQLRelationsByModel;
end;

function TFirebirdDataProvider.GetChildAssociations(): TSQLQuery;
begin
    GetChildAssociations:=FFirebirdBuildQueryMod.SQLChildAssociation;
end;

function TFirebirdDataProvider.GetParentAssociations(): TSQLQuery;
begin
  GetParentAssociations:=FFirebirdBuildQueryMod.SQLParentAssociation;
end;

procedure TFirebirdDataProvider.RelationAfterScroll(DataSet:TDataSet);
var
    RelationId:LongInt;
begin
   RelationId:=DataSet.FieldByName('RelationId').AsLargeInt;
   if Assigned(FRelationAfterScrollEvent) then
     FRelationAfterScrollEvent(DataSet);
end;

function TFirebirdDataProvider.GetOnRelationAfterScroll():TRelationAfterScroll;
begin
   GetOnRelationAfterScroll:=FRelationAfterScrollEvent;
end;

procedure TFirebirdDataProvider.SetOnRelationAfterScroll(PRelationAfterScroll:TRelationAfterScroll);
begin
   self.FRelationAfterScrollEvent:=PRelationAfterScroll;
end;

function TFirebirdDataProvider.GetAttributes(): TSQLQuery;
begin
  GetAttributes:=FFirebirdQueryMod.SQLAttribute;
end;

function TFirebirdDataProvider.GetAttributesDataSource(): TDataSource;
begin
  GetAttributesDataSource:=FFirebirdQueryMod.dsAttribute;
end;

function TFirebirdDataProvider.GetAttributePropertyValue() : TSQLQuery;
begin
  GetAttributePropertyValue:=FFirebirdQueryMod.SQLAttributePropertyValue;
end;

function TFirebirdDataProvider.GetAttributePropertyValueDataSource(): TDataSource;
begin
  GetAttributePropertyValueDataSource:=FFirebirdQueryMod.dsAttributePropertyValue;
end;


function TFirebirdDataProvider.GetAttributeTypesDataSource(): TDataSource;
begin
   GetAttributeTypesDataSource:=FFirebirdLookupQueryMod.dsAttributeTypes;
end;

function TFirebirdDataProvider.GetLoadModel(): TSQLQuery;
begin
  GetLoadModel:=FFirebirdBuildQueryMod.SQLLoadModel;
end;

function TFirebirdDataProvider.GetLoadBuild(): TSQLQuery;
begin
  GetLoadBuild:=FFirebirdBuildQueryMod.SQLLoadBuild;
end;

function TFirebirdDataProvider.GetBuilds(): TSQLQuery;
begin
     GetBuilds:=FFirebirdQueryMod.SQLBuild;
end;

function TFirebirdDataProvider.GetBuildsDataSource(): TDataSource;
begin
     GetBuildsDataSource:=FFirebirdQueryMod.dsBuild;
end;

function TFirebirdDataProvider.GetBuildPropertyValue() : TSQLQuery;
begin
  GetBuildPropertyValue:=FFirebirdQueryMod.SQLBuildPropertyValue;
end;

function TFirebirdDataProvider.GetBuildPropertyValueDataSource(): TDataSource;
begin
  GetBuildPropertyValueDataSource:=FFirebirdQueryMod.dsBuildPropertyValue;
end;

function TFirebirdDataProvider.GetAssociations(): TSQLQuery;
begin
   GetAssociations:=FFirebirdQueryMod.SQLAssociation;
end;

function TFirebirdDataProvider.GetRelationsLookup(): TSQLQuery;
begin
     GetRelationsLookup:=FFirebirdLookupQueryMod.SQLRelationLookup;
end;

function TFirebirdDataProvider.GetAssociationsDataSource(): TDataSource;
begin
   GetAssociationsDataSource:=FFirebirdQueryMod.dsAssociation;
end;

function TFirebirdDataProvider.GetAssociationPropertyValue() : TSQLQuery;
begin
  GetAssociationPropertyValue:=FFirebirdQueryMod.SQLAssociationPropertyValue;
end;

function TFirebirdDataProvider.GetAssociationPropertyValueDataSource(): TDataSource;
begin
  GetAssociationPropertyValueDataSource:=FFirebirdQueryMod.dsAssociationPropertyValue;
end;

function TFirebirdDataProvider.GetAssociationTypeLookupDataSource(): TDataSource;
begin
  GetAssociationTypeLookupDataSource:=FFirebirdLookupQueryMod.dsAssociationTypes;
end;

function TFirebirdDataProvider.GetRelationsLookupDataSource(): TDataSource;
begin
    GetRelationsLookupDataSource:=FFirebirdLookupQueryMod.dsRelationsLookup;
end;

function TFirebirdDataProvider.GetAssociationsByOwner(): TSQLQuery;
begin
   GetAssociationsByOwner:=FFirebirdLookupQueryMod.SQLGetAssociationsByOwner;
end;

{ forms entity }
function TFirebirdDataProvider.GetScreenFamilies(): TSQLQuery;
begin
    GetScreenFamilies:=FFirebirdQueryMod.SQLScreenFamily;
end;

function TFirebirdDataProvider.GetScreenFamiliesDataSource(): TDataSource;
begin
     GetScreenFamiliesDataSource:=FFirebirdQueryMod.dsScreenFamily;
end;

procedure TFirebirdDataProvider.ScreenFamilyAfterScroll(DataSet:TDataSet);
begin
   if Assigned(FScreenFamilyAfterScrollEvent) then
      FScreenFamilyAfterScrollEvent(DataSet);
end;

function TFirebirdDataProvider.GetOnScreenFamilyAfterScroll():TScreenFamilyAfterScroll;
begin
     GetOnScreenFamilyAfterScroll:=FScreenFamilyAfterScrollEvent;
end;

procedure TFirebirdDataProvider.SetOnScreenFamilyAfterScroll(PScreenFamilyAfterScroll:TScreenFamilyAfterScroll);
begin
   FScreenFamilyAfterScrollEvent:=PScreenFamilyAfterScroll;
end;

function TFirebirdDataProvider.GetScreenPropertyValue(): TSQLQuery;
begin
     GetScreenPropertyValue:=FFirebirdQueryMod.SQLScreenPropertyValue;
end;

function TFirebirdDataProvider.GetScreenChildPropertyValue(): TSQLQuery;
begin
     GetScreenChildPropertyValue:=FFirebirdQueryMod.SQLScreenChildPropertyValue;
end;

function TFirebirdDataProvider.GetArtifactPropertyValue(): TSQLQuery;
begin
    GetArtifactPropertyValue:=FFirebirdQueryMod.SQLArtifactPropertyValue;
end;

{master properties}
function TFirebirdDataProvider.GetMasterPropertiesLookup(): TSQLQuery;
begin
    GetMasterPropertiesLookup:=FFirebirdLookupQueryMod.SQLMasterProperties;
end;

function TFirebirdDataProvider.GetPropertyType() : TSQLQuery;
begin
     GetPropertyType:=FFirebirdQueryMod.SQLPropertyType;
end;

function TFirebirdDataProvider.GetPropertytypeDataSource(): TDataSource;
begin
  GetPropertytypeDataSource:=FFirebirdQueryMod.dsPropertyType;
end;

function TFirebirdDataProvider.GetListHeader() : TSQLQuery;
begin
     GetListHeader:=FFirebirdQueryMod.SQLListHeader;
end;

function TFirebirdDataProvider.GetListDetail() : TSQLQuery;
begin
    GetListDetail:=FFirebirdQueryMod.SQLListDetail;
end;

function TFirebirdDataProvider.GetListHeaderDataSource(): TDataSource;
begin
     GetListHeaderDataSource:=FFirebirdQueryMod.dsListHeader;
end;

function TFirebirdDataProvider.GetListDetailDataSource(): TDataSource;
begin
   GetListDetailDataSource:=FFirebirdQueryMod.dsListDetail;
end;

function TFirebirdDataProvider.GetListHeaderLookup() : TSQLQuery;
begin
  Result:=FFirebirdLookupQueryMod.SQLListHeaderLookup;
end;

function TFirebirdDataProvider.GetListDetailLookup() : TSQLQuery;
begin
     Result:=FFirebirdLookupQueryMod.SQLListDetailLookup;
end;

function TFirebirdDataProvider.GetListHeaderLookupDataSource(): TDataSource;
begin
     Result:=FFirebirdLookupQueryMod.dsListHeaderLookup;
end;

function TFirebirdDataProvider.GetListDetailLookupDataSource(): TDataSource;
begin
     Result:=FFirebirdLookupQueryMod.dsListDetailLookup;
end;

function TFirebirdDataProvider.GetListDetailByID(): TSQLQuery;
begin
     Result:=FFirebirdLookupQueryMod.SQLListDetailByID;
end;

function TFirebirdDataProvider.GetPropertyGroup() : TSQLQuery;
begin
    GetPropertyGroup:=FFirebirdQueryMod.SQLPropertyGroup;
end;

function TFirebirdDataProvider.GetPropertyGroupDataSource(): TDataSource;
begin
   GetPropertyGroupDataSource:=FFirebirdQueryMod.dsPropertyGroup;
end;

function TFirebirdDataProvider.GetMasterCategory() : TSQLQuery;
begin
  GetMasterCategory:=FFirebirdQueryMod.SQLMasterCategory;
end;

function TFirebirdDataProvider.GetMasterCategoryDataSource(): TDataSource;
begin
   GetMasterCategoryDataSource:=FFirebirdQueryMod.dsMasterCategory;
end;

function TFirebirdDataProvider.GetMasterProperty() : TSQLQuery;
begin
   GetMasterProperty:=FFirebirdQueryMod.SQLMasterProperty;
end;

function TFirebirdDataProvider.GetMasterPropertyDataSource(): TDataSource;
begin
   GetMasterPropertyDataSource:=FFirebirdQueryMod.dsMasterProperty;
end;

function TFirebirdDataProvider.GetMasterPropertyValueList() : TSQLQuery;
begin
   GetMasterPropertyValueList:=FFirebirdQueryMod.SQLMasterPropertyValueList;
end;

function TFirebirdDataProvider.GetMasterPropertyValueListDataSource(): TDataSource;
begin
   GetMasterPropertyValueListDataSource:=FFirebirdQueryMod.dsMasterPropertyValueList;
end;

function TFirebirdDataProvider.GetMasterPropertyToCategory(): TSQLQuery;
begin
   GetMasterPropertyToCategory:=FFirebirdQueryMod.SQLMasterPropertyToCategory;
end;

function TFirebirdDataProvider.GetPropertyTypeLookupDataSource(): TDataSource;
begin
   GetPropertyTypeLookupDataSource:=self.FFirebirdLookupQueryMod.dsPropertyTypeLookup;
end;

function TFirebirdDataProvider.GetPropertyGroupLookupDataSource(): TDataSource;
begin
  GetPropertyGroupLookupDataSource:=self.FFirebirdLookupQueryMod.dsPropertyGroupLookup;
end;

function TFirebirdDataProvider.GetMasterCategoryLookupDataSource(): TDataSource;
begin
     GetMasterCategoryLookupDataSource:=self.FFirebirdLookupQueryMod.dsMasterCategoryLookup;
end;


function TFirebirdDataProvider.GetMasterCategoryByMasterPropertyIDDataSource(): TDataSource;
begin
   GetMasterCategoryByMasterPropertyIDDataSource:=FFirebirdLookupQueryMod.dsGetCategoryByMasterPropertyID;
end;

procedure TFirebirdDataProvider.MasterPropertyAfterScroll(DataSet:TDataSet);
begin

   FFirebirdQueryMod.SQLMasterPropertyValueList.Active:=False;
   FFirebirdQueryMod.SQLMasterPropertyValueList.ParamByName('MasterPropertyId').AsLargeInt:=DataSet.FieldByName('MasterPropertyId').AsLargeInt;
   FFirebirdQueryMod.SQLMasterPropertyValueList.Active:=True;

   if Assigned(FMasterPropertyAfterScrollEvent) then
     FMasterPropertyAfterScrollEvent(DataSet);
end;

function TFirebirdDataProvider.GetOnMasterPropertyAfterScroll():TMasterPropertyAfterScroll;
begin
   GetOnMasterPropertyAfterScroll:=FMasterPropertyAfterScrollEvent;
end;

procedure TFirebirdDataProvider.SetOnMasterPropertyAfterScroll(PEvent:TMasterPropertyAfterScroll);
begin
    FMasterPropertyAfterScrollEvent:=PEvent;
end;

procedure TFirebirdDataProvider.MasterPropertyAfterPost(DataSet:TDataSet);
begin

   FFirebirdQueryMod.SQLMasterProperty.ApplyUpdates(-1);
   FFirebirdQueryMod.Transaction.CommitRetaining;

   if Assigned(FMasterPropertyAfterPostEvent) then
     FMasterPropertyAfterPostEvent(DataSet);
end;

function TFirebirdDataProvider.GetOnMasterPropertyAfterPost():TMasterPropertyAfterPost;
begin
    GetOnMasterPropertyAfterPost:=FMasterPropertyAfterPostEvent;
end;

procedure TFirebirdDataProvider.SetOnMasterPropertyAfterPost(PEvent:TMasterPropertyAfterPost);
begin
    FMasterPropertyAfterPostEvent:=PEvent;
end;

{scripting }
function TFirebirdDataProvider.GetBuildTemplate() : TSQLQuery;
begin
    GetBuildTemplate:=self.FFirebirdQueryMod.SQLBuildTemplate;
end;

function TFirebirdDataProvider.GetBuildScript() : TSQLQuery;
begin
    GetBuildScript:=self.FFirebirdQueryMod.SQLBuildScript;
end;

function TFirebirdDataProvider.GetBuildController() : TSQLQuery;
begin
    GetBuildController:=self.FFirebirdQueryMod.SQLBuildController;
end;

function TFirebirdDataProvider.GetBuildTemplateDataSource() : TDataSource;
begin
  GetBuildTemplateDataSource:=self.FFirebirdQueryMod.dsBuildTemplate;
end;

function TFirebirdDataProvider.GetBuildScriptDataSource() : TDataSource;
begin
  GetBuildScriptDataSource:=self.FFirebirdQueryMod.dsBuildScript;
end;

function TFirebirdDataProvider.GetBuildControllerDataSource() : TDataSource;
begin
   GetBuildControllerDataSource:=self.FFirebirdQueryMod.dsBuildController;
end;

function TFirebirdDataProvider.GetBuildTemplateByName() : TSQLQuery;
begin
   GetBuildTemplateByName:=FFirebirdBuildQueryMod.SQLGetBuildTemplateByName;
end;

function TFirebirdDataProvider.GetBuildScriptsForController():TSQLQuery;
begin
     GetBuildScriptsForController:=FFirebirdBuildQueryMod.SQLGetBuildScriptsForController;
end;

function TFirebirdDataProvider.GetBuildByModelLookup():TSQLQuery;
begin
   GetBuildByModelLookup:=FFirebirdLookupQueryMod.SQLBuildByModelLookup;
end;

function TFirebirdDataProvider.GetModellookup():TSQLQuery;
begin
    GetModellookup:=FFirebirdLookupQueryMod.SQLModelLookup;
end;

function TFirebirdDataProvider.GetBuildScriptByID():TSQLQuery;
begin
  GetBuildScriptByID:=FFirebirdBuildQueryMod.SQLGetBuildScriptByID;
end;


function TFirebirdDataProvider.GetLoadAttribute():TSQLQuery;
begin
   GetLoadAttribute:=FFirebirdBuildQueryMod.SQLLoadAttribute;
end;

function TFirebirdDataProvider.GetBuildScriptLookup():TSQLQuery;
begin
   GetBuildScriptLookup:=FFirebirdLookupQueryMod.SQLBuildScriptLookup;
end;

function TFirebirdDataProvider.GetBuildScriptLookupDatasource():TDataSource;
begin
     GetBuildScriptLookupDatasource:=FFirebirdLookupQueryMod.dsBuildScriptLookup;
end;

function TFirebirdDataProvider.GetBuildControllerScript() : TSQLQuery;
begin
  GetBuildControllerScript:=FFirebirdQueryMod.SQLBuildControllerScript;
end;

function TFirebirdDataProvider.GetBuildControllerScriptDataSource(): TDataSource;
begin
  GetBuildControllerScriptDataSource:=FFirebirdQueryMod.dsBuildControllerScript;
end;

function TFirebirdDataProvider.GetBuildScriptParameter() : TSQLQuery;
begin
  GetBuildScriptParameter:=FFirebirdQueryMod.SQLBuildScriptParameter;
end;

function TFirebirdDataProvider.GetBuildScriptParameterDataSource(): TDataSource;
begin
  GetBuildScriptParameterDataSource:=FFirebirdQueryMod.dsBuildScriptParameter;
end;

function TFirebirdDataProvider.GetBuildScriptParameters():TSQLQuery;
begin
   GetBuildScriptParameters:=FFirebirdBuildQueryMod.SQLGetBuildScriptParameters;
end;

function TFirebirdDataProvider.GetMapping() : TSQLQuery;
begin
     Result:=FFirebirdQueryMod.SQLMapping;
end;

function TFirebirdDataProvider.GetMappingDataSource(): TDataSource;
begin
   Result:=FFirebirdQueryMod.dsMapping;
end;

function TFirebirdDataProvider.GetMappingValue() : TSQLQuery;
begin
     Result:=FFirebirdQueryMod.SQLMappingValue;
end;

function TFirebirdDataProvider.GetMappingValueDataSource(): TDataSource;
begin
   Result:=FFirebirdQueryMod.dsMappingValue;
end;



{private methods }
procedure TFirebirdDataProvider.CreateDatabaseObjects();
var
  DoTablesExist : Boolean;
begin
  {
     this will create all objects in the embedded firebird database
   }
   FFireBirdMod.SQLQueryDBObjects.Open;
   DoTablesExist:= not FFireBirdMod.SQLQueryDBObjects.EOF;
   FFireBirdMod.SQLQueryDBObjects.Close;
   if not DoTablesExist then
   begin
      FFireBirdMod.SQLCreateTables.Execute;
      FFireBirdMod.SQLTransaction1.CommitRetaining;

      FFireBirdMod.SQLCreateData.Execute;
      FFireBirdMod.SQLTransaction1.CommitRetaining;
   end;
end;

function TFirebirdDataProvider.InsertScreenChild(PTreeData : TAssociationTree; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
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

procedure TFirebirdDataProvider.CreateArtifacts(PQuery: TSQLQuery; PForeignKey:LongInt; PForeignKeyName: String; PForeignKeyParameterName: String);
var
  UpdatedNeeded:Boolean;
begin
   {
     call stored procedure that checks if screen family entity already has all the screen artifact
     records in place, if not then add them

     1. get the list of artifacts not yet existing
     select   a.attributeId,  ScreenFamilyId, a.Name, CURRENT_TIMESTAMP
     from screenfamily f
     inner join relation r on r.RELATIONID = f.SCREENFAMILYTORELATION
     inner join attribute a on r.RELATIONID = a.RELATIONATTRIBUTE
      where f.SCREENFAMILYID = 1
     and a.ATTRIBUTEID not in (
     select s.ARTIFACTTOATTRIBUTE from screenartifact s where s.FAMILYTOARTIFACT = 1
     )

     2. loop through each artifact and get a new ScreenArtifactId

     3. insert into the ScreenArtifact table

   }

   try
       UpdatedNeeded:=False;
       PQuery.Active:=False;
       PQuery.ParamByName(PForeignKeyParameterName).AsLargeInt:=PForeignKey;
       PQuery.Active:=True;
       FFirebirdQueryMod.SQLScreenArtifact.Active:=True;
       while not PQuery.EOF do
       begin
            FFirebirdQueryMod.SQLScreenArtifact.Append;    //append will cause primary key to get populated
            FFirebirdQueryMod.SQLScreenArtifact.FieldByName('ARTIFACTTOATTRIBUTE').AsLargeInt:=PQuery.FieldByName('attributeId').AsLargeInt;
            FFirebirdQueryMod.SQLScreenArtifact.FieldByName(PForeignKeyName).AsLargeInt:=PForeignKey;
            FFirebirdQueryMod.SQLScreenArtifact.FieldByName('NAME').AsString:=PQuery.FieldByName('NAME').AsString;
            UpdatedNeeded:=True;
           // FFirebirdQueryMod.SQLScreenArtifact.FieldByName('VERSION').AsDateTime:=PQuery.FieldByName('Version').AsDateTime;
            PQuery.Next;
       end;
       if UpdatedNeeded then
          FFirebirdQueryMod.SQLScreenArtifact.Post;
   finally
       FFirebirdQueryMod.SQLScreenArtifact.Active:=False;
   end;
end;

procedure TFirebirdDataProvider.RefreshFamilyArtifacts(PScreenFamilyId : LongInt);

begin
  self.CreateArtifacts(self.FFirebirdLookupQueryMod.SQLGetUnsavedArtifactsByScreenFamily, PScreenFamilyId, 'FAMILYTOARTIFACT', 'ScreenFamilyId');
end;

procedure TFirebirdDataProvider.GetArtifactsByScreenFamily(PScreenFamilyId : LongInt; var list:TList);
var
  query : TSQLQuery;
  data : TAssociationTree;
begin
       try
         try
         query := TSQLQuery.Create(Nil);
         query.Transaction := self.FFireBirdMod.SQLTransaction1;
         query.DataBase := self.FFireBirdMod.IBConnection1;
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

procedure TFirebirdDataProvider.GetArtifactsByScreenChild(PScreenChildId : LongInt; var list:TList);
var
  query : TSQLQuery;
  data : TAssociationTree;
begin
       try
         try
         query := TSQLQuery.Create(Nil);
         query.Transaction := self.FFireBirdMod.SQLTransaction1;
         query.DataBase := self.FFireBirdMod.IBConnection1;
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

procedure TFirebirdDataProvider.GetListOfMasterPropertyLookups(PMasterPropertyId: LongInt; var list: TStringList);
var
   query : TSQLQuery;
   objectData: TStringLookup;
begin
   try
     try
     query := TSQLQuery.Create(Nil);
     query.Transaction := self.FFireBirdMod.SQLTransaction1;
     query.DataBase := self.FFireBirdMod.IBConnection1;
     query.SQL.Text := 'SELECT Name, Code, Display FROM masterpropertyvaluelist WHERE MASTERPROPERYTOVALUELIST = :MasterPropertyId ';
     query.ParamByName('MasterPropertyId').AsLargeInt:=PMasterPropertyId;
     query.Open;
     while not query.EOF do
     begin
       //list.Add(query.FieldByName('Code').AsString + '=' + query.FieldByName('Display').AsString);
       objectData:=TStringLookup.Create(query.FieldByName('Code').AsString, query.FieldByName('Display').AsString);
       list.AddObject(query.FieldByName('Display').AsString, objectData);
       //list.Add(query.FieldByName('Name').AsString);
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


function TFirebirdDataProvider.GetExistingScreenChildId(PAssociationId : LongInt; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;
var
  query : TSQLQuery;
  screenChildId : LongInt;
begin
   {
    screenchild where screenfamilyid =-x and associationid = y and screenchildtoself is null limit 1
   }
   screenChildId := -1;
   query := TSQLQuery.Create(Nil);
   query.DataBase := self.FFireBirdMod.IBConnection1;
   if PScreenFamilyId > 0 then
      begin
        query.SQL.Text := 'SELECT COALESCE(screenchildid, 0) as ScreenChildId FROM ScreenChild' +
                      ' WHERE ScreenChild.SCREENFAMILYTOSCREENCHILD=:ScreenFamilyId and ' +
                      ' screenchild.SCREENCHILDTOASSOCIATION=:AssociationId and ' +
                      ' screenchild.screenchildtoself is null ROWS 1;';
        query.ParamByName('ScreenFamilyId').AsLargeInt:=PScreenFamilyId;
      end

   else
       begin
         query.SQL.Text := 'SELECT COALESCE(screenchildid, 0) as ScreenChildId  FROM ScreenChild' +
                    ' WHERE ScreenChild.screenchildtoself=:ScreenChildId and ' +
                    ' screenchild.SCREENCHILDTOASSOCIATION=:AssociationId and ' +
                    ' screenchild.SCREENFAMILYTOSCREENCHILD is null ROWS 1;';
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

function TFirebirdDataProvider.CreateNewScreenChildRecord(PTreeData : TAssociationTree; PScreenFamilyId : LongInt; PScreenChildId : LongInt) : LongInt;

begin
     try
       self.FFirebirdQueryMod.SQLScreenChild.Active:=True;
       self.FFirebirdQueryMod.SQLScreenChild.Append;
       self.FFirebirdQueryMod.SQLScreenChild.FieldByName('SCREENCHILDTOASSOCIATION').AsLargeInt:=PTreeData.FAssociationId;
       if PScreenFamilyId > 0 then
       begin
            self.FFirebirdQueryMod.SQLScreenChild.FieldByName('SCREENFAMILYTOSCREENCHILD').AsLargeInt:=PScreenFamilyId;
            self.FFirebirdQueryMod.SQLScreenChild.FieldByName('SCREENCHILDTOSELF').Clear;
       end
       else
       begin
            self.FFirebirdQueryMod.SQLScreenChild.FieldByName('SCREENCHILDTOSELF').AsLargeInt:=PScreenChildId;
            self.FFirebirdQueryMod.SQLScreenChild.FieldByName('SCREENFAMILYTOSCREENCHILD').Clear;
       end;
      self.FFirebirdQueryMod.SQLScreenChild.FieldByName('NAME').AsString:=PTreeData.FName;
      self.FFirebirdQueryMod.SQLScreenChild.Post;
      self.FFireBirdMod.SQLTransaction1.CommitRetaining;
      CreateNewScreenChildRecord:=self.FFirebirdQueryMod.SQLScreenChild.FieldByName('SCREENCHILDID').AsLargeInt;
     finally
            self.FFirebirdQueryMod.SQLScreenChild.Active:=False;
     end;
end;

procedure TFirebirdDataProvider.RefreshScreenChildArtifacts(PScreenChildId : LongInt);
var
  query : TSQLQuery;
begin
   {
     call stored procedure that checks if screen family entity already has all the screen artifact
     records in place, if not then add them
   }
   self.CreateArtifacts(self.FFirebirdLookupQueryMod.SQLGetUnsavedArtifactsByScreenChild, PScreenChildId, 'ChildToArtifact', 'ScreenChildId');

end;

{imports}
function TFirebirdDataProvider.GetConnection() : TSQLQuery;
begin
     GetConnection:=FFirebirdImportQuery.SQLConnection;
end;

function TFirebirdDataProvider.GetConnectionDataSource(): TDataSource;
begin
   GetConnectionDataSource:=FFirebirdImportQuery.dsConnection;
end;


function TFirebirdDataProvider.GetImportMappingSystemCode(PDatabaseType:databaseType):String;
var
  DatabaseType:String;
  TargetValue:String;
begin
   Result:=FCommonProvider.GetImportMappingSystemCode(PDatabaseType, self.FFirebirdLookupQueryMod.SQLGetImportSystemCode);
end;

function TFirebirdDataProvider.GetMappingDataSetBySystemCode(PSystemCode:String):TDataSet;
begin
   self.FFirebirdLookupQueryMod.SQLGetMappingValueBySystemCode.Active:=False;
   self.FFirebirdLookupQueryMod.SQLGetMappingValueBySystemCode.ParamByName('SystemCode').AsString:=PSystemCode;
   self.FFirebirdLookupQueryMod.SQLGetMappingValueBySystemCode.Active:=True;
   Result:=self.FFirebirdLookupQueryMod.SQLGetMappingValueBySystemCode;
end;


end.

