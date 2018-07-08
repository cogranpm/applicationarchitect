unit appinterfacesunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, ComCtrls, db, AssociationTree, ValEdit;

type
  databaseType = (edbFireBirdEmbedded, edbFireBirdServer, edbMySQL, edbMSSQL);

type
  navigationNodeType = ( Menu, ModelRoot, ModelEntity, NewModelEntity);

type
  associationType = (atOneToMany, atOneToOne, atManyToMany, atLookup);

type
  attributeType = (atDummy, atString, atInteger, atBoolean, atDate, atDecimal, atChar, atByte, atShort, atLong, atFloat, atDouble, atBlob, atClob, atTime, atTimestamp);

type
 TRelationAfterScroll = procedure(DataSet:TDataSet) of object;

type
 TScreenFamilyAfterScroll = procedure(DataSet:TDataSet) of object;

type
 TMasterPropertyAfterScroll = procedure(DataSet:TDataSet) of object;

type
 TMasterPropertyAfterPost = procedure(DataSet:TDataSet) of object;

 type
  TChangeSelectedFormEntity = procedure(Sender:TObject; Node:TTreeNode) of object;

 type
  TFormPropertySaveClick = procedure(Sender:TObject) of object;

 type
  TPostButtonClick = procedure(Sender:TObject; PName:String) of object;

type
 modelImageIndex = (miEntity, miField, miHierarchy, miInterface, miAttribute, miRelation, miAssociation, miNewModel, miFred, miOpen, miTool);

type
 mainImageIndex = (miTreeModel, miTreeModelSelect, miTreeThree, miTreeMenu); {todo- main image list}

type
 TLongIntLookup = Class(TObject)
   private
     FKey: LongInt;
     FLabel: String;
     FCode: String;
   public
     property Key: LongInt read FKey write FKey;
     property Display: String read FLabel write FLabel;
     property Code: String read FCode write FCode;
     constructor Create(PKey:LongInt; PLabel:String);
     constructor Create(PKey:LongInt; PLabel:String; PCode:String);
 end;

 type
 TStringLookup = Class(TObject)
   private
     FKey: String;
     FLabel: String;
   public
     property Key: String read FKey write FKey;
     property Display: String read FLabel write FLabel;
     constructor Create(PKey:String; PLabel:String);
 end;

 type
  RBuildControllerLoadOption = record
    BuildControllerId: LongInt;
    BuildScriptId: LongInt;
    ScriptOnly:Boolean;
  end;


type
  IMainModule = interface
    ['{48AC1E8A-36DB-4A8B-97D6-2F064873108C}']
      {all exposed public controller methods should be here so the forms can call them }
      procedure OnSetDatabase();
      procedure OnNew();
      procedure OnDelete();
      procedure OnNewModel();
      procedure OnDeleteModel();
      procedure OnSave();
      procedure OnQuit();
      procedure OnPostModel(PName:String);
      procedure OnSelectModel(var Node: TTreeNode);
      procedure OnBuild();
      procedure OnImportModel();
  end;

