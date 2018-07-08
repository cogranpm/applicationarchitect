unit BuildControllerLoadUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, SysUtils, StdCtrls, fpjson, jsonparser, db, sqldb, appinterfacesunit,
  BuildEntityDTOUnit, BuildHelper, EntityFormatterUnit, Dialogs,  contnrs,
  uPSCompiler, uPSR_std, uPSC_std, uPSR_classes, uPSC_classes, uPSRuntime,
   uPSComponent,uPSDisassembly,uPSR_dateutils,uPSC_dateutils,uPSC_forms,uPSR_forms,uPSC_controls,uPSR_controls,
   uPSR_dll,uPSC_dll, uPSUtils, uPSR_DB, uPSC_DB;


type
  TBuildControllerLoader = class(TObject)

  private
       FIterateEntities:Boolean;
       FIterateForms:Boolean;
       FLogControl:TMemo;
       FParameters:TStringList;
  protected
       FDataProvider : IDataProvider;
       FBuildHelper:TBuildHelper;
  private
       function CompileAndExecuteScript(PScriptBody:String):Boolean;
       procedure OnCompile(Sender: TPSScript);
       procedure OnExecute(Sender: TPSScript);
       procedure OnCompImport(Sender: TObject;  compiler: TIFPSPascalcompiler);
       procedure OnExecImport(Sender: TObject; se: TPSExec; ClassImporter: TPSRuntimeClassImporter);
       procedure CEVerifyProc(Sender: TPSScript; Proc: TPSInternalProcedure; const Decl: String;var Error: Boolean);
       function GetCompilerMessages(PSScript:TPSScript):String;
  public
       constructor Create();
       destructor Destroy(); override;
       procedure Execute(var PDataProvider : IDataProvider; PBuildId : LongInt; PLoadOption:RBuildControllerLoadOption);
       procedure CompileScript(var PDataProvider : IDataProvider; PScriptID:LongInt);
       property LogControl:TMemo read FLogControl write FLogControl;
  protected
       procedure SetIterateEntities(PFlag:Boolean);
       procedure SetIterateForms(PFlag:Boolean);
       procedure WriteLog(Message:String);
  end;

implementation

constructor TBuildControllerLoader.Create();
begin
  FBuildHelper:=TBuildHelper.Create();
  FParameters:=TStringList.Create;
  FIterateEntities:=False;
  FIterateForms:=False;

end;

destructor TBuildControllerLoader.Destroy();
begin
  if Assigned(FBuildHelper) then
     FreeAndNil(FBuildHelper);

  if Assigned(FLogControl) then
     FreeAndNil(FLogControl);

  if Assigned(FParameters) then
     FreeAndNil(FParameters);

  inherited;
end;

procedure TBuildControllerLoader.SetIterateEntities(PFlag:Boolean);
begin
    self.FIterateEntities:=PFlag;
end;

procedure TBuildControllerLoader.SetIterateForms(PFlag:Boolean);
begin
    self.FIterateForms:=PFlag;
end;

procedure TBuildControllerLoader.WriteLog(Message:String);
begin
    if Assigned(FLogControl) then
    begin
       FLogControl.Append(Message);
    end;
end;

procedure TBuildControllerLoader.CompileScript(var PDataProvider : IDataProvider; PScriptID:LongInt);
var
  BuildScriptQuery:TSQLQuery;
   Rslt: Boolean;
   FScr: TPSScript;
begin
  BuildScriptQuery:=PDataProvider.GetBuildScriptByID();
  BuildScriptQuery.Active:=False;
  BuildScriptQuery.ParamByName('BuildScriptID').AsLargeInt:=PScriptID;
  BuildScriptQuery.Active:=True;

  FScr:=TPSScript.Create(Nil);
  FScr.OnCompile:=@OnCompile;
  FScr.OnExecImport:=@OnExecImport;
  FScr.OnCompImport:=@OnCompImport;
  FScr.OnVerifyProc:=@CEVerifyProc;

  FScr.Script.Add(BuildScriptQuery.FieldByName('Script').AsString);
  try
    Rslt:=FScr.Compile;
    if not Rslt then
    begin
      MessageDlg('Error', self.GetCompilerMessages(FScr), mtError, [mbOk], 0);
    end
    else
    begin
         ShowMessage('Script compiled successfully');
    end;
  finally
    FreeAndNil(FScr);
  end;
end;

procedure TBuildControllerLoader.Execute(var PDataProvider : IDataProvider; PBuildId : LongInt; PLoadOption:RBuildControllerLoadOption);
{
 sets up the data for the scripts
 loads all scripts for the controller and executes them
 --to do
      finish off the build helper allowing expansion of mustache template and saving to file
      expose the build helper class to the scripts
 }
