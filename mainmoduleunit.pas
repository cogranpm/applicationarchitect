unit mainmoduleunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FrmMainUnit, appinterfacesunit, FirebirdDataProvider, AppSettingsUnit, Dialogs, CommCtrl, ComCtrls, unitDatabaseSettings, Forms, Controls,
  NavigationNodeUnit, MySQLDataProvider, LazBuildController, frmModels, ScreenFamilyViewModel, ValEdit, AssociationTree, unitFrmPropertyType, unitfrmListHeader,
  unitFrmPropertyGroup, unitFrmMasterCategory, frmMasterProperty, MasterPropertyViewModel, frmScripting, BuildControllerLoadUnit, BuildLookup, MasterPropertyHelper,
  SettingsDBModule, frmModelImporter, fraMappings;

type
  TMainModule = class(TInterfacedObject, IMainModule)
  private
    { private declarations }
    FMainForm : TfrmMain;
    FActiveFrame : TFrame;

    {data providers}
    { should we try just replacing this with a TDataModule field and set according to which database }
    FireBirdProvider : TFirebirdDataProvider;
    FMySqlProvider : TMySQLDataProvider;

    FDataProvider : IDataProvider;
    FAppSettings : TAppSettings;
    FSettingsDB: TSettingsDB;

    {view models}
    FScreenFamilyVM:TScreenFamilyViewModel;
    FMasterPropertyVM:TMasterPropertyViewModel;

    const MODEL_FORM_FORMS_KEY:string = 'Forms';
    const TREE_MENU_PROPERTY_TYPE:string = 'Property Type';
    const TREE_MENU_PROPERTY_GROUP:string = 'Property Group';
    const TREE_MENU_MASTER_PROPERTY:string = 'Master Property';
    const TREE_MENU_MASTER_CATEGORY:string = 'Master Category';
    const TREE_MENU_SCRIPTING:string = 'Scripting';
    const TREE_MENU_LISTS:string = 'Lists';
    const TREE_MENU_MAPPING:string = 'Mappings';


  public
    { public declarations }
    constructor Create();
    destructor Destroy(); override;
    procedure Init(MainForm : TfrmMain);


    {event handlers }
    procedure OnSetDatabase();
    procedure OnNew();
    procedure OnDelete();
    procedure OnSave();
    procedure OnNewModel();
    procedure OnDeleteModel();
    procedure OnQuit();
    procedure OnPostModel(PName : String);
    procedure OnSelectModel(var Node: TTreeNode);
    procedure OnBuild();
    procedure OnImportModel();

    { models form event handlers}
    procedure OnChangedSelectedFormEntity(Sender:TObject; Node:TTreeNode);
    procedure OnFormPropertySaveClick(Sender:TObject);
    procedure OnModelsFormPostButtonClick(Sender:TObject; PName:String);

    {data provider event handlers}
    procedure OnRelationAfterScroll(DataSet:TDataSet);
    procedure OnAttributeAfterScroll(DataSet:TDataSet);
    procedure OnAssociationAfterScroll(DataSet:TDataSet);
    procedure OnBuildAfterScroll(DataSet:TDataSet);
    procedure OnScreenFamilyAfterScroll(DataSet:TDataSet);
    procedure OnBuildControllerAfterScroll(DataSet:TDataSet);

  private
    procedure RenderNavigationModels();
    procedure RenderNavigation();
    procedure Connect();
    procedure LoadModelFrame(PModelId : LongInt);
    procedure HandleError(Sender: TObject; E: Exception);
    function GetLoadedFrameInterface():IAppFrame;

    procedure MemoScriptChange(Sender: TObject);
    procedure BuildScriptAfterScroll(DataSet: TDataSet);
    procedure TemplateAfterScroll(DataSet:TDataSet);
    procedure TemplateScriptChange(Sender: TObject);

    procedure RunBuildControllerTest(Sender: TObject);
    procedure RunBuildScriptTest(Sender: TObject);
    procedure OnCompileScript(Sender: TObject);
  end;

implementation


constructor TMainModule.Create();
begin
  FAppSettings:=TAppSettings.Create();
  FSettingsDB:=TSettingsDB.Create(Nil);
  inherited.Create();
end;


destructor TMainModule.Destroy();
begin
  try
    if Assigned(FScreenFamilyVM) then
       FreeAndNil(FScreenFamilyVM);

    if Assigned(FMasterPropertyVM) then
       FreeAndNil(FMasterPropertyVM);

    if Assigned(FDataProvider) then
       FreeAndNil(FDataProvider);

    if Assigned(FAppSettings) then
       FAppSettings.Free;

    if Assigned(FSettingsDB) then
       FSettingsDB.Free;

  finally
    inherited;
  end;
end;


{ private methods }

