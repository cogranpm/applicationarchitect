unit MYSQLImportProvider;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, appinterfacesunit, dmMySQLImport, AppSettingsUnit, db, sqldb;

type
  TMYSQLImportProvider = class(TInterfacedObject, IDataImportProvider)

  const
       INFORMATION_SCHEMA_NAME:String = 'INFORMATION_SCHEMA';

  public
    constructor Create();
    destructor Destroy(); override;
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
  private
    function GetMappedDataType(PDataType:String; PMappingValues:TDataSet):String;
  private
    //underlying data module for db operations
    FDataModule: TdmMYSQLImport;
    FSourceDatabaseName:String;
  end;


implementation

constructor TMYSQLImportProvider.Create();
begin
  FDataModule:=TdmMYSQLImport.Create(Nil);
  inherited.Create();
end;

destructor TMYSQLImportProvider.Destroy();
begin
  if Assigned(FDataModule) then
     FreeAndNil(FDataModule);
  inherited;
end;

procedure TMYSQLImportProvider.Connect(PName : String; PUser: String; PPassword: String);
begin

end;

procedure TMYSQLImportProvider.Connect(PHost:String; PPort:Integer; PName : String; PUser: String; PPassword: String);
begin
    FDataModule.Connection.HostName:=PHost;
    FDataModule.Connection.Port:=PPort;
    FDataModule.Connection.UserName:=PUser;
    FDataModule.Connection.Password:=PPassword;
    FDataModule.Connection.DatabaseName:=INFORMATION_SCHEMA_NAME;
    FSourceDatabaseName:=PName;
    FDataModule.Connection.Connected:=True;
end;

procedure TMYSQLImportProvider.LoadTables();

begin
  FDataModule.SQLListTables.Active:=False;
  FDataModule.SQLListTables.ParamByName('tableschema').AsString:=FSourceDatabaseName;
  FDataModule.SQLListTables.Active:=True;
end;

function TMYSQLImportProvider.GetTables():TDataSet;
begin
     Result:=FDataModule.SQLListTables;
end;

procedure TMYSQLImportProvider.LoadColumns(PTableName:String);
begin
  FDataModule.SQLListColumns.Active:=False;
  FDataModule.SQLListColumns.ParamByName('tablename').AsString:=PTableName;
  FDataModule.SQLListColumns.ParamByName('tableschema').AsString:=FSourceDatabaseName;
  FDataModule.SQLListColumns.Active:=True;
end;

function TMYSQLImportProvider.GetColumns():TDataSet;
begin
  Result:=FDataModule.SQLListColumns;
end;

procedure TMYSQLImportProvider.Disconnect();
begin
   FDataModule.Connection.Connected:=False;
end;

function TMYSQLImportProvider.DisplayConnection():String;
begin
    Result:='Host: ' + FDataModule.Connection.HostName + #13#10 + 'Database:' + FSourceDatabaseName +  #13#10 + 'User:' + FDataModule.Connection.UserName;
end;

procedure TMYSQLImportProvider.CreateModel(var PModelProvider:IDataProvider; PModelName:String);
var
  ModelDataSet:TSQLQuery;
begin
  ModelDataSet:=PModelProvider.GetModels();
  ModelDataSet.Active:=True;
  ModelDataSet.Append;
  ModelDataSet.FieldByName('Name').AsString:=PModelName;
  ModelDataSet.Post;
end;

function TMYSQLImportProvider.GetMappedDataType(PDataType:String; PMappingValues:TDataSet):String;
var
  SourceValue:String;
  SourceCode:String;
  TargetValue:String;
  TargetCode:String;
  Source:String;
  Target:String;
  MappedColumnType:String;