var
    BuildScriptQuery:TSQLQuery;
    ScriptParametersQuery:TSQLQuery;
    BuildScript:String;
    CompiledOK:Boolean;
    BuildScriptControllerId:LongInt;
begin
  FBuildHelper.LoadBuildData(PDataProvider, PBuildId);
  if PLoadOption.ScriptOnly then
  begin
     BuildScriptQuery:=PDataProvider.GetBuildScriptByID();
     BuildScriptQuery.Active:=False;
     BuildScriptQuery.ParamByName('BuildScriptID').AsLargeInt:=PLoadOption.BuildScriptId;
     BuildScriptQuery.Active:=True;
  end
  else
  begin
    BuildScriptQuery:=PDataProvider.GetBuildScriptsForController();
    BuildScriptQuery.Active:=False;
    BuildScriptQuery.ParamByName('BuildControllerId').AsLargeInt:=PLoadOption.BuildControllerId;
    BuildScriptQuery.Active:=True;
  end;

  ScriptParametersQuery:=PDataProvider.GetBuildScriptParameters();

  while not BuildScriptQuery.EOF do
  begin
    //get the build script parameters based on BuildScriptControllerID from BuildScriptQuery object
    if not PLoadOption.ScriptOnly then
    begin
       BuildScriptControllerId:=BuildScriptQuery.FieldByName('BUILDCONTROLLERSCRIPTID').AsLargeInt;
       ScriptParametersQuery.Active:=False;
       ScriptParametersQuery.ParamByName('BUILDCONTROLLERSCRIPTID').AsLargeInt:=BuildScriptControllerId;
       ScriptParametersQuery.Active:=True;
       while not ScriptParametersQuery.EOF do
       begin
         //FParameters.Add(ScriptParametersQuery.FieldByName('Name').AsString, ScriptParametersQuery.FieldByName('Value').AsString);
         FParameters.Add(ScriptParametersQuery.FieldByName('Name').AsString + '=' + ScriptParametersQuery.FieldByName('Value').AsString);
         ScriptParametersQuery.Next;
       end;
    end;

      Application.ProcessMessages;
      BuildScript:=BuildScriptQuery.FieldByName('Script').AsString;
      CompiledOK:= self.CompileAndExecuteScript(BuildScript);
      FParameters.Clear;
      BuildScriptQuery.Next;
  end;
end;

function TBuildControllerLoader.CompileAndExecuteScript(PScriptBody:String):Boolean;
var
   Rslt: Boolean;
   FScr: TPSScript;