procedure TMainModule.RenderNavigation();
var
ModelRootNode : TTreeNode;
RootNode : TTreeNode;
RootNodeData : TNavigationNode;
MenuNodeData : TNavigationNode;
begin
  while FMainForm.navigationTree.Items.Count > 0 do
  begin
       FMainForm.navigationTree.Items.Delete(FMainForm.navigationTree.Items[FMainForm.navigationTree.Items.Count - 1]);
  end;

  RootNodeData:=TNavigationNode.Create(navigationNodeType.ModelRoot, 0);
  MenuNodeData:=TNavigationNode.Create(navigationNodeType.Menu, 0);

  ModelRootNode:= FMainForm.navigationTree.Items.Add(Nil, 'Model');
  ModelRootNode.ImageIndex:=ord(mainImageIndex.miTreeModel);
  ModelRootNode.SelectedIndex:=ord(mainImageIndex.miTreeModel);
  ModelRootNode.Data:=RootNodeData;
  self.RenderNavigationModels();

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_SCRIPTING);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_MASTER_PROPERTY);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_PROPERTY_TYPE);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_MASTER_CATEGORY);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_PROPERTY_GROUP);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_LISTS);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;

  RootNode:= FMainForm.navigationTree.Items.Add(Nil, TREE_MENU_MAPPING);
  RootNode.ImageIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.SelectedIndex:=ord(mainImageIndex.miTreeMenu);
  RootNode.Data:=MenuNodeData;


end;

procedure TMainModule.RenderNavigationModels();

var
   ModelNode : TTreeNode;
   NodeData : TNavigationNode;
   ModelRootNode : TTreeNode;
   ModelQuery : TSQLQuery;

begin

  ModelRootNode:=FMainForm.navigationTree.Items[0];
  if not Assigned(ModelRootNode) then
     exit;

  while ModelRootNode.HasChildren do
  begin
       FMainForm.navigationTree.Items.Delete(ModelRootNode.GetLastChild);
  end;

  ModelQuery:= FDataProvider.GetModels();
  ModelQuery.Active:=True;
  ModelQuery.Refresh;
  while not ModelQuery.EOF do
  begin
       ModelNode:=FMainForm.navigationTree.Items.AddChild(ModelRootNode, ModelQuery.FieldByName('Name').AsString);
       ModelNode.ImageIndex:=3;
       ModelNode.SelectedIndex:=3;
       NodeData:=TNavigationNode.Create(navigationNodeType.ModelEntity, ModelQuery.FieldByName('ModelId').AsLongint);
       ModelNode.Data:=NodeData;
       ModelQuery.Next;
  end;
  ModelQuery.Active:=False;

end;

procedure TMainModule.Init(MainForm : TfrmMain);
var
  DBForm : TfrmDatabaseSettings;
  DBSettingsFormResult: TModalResult;

begin
  FMainForm:=MainForm;
  Application.OnException:=@self.HandleError;
  FAppSettings.ReadSettings();
  if FAppSettings.DatabaseName = '' then
  begin
       DBForm:=TfrmDatabaseSettings.Create(FMainForm, FAppSettings);
       DBSettingsFormResult:=DBForm.ShowModal;
       if DBSettingsFormResult = mrOK then
       begin
          FAppSettings.WriteSettings();
       end;
  end;
  if FAppSettings.DatabaseName = '' then
  begin
     MessageDlg('No Database Selected', 'No Database has been selected, Application will exit.', mtInformation, [mbOK], 0);
  end
  else
  begin
       try
         self.Connect();
       Except
         On E: Exception do
            begin
            ShowMessage('Error connecting: ' + E.Message);
            Exit;
            end;
       end;

    FScreenFamilyVM:=TScreenFamilyViewModel.Create();
    FMasterPropertyVM:=TMasterPropertyViewModel.Create();
    self.RenderNavigation();
  end;

end;

procedure TMainModule.HandleError(Sender: TObject; E: Exception);
begin
   ShowMessage(E.Message);
end;

procedure TMainModule.Connect();
begin

  { if firebird then }

  try
    if FAppSettings.DatabaseType = edbFireBirdEmbedded then
    begin
      FireBirdProvider:=TFirebirdDataProvider.Create();
      FDataProvider:=FireBirdProvider;
      FDataProvider.Connect(self.FAppSettings.DatabaseName, self.FAppSettings.DatabaseUser, self.FAppSettings.DatabasePassword);
    end
    else if FAppSettings.DatabaseType = edbMySQL then
    begin
      FMySqlProvider:=TMySQLDataProvider.Create();
      FDataProvider:=FMySqlProvider;
      FDataProvider.Connect(self.FAppSettings.DatabaseHost, self.FAppSettings.DatabasePort, self.FAppSettings.DatabaseName, self.FAppSettings.DatabaseUser, self.FAppSettings.DatabasePassword);
    end;
  Except
    On E: Exception do raise;
  end;


  FDataProvider.OnRelationAfterScroll:=@self.OnRelationAfterScroll;
  FDataProvider.OnScreenFamilyAfterScroll:=@self.OnScreenFamilyAfterScroll;
  FDataProvider.GetAttributes().AfterScroll:=@self.OnAttributeAfterScroll;
  FDataProvider.GetAssociations().AfterScroll:=@self.OnAssociationAfterScroll;
  FDataProvider.GetBuilds().AfterScroll:=@self.OnBuildAfterScroll;
  FDataProvider.GetBuildController().AfterScroll:=@self.OnBuildControllerAfterScroll;
