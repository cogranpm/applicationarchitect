unit frmMasterProperty;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, StdCtrls, ExtCtrls,
  DBGrids, DbCtrls, CheckLst, Dialogs, appinterfacesunit;

type

  { TfrmMasterProperty }

  TfrmMasterProperty = class(TFrame, IAppFrame)
    cboGroupLookup: TDBLookupComboBox;
    chkCategoriesList: TCheckListBox;
    dbGridMasterPropertyValueList: TDBGrid;
    dbNavMasterPropertyValueList: TDBNavigator;
    dsMasterCategoryLookup: TDataSource;
    cboPropertyTypeLookup: TDBLookupComboBox;
    dsTypeLookup: TDataSource;
    dsGroupLookup: TDataSource;
    GroupBox1: TGroupBox;
    grpValueList: TGroupBox;
    lblType: TLabel;
    lblGroup: TLabel;
    txtDefaultValue: TDBEdit;
    txtName: TDBEdit;
    dbgMasterProperty: TDBGrid;
    txtNotes: TDBMemo;
    dbNavMasterProperty: TDBNavigator;
    lblNotes: TLabel;
    lblDefaultValue: TLabel;
    lblName: TLabel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    pnlMain: TPanel;
    procedure chkCategoriesListClickCheck(Sender: TObject);
    procedure grpValueListClick(Sender: TObject);
    procedure pnlBottomClick(Sender: TObject);



  public
    { public declarations }
    constructor Create(AOwner: TComponent) ; override;
     destructor Destroy; override;
    procedure SetupDataSource(PEntityName:String; PDataSource:TDataSource);


  end;

implementation

{$R *.lfm}

{ TfrmMasterProperty }

destructor TfrmMasterProperty.Destroy;
var
  i : Integer;
  CheckboxData : MasterCategoryCheckboxListItem;
begin
  if self.chkCategoriesList <> Nil then
  begin
    for i:= 0 to self.chkCategoriesList.Count -1 do
    begin
       CheckboxData:=MasterCategoryCheckboxListItem(self.chkCategoriesList.Items.Objects[i]);
       if CheckboxData <> Nil then
       begin
         CheckboxData.Free;
       end;
    end;
  end;

  inherited Destroy;
end;

procedure TfrmMasterProperty.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
    case PEntityName of
      'MasterProperty':
      begin
           self.dbgMasterProperty.DataSource:=PDataSource;
           self.dbNavMasterProperty.DataSource:=PDataSource;
           self.txtDefaultValue.DataSource:=PDataSource;
           self.txtName.DataSource:=PDataSource;
           self.txtNotes.DataSource:=PDataSource;
           self.cboGroupLookup.DataSource:=PDataSource;
           self.cboPropertyTypeLookup.DataSource:=PDataSource;
      end;
      'MasterPropertyValueList':
      begin
         self.dbGridMasterPropertyValueList.DataSource:=PDataSource;
         self.dbNavMasterPropertyValueList.DataSource:=PDataSource;
      end;
      'PropertyGroupLookup':
      begin
         self.cboGroupLookup.ListSource:=PDataSource;
      end;
      'PropertyTypeLookup':
      begin
         self.cboPropertyTypeLookup.ListSource:=PDataSource;
      end;

    end;
end;


procedure TfrmMasterProperty.chkCategoriesListClickCheck(Sender: TObject);
var
  CheckboxData : MasterCategoryCheckboxListItem;
begin
    { edit here in order to make the apply button appear }
    self.dbgMasterProperty.DataSource.DataSet.Edit;

end;

procedure TfrmMasterProperty.grpValueListClick(Sender: TObject);
begin

end;

procedure TfrmMasterProperty.pnlBottomClick(Sender: TObject);
begin

end;

constructor TfrmMasterProperty.Create(AOwner: TComponent);
begin
  inherited Create(AOwner) ;
end;








end.