begin
    PMappingValues.First;
    while not PMappingValues.EOF do
    begin
       SourceValue:= '';
       SourceCode:= '';
       TargetValue:= '';
       TargetCode:= '';

       if not PMappingValues.FieldByName('SourceValue').IsNull then
          SourceValue:= PMappingValues.FieldByName('SourceValue').AsString;

       if not PMappingValues.FieldByName('SourceLookupCode').IsNull then
        SourceCode:= PMappingValues.FieldByName('SourceLookupCode').AsString;

       if not PMappingValues.FieldByName('TargetValue').IsNull then
          TargetValue:= PMappingValues.FieldByName('TargetValue').AsString;

       if not PMappingValues.FieldByName('TargetLookupCode').IsNull then
        TargetCode:= PMappingValues.FieldByName('TargetLookupCode').AsString;

       if SourceValue <> '' then
        Source:=SourceValue
       else
         Source:=SourceCode;


       if SourceValue <> '' then
        begin
           if CompareText(SourceValue, PDataType) = 0 then
            begin
               if TargetValue <> '' then
                  MappedColumnType:=TargetValue
               else
                   MappedColumnType:=TargetCode;
               break;
            end;
        end
       else
       begin
          if CompareText(SourceCode, PDataType) = 0 then
           begin
              if TargetValue <> '' then
                 MappedColumnType:=TargetValue
              else
                  MappedColumnType:=TargetCode;
              break;
           end;
       end;

       PMappingValues.Next;
    end;
    Result:=MappedColumnType;
end;

procedure TMYSQLImportProvider.CreateRelation(var PModelProvider:IDataProvider; var PMappingValuesDataSet:TDataSet; PRelationName:String; PTableName:String; PExcludePrimaryKey:Boolean);
var
  RelationsDataSet:TSQLQuery;
  InsertedRelationId:LongInt;
  AttributesDataSet:TSQLQuery;
  DSColumns:TDataSet;
  ColumnName:String;
  ColumnType:String;
  ColumnNullable:String;
  ColumnLength:LongInt;
  ColumnKey:String;
  IsPrimaryKey:Boolean;
  MappedColumnType:String;
begin
    RelationsDataSet:=PModelProvider.GetRelations();
    RelationsDataSet.Active:=True;
    RelationsDataSet.Append;
    RelationsDataSet.FieldByName('Name').AsString:=PRelationName;
    RelationsDataSet.FieldByName('Frozen').AsBoolean:=False;
    RelationsDataSet.Post;
    InsertedRelationId:=RelationsDataSet.FieldByName('RelationId').AsLongint;

    AttributesDataSet:=PModelProvider.GetAttributes();
    LoadColumns(PTableName);
    DSColumns:=GetColumns();
    while not DSColumns.EOF do
    begin
       IsPrimaryKey:=False;
       if not DSColumns.FieldByName('COLUMN_KEY').IsNull then
        begin
          ColumnKey:=DSColumns.FieldByName('COLUMN_KEY').AsString;
          if ColumnKey = 'PRI' then
           IsPrimaryKey:=True
          else
            IsPrimaryKey:=False;
        end;

       if IsPrimaryKey and PExcludePrimaryKey then
       begin
         ;
       end
       else
       begin
         AttributesDataSet.Active:=True;
         AttributesDataSet.Append;
         AttributesDataSet.FieldByName('RelationAttribute').AsLongint:=InsertedRelationId;
         ColumnName:=DSColumns.FieldByName('COLUMN_NAME').AsString;
         AttributesDataSet.FieldByName('Name').AsString:=ColumnName;
         ColumnType:=DSColumns.FieldByName('DATA_TYPE').AsString;
         MappedColumnType:=self.GetMappedDataType(ColumnType, PMappingValuesDataSet);
         AttributesDataSet.FieldByName('Type').AsInteger:=StrToInt(MappedColumnType);

         ColumnNullable:=DSColumns.FieldByName('IS_NULLABLE').AsString;

          if ColumnNullable = 'YES' then
            AttributesDataSet.FieldByName('AllowNull').AsInteger:=1
         else
           AttributesDataSet.FieldByName('AllowNull').AsInteger:=0;

         if not DSColumns.FieldByName('CHARACTER_MAXIMUM_LENGTH').IsNull then
          begin
               ColumnLength:=DSColumns.FieldByName('CHARACTER_MAXIMUM_LENGTH').AsLongint;
               AttributesDataSet.FieldByName('AttributeLength').AsInteger:=ColumnLength;
          end;
         AttributesDataSet.Post;
        end;

       DSColumns.Next;
    end;

end;


end.