begin

  FScr:=TPSScript.Create(Nil);
  FScr.OnCompile:=@OnCompile;
  FScr.OnExecImport:=@OnExecImport;
  FScr.OnCompImport:=@OnCompImport;
  FScr.OnVerifyProc:=@CEVerifyProc;
  FScr.OnExecute:=@OnExecute;

  FScr.Script.Add(PScriptBody);
  try
    Rslt:=FScr.Compile;
    {set up the variables exposed to scripts }
    FScr.SetVarToInstance('Helper', Self.FBuildHelper);
    FScr.SetVarToInstance('Parameters', self.FParameters);

    if Rslt then
       begin
         {run the script and then run the callbacks}
         Rslt:=FScr.Execute;
         if not Rslt then
            MessageDlg('Error', FScr.ExecErrorToString, mtError, [mbOk], 1)
         else
         begin
              if FIterateEntities then
              begin
                self.FBuildHelper.EntityFormatter.IterateModel(FScr);
              end;
         end;
       end
    else
    begin
      MessageDlg('Error', self.GetCompilerMessages(FScr), mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(FScr);
  end;
 CompileAndExecuteScript:=Rslt;

end;

function TBuildControllerLoader.GetCompilerMessages(PSScript:TPSScript):String;
var
   Counter:Integer;
   Messages:String;
begin
    Messages:='';
    for Counter := 0 to PSScript.CompilerMessageCount - 1 do
    begin
      if (PSScript.CompilerMessages[Counter] is TIFPSPascalCompilerError) then
      begin
           Messages:=Messages + PSScript.CompilerErrorToStr(Counter);
      end;
    end;
    GetCompilerMessages:=Messages;
end;

procedure TBuildControllerLoader.OnCompile(Sender: TPSScript);
begin
  {exposing a function to the script engine}
  Sender.AddMethod(Self, @TBuildControllerLoader.SetIterateEntities, 'procedure SetIterateEntities(PFlag:Boolean);');
  Sender.AddMethod(Self, @TBuildControllerLoader.SetIterateForms, 'procedure SetIterateForms(PFlag:Boolean);');
  Sender.AddMethod(Self, @TBuildControllerLoader.WriteLog, 'procedure WriteLog(Message:String);');
end;


procedure TBuildControllerLoader.OnExecute(Sender: TPSScript);
begin
  //sender.SetVarToInstance('Helper', Self.FBuildHelper);
end;

procedure TBuildControllerLoader.OnCompImport(Sender: TObject;  compiler: TIFPSPascalcompiler);
var
  BuildEntityClassDef: TPSCompileTimeClass;
  BuildHelperClassDef: TPSCompileTimeClass;
  EntityFormatterClassDef: TPSCompileTimeClass;
  JSONDataClassDef: TPSCompileTimeClass;
  JSONObjectClassDef: TPSCompileTimeClass;
  TJSONStringTypeDef: TPSType;
begin

   SIRegister_Std(compiler);
   SIRegister_Classes(compiler,true);
   SIRegister_Forms(compiler);
   SIRegister_Controls(compiler);
   SIRegister_DB(compiler);

   {system functions not exposed be default }
   compiler.AddDelphiFunction('function CreateDir(Const NewDir:String):Boolean;');
   compiler.AddDelphiFunction('procedure ShowMessage(const aMsg: string);');

   {json}
   JSONDataClassDef:=compiler.AddClass(Compiler.FindClass('TObject'), TJSONData);
   JSONObjectClassDef:=compiler.AddClass(Compiler.FindClass('TJSONData'), TJSONObject);
   JSONObjectClassDef.RegisterMethod('Function Get(Const AName : String) : Variant;');


   {build entity}
   BuildEntityClassDef := compiler.AddClass(Compiler.FindClass('TObject'), TBuildEntityDTO);
   BuildEntityClassDef.RegisterMethod('function GetModelData():TDataSet;');
   BuildEntityClassDef.RegisterMethod('function GetRelationData():TDataSet;');
   BuildEntityClassDef.RegisterMethod('function GetBuildData():TDataSet;');

   {entity formatter}
   EntityFormatterClassDef:=compiler.AddClass(Compiler.FindClass('TObject'), TEntityFormatter);
   EntityFormatterClassDef.RegisterMethod('function GetModel(var BuildDataDTO:TBuildEntityDTO):TJSONObject;');
   EntityFormatterClassDef.RegisterMethod('function GetRelationByRelationId(RelationId:LongInt; IncludeAttributes:Boolean; IncludeRelatedEntities:Boolean):TJSONObject;');


   {build helper}
   BuildHelperClassDef := compiler.AddClass(Compiler.FindClass('TObject'), TBuildHelper);
   BuildHelperClassDef.RegisterMethod('function GetBuildData():TBuildEntityDTO;');
   BuildHelperClassDef.RegisterMethod('function FormatJSON(JSONData:TJSONData):AnsiString;');
   BuildHelperClassDef.RegisterMethod('procedure RenderTemplateToFile(TemplateName:String; TargetFilePath:String; TemplateData:String);');
   BuildHelperClassDef.RegisterMethod('function RenderTemplate(TemplateName:String; TemplateData:String):String;');
   BuildHelperClassDef.RegisterMethod('function SaveStringToFile(PData:String; PFilePath: AnsiString): boolean;');
   BuildHelperClassDef.RegisterMethod('function JsonAddBoolean(AData: TJSONObject; const AName: AnsiString; AValue: Boolean): Integer;');
   BuildHelperClassDef.RegisterMethod('function JsonAddString(AData: TJSONObject; const AName: AnsiString; AValue: String): Integer;');
   BuildHelperClassDef.RegisterMethod('function GetEntityFormatter():TEntityFormatter');

   BuildHelperClassDef.RegisterMethod('function JsonGetBoolean(AData: TJSONObject; Const AName : String; ADefault : Boolean) : Boolean;');
   BuildHelperClassDef.RegisterMethod('function JsonGetAsJSON(AData: TJSONObject; Const AName : String; ADefault : TJSONObject) : TJSONObject;');
   BuildHelperClassDef.RegisterMethod('function JsonGetAsString(AData: TJSONObject; Const AName : String; ADefault : TJSONStringType) : TJSONStringType;');

   compiler.AddVariable('Helper', Compiler.FindType('TBuildHelper'));
   compiler.AddVariable('Parameters', Compiler.FindType('TStringList'));
//   compiler.AddVariable('Parameters', Compiler.FindType('TFPStringHashTable'));
end;

procedure TBuildControllerLoader.OnExecImport(Sender: TObject; se: TPSExec; ClassImporter: TPSRuntimeClassImporter);
var
  BuildEntityRuntimeClassDef: TPSRuntimeClass;
  BuildHelperRuntimeClassDef: TPSRuntimeClass;
  EntityFormatterRuntimeClassDef: TPSRuntimeClass;
  JSONDataRuntimeClassDef: TPSRuntimeClass;
  JSONObjectRuntimeClassDef: TPSRuntimeClass;

begin
   RIRegister_Std(ClassImporter);
   RIRegister_Classes(ClassImporter,true);
   RIRegister_Forms(ClassImporter);
   RIRegister_Controls(ClassImporter);
   RegisterDateTimeLibrary_R(se);
   RegisterDLLRuntime(se);
   RIRegister_DB(ClassImporter);


   {functions }
   se.RegisterDelphiFunction(@SysUtils.CreateDir, 'CreateDir', cdRegister);
   se.RegisterDelphiFunction(@Dialogs.ShowMessage, 'ShowMessage', cdRegister);

   {class defs}
   JSONDataRuntimeClassDef:=ClassImporter.Add(TJSONData);
   JSONObjectRuntimeClassDef:=ClassImporter.Add(TJSONObject);
   JSONObjectRuntimeClassDef.RegisterMethod(@TJSONObject.Get, 'Get');


   BuildEntityRuntimeClassDef := ClassImporter.Add(TBuildEntityDTO);
   BuildEntityRuntimeClassDef.RegisterMethod(@TBuildEntityDTO.GetModelData, 'GetModelData');
   BuildEntityRuntimeClassDef.RegisterMethod(@TBuildEntityDTO.GetRelationData, 'GetRelationData');
   BuildEntityRuntimeClassDef.RegisterMethod(@TBuildEntityDTO.GetBuildData, 'GetBuildData');

   EntityFormatterRuntimeClassDef := ClassImporter.Add(TEntityFormatter);
   EntityFormatterRuntimeClassDef.RegisterMethod(@TEntityFormatter.GetModel, 'GetModel');
   EntityFormatterRuntimeClassDef.RegisterMethod(@TEntityFormatter.GetRelationByRelationId, 'GetRelationByRelationId');


   BuildHelperRuntimeClassDef := ClassImporter.Add(TBuildHelper);
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.GetBuildData, 'GetBuildData');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.FormatJSON, 'FormatJSON');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.RenderTemplateToFile, 'RenderTemplateToFile');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.RenderTemplate, 'RenderTemplate');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.SaveStringToFile, 'SaveStringToFile');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.JsonAddBoolean, 'JsonAddBoolean');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.JsonAddString, 'JsonAddString');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.GetEntityFormatter, 'GetEntityFormatter');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.JsonGetBoolean, 'JsonGetBoolean');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.JsonGetAsJSON, 'JsonGetAsJSON');
   BuildHelperRuntimeClassDef.RegisterMethod(@TBuildHelper.JsonGetAsString, 'JsonGetAsString');

