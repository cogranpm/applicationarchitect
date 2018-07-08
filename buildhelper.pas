unit BuildHelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, appinterfacesunit, EntityFormatterUnit, fpjson, jsonparser, db, sqldb, SynMustache, SynCommons, Dialogs, BuildEntityDTOUnit;

type
  TBuildHelper = class(TObject)
  private
    { private declarations }

    FDataProvider : IDataProvider;
    FEntityFormatter: TEntityFormatter;
    FBuildDataDTO: TBuildEntityDTO;
  private
    procedure SetEntityFormatter(PEntityFormatter:TEntityFormatter);

  public
    { public declarations }
    constructor Create();
    destructor Destroy(); override;
    procedure LoadBuildData(var PDataProvider:IDataProvider; PBuildId:LongInt);
    procedure RenderTemplateToFile(TemplateName:String; TargetFilePath:String; TemplateData:String);
    function RenderTemplate(TemplateName:String; TemplateData:String):String;
    function SaveStringToFile(PData:String; PFilePath: AnsiString): boolean;
    function GetBuildData():TBuildEntityDTO;
    function FormatJSON(JSONData:TJSONData):AnsiString;
    function JsonAddBoolean(AData: TJSONObject; const AName: AnsiString; AValue: Boolean): Integer;
    function JsonAddString(AData: TJSONObject; const AName: AnsiString; AValue: String): Integer;
    function JsonGetBoolean(AData: TJSONObject; Const AName : String; ADefault : Boolean) : Boolean;
    function JsonGetAsJSON(AData: TJSONObject; Const AName : String; ADefault : TJSONObject) : TJSONObject;
    Function JsonGetAsString(AData: TJSONObject; Const AName : String; ADefault : TJSONStringType) : TJSONStringType;
    function GetEntityFormatter():TEntityFormatter;
    property EntityFormatter: TEntityFormatter read GetEntityFormatter write SetEntityFormatter;

  end;

implementation

constructor TBuildHelper.Create();
begin
  FEntityFormatter:=TEntityFormatter.Create();
  inherited.Create();
end;

destructor TBuildHelper.Destroy();
begin
  if Assigned(FEntityFormatter) then
     FEntityFormatter.Free;
  inherited;
end;

function TBuildHelper.GetEntityFormatter():TEntityFormatter;
begin
   GetEntityFormatter:=FEntityFormatter;
end;

procedure TBuildHelper.SetEntityFormatter(PEntityFormatter:TEntityFormatter);
begin
    FEntityFormatter:=PEntityFormatter;
end;

procedure TBuildHelper.LoadBuildData(var PDataProvider:IDataProvider; PBuildId:LongInt);
var
    ModelId : LongInt;
begin
  FBuildDataDTO:=TBuildEntityDTO.Create();
  FBuildDataDTO.BuildData:=PDataProvider.GetLoadBuild();
  FBuildDataDTO.ModelData:=PDataProvider.GetLoadModel();

  //note note note, this must change to use a "build" version of this dataset
  //otherwise the scroll event fires every time the dataset is iterated
  FBuildDataDTO.RelationData:=PDataProvider.GetRelationsByModel();
  FBuildDataDTO.AttributeData:=PDataProvider.GetLoadAttribute();
  FBuildDataDTO.ChildAssociationData:=PDataProvider.GetChildAssociations();
  FBuildDataDTO.ParentAssociationData:=PDataProvider.GetParentAssociations();
  FBuildDataDTO.LoadRelationData:=PDataProvider.GetLoadRelation();
  FBuildDataDTO.BuildTemplateData:=PDataProvider.GetBuildTemplateByName();

  {which build are we generating}
  FBuildDataDTO.BuildData.Active:=False;
  FBuildDataDTO.BuildData.ParamByName('BuildId').AsLargeInt:=PBuildId;
  FBuildDataDTO.BuildData.Active:=True;
  //ProjectPath:=BuildDataDTO.BuildData.FieldByName('ProjectPath').AsString;
  ModelId:=FBuildDataDTO.BuildData.FieldByName('MODELTOBUILD').AsLargeInt;

  {which model is associated with the build}
  FBuildDataDTO.ModelData.Active:=False;
  FBuildDataDTO.ModelData.ParamByName('ModelId').AsLargeInt:=ModelId;
  FBuildDataDTO.ModelData.Active:=True;

  {which relations are associated with the model}
  FBuildDataDTO.RelationData.Active:=False;
  FBuildDataDTO.RelationData.ParamByName('ModelId').AsLargeInt:=ModelId;
  FBuildDataDTO.RelationData.Active:=True;

  FEntityFormatter.Init(FBuildDataDTO);