end;



{event handlers}
procedure TMainModule.OnSetDatabase();
var
  DBForm : TfrmDatabaseSettings;
  DBSettingsFormResult : TModalResult;
begin

  Try

    DBForm:=TfrmDatabaseSettings.Create(FMainForm, FAppSettings);
    DBSettingsFormResult:=DBForm.ShowModal;
    if DBSettingsFormResult = mrOK then
       FAppSettings.WriteSettings();
    DBForm.Free;

    if Assigned(self.FActiveFrame) then
    begin
       FMainForm.pnlMain.RemoveControl(self.FActiveFrame);
       self.FActiveFrame.Free;
       self.FActiveFrame:=Nil;
    end;

    if FAppSettings.DatabaseName = '' then
    begin
       MessageDlg('No Database Selected', 'No Database has been selected, Application will exit.', mtInformation, [mbOK], 0);
    end;

    self.Connect();
    self.RenderNavigation();

  Except
    On Exception do ShowMessage('Connection failed') ;

  end;

end;

procedure TMainModule.OnNew();
begin

end;

procedure TMainModule.OnDelete();
begin

end;

procedure TMainModule.OnNewModel();
var
  NewNode : TTreeNode;
  NewNodeData : TNavigationNode;
begin
     NewNodeData:=TNavigationNode.Create(navigationNodeType.NewModelEntity, 0);
     NewNode:=FMainForm.navigationTree.Items.AddChild(FMainForm.navigationTree.Items[0], 'New Model');
     NewNode.ImageIndex:=3;
     NewNode.SelectedIndex:=3;
     NewNode.Data:=NewNodeData;
     NewNode.EditText;
end;

procedure TMainModule.OnDeleteModel();
var
  NodeData : TNavigationNode;
