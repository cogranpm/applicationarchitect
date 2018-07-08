unit LazBuildController;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, appinterfacesunit, EntityFormatterUnit, fpjson, jsonparser, db, sqldb, SynMustache, SynCommons, Dialogs,
  BuildControllerLoadUnit, BuildEntityDTOUnit;

type
  TLazBuildController = class(TObject)
  private
    { private declarations }

    FDataProvider : IDataProvider;
    FEntityFormatter: TEntityFormatter;
    BuildDataDTO: TBuildEntityDTO;
  public
    { public declarations }
    constructor Create();
    destructor Destroy(); override;
    procedure Execute(var PDataProvider:IDataProvider; PBuildId:LongInt);


  private
    procedure RenderSourceCodeToFile(TemplatePath:String; TargetFilePath:String; TemplateData:String);
  end;

implementation

constructor TLazBuildController.Create();
begin
  FEntityFormatter:=TEntityFormatter.Create();
  inherited.Create();
end;

destructor TLazBuildController.Destroy();
begin
  if Assigned(FEntityFormatter) then
     FEntityFormatter.Free;
  inherited;
end;

procedure TLazBuildController.Execute(var PDataProvider:IDataProvider; PBuildId:LongInt);

{this controller code should be scritable via pascal script
  behaviours required:
  //setting params on Dataset objects
  //calling functions in EntityFormatter class
  //loading mustache templates (file io)
  //making json calls
  //making mustache calls

  --only stuff proven so far is calling functions in the class that
  is executing the pascal script
  all this other stuff can be encapsulated, and each script gets a full
  model object as a json string, script passes name of template and gets back
  the output so it can write a file - it really needs to loop through the
  DataSets though, in case it needs to write a file for each Relation etc


  Mustach details:

  External partials can be supplied as TSynMustachePartials dictionaries;
  {{.}}, {{-index}} and {{"some text}} pseudo-variables were added to the standard Mustache syntax;
  {{#-first}}, {{#-last}} and {{#-odd}} pseudo-sections were added to the standard Mustache syntax;

  Sections are handled as expected:

    mustache := TSynMustache.Parse('Shown.{{#person}}As {{name}}!{{/person}}end{{name}}');
    html := mustache.RenderJSON('{person:{age:?,name:?}}',[10,'toto']);
    // now html='Shown.As toto!end'
  Note that the sections change the data context, so that within the #person section, you can directly access to the data context person member, i.e. writing directly name

  It supports also inverted sections:

    mustache := TSynMustache.Parse('Shown.{{^person}}Never shown!{{/person}}end');
    html := mustache.RenderJSON('{person:true}');
    // now html='Shown.end'
  To render a list of items, you can write for instance (using the . pseudo-variable):

    mustache := TSynMustache.Parse('{{#things}}{{.}}{{/things}}');
    html := mustache.RenderJSON('{things:["one", "two", "three"]}');
    // now html='onetwothree'
  The -index pseudo-variable allows to numerate the list items, when rendering:

    mustache := TSynMustache.Parse(
      'My favorite things:'#$A'{{#things}}{{-index}}. {{.}}'#$A'{{/things}}');
    html := mustache.RenderJSON('{things:["Peanut butter", "Pen spinning", "Handstands"]}');
    // now html='My favorite things:'#$A'1. Peanut butter'#$A'2. Pen spinning'#$A+
    //          '3. Handstands'#$A,'-index pseudo variable'


  Partials

External partials (i.e. standard Mustache partials) can be defined using TSynMustachePartials. You can define and maintain a list of TSynMustachePartials instances,
or you can use a one-time partial, for a given rendering process, as such:

  mustache := TSynMustache.Parse('{{>partial}}'#$A'3');
  html := mustache.RenderJSON('{}',TSynMustachePartials.CreateOwned(['partial','1'#$A'2']));
  // now html='1'#$A'23','external partials'
Here TSynMustachePartials.CreateOwned() expects the partials to be supplied as name/value pairs.

Internal partials (one of the SynMustache extensions), can be defined directly in the main template:

  mustache := TSynMustache.Parse('{{<partial}}1'#$A'2{{name}}{{/partial}}{{>partial}}4');
  html := mustache.RenderJSON('{name:3}');
  // now html='1'#$A'234','internal partials'
}


var
  {data elements}
  ModelId : LongInt;
  ProjectPath: String;

  {template elements}
  ModelJson : TJSONObject;
  ModelString : TJSONStringType;
  TemplatePath: String;

begin

  {create a data transfer object will all the recordsets required }
     BuildDataDTO:=TBuildEntityDTO.Create();

     BuildDataDTO.BuildData:=PDataProvider.GetLoadBuild();
     BuildDataDTO.ModelData:=PDataProvider.GetLoadModel();

     //note note note, this must change to use a "build" version of this dataset
     //otherwise the scroll event fires every time the dataset is iterated
     BuildDataDTO.RelationData:=PDataProvider.GetRelationsByModel();
     BuildDataDTO.AttributeData:=PDataProvider.GetAttributes();
     BuildDataDTO.ChildAssociationData:=PDataProvider.GetChildAssociations();
     BuildDataDTO.ParentAssociationData:=PDataProvider.GetParentAssociations();
     BuildDataDTO.LoadRelationData:=PDataProvider.GetLoadRelation();

     {which build are we generating}
     BuildDataDTO.BuildData.Active:=False;
     BuildDataDTO.BuildData.ParamByName('BuildId').AsLargeInt:=PBuildId;
     BuildDataDTO.BuildData.Active:=True;
     ProjectPath:=BuildDataDTO.BuildData.FieldByName('ProjectPath').AsString;
     ModelId:=BuildDataDTO.BuildData.FieldByName('MODELTOBUILD').AsLargeInt;

     {which model is associated with the build}
     BuildDataDTO.ModelData.Active:=False;
     BuildDataDTO.ModelData.ParamByName('ModelId').AsLargeInt:=ModelId;
     BuildDataDTO.ModelData.Active:=True;

     {which relations are associated with the model}
     BuildDataDTO.RelationData.Active:=False;
     BuildDataDTO.RelationData.ParamByName('ModelId').AsLargeInt:=ModelId;
     BuildDataDTO.RelationData.Active:=True;
     FEntityFormatter.Init(BuildDataDTO);
     ModelJson:=FEntityFormatter.GetModel();
     ModelString:=ModelJson.FormatJSON();

     {all the source code files that are 1 per model }
     TemplatePath:=BuildDataDTO.BuildData.FieldByName('TemplatePath').AsString;
     ProjectPath:= ProjectPath + '/' + BuildDataDTO.ModelData.FieldByName('Name').AsString;
     CreateDir(ProjectPath);

     { a lazarus data module for queries consists of a .pas and a .lfm }
     self.RenderSourceCodeToFile(TemplatePath + '/Lazarus/DataModule/FirebirdQueryModule.pas.mustache', ProjectPath + '/FirebirdQueryModule.pas', ModelString);
     self.RenderSourceCodeToFile(TemplatePath + '/Lazarus/DataModule/FirebirdQueryModule.lfm.mustache', ProjectPath + '/FirebirdQueryModule.lfm', ModelString);

     {alter the model data to account for mysql idisosyncracies }
     self.RenderSourceCodeToFile(TemplatePath + '/Lazarus/DataModule/MySQLQueryModule.pas.mustache', ProjectPath + '/MySqlQueryModule.pas', ModelString);
     self.RenderSourceCodeToFile(TemplatePath + '/Lazarus/DataModule/MySQLQueryModule.lfm.mustache', ProjectPath + '/MySqlQueryModule.lfm', ModelString);

end;

procedure TLazBuildController.RenderSourceCodeToFile(TemplatePath:String; TargetFilePath:String; TemplateData:String);
var
    TemplateContents : TStringList;
    TemplateOutput: String;
    ParsedTemplate: TSynMustache;
    TargetStream : TFileStream;

begin
  try
     TemplateContents:=TStringList.Create;
     TemplateContents.LoadFromFile(TemplatePath);
     ParsedTemplate := TSynMustache.Parse(TemplateContents.Text);
     TemplateOutput:=ParsedTemplate.RenderJSON(TemplateData);
     TargetStream := TFileStream.Create(TargetFilePath, fmCreate);
     TargetStream.Write(TemplateOutput[1], length(TemplateOutput));
  finally
    if Assigned(TemplateContents) then
       TemplateContents.Free;

    if Assigned(TargetStream) then
        TargetStream.Free;
  end;
end;



end.