type
  IDataProvider = interface
    ['{B58F2BB7-C4D2-4DD2-A97A-BDD540DA6E89}']
      {implementation of non database specific provider }
      procedure Connect(PName : String; PUser: String; PPassword: String);
      procedure Connect(PHost:String; PPort:Integer; PName : String; PUser: String; PPassword: String);

      {model entity}
      function GetModels(): TSqlQuery;
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
      function GetOnRelationAfterScroll():TRelationAfterScroll;
      procedure SetOnRelationAfterScroll(PRelationAfterScroll:TRelationAfterScroll);
      property OnRelationAfterScroll: TRelationAfterScroll read GetOnRelationAfterScroll write SetOnRelationAfterScroll;
      function GetNameByRelationId(RelationId : LongInt) : string;
      function GetRelationPropertyValue() : TSQLQuery;
      function GetRelationPropertyValueDataSource(): TDataSource;


      {attribute entity}
      function GetAttributes(): TSQLQuery;
      function GetAttributesDataSource(): TDataSource;
      function GetAttributeTypesDataSource(): TDataSource;
      function GetAttributePropertyValue() : TSQLQuery;
      function GetAttributePropertyValueDataSource(): TDataSource;
      function GetAssociationPropertyValue() : TSQLQuery;
      function GetAssociationPropertyValueDataSource(): TDataSource;


      {build entity}
      function GetLoadBuild(): TSQLQuery;
      function GetBuilds(): TSQLQuery;
      function GetBuildsDataSource(): TDataSource;
      function GetBuildPropertyValue() : TSQLQuery;
      function GetBuildPropertyValueDataSource(): TDataSource;


      { associations entity }
      function GetAssociations(): TSQLQuery;
      function GetAssociationsDataSource(): TDataSource;
      function GetRelationsLookup(): TSQLQuery;
      function GetAssociationTypeLookupDataSource(): TDataSource;
      function GetRelationsLookupDataSource(): TDataSource;
      function GetAssociationsByOwner(): TSQLQuery;

      { forms entity }
      function GetScreenFamilies(): TSQLQuery;
      function GetScreenFamiliesDataSource(): TDataSource;
      function GetOnScreenFamilyAfterScroll():TScreenFamilyAfterScroll;
      procedure SetOnScreenFamilyAfterScroll(PScreenFamilyAfterScroll:TScreenFamilyAfterScroll);
      property OnScreenFamilyAfterScroll: TScreenFamilyAfterScroll read GetOnScreenFamilyAfterScroll write SetOnScreenFamilyAfterScroll;
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
      property OnMasterPropertyAfterScroll: TMasterPropertyAfterScroll read GetOnMasterPropertyAfterScroll write SetOnMasterPropertyAfterScroll;

      function GetOnMasterPropertyAfterPost():TMasterPropertyAfterPost;
      procedure SetOnMasterPropertyAfterPost(PEvent:TMasterPropertyAfterPost);
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
      function GetBuildScriptParameters():TSQLQuery;
      function GetBuildScriptByID():TSQLQuery;
      function GetBuildByModelLookup():TSQLQuery;
      function GetModellookup():TSQLQuery;
      function GetLoadAttribute():TSQLQuery;
      function GetBuildScriptLookup():TSQLQuery;
      function GetBuildScriptLookupDatasource():TDataSource;
      function GetBuildControllerScript() : TSQLQuery;
      function GetBuildControllerScriptDataSource(): TDataSource;
      function GetBuildScriptParameter() : TSQLQuery;
      function GetBuildScriptParameterDataSource(): TDataSource;

      {importing}
      {
      function GetModelImport() : TSQLQuery;
      function GetModelImportDataSource(): TDataSource;
      function GetTableImport() : TSQLQuery;
      function GetTableImportDataSource(): TDataSource;
      function GetColumnImport() : TSQLQuery;
      function GetColumnImportDataSource(): TDataSource;
      }
      function GetConnection() : TSQLQuery;
      function GetConnectionDataSource(): TDataSource;
      function GetImportMappingSystemCode(PDatabaseType:databaseType):String;
      function GetMappingDataSetBySystemCode(PSystemCode:String):TDataSet;

      {mapping}
      function GetMapping() : TSQLQuery;
      function GetMappingDataSource(): TDataSource;
      function GetMappingValue() : TSQLQuery;
      function GetMappingValueDataSource(): TDataSource;

  end;

type
IAppFrame = interface
     ['{7355F956-3889-4692-B379-E3445CD99711}']
    {frames expose method so the datasource can be set}
    procedure SetupDataSource(PEntityName:String; PDataSource:TDataSource);

end;

type
  IDataImportProvider = interface
    ['{FB176A2C-E167-4A59-88C5-9478294EF455}']
   procedure Connect(PName : String; PUser: String; PPassword: String);
   procedure Connect(PHost:String; PPort:Integer; PName : String; PUser: String; PPassword: String);
   procedure Disconnect();
   function DisplayConnection():String;
   procedure LoadTables();
   function GetTables():TDataSet;
   procedure LoadColumns(PTableName:String);
   function GetColumns():TDataSet;
   procedure CreateModel(var PModelProvider:IDataProvider; PModelName:String);
   procedure CreateRelation(var PModelProvider:IDataProvider; var PMappingValuesDataSet:TDataSet; PRelationName:String; PTableName:String; PExcludePrimaryKey:Boolean);
end;

type
  PMasterCategoryCheckboxListItem = ^MasterCategoryCheckboxListItem;
  MasterCategoryCheckboxListItem = class(TObject)
   public
     FMasterCategoryId : LongInt;
end;

implementation

constructor TLongIntLookup.Create(PKey:LongInt; PLabel:String);
begin
  self.FKey:=PKey;
  self.FLabel:=PLabel;
  self.FCode:='';
end;

constructor TLongIntLookup.Create(PKey:LongInt; PLabel:String; PCode:String);
begin
  self.FKey:=PKey;
  self.FLabel:=PLabel;
  self.FCode:=PCode;
end;

constructor TStringLookup.Create(PKey:String; PLabel:String);
begin
  self.FKey:=PKey;
  self.FLabel:=PLabel;
end;



end.