begin
  if not Assigned(FMainForm.navigationTree.Selected) then
     exit;

  NodeData:=TNavigationNode(FMainForm.navigationTree.Selected.Data);
  if NodeData.FType = navigationNodeType.ModelEntity then
  begin
    if MessageDlg('Delete Model ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then exit;
    FDataProvider.DeleteModel(NodeData.FKey);
    self.RenderNavigationModels();
    FMainForm.navigationTree.Items[0].Expanded:=True;
  end;
end;

procedure TMainModule.OnSave();
begin

end;

procedure TMainModule.OnQuit();
begin

  {
  try
    if Assigned(FScreenFamilyVM) then
       FreeAndNil(FScreenFamilyVM);

    if Assigned(FMasterPropertyVM) then
       FreeAndNil(FMasterPropertyVM);

    if Assigned(FDataProvider) then
       FreeAndNil(FDataProvider);

    if Assigned(FAppSettings) then
       FAppSettings.Free;

  finally

  end;
  }


  Application.Terminate;
end;

procedure TMainModule.OnPostModel(PName : String);
begin
  FDataProvider.AppendModel(PName);
  self.RenderNavigationModels();
  FMainForm.navigationTree.Items[0].Expanded:=True;
end;

procedure TMainModule.OnImportModel();
var
  DBForm : TfrmDatabaseSettings;
  DBSettingsFormResult : TModalResult;
  DBSettings:TAppSettings;
  ImportForm: TfrmModelImporter;
begin

    DBSettings:=TAppSettings.Create();

    //temp
    DBSettings.DatabaseType:=edbMySQL;
    DBSettings.DatabasePassword:='reddingo';
    DBSettings.DatabaseUser:='root';
    DBSettings.DatabaseName:='cogran';
    DBSettings.DatabasePort:=3308;
    DBSettings.DatabaseHost:='kron1';
    //temp
    FDataProvider.GetModellookup().Active:=True;

    DBForm:=TfrmDatabaseSettings.Create(FMainForm, DBSettings);
    DBSettingsFormResult:=DBForm.ShowModal;
    if DBSettingsFormResult = mrOK then
    begin
        ImportForm:=TfrmModelImporter.Create(FMainForm, DBSettings, FDataProvider, FDataProvider.GetModellookup());
        ImportForm.Connect();
        DBSettingsFormResult:=ImportForm.ShowModal;
        ImportForm.Free;
    end;
    DBForm.Free;
    FDataProvider.GetModellookup().Active:=False;

end;

procedure TMainModule.OnSelectModel(var Node: TTreeNode);
var
  NodeData : TNavigationNode;
  LoadedFrame:IAppFrame;
begin
  if not Assigned(Node) then exit;
  NodeData:=TNavigationNode(Node.Data);
  if NodeData.FType = navigationNodeType.ModelEntity then
  begin
    self.LoadModelFrame(NodeData.FKey);
  end
  else if NodeData.FType = navigationNodeType.Menu then
  begin


    if Assigned(self.FActiveFrame) then
    begin
       FMainForm.pnlMain.RemoveControl(self.FActiveFrame);
       self.FActiveFrame.Free;
       self.FActiveFrame:=Nil;
    end;
    {load the appropriate frame in the main panel }
    if Node.Text = TREE_MENU_PROPERTY_TYPE then
    begin
     FDataProvider.GetPropertyType().Active:=True;
     self.FActiveFrame:=TfrmPropertyType.Create(self.FMainForm);
     self.FActiveFrame.parent := FMainForm.pnlMain;
     self.FActiveFrame.Align:=alClient;
     LoadedFrame:=self.GetLoadedFrameInterface();
     LoadedFrame.SetupDataSource('PropertyType', FDataProvider.GetPropertytypeDataSource());
    end
    else if Node.Text = TREE_MENU_LISTS then
    begin
      FDataProvider.GetListHeader().Active:=True;
      FDataProvider.GetListDetail().Active:=True;
      self.FActiveFrame:=TfrmListHeader.Create(self.FMainForm);
      self.FActiveFrame.parent := FMainForm.pnlMain;
      self.FActiveFrame.Align:=alClient;
      LoadedFrame:=self.GetLoadedFrameInterface();
      LoadedFrame.SetupDataSource('ListHeader', FDataProvider.GetListHeaderDataSource());
      LoadedFrame.SetupDataSource('ListDetail', FDataProvider.GetListDetailDataSource());
    end
    else if Node.Text = TREE_MENU_PROPERTY_GROUP then
    begin
     FDataProvider.GetPropertyGroup().Active:=True;
     self.FActiveFrame:=TfrmPropertyGroup.Create(self.FMainForm);
     self.FActiveFrame.parent := FMainForm.pnlMain;
     self.FActiveFrame.Align:=alClient;
     LoadedFrame:=self.GetLoadedFrameInterface();
     LoadedFrame.SetupDataSource('PropertyGroup', FDataProvider.GetPropertyGroupDataSource());
    end
    else if Node.Text = TREE_MENU_MASTER_CATEGORY then
    begin
     FDataProvider.GetMasterCategory().Active:=True;
     self.FActiveFrame:=TfrmMasterCategory.Create(self.FMainForm);
     self.FActiveFrame.parent := FMainForm.pnlMain;
     self.FActiveFrame.Align:=alClient;
     LoadedFrame:=self.GetLoadedFrameInterface();
     LoadedFrame.SetupDataSource('MasterCategory', FDataProvider.GetMasterCategoryDataSource());
    end
    else if Node.Text = TREE_MENU_MASTER_PROPERTY then
    begin
     FDataProvider.GetMasterProperty().Active:=True;
     FDataProvider.GetMasterPropertyValueList().Active:=True;
     FDataProvider.GetPropertyGroupLookupDataSource().DataSet.Active:=True;
     FDataProvider.GetPropertyTypeLookupDataSource().DataSet.Active:=True;
     FDataProvider.GetMasterCategoryLookupDataSource().DataSet.Active:=True;

     self.FActiveFrame:=TfrmMasterProperty.Create(self.FMainForm);
     FMasterPropertyVM.Init(TfrmMasterProperty(self.FActiveFrame), FDataProvider.GetMasterProperty(), FDataProvider.GetMasterPropertyToCategory(),
     FDataProvider.GetMasterCategoryLookupDataSource().DataSet, FDataProvider.GetMasterCategoryByMasterPropertyIDDataSource());
     FDataProvider.OnMasterPropertyAfterPost:=@FMasterPropertyVM.OnPostMasterProperty;
     FDataProvider.OnMasterPropertyAfterScroll:=@FMasterPropertyVM.OnScrollMasterProperty;

      self.FActiveFrame.parent := FMainForm.pnlMain;
      self.FActiveFrame.Align:=alClient;
      LoadedFrame:=self.GetLoadedFrameInterface();
      LoadedFrame.SetupDataSource('MasterProperty', FDataProvider.GetMasterPropertyDataSource());
      LoadedFrame.SetupDataSource('MasterPropertyValueList', FDataProvider.GetMasterPropertyValueListDataSource());
      LoadedFrame.SetupDataSource('PropertyGroupLookup', FDataProvider.GetPropertyGroupLookupDataSource());
      LoadedFrame.SetupDataSource('PropertyTypeLookup', FDataProvider.GetPropertyTypeLookupDataSource());
    end
    else if Node.Text = TREE_MENU_SCRIPTING then
    begin
      FDataProvider.GetBuildController().Active:=True;
      FDataProvider.GetBuildScript().Active:=True;
      FDataProvider.GetBuildTemplate().Active:=True;
      self.FActiveFrame:=TfrmScripting.Create(self.FMainForm);
      self.FActiveFrame.parent := FMainForm.pnlMain;
      self.FActiveFrame.Align:=alClient;
      LoadedFrame:=self.GetLoadedFrameInterface();
      LoadedFrame.SetupDataSource('BuildController', FDataProvider.GetBuildControllerDataSource());
      LoadedFrame.SetupDataSource('BuildScript', FDataProvider.GetBuildScriptDataSource());
      LoadedFrame.SetupDataSource('BuildTemplate', FDataProvider.GetBuildTemplateDataSource());
      LoadedFrame.SetupDataSource('BuildScriptLookup', FDataProvider.GetBuildScriptLookupDatasource());
      LoadedFrame.SetupDataSource('BuildControllerScript', FDataProvider.GetBuildControllerScriptDataSource());
      LoadedFrame.SetupDataSource('BuildScriptParameter', FDataProvider.GetBuildScriptParameterDataSource());
      FDataProvider.GetBuildScript().AfterScroll:=@BuildScriptAfterScroll;
      FDataProvider.GetBuildTemplate().AfterScroll:=@TemplateAfterScroll;
      TfrmScripting(self.FActiveFrame).memoScript.OnChange:=@MemoScriptChange;
      TfrmScripting(self.FActiveFrame).synMemoTemplateBody.OnChange:=@TemplateScriptChange;
      TfrmScripting(self.FActiveFrame).btnTest.OnClick:=@RunBuildScriptTest;
      TfrmScripting(self.FActiveFrame).btnTestBuildController.OnClick:=@RunBuildControllerTest;
      TfrmScripting(self.FActiveFrame).btnCompileScript.OnClick:=@OnCompileScript;
    end
    else if Node.Text = TREE_MENU_MAPPING then
    begin
     /// FDataProvider.GetMapping().Active:=True;
     // FDataProvider.GetMappingValue().Active:=True;
      self.FActiveFrame:=TfraMappings.Create(self.FMainForm);
      self.FActiveFrame.Parent:=FMainForm.pnlMain;
      self.FActiveFrame.Align:=alClient;
      LoadedFrame:=self.GetLoadedFrameInterface();
      LoadedFrame.SetupDataSource('MappingValue', FDataProvider.GetMappingValueDataSource());
      LoadedFrame.SetupDataSource('ListHeader', FDataProvider.GetListHeaderLookupDataSource());
      LoadedFrame.SetupDataSource('ListDetail', FDataProvider.GetListDetailLookupDataSource());
      LoadedFrame.SetupDataSource('Mapping', FDataProvider.GetMappingDataSource());
      TfraMappings(self.FActiveFrame).ListDetailDisplayDataSet:=FDataProvider.GetListDetailByID();
      TfraMappings(self.FActiveFrame).RefreshDisplay();
    end;

  end;
end;

procedure TMainModule.OnBuild();
var
   LazBuildController : TLazBuildController;
   SelectedBuildId: LongInt;
begin
  SelectedBuildId:=self.FDataProvider.GetBuilds().FieldByName('BuildId').AsLargeInt;
  if SelectedBuildId = 0 then
     exit;
  {testing the build controller }
  LazBuildController:=TLazBuildController.Create();
  LazBuildController.Execute(self.FDataProvider, SelectedBuildId);
  {testing pascal script stuff
  LazBuildController.PascalScriptTest(self.FDataProvider);
  }
  LazBuildController.Free;

end;

procedure TMainModule.OnRelationAfterScroll(DataSet:TDataSet);
var
   RelationPropertiesData:TSQLQuery;
   MPHelper: TMasterPropertyHelper;
   ModelsFrame: TfrmModels;

begin

  if DataSet.FieldByName('RelationId').IsNull then
     exit;

  FDataProvider.GetAttributes().Active:=False;
  FDataProvider.GetAttributes().ParamByName('RelationId').AsLargeInt:=DataSet.FieldByName('RelationId').AsLargeInt;
  FDataProvider.GetAttributes().Active:=True;

  //properties
  RelationPropertiesData := FDataProvider.GetRelationPropertyValue();
  RelationPropertiesData.Active:=False;
  RelationPropertiesData.ParamByName('RelationId').AsLargeInt := DataSet.FieldByName('RelationId').AsLargeInt;
  RelationPropertiesData.Active:=True;

  MPHelper:=TMasterPropertyHelper.Create();
  ModelsFrame:=TfrmModels(FActiveFrame);
  if (ModelsFrame <> Nil) and (ModelsFrame.valListRelationProperty <> Nil) then
    MPHelper.BindPropertyValuesToValuesList(FDataProvider, RelationPropertiesData, 'MasterProperty', ModelsFrame.valListRelationProperty, 'Relation');

end;

procedure TMainModule.OnAttributeAfterScroll(DataSet:TDataSet);
var
   AttributePropertiesData:TSQLQuery;
   MPHelper: TMasterPropertyHelper;
   ModelsFrame: TfrmModels;
begin
  AttributePropertiesData := FDataProvider.GetAttributePropertyValue();
  AttributePropertiesData.Active:=False;
  AttributePropertiesData.ParamByName('AttributeId').AsLargeInt := DataSet.FieldByName('AttributeId').AsLargeInt;
  AttributePropertiesData.Active:=True;
  MPHelper:=TMasterPropertyHelper.Create();
  ModelsFrame:=TfrmModels(FActiveFrame);
  if (ModelsFrame <> Nil) and (ModelsFrame.valListAttributeProperties <> Nil) then
     MPHelper.BindPropertyValuesToValuesList(FDataProvider, AttributePropertiesData, 'MasterProperty', ModelsFrame.valListAttributeProperties, 'Attribute');

end;

procedure TMainModule.OnAssociationAfterScroll(DataSet:TDataSet);
var
   AssociationPropertiesData:TSQLQuery;
   MPHelper: TMasterPropertyHelper;
   ModelsFrame: TfrmModels;
begin
  AssociationPropertiesData := FDataProvider.GetAssociationPropertyValue();
  AssociationPropertiesData.Active:=False;
  AssociationPropertiesData.ParamByName('AssociationId').AsLargeInt := DataSet.FieldByName('AssociationId').AsLargeInt;
  AssociationPropertiesData.Active:=True;
  MPHelper:=TMasterPropertyHelper.Create();
  ModelsFrame:=TfrmModels(FActiveFrame);
  MPHelper.BindPropertyValuesToValuesList(FDataProvider, AssociationPropertiesData, 'MasterProperty', ModelsFrame.valueListAssociationProperty, 'Association');

end;

procedure TMainModule.OnBuildAfterScroll(DataSet:TDataSet);
var
   BuildPropertiesData:TSQLQuery;
   MPHelper: TMasterPropertyHelper;
   ModelsFrame: TfrmModels;
begin
  BuildPropertiesData := FDataProvider.GetBuildPropertyValue();
  BuildPropertiesData.Active:=False;
  BuildPropertiesData.ParamByName('BuildId').AsLargeInt := DataSet.FieldByName('BuildId').AsLargeInt;
  BuildPropertiesData.Active:=True;
  MPHelper:=TMasterPropertyHelper.Create();
  ModelsFrame:=TfrmModels(FActiveFrame);
  MPHelper.BindPropertyValuesToValuesList(FDataProvider, BuildPropertiesData, 'MasterProperty', ModelsFrame.ValueListBuildProperty, 'Build');

end;

procedure TMainModule.OnBuildControllerAfterScroll(DataSet:TDataSet);
var
  // ScriptingFrame:TfrmScripting;
   SQLBuildControllerScript:TSQLQuery;
begin
     SQLBuildControllerScript:=FDataProvider.GetBuildControllerScript();
     SQLBuildControllerScript.Active:=False;
     SQLBuildControllerScript.ParamByName('BuildControllerID').AsLargeInt:=DataSet.FieldByName('BuildControllerID').AsLargeInt;
     SQLBuildControllerScript.Active:=True;

     {
     ScriptingFrame:=TfrmScripting(FActiveFrame);
     if ScriptingFrame <> Nil then
          ScriptingFrame.BindBuildScriptLookups();
          }
end;

procedure TMainModule.OnScreenFamilyAfterScroll(DataSet:TDataSet);
var
RelationId : LongInt;
ScreenFamilyId : LongInt;
LoadedFrame : IAppFrame;
EntityTree: TTreeView;
PropertyEdit: TValueListEditor;
ModelsFrame: TfrmModels;
begin

  RelationId := DataSet.FieldByName('ScreenFamilyToRelation').AsLargeInt;
  ScreenFamilyId := DataSet.FieldByName('ScreenFamilyId').AsLargeInt;
  if self.FActiveFrame <> Nil then
  begin
    ModelsFrame:=  TfrmModels(FActiveFrame);
    LoadedFrame:=self.GetLoadedFrameInterface();
    EntityTree:= ModelsFrame.GetTreeView('Forms');
    PropertyEdit:= ModelsFrame.GetPropertyValueList('Forms');
    if EntityTree.Items = Nil then
       exit;
    FScreenFamilyVM.LoadFormsTree(RelationId, ScreenFamilyId, self.FDataProvider, EntityTree, PropertyEdit);
  end;

end;

procedure TMainModule.OnChangedSelectedFormEntity(Sender:TObject; Node:TTreeNode);
var
   selectedData : TAssociationTree;
   PropertyValueWidget:TValueListEditor;
   ModelsFrame: TfrmModels;
begin
     ModelsFrame:=TfrmModels(FActiveFrame);
     PropertyValueWidget:=ModelsFrame.GetPropertyValueList('Forms');
   //self.bEditingFamilyValueList:=True;
   PropertyValueWidget.Clear;
   //self.bEditingFamilyValueList:=False;
   PropertyValueWidget.Row:=0;

  if Node <> Nil then
  begin
     selectedData := TAssociationTree(Node.Data);
     if selectedData <> Nil then
     begin
          FScreenFamilyVM.LoadScreenProperties(self.FDataProvider, self.FActiveFrame, selectedData);
     end;
  end;
end;

procedure TMainModule.OnFormPropertySaveClick(Sender:TObject);
begin
    FScreenFamilyVM.SaveScreenProperties(self.FDataProvider, self.FActiveFrame);
end;

procedure TMainModule.OnModelsFormPostButtonClick(Sender:TObject; PName:String);
var
   MPHelper: TMasterPropertyHelper;
   PropertiesData:TSQLQuery;
   ModelsFrame: TfrmModels;
begin
     MPHelper:=TMasterPropertyHelper.Create();
     ModelsFrame:=TfrmModels(FActiveFrame);
     if PName = 'Relation' then
     begin
      PropertiesData := FDataProvider.GetRelationPropertyValue();
      MPHelper.BindPropertyValuesToDataSet(FDataProvider, PropertiesData, 'RelationToPropertyValue', FDataProvider.GetRelations().FieldByName('RelationId').AsLargeInt, 'MasterProperty', ModelsFrame.valListRelationProperty, 'Relation');
     end
     else if PName = 'Attribute' then
     begin
      PropertiesData := FDataProvider.GetAttributePropertyValue();
      MPHelper.BindPropertyValuesToDataSet(FDataProvider, PropertiesData, 'AttributeToPropertyValue', FDataProvider.GetAttributes().FieldByName('AttributeId').AsLargeInt, 'MasterProperty', ModelsFrame.valListAttributeProperties, 'Attribute');
     end
     else if PName = 'Association' then
     begin
      PropertiesData := FDataProvider.GetAssociationPropertyValue();
      MPHelper.BindPropertyValuesToDataSet(FDataProvider, PropertiesData, 'AssociationToPropertyValue', FDataProvider.GetAssociations().FieldByName('AssociationId').AsLargeInt, 'MasterProperty', ModelsFrame.valueListAssociationProperty, 'Association');
     end
     else if PName = 'Build' then
     begin
      PropertiesData := FDataProvider.GetBuildPropertyValue();
      MPHelper.BindPropertyValuesToDataSet(FDataProvider, PropertiesData, 'BuildToPropertyValue', FDataProvider.GetBuilds().FieldByName('BuildId').AsLargeInt, 'MasterProperty', ModelsFrame.ValueListBuildProperty, 'Build');
     end
     else if PName = 'Form' then
     begin
      FScreenFamilyVM.SaveScreenProperties(self.FDataProvider, self.FActiveFrame);
      //PropertiesData := FDataProvider.GetBuildPropertyValue();
      //MPHelper.BindPropertyValuesToDataSet(FDataProvider, PropertiesData, 'BuildToPropertyValue', FDataProvider.GetBuilds().FieldByName('BuildId').AsLargeInt, 'MasterProperty', ModelsFrame.ValueListBuildProperty, 'Build');
     end;
end;

procedure TMainModule.LoadModelFrame(PModelId : LongInt);
var
  ModelsData : TSQLQuery;
  LoadedFrame : IAppFrame;
  ModelsFrame: TfrmModels;
  BModelFound: Boolean;
begin

  if FMainForm.pnlMain.ContainsControl(self.FActiveFrame) and (self.FActiveFrame.Name = 'frmModels') then
  begin
    //need to set about refreshing things here, clear out all tree views, property list, master details grids etc
   ;
  end
  else
  begin
    if Assigned(self.FActiveFrame) then
    begin
       FMainForm.pnlMain.RemoveControl(self.FActiveFrame);
       self.FActiveFrame.Free;
       self.FActiveFrame:=Nil;
    end;
    {load the appropriate frame in the main panel }

    self.FActiveFrame:=TfrmModels.Create(self.FMainForm);
    self.FActiveFrame.parent := FMainForm.pnlMain;
    self.FActiveFrame.Align:=alClient;
    ModelsFrame:=TfrmModels(FActiveFrame);
    ModelsFrame.OnChangeSelectedFormEntity:=@OnChangedSelectedFormEntity;
    ModelsFrame.OnFormPropertySaveClick:=@OnFormPropertySaveClick;
    ModelsFrame.OnPostButtonClick:=@OnModelsFormPostButtonClick;

  end;

   ModelsData:= self.FDataProvider.GetModels();
   ModelsData.Active:=True;
   BModelFound:= ModelsData.Locate('ModelId', PModelId, [loCaseInsensitive]);

   FDataProvider.GetBuilds().Active:=False;
   FDataProvider.GetBuilds().ParamByName('ModelId').AsLargeInt:=ModelsData.FieldByName('ModelId').AsLargeInt;
   FDataProvider.GetBuilds().Active:=True;

   FDataProvider.GetRelations().Active:=False;
   FDataProvider.GetRelations().ParamByName('ModelId').AsLargeInt:=ModelsData.FieldByName('ModelId').AsLargeInt;
   FDataProvider.GetRelations().Active:=True;

   FDataProvider.GetRelationsLookup().Active:=False;
   FDataProvider.GetRelationsLookup().ParamByName('ModelId').AsLargeInt:=ModelsData.FieldByName('ModelId').AsLargeInt;
   FDataProvider.GetRelationsLookup().Active:=True;

   FDataProvider.GetAssociations().Active:=False;
   FDataProvider.GetAssociations().ParamByName('ModelId').AsLargeInt:=ModelsData.FieldByName('ModelId').AsLargeInt;
   FDataProvider.GetAssociations().Active:=True;

   FDataProvider.GetScreenFamilies().Active:=False;
   FDataProvider.GetScreenFamilies().ParamByName('ModelId').AsLargeInt:=ModelsData.FieldByName('ModelId').AsLargeInt;
   FDataProvider.GetScreenFamilies().Active:=True;
   LoadedFrame:=self.GetLoadedFrameInterface();

    LoadedFrame.SetupDataSource('Build', self.FDataProvider.GetBuildsDataSource());
    LoadedFrame.SetupDataSource('Relation', self.FDataProvider.GetRelationsDataSource());
    LoadedFrame.SetupDataSource('Attribute', self.FDataProvider.GetAttributesDataSource());
    LoadedFrame.SetupDataSource('Association', self.FDataProvider.GetAssociationsDataSource());
    LoadedFrame.SetupDataSource('AssociationTypes', self.FDataProvider.GetAssociationTypeLookupDataSource());
    LoadedFrame.SetupDataSource('RelationsLookup', self.FDataProvider.GetRelationsLookupDataSource());
    LoadedFrame.SetupDataSource('AttributeType', self.FDataProvider.GetAttributeTypesDataSource());
    LoadedFrame.SetupDataSource('ScreenFamily', self.FDataProvider.GetScreenFamiliesDataSource());



end;

function TMainModule.GetLoadedFrameInterface():IAppFrame;
var
   BInterfaceExists: Boolean;
   LoadedFrame : IAppFrame;
begin
  BInterfaceExists:= self.FActiveFrame.GetInterface(IAppFrame, LoadedFrame);
  if not bInterfaceExists then
     GetLoadedFrameInterface:=Nil
  else
     GetLoadedFrameInterface:=LoadedFrame;

end;

procedure TMainModule.RunBuildScriptTest(Sender: TObject);
var
  BuildLookupForm:TfrmBuildLookup;
  LoadOption:RBuildControllerLoadOption;
begin
     LoadOption.BuildScriptId:=FDataProvider.GetBuildScript().FieldByName('BuildScriptID').AsLargeInt;
     LoadOption.ScriptOnly:=True;
     BuildLookupForm:=TfrmBuildLookup.Create(self.FMainForm);
     BuildLookupForm.Init(self.FDataProvider, LoadOption);
     BuildLookupForm.ShowModal
end;

procedure TMainModule.RunBuildControllerTest(Sender: TObject);
var
  BuildLookupForm:TfrmBuildLookup;
  LoadOption:RBuildControllerLoadOption;
begin
    LoadOption.BuildControllerId:=FDataProvider.GetBuildController().FieldByName('BuildControllerId').AsLargeInt;
    LoadOption.BuildScriptId:=0;
    LoadOption.ScriptOnly:=False;
    BuildLookupForm:=TfrmBuildLookup.Create(self.FMainForm);
    BuildLookupForm.Init(self.FDataProvider, LoadOption);
    BuildLookupForm.ShowModal;
end;

procedure TMainModule.OnCompileScript(Sender: TObject);
var
  BuildScriptId:LongInt;
  BuildLoader:TBuildControllerLoader;
begin
  BuildLoader:=TBuildControllerLoader.Create();
  BuildScriptId:=FDataProvider.GetBuildScript().FieldByName('BuildScriptID').AsLargeInt;
  BuildLoader.CompileScript(self.FDataProvider, BuildScriptId);

end;



procedure TMainModule.MemoScriptChange(Sender: TObject);
begin
  FDataProvider.GetBuildScriptDataSource().Edit;
  FDataProvider.GetBuildScript().FieldByName('Script').AsString:= TfrmScripting(self.FActiveFrame).memoScript.Text;
end;

procedure TMainModule.BuildScriptAfterScroll(DataSet: TDataSet);
begin
     TfrmScripting(self.FActiveFrame).memoScript.Text:=DataSet.FieldByName('Script').AsString;
end;

procedure TMainModule.TemplateAfterScroll(DataSet:TDataSet);
begin
    TfrmScripting(self.FActiveFrame).synMemoTemplateBody.Text:=DataSet.FieldByName('Script').AsString;
end;

procedure TMainModule.TemplateScriptChange(Sender: TObject);
begin
  FDataProvider.GetBuildTemplate().Edit;
  FDataProvider.GetBuildTemplate().FieldByName('Script').AsString:= TfrmScripting(self.FActiveFrame).synMemoTemplateBody.Text;
end;

end.

