unit frmModels;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ComCtrls, ExtCtrls, DbCtrls,
  DBGrids, StdCtrls, Dialogs, ValEdit, appinterfacesunit, db, FrmMainUnit;

type

  { TfrmModels }

  TfrmModels = class(TFrame, IAppFrame)
    btnBuildProjectPath: TButton;
    cmdBuild: TButton;
    chkFrozen: TDBCheckBox;
    chkAttributeAllowNull: TDBCheckBox;
    edtScreenFamilyName: TDBEdit;
    grdScreenFamily: TDBGrid;
    cboScreenFamilyRelation: TDBLookupComboBox;
    dbNavForms: TDBNavigator;
    dlgSelectDirectory: TSelectDirectoryDialog;
    edtAttributeName: TDBEdit;
    edtAttributeLength: TDBEdit;
    cboAttributeType: TDBLookupComboBox;
    edtRelationName: TDBEdit;
    edtAssociationName: TDBEdit;
    Images: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblRelationPropertyHeader: TLabel;
    lblFormPropertiesHeader: TLabel;
    lblFormEntity: TLabel;
    lblFormsHeader: TLabel;
    lblFormHeader: TLabel;
    lblBuildName: TLabel;
    lblBuildProjectPath: TLabel;
    lblBuilds: TLabel;
    lblBuild: TLabel;
    lblAttributesList: TLabel;
    lblRelations: TLabel;
    lblRelationName: TLabel;
    lkpOwner: TDBLookupComboBox;
    lkpOwned: TDBLookupComboBox;
    lkpAssociationType: TDBLookupComboBox;
    grdAssociation: TDBGrid;
    dbGridAttributes: TDBGrid;
    dbGridRelation: TDBGrid;
    dbGridBuild: TDBGrid;
    dbNavBuild: TDBNavigator;
    dbNavAttributes: TDBNavigator;
    dbNavAssociation: TDBNavigator;
    dbNavRelation: TDBNavigator;
    lblAssociationName: TLabel;
    lblAssociationOwner: TLabel;
    lblAssociationOwned: TLabel;
    lblAssociationType: TLabel;
    lblAssociationSingular: TLabel;
    lblAssociation: TLabel;
    lblAttributeHeader: TLabel;
    lblRelationsTop: TLabel;
    pnlBuildPropertyValueList: TPanel;
    pnlBuildPropertyHeader: TPanel;
    pnlBuildProperties: TPanel;
    pnlBuildMain: TPanel;
    pnlAssociationPropertyValueList: TPanel;
    pnlAssociationPropertyHeader: TPanel;
    pnlAssociationProperties: TPanel;
    pnlAttributePropertyValueList: TPanel;
    pnlAttributePropertyHeader: TPanel;
    pnlAttributeProperty: TPanel;
    pnlAttributeLeft: TPanel;
    pnlAttributeTop: TPanel;
    pgeRelationProperty: TPageControl;
    pnlRelationPropertyMain: TPanel;
    pnlRelationTop: TPanel;
    pnlRelationPropertyHeader: TPanel;
    pnlRelationProperty: TPanel;
    pnlRelationListContainer: TPanel;
    pnlRelation: TPanel;
    pnlAttribute: TPanel;
    pnlFormEntityList: TPanel;
    pnlFormPropertiesHeader: TPanel;
    pnlEntitiesHeader: TPanel;
    pnlFormsHeader: TPanel;
    pnlFormEdit: TPanel;
    pnlFormHeader: TPanel;
    pnlFormList: TPanel;
    pnlFormAux: TPanel;
    pnlFormProperties: TPanel;
    pnlFormEntities: TPanel;
    pnlFormMain: TPanel;
    pnlRelationListGrid: TPanel;
    pnlBuildEdit: TPanel;
    pnlBuildListHeader: TPanel;
    pnlAttributeBodyHeader: TPanel;
    pnlRelationListBody: TPanel;
    pnlRelationListHeader: TPanel;
    pnlAssociationMainBody: TPanel;
    pnlAssociationMainTop: TPanel;
    pnlAssociationGrid: TPanel;
    pnlAssociationMain: TPanel;
    pnlAssociationHeader: TPanel;
    pnlAssociationBody: TPanel;
    pnlAssociationHeaderNav: TPanel;
    pnlRelationHeader: TPanel;
    pnlAttributeHeader: TPanel;
    pnlAttributeList: TPanel;
    pnlAttributeNav: TPanel;
    pnlAttributeBody: TPanel;
    pnlRelationList: TPanel;
    pnlRelationBody: TPanel;
    pnlRelationNav: TPanel;
    pnlRelationMain: TPanel;
    pnlBuildGrid: TPanel;
    pnlBuildNav: TPanel;
    pnlBuildList: TPanel;
    pnBuildTop: TPanel;
    pgeMain: TPageControl;
    sptFormsOne: TSplitter;
    sptRelation: TSplitter;
    sptAssociation: TSplitter;
    sptBuild: TSplitter;
    tabRelations: TTabSheet;
    tabAssociations: TTabSheet;
    tabForms: TTabSheet;
    tabBuilds: TTabSheet;
    tabRelationProperty: TTabSheet;
    tabRelationAttributes: TTabSheet;
    tvForms: TTreeView;
    txtBuildEditName: TDBEdit;
    txtBuildProjectPath: TDBEdit;
    valListRelationProperty: TValueListEditor;
    valListAttributeProperties: TValueListEditor;
    valueListAssociationProperty: TValueListEditor;
    ValueListBuildProperty: TValueListEditor;
    vlScreenProps: TValueListEditor;
    procedure btnBuildProjectPathClick(Sender: TObject);
    procedure btnFormPropertiesSaveClick(Sender: TObject);
    procedure cmdBuildClick(Sender: TObject);
    procedure cboScreenFamilyRelationChange(Sender: TObject);
    procedure dbNavAssociationClick(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNavAttributesClick(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNavBuildClick(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNavFormsClick(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNavRelationClick(Sender: TObject; Button: TDBNavButtonType);
    procedure lkpAssociationTypeChange(Sender: TObject);
    procedure pgeMainChange(Sender: TObject);
    procedure pnlFormEntitiesClick(Sender: TObject);
    procedure tabAssociationsShow(Sender: TObject);
    procedure tvFormsChange(Sender: TObject; Node: TTreeNode);
    procedure tvFormsSelectionChanged(Sender: TObject);
    procedure valListAttributePropertiesEditingDone(Sender: TObject);
    procedure valListRelationPropertyClick(Sender: TObject);
    procedure valListRelationPropertyEditingDone(Sender: TObject);
    procedure valListRelationPropertyPickListSelect(Sender: TObject);
    procedure valueListAssociationPropertyEditingDone(Sender: TObject);
    procedure ValueListBuildPropertyEditingDone(Sender: TObject);
    procedure vlScreenPropsEditingDone(Sender: TObject);

  private
    { private declarations }
//    FController : IMainModule;
    FChangedSelectedFormEntityEvent: TChangeSelectedFormEntity;
    FFormPropertySaveClickEvent: TFormPropertySaveClick;
    FRelationPostButtonClickEvent: TPostButtonClick;
    FRelationDataSource:TDataSource;
    FAttributeDataSource:TDataSource;
    FAssociationDataSource:TDataSource;
    FBuildDataSource:TDataSource;
    FScreenFamilyDataSource:TDataSource;

  private
    function GetMainForm():TfrmMain;
    function GetOnChangeSelectedFormEntity():TChangeSelectedFormEntity;
    procedure SetOnChangeSelectedFormEntity(PEventData:TChangeSelectedFormEntity);

    function GetOnFormPropertySaveClick():TFormPropertySaveClick;
    procedure SetOnFormPropertySaveClick(PEventData:TFormPropertySaveClick);

  public
    { public declarations }
    constructor Create(PForm:TComponent);
    destructor Destroy(); override;
    procedure SetupDataSource(PEntityName:String; PDataSource:TDataSource);
 //   procedure SetController(PController: IMainModule);
    function GetTreeView(PName:String):TTreeView;
    function GetPropertyValueList(PName:String):TValueListEditor;

    property OnChangeSelectedFormEntity: TChangeSelectedFormEntity read GetOnChangeSelectedFormEntity write SetOnChangeSelectedFormEntity;
    property OnFormPropertySaveClick: TFormPropertySaveClick read GetOnFormPropertySaveClick write SetOnFormPropertySaveClick;
    property OnPostButtonClick: TPostButtonClick read FRelationPostButtonClickEvent write FRelationPostButtonClickEvent;

  end;

implementation

{$R *.lfm}

constructor TfrmModels.Create(PForm:TComponent);
begin
    inherited;
    FRelationDataSource:=Nil;
    FAttributeDataSource:=Nil;
    FAssociationDataSource:=Nil;
    FBuildDataSource:=Nil;
    FScreenFamilyDataSource:=Nil;
end;

destructor TfrmModels.Destroy();
begin

    inherited;
end;

procedure TfrmModels.cmdBuildClick(Sender: TObject);
var
  ParentForm:TfrmMain;
begin
   ParentForm:=self.GetMainForm();
   ParentForm.Controller.OnBuild();
end;

procedure TfrmModels.cboScreenFamilyRelationChange(Sender: TObject);
begin

end;

procedure TfrmModels.dbNavAssociationClick(Sender: TObject;
  Button: TDBNavButtonType);
begin
  case Button of
  nbPost:
    begin
       {save the property values}
       FRelationPostButtonClickEvent(Sender, 'Association');
    end;
 end;

end;

procedure TfrmModels.dbNavAttributesClick(Sender: TObject;
  Button: TDBNavButtonType);
begin
   case Button of
   nbPost:
     begin
        {save the property values}
        FRelationPostButtonClickEvent(Sender, 'Attribute');
     end;
  end;
end;

procedure TfrmModels.dbNavBuildClick(Sender: TObject; Button: TDBNavButtonType);
begin
  case Button of
   nbPost:
     begin
        {save the property values}
        FRelationPostButtonClickEvent(Sender, 'Build');
     end;
  end;
end;

procedure TfrmModels.dbNavFormsClick(Sender: TObject; Button: TDBNavButtonType);
begin
  case Button of
   nbPost:
     begin
        {save the property values}
        FRelationPostButtonClickEvent(Sender, 'Form');
     end;
  end;
end;

procedure TfrmModels.dbNavRelationClick(Sender: TObject;
  Button: TDBNavButtonType);
begin
  case Button of
   nbPost:
     begin
        {save the property values}
        FRelationPostButtonClickEvent(Sender, 'Relation');
     end;
  end;
end;


procedure TfrmModels.btnBuildProjectPathClick(Sender: TObject);
begin
  if dlgSelectDirectory.Execute then
  begin
      txtBuildProjectPath.DataSource.DataSet.Edit;
      txtBuildProjectPath.Field.Text:=dlgSelectDirectory.FileName;
  end;
end;



procedure TfrmModels.btnFormPropertiesSaveClick(Sender: TObject);
begin
   FFormPropertySaveClickEvent(self);
end;

procedure TfrmModels.lkpAssociationTypeChange(Sender: TObject);
begin

end;

procedure TfrmModels.pgeMainChange(Sender: TObject);
begin
     if (pgeMain.ActivePage.Name='tabAssociations') then
     begin
          self.lkpOwned.ListSource.DataSet.Refresh;
          self.lkpOwner.ListSource.DataSet.Refresh;
     end
     else if (pgeMain.ActivePage.Name='tabForms') then
     begin
         cboScreenFamilyRelation.ListSource.DataSet.Refresh;
     end;
end;

procedure TfrmModels.pnlFormEntitiesClick(Sender: TObject);
begin

end;

procedure TfrmModels.tabAssociationsShow(Sender: TObject);
begin

end;

procedure TfrmModels.tvFormsChange(Sender: TObject; Node: TTreeNode);
begin

end;

procedure TfrmModels.tvFormsSelectionChanged(Sender: TObject);
begin
     if self.tvForms.Selected <> Nil then
        FChangedSelectedFormEntityEvent(self, self.tvForms.Selected);
end;

procedure TfrmModels.valListAttributePropertiesEditingDone(Sender: TObject);
begin
   if FAttributeDataSource <> Nil then
     FAttributeDataSource.DataSet.Edit;
end;

procedure TfrmModels.valListRelationPropertyClick(Sender: TObject);
begin

end;

procedure TfrmModels.valListRelationPropertyEditingDone(Sender: TObject);
begin
//  ShowMessage('Done');
    if FRelationDataSource <> Nil then
      FRelationDataSource.DataSet.Edit;
end;

procedure TfrmModels.valListRelationPropertyPickListSelect(Sender: TObject);
begin
//ShowMessage( valListRelationProperty.Cells[valListRelationProperty.Col, valListRelationProperty.Row]);
//valListRelationProperty.;
end;

procedure TfrmModels.valueListAssociationPropertyEditingDone(Sender: TObject);
begin
  if FAssociationDataSource <> Nil then
     FAssociationDataSource.DataSet.Edit;
end;

procedure TfrmModels.ValueListBuildPropertyEditingDone(Sender: TObject);
begin
  if FBuildDataSource <> Nil then
     FBuildDataSource.DataSet.Edit;
end;

procedure TfrmModels.vlScreenPropsEditingDone(Sender: TObject);
begin
  //update the forms dataset to be modified to trigger user to save
  if FScreenFamilyDataSource <> Nil then
     FScreenFamilyDataSource.DataSet.Edit;
end;




{IAppFrame interface methods}
{
procedure TfrmModels.SetController(PController: IMainModule);
begin
    FController:=PController;
end;
}

function TfrmModels.GetMainForm():TfrmMain;
var
  ParentForm:TCustomForm;
begin
    ParentForm:=GetParentForm(self);
    GetMainForm:=TfrmMain(ParentForm);
end;

procedure TfrmModels.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
    case PEntityName of
    'Build':
      begin
        self.dbGridBuild.DataSource:=PDataSource;
        self.dbNavBuild.DataSource:=PDataSource;
        self.txtBuildEditName.DataSource:=PDataSource;
        self.txtBuildProjectPath.DataSource:=PDataSource;
        self.FBuildDataSource:=PDataSource;
      end;
    'Relation':
      begin
         self.dbGridRelation.DataSource:=PDataSource;
         self.dbNavRelation.DataSource:=PDataSource;
         self.edtRelationName.DataSource:=PDataSource;
         self.chkFrozen.DataSource:=PDataSource;
         FRelationDataSource:=PDataSource;
      end;
    'Attribute':
      begin
           self.dbNavAttributes.DataSource:=PDataSource;
           self.dbGridAttributes.DataSource:=PDataSource;
           self.edtAttributeLength.DataSource:=PDataSource;
           self.cboAttributeType.DataSource:=PDataSource;
           self.edtAttributeName.DataSource:=PDataSource;
           self.chkAttributeAllowNull.DataSource:=PDataSource;
           FAttributeDataSource:=PDataSource;
      end;
    'Association':
      begin
        self.dbNavAssociation.DataSource:=PDataSource;
        self.grdAssociation.DataSource:=PDataSource;
        self.edtAssociationName.DataSource:=PDataSource;
        self.lkpAssociationType.DataSource:=PDataSource;
        self.lkpOwned.DataSource:=PDataSource;
        self.lkpOwner.DataSource:=PDataSource;
        self.FAssociationDataSource:=PDataSource;
      end;
    'AssociationTypes':
      begin
        self.lkpAssociationType.ListSource:=PDataSource;
        self.lkpAssociationType.KeyField:='Code';
        self.lkpAssociationType.ListField:='Label';
      end;
    'RelationsLookup':
      begin
         self.lkpOwned.ListSource:=PDataSource;
         self.lkpOwned.KeyField:='RelationId';
         self.lkpOwned.ListField:='Name';
         self.lkpOwner.ListSource:=PDataSource;
         self.lkpOwner.KeyField:='RelationId';
         self.lkpOwner.ListField:='Name';
         self.cboScreenFamilyRelation.ListSource:=PDataSource;
         self.cboScreenFamilyRelation.KeyField:='RelationId';
         self.cboScreenFamilyRelation.ListField:='Name';
      end;
    'AttributeType':
      begin
         self.cboAttributeType.ListSource:=PDataSource;
         self.cboAttributeType.KeyField:='Code';
         self.cboAttributeType.ListField:='Label';
      end;
    'ScreenFamily':
      begin
         self.dbNavForms.DataSource:=PDataSource;
         self.grdScreenFamily.DataSource:=PDataSource;
         self.edtScreenFamilyName.DataSource:=PDataSource;
         self.cboScreenFamilyRelation.DataSource:=PDataSource;
         self.FScreenFamilyDataSource:=PDataSource;
      end;
    end;
end;

function TfrmModels.GetTreeView(PName:String):TTreeView;
begin
   case PName of
    'Forms':
      begin
         GetTreeView:= self.tvForms;
      end;
   end;
end;

function TfrmModels.GetPropertyValueList(PName:String):TValueListEditor;
begin
  case PName of
   'Forms':
     begin
        GetPropertyValueList:= self.vlScreenProps;
     end;
  end;
end;

function TfrmModels.GetOnChangeSelectedFormEntity():TChangeSelectedFormEntity;
begin
    GetOnChangeSelectedFormEntity:=FChangedSelectedFormEntityEvent;
end;

procedure TfrmModels.SetOnChangeSelectedFormEntity(PEventData:TChangeSelectedFormEntity);
begin
   FChangedSelectedFormEntityEvent:=PEventData;
end;

function TfrmModels.GetOnFormPropertySaveClick():TFormPropertySaveClick;
begin
   GetOnFormPropertySaveClick:=FFormPropertySaveClickEvent;
end;

procedure TfrmModels.SetOnFormPropertySaveClick(PEventData:TFormPropertySaveClick);
begin
   FFormPropertySaveClickEvent:=PEventData;
end;


end.

