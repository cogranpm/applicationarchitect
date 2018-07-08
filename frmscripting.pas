unit frmScripting;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, SynHighlighterPas, Forms, Controls,
  ComCtrls, ExtCtrls, StdCtrls, db, DbCtrls, DBGrids, CheckLst,
  appinterfacesunit;

type

  { TfrmScripting }

  TfrmScripting = class(TFrame, IAppFrame)
    btnTest: TButton;
    btnTestBuildController: TButton;
    btnCompileScript: TButton;
    dbGridBuildScriptParameter: TDBGrid;
    dbLookupBuildControllerScript: TDBLookupComboBox;
    dbNavBuildScriptParameter: TDBNavigator;
    grdBuildControllerScript: TDBGrid;
    dbNavBuildControllerScript: TDBNavigator;
    grdBuildScript: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    dbNavBuildScript: TDBNavigator;
    edtBuildScriptName: TDBEdit;
    grdBuildController: TDBGrid;
    edtControllerName: TDBEdit;
    dbNavController: TDBNavigator;
    edtBuildTemplateName: TDBEdit;
    dbListBuildTemplate: TDBGrid;
    dbNavBuildTemplate: TDBNavigator;
    Label1: TLabel;
    lblBuildScriptName: TLabel;
    lblControllerName: TLabel;
    lblBuildTemplateName: TLabel;
    pnlBuildScriptParameterListHeader: TPanel;
    pnlBuildControllerScriptParameterHeader: TPanel;
    pnlBuildControllerScriptParameters: TPanel;
    pnlBuildControllerScriptEditMain: TPanel;
    pnlBuildControllerScriptEdit: TPanel;
    pnlBuildControllerScriptList: TPanel;
    pnlBuildControllerScriptHeader: TPanel;
    pnlScriptPicker: TPanel;
    pnlMainScript: TPanel;
    pnlBuildScriptNav: TPanel;
    pnlBuildScriptMain: TPanel;
    pgeScripting: TPageControl;
    pnlBuildScriptListHeader: TPanel;
    pnlBuildScriptMemo: TPanel;
    pnlBuildScriptEditFields: TPanel;
    pnlBuildScriptList: TPanel;
    pnlBuildScriptHeader: TPanel;
    pnlMainList: TPanel;
    pnlControllerMain: TPanel;
    pnlControllerHeader: TPanel;
    pnlControllerTop: TPanel;
    pnlBuildTemplateEdit: TPanel;
    pnlBuildTemplateList: TPanel;
    pnlBuildTemplateNav: TPanel;
    memoScript: TSynMemo;
    synMemoTemplateBody: TSynMemo;
    BuildScriptHighlighter: TSynPasSyn;
    tabBuildController: TTabSheet;
    tabBuildTemplates: TTabSheet;
    tabBuildScript: TTabSheet;

  private
    { private declarations }
    FBuildScriptDS : TDataSource;
    FTemplateDS: TDataSource;
    FBuildScriptLookupDS: TDataSource;
    FBuildControllerScriptDS: TDataSource;
    FBuildControllerDS: TDataSource;
  public
    { public declarations }
    procedure SetupDataSource(PEntityName:String; PDataSource:TDataSource);
    constructor Create(PForm:TComponent);override;
  //  procedure BindBuildScriptLookups();
  end;

implementation

{$R *.lfm}

constructor TfrmScripting.Create(PForm:TComponent);
begin
     self.FBuildControllerScriptDS:=Nil;
     self.FTemplateDS:=Nil;
     self.FBuildScriptLookupDS:=Nil;
     self.FBuildScriptDS:=Nil;
     self.FBuildControllerDS:=Nil;
    inherited;
end;



procedure TfrmScripting.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
    case PEntityName of
      'BuildTemplate':
      begin
         FTemplateDS:=PDataSource;
        self.dbNavBuildTemplate.DataSource:=PDataSource;
        self.dbListBuildTemplate.DataSource:=PDataSource;
        self.edtBuildTemplateName.DataSource:=PDataSource;
        self.synMemoTemplateBody.Text:=FTemplateDS.DataSet.FieldByName('Script').AsString;
      end;
      'BuildController':
      begin
         self.dbNavController.DataSource:=PDataSource;
         self.grdBuildController.DataSource:=PDataSource;
         self.edtControllerName.DataSource:=PDataSource;
         FBuildControllerDS:=PDataSource;
      end;
      'BuildScript':
      begin
         self.dbNavBuildScript.DataSource:=PDataSource;
         self.grdBuildScript.DataSource:=PDataSource;
         self.edtBuildScriptName.DataSource:=PDataSource;
       //  self.memoBuildScript.DataSource:=PDataSource;
         FBuildScriptDS:=PDataSource;
         self.memoScript.Text:=FBuildScriptDS.DataSet.FieldByName('Script').AsString;
      end;
      'BuildScriptLookup':
      begin
        FBuildScriptLookupDS:=PDataSource;
        self.dbLookupBuildControllerScript.ListSource:=PDataSource;
      end;
      'BuildControllerScript':
      begin
        FBuildControllerScriptDS:=PDataSource;
        self.dbNavBuildControllerScript.DataSource:=PDataSource;
        self.grdBuildControllerScript.DataSource:=PDataSource;
        self.dbLookupBuildControllerScript.DataSource:=PDataSource;
      end;
      'BuildScriptParameter':
      begin
          self.dbNavBuildScriptParameter.DataSource:=PDataSource;
          self.dbGridBuildScriptParameter.DataSource:=PDataSource;
      end;

    end;
end;

{
procedure TfrmScripting.BindBuildScriptLookups();
var
  LookupData: TLongIntLookup;
  BuildScriptID : LongInt;
  BuildScriptName: String;
  BuildControllerID : LongInt;
 // ListItem:TListItem;
begin

     if (self.FBuildScriptLookupDS <> Nil) and (self.FBuildControllerScriptDS <> Nil) and (FBuildControllerDS <> Nil) then
     begin
       self.lstBuildScriptFrom.Clear;
       BuildControllerID:=FBuildControllerDS.DataSet.FieldByName('BuildControllerID').AsLargeInt;


       self.FBuildScriptLookupDS.DataSet.Active:=True;
       self.FBuildScriptLookupDS.DataSet.Refresh;
       self.FBuildScriptLookupDS.DataSet.First;
       while not self.FBuildScriptLookupDS.DataSet.EOF do
       begin
         BuildScriptID:=self.FBuildScriptLookupDS.DataSet.FieldByName('BuildScriptID').AsLongInt;

         //if buildcontrollerscript contains buildscriptid and buildcontrollerid then put in right list

         BuildScriptName:=self.FBuildScriptLookupDS.DataSet.FieldByName('Name').AsString;
         LookupData:=TLongIntLookup.Create(BuildScriptID, BuildScriptName);
         self.lstBuildScriptFrom.Items.AddObject(LookupData.Display, LookupData);

         //if we want to use a list view at some point for more flexibility
         {
          ListItem:=TListItem.Create(Nil);
          ListItem.Data:=LookupData;
         }
       //  self.lstvBuildScripts.AddItem(LookupData.Display, LookupData);
         self.FBuildScriptLookupDS.DataSet.Next;
       end;
     end;
end;
}

end.