end;


procedure TBuildControllerLoader.CEVerifyProc(Sender: TPSScript; Proc: TPSInternalProcedure; const Decl: String;var Error: Boolean);
begin
   if Proc.Name = 'FTest' then begin
      if not ExportCheck(Sender.Comp, Proc, [btS32], [pmIn, pmIn]) then
      begin
        Sender.Comp.MakeError('', ecCustomError, 'Function header for TestFunction does not match.');
        Error := True;
      end
      else begin
        Error := False;
      end;
    end
    else
      Error := False;
end;



{
procedure TBuildControllerLoader.RunScript(var PDataProvider : IDataProvider; PScriptBody: String);

{
var
  { pascal script
  FScr: TPSScript;

  }

  {manually compiling in seperate step, allows to add my classes manually
  can't get the unit importer to work as it is a delphi thing }
  Rslt: Boolean;
  Compiler: TPSPascalCompiler;
  Bytecode: AnsiString;
  Messages: AnsiString;
  I: Integer;
  Runtime: TPSExec;
  ClassImporter: TPSRuntimeClassImporter;

  ModelId:LongInt;
  }
begin
   {
  {set up the data, temporary, use dto instead }
  FDataProvider:=PDataProvider;
  FModels:=FDataProvider.GetModels();
  FBuildEntity:=TBuildEntityDTO.Create();
  FBuildEntity.BuildData:=FDataProvider.GetLoadBuild();
  FBuildEntity.ModelData:=FDataProvider.GetLoadModel();
  FBuildEntity.RelationData:=PDataProvider.GetRelationsByModel();
  FBuildEntity.AttributeData:=PDataProvider.GetAttributes();
  FBuildEntity.ChildAssociationData:=PDataProvider.GetChildAssociations();
  FBuildEntity.ParentAssociationData:=PDataProvider.GetParentAssociations();
  FBuildEntity.LoadRelationData:=PDataProvider.GetLoadRelation();

  {which build are we generating}
  FBuildEntity.BuildData.Active:=False;
  FBuildEntity.BuildData.ParamByName('BuildId').AsLargeInt:=2;
  FBuildEntity.BuildData.Active:=True;
//  ProjectPath:=BuildDataDTO.BuildData.FieldByName('ProjectPath').AsString;
  ModelId:=FBuildEntity.BuildData.FieldByName('MODELTOBUILD').AsLargeInt;

  {which model is associated with the build}
  FBuildEntity.ModelData.Active:=False;
  FBuildEntity.ModelData.ParamByName('ModelId').AsLargeInt:=ModelId;
  FBuildEntity.ModelData.Active:=True;

  {which relations are associated with the model}
  FBuildEntity.RelationData.Active:=False;
  FBuildEntity.RelationData.ParamByName('ModelId').AsLargeInt:=ModelId;
  FBuildEntity.RelationData.Active:=True;

  {
  FScr:=TPSScript.Create(Nil);
  FScr.OnCompile:=@OnCompile;
  FScr.OnExecImport:=@OnExecImport;
  FScr.OnCompImport:=@OnCompImport;
  FScr.OnVerifyProc:=@CEVerifyProc;
  FScr.OnExecute:=@OnExecute;
  }


  Runtime := TPSExec.Create;
  ClassImporter := TPSRuntimeClassImporter.CreateAndRegister(Runtime, false);
  Compiler:=TPSPascalCompiler.Create;
  Compiler.OnUses:=@ExtendCompiler;

  try
    Rslt:=Compiler.Compile(PScriptBody) and Compiler.GetOutput(Bytecode);

    if not Rslt then
    begin
      for I := 0 to Compiler.MsgCount - 1 do
        if Length(Messages) = 0 then
          Messages := Compiler.Msg[I].MessageToString
        else
          Messages := Messages + #13#10 + Compiler.Msg[I].MessageToString;
      ShowMessage(Messages);
    end;
    ExtendRuntime(Runtime, ClassImporter);
    Rslt := Runtime.LoadData(Bytecode)
          and Runtime.RunScript
          and (Runtime.ExceptionCode = erNoError);
    if not Rslt then
    begin
      Messages :=  PSErrorToString(Runtime.LastEx, '');
      ShowMessage(Messages);
    end;

     {
    FScr.Script.Add(PScriptBody);
    Rslt:=FScr.Compile;
    if Rslt then
       begin
         Rslt:=FScr.Execute;
         if not Rslt then
            MessageDlg('Error', FScr.ExecErrorToString, mtError, [mbOk], 1);
       end
    else
    begin
      MessageDlg('Error', FScr.CompilerErrorToStr(0), mtError, [mbOk], 0);
    end;
    }

  finally
     //  FScr.Free;
       Compiler.Free;
       ClassImporter.Free;
       Runtime.Free;
  end;
  }

end;




procedure TBuildControllerLoader.DoTest(var DataProvider : IDataProvider);
var
  { pascal script }
  FScr: TPSScript;
  daScript : String;
  Rslt: Boolean;
  Meth: TTestFunction;
begin

   {pascal script
   FScr:=TPSScript.Create(Nil);
   FScr.OnCompile:=@OnCompile;
   FScr.OnExecImport:=@OnExecImport;
   FScr.OnCompImport:=@OnCompImport;
   FScr.OnVerifyProc:=@CEVerifyProc;

   daScript:='procedure FTest(PCount:Integer); var ITest:Integer; begin ITest:=0; Writes(IntToStr(PCount)); end; BEGIN Writes(' + '''unfathomable''' +'); RaiseHell();  END.';
   FScr.Script.Add(daScript);
   Rslt:=FScr.Compile;
   if Rslt then
      begin

        Meth:=TTestFunction(FScr.GetProcMethod('FTest'));
        if Meth = Nil then
           MessageDlg('Error', 'Function not found', mtError, [mbOK], 0);
        Meth(15);
        Rslt:=FScr.Execute;
        if not Rslt then
           MessageDlg('Error', FScr.CompilerErrorToStr(0), mtError, [mbOk], 0);
      end
   else
   begin
     MessageDlg('Error', FScr.CompilerErrorToStr(0), mtError, [mbOk], 0);
   end;
  FScr.Free;
  }
end;
}

end.