end;

function TBuildHelper.GetBuildData():TBuildEntityDTO;
begin
  GetBuildData:=FBuildDataDTO;
end;

function TBuildHelper.FormatJSON(JSONData:TJSONData):AnsiString;
begin
    FormatJSON:=JSONData.FormatJSON();
end;

procedure TBuildHelper.RenderTemplateToFile(TemplateName:String; TargetFilePath:String; TemplateData:String);
  var
      TemplateOutput: String;
      TargetStream : TFileStream;
  begin
    try
       TemplateOutput:=self.RenderTemplate(TemplateName, TemplateData);
       TargetStream := TFileStream.Create(TargetFilePath, fmCreate);
       TargetStream.Write(TemplateOutput[1], length(TemplateOutput));

    finally
      if Assigned(TargetStream) then
          TargetStream.Free;
    end;
end;

function TBuildHelper.RenderTemplate(TemplateName:String; TemplateData:String):String;
var
    TemplateOutput: String;
    ParsedTemplate: TSynMustache;
begin

  self.FBuildDataDTO.BuildTemplateData.Active:=False;
  self.FBuildDataDTO.BuildTemplateData.ParamByName('Name').AsString:=TemplateName;
  self.FBuildDataDTO.BuildTemplateData.Active:=True;
  while not self.FBuildDataDTO.BuildTemplateData.EOF do
  begin
     ParsedTemplate := TSynMustache.Parse(self.FBuildDataDTO.BuildTemplateData.FieldByName('Script').AsString);
     TemplateOutput:=ParsedTemplate.RenderJSON(TemplateData);
     self.FBuildDataDTO.BuildTemplateData.Next;
  end;
    RenderTemplate:= TemplateOutput;
end;

function TBuildHelper.SaveStringToFile(PData:String; PFilePath: AnsiString): boolean;
var
  fsOut: TFileStream;
begin
  // By default assume the writing will fail.
  result := false;

  // Write the given string to a file, catching potential errors in the process.
  try
    fsOut := TFileStream.Create(PFilePath, fmCreate);
    fsOut.Write(PData[1], length(PData));
    fsOut.Free;

    // At his point it is known that the writing went ok.
    result := true

  except
    on E:Exception do
      //log an error here

  end

end;

function TBuildHelper.JsonAddBoolean(AData: TJSONObject; const AName: AnsiString; AValue: Boolean): Integer;
begin
    JsonAddBoolean:=AData.Add(AName, AValue);
end;

function TBuildHelper.JsonAddString(AData: TJSONObject; const AName: AnsiString; AValue: String): Integer;
begin
  JsonAddString:=AData.Add(AName, AValue);
end;

function TBuildHelper.JsonGetBoolean(AData: TJSONObject; Const AName : String; ADefault : Boolean) : Boolean;
begin
   JsonGetBoolean:=AData.Get(AName, ADefault);
end;

function TBuildHelper.JsonGetAsJSON(AData: TJSONObject; Const AName : String; ADefault : TJSONObject) : TJSONObject;
begin
  JsonGetAsJSON:=AData.Get(AName, ADefault);
end;

function TBuildHelper.JsonGetAsString(AData: TJSONObject; Const AName : String; ADefault : TJSONStringType) : TJSONStringType;
begin
  JsonGetAsString:=AData.Get(AName, ADefault);
end;

end.

