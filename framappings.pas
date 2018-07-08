unit fraMappings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, DbCtrls, DBGrids,
  StdCtrls, Buttons, appinterfacesunit, db, sqldb, frmLookupDetailLookup,
  Dialogs, ComCtrls;

type

  { TfraMappings }

  TfraMappings = class(TFrame, IAppFrame)
    btnSourceLookup: TBitBtn;
    btnTargetLookup: TBitBtn;
    dbEditTargetLookup: TDBEdit;
    dbEditSourceLookup: TDBEdit;
    dbEditSystemCode: TDBEdit;
    dbEditSourceValue: TDBEdit;
    dbEditTargetValue: TDBEdit;
    dbEditToDescription: TDBEdit;
    dbEditFromDescription: TDBEdit;
    dbGridMappingValue: TDBGrid;
    dbGridMapping: TDBGrid;
    dbMemoNotes: TDBMemo;
    dbNavMappingValue: TDBNavigator;
    dbNavMapping: TDBNavigator;
    grpSourceLookup: TGroupBox;
    grpTargetLookup: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblLookupSourceCodeCaption1: TLabel;
    lstMappingValues: TListView;
    txtLookupSourceCode: TEdit;
    txtLookupTargetCode: TEdit;
    txtLookupTargetLabel: TEdit;
    txtLookupSourceName: TEdit;
    txtLookupSourceLabel: TEdit;
    grpTargetValue: TGroupBox;
    grpSource: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblLookupSourceCodeCaption: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnlValueEdit: TPanel;
    pnlValueMain: TPanel;
    pnlValueList: TPanel;
    pnlValueHeader: TPanel;
    pnlMappingHeader: TPanel;
    pnlMappingMain: TPanel;
    pnlMappingValue: TPanel;
    pnlMappingGrid: TPanel;
    pnlMapping: TPanel;
    pnlList: TPanel;
    txtLookupTargetName: TEdit;
    procedure btnSourceLookupClick(Sender: TObject);
    procedure btnTargetLookupClick(Sender: TObject);
    procedure lstMappingValuesClick(Sender: TObject);
    procedure lstMappingValuesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure pnlMappingValueClick(Sender: TObject);
  private
    { private declarations }
    ListLookupForm:TfrmLookupDetailLookup;
    FListHeaderDataSource:TDataSource;
    FListDetailDataSource:TDataSource;
    FMappingDataSet:TDataSet;
    FMappingValueDataSet:TDataSet;
    FMappingValueDataSource:TDataSource;
    FListDetailDisplayDataSet:TSQLQuery;
  public
    { public declarations }
    constructor Create(PForm:TComponent);
    destructor Destroy(); override;
    procedure SetupDataSource(PEntityName:String; PDataSource:TDataSource);
    property ListDetailDisplayDataSet : TSQLQuery read FListDetailDisplayDataSet write FListDetailDisplayDataSet;
    procedure RefreshDisplay();
    procedure RefreshListDisplay();
  private
    procedure OnMappingValueAfterScroll(DataSet:TDataSet);
    procedure OnMappingAfterScroll(DataSet:TDataSet);
    procedure RefreshLookupDisplay(PListDetailID:LongInt; IsSource:Boolean);
    procedure OnMappingValueAfterPost(DataSet:TDataSet);
    procedure OnMappingValueAfterDelete(DataSet:TDataSet);
    procedure ApplyDataSetUpdates();
  end;

implementation

{$R *.lfm}

procedure TfraMappings.pnlMappingValueClick(Sender: TObject);
begin

end;

procedure TfraMappings.OnMappingAfterScroll(DataSet:TDataSet);
begin
     RefreshListDisplay();
end;


procedure TfraMappings.ApplyDataSetUpdates();
var
   DataSetQuery:TSQLQuery;
   DataSetTransaction:TSQLTransaction;
begin
  DataSetQuery:=TSQLQuery(self.FMappingValueDataSet);
  DataSetQuery.ApplyUpdates(-1);
  DataSetTransaction:=TSQLTransaction(DataSetQuery.Transaction);
  DataSetTransaction.CommitRetaining;
  self.RefreshListDisplay();
end;

procedure TfraMappings.OnMappingValueAfterPost(DataSet:TDataSet);
begin
     ApplyDataSetUpdates();
end;

procedure TfraMappings.OnMappingValueAfterDelete(DataSet:TDataSet);
begin
     ApplyDataSetUpdates();
end;


procedure TfraMappings.RefreshListDisplay();
var
    ListItemData:TLongIntLookup;
begin
  self.FMappingValueDataSet.Active:=False;
  TSQLQuery(self.FMappingValueDataSet).ParamByName('MappingId').AsLargeInt:=FMappingDataSet.FieldByName('MappingID').AsLargeInt;
  self.FMappingValueDataSet.Active:=True;

  self.lstMappingValues.BeginUpdate;
  self.lstMappingValues.Clear;
  while not self.FMappingValueDataSet.EOF do
  begin
     with self.lstMappingValues.Items.Add() do
     begin
        Caption:=FMappingValueDataSet.FieldByName('SourceValue').AsString;
        SubItems.Add(FMappingValueDataSet.FieldByName('SourceListName').AsString);
        SubItems.Add(FMappingValueDataSet.FieldByName('SourceCode').AsString);
        SubItems.Add(FMappingValueDataSet.FieldByName('SourceLabel').AsString);

        SubItems.Add(FMappingValueDataSet.FieldByName('TargetValue').AsString);
        SubItems.Add(FMappingValueDataSet.FieldByName('TargetListName').AsString);
        SubItems.Add(FMappingValueDataSet.FieldByName('TargetCode').AsString);
        SubItems.Add(FMappingValueDataSet.FieldByName('TargetLabel').AsString);

        ListItemData:=TLongIntLookup.Create(FMappingValueDataSet.FieldByName('MappingValueID').AsLargeInt, '');
        Data:=ListItemData;
     end;
     FMappingValueDataSet.Next;
  end;
  self.lstMappingValues.EndUpdate;
  self.FMappingValueDataSet.First;
end;

procedure TfraMappings.RefreshDisplay();
var
  ListDetailID:LongInt;

begin

    self.txtLookupSourceCode.Text:='';
    self.txtLookupSourceLabel.Text:='';
    self.txtLookupSourceName.Text:='';
    self.txtLookupTargetCode.Text:='';
    self.txtLookupTargetLabel.Text:='';
    self.txtLookupTargetName.Text:='';
    if not FMappingValueDataSet.FieldByName('MapValueSourceLookup').IsNull then
    begin
       ListDetailID:=FMappingValueDataSet.FieldByName('MapValueSourceLookup').AsLongint;
       RefreshLookupDisplay(ListDetailID, True);
    end;

    if not FMappingValueDataSet.FieldByName('MapValueTargetLookup').IsNull then
    begin
       ListDetailID:=FMappingValueDataSet.FieldByName('MapValueTargetLookup').AsLongint;
       RefreshLookupDisplay(ListDetailID, False);
    end;


end;

procedure TfraMappings.RefreshLookupDisplay(PListDetailID:LongInt; IsSource:Boolean);
var
  ListDetailID:LongInt;
  CodeTextBox:TEdit;
  LabelTextBox:TEdit;
  NameTextBox:TEdit;
begin
    if IsSource then
    begin
         CodeTextBox:=self.txtLookupSourceCode;
         LabelTextBox:=self.txtLookupSourceLabel;
         NameTextBox:=Self.txtLookupSourceName;
    end
    else
    begin
         CodeTextBox:=self.txtLookupTargetCode;
         LabelTextBox:=self.txtLookupTargetLabel;
         NameTextBox:=Self.txtLookupTargetName;
    end;

    CodeTextBox.Text:='';
    LabelTextBox.Text:='';
    NameTextBox.Text:='';

    if (FListDetailDisplayDataSet <> Nil) then
    begin
         begin
            self.FListDetailDisplayDataSet.Active:=False;
            self.FListDetailDisplayDataSet.ParamByName('ListDetailID').AsLargeInt:=PListDetailID;
            self.FListDetailDisplayDataSet.Active:=True;
            while not self.FListDetailDisplayDataSet.EOF do
            begin
              CodeTextBox.Text:=self.FListDetailDisplayDataSet.FieldByName('Code').AsString;
              LabelTextBox.Text:=self.FListDetailDisplayDataSet.FieldByName('Label').AsString;
              NameTextBox.Text:=self.FListDetailDisplayDataSet.FieldByName('Name').AsString;
              self.FListDetailDisplayDataSet.Next;
            end;
         end;
    end;
end;

procedure TfraMappings.OnMappingValueAfterScroll(DataSet:TDataSet);
begin
     RefreshDisplay();
end;

procedure TfraMappings.btnSourceLookupClick(Sender: TObject);
begin
    FListDetailDataSource.DataSet.Active:=False;
    FListHeaderDataSource.DataSet.Active:=True;
    ListLookupForm.ListDetailLookup:=FListDetailDataSource;
    ListLookupForm.ListHeaderLookup:=FListHeaderDataSource;
    ListLookupForm.SelectedListItemData:=Nil;
    ListLookupForm.ShowModal;
    if ListLookupForm.SelectedListItemData <> Nil then
    begin
     FMappingValueDataSet.Edit;
     self.dbEditSourceLookup.Text:=IntToStr(ListLookupForm.SelectedListItemData.Key);
     self.dbEditSourceValue.Text:='';
     RefreshLookupDisplay(ListLookupForm.SelectedListItemData.Key, True);
    end;
end;

procedure TfraMappings.btnTargetLookupClick(Sender: TObject);
begin
    FListDetailDataSource.DataSet.Active:=False;
    FListHeaderDataSource.DataSet.Active:=True;
    ListLookupForm.ListDetailLookup:=FListDetailDataSource;
    ListLookupForm.ListHeaderLookup:=FListHeaderDataSource;
    ListLookupForm.SelectedListItemData:=Nil;
    ListLookupForm.ShowModal;
    if ListLookupForm.SelectedListItemData <> Nil then
    begin
     FMappingValueDataSet.Edit;
     self.dbEditTargetLookup.Text:=IntToStr(ListLookupForm.SelectedListItemData.Key);
     self.dbEditTargetValue.Text:='';
     RefreshLookupDisplay(ListLookupForm.SelectedListItemData.Key, False);
    end;
end;

procedure TfraMappings.lstMappingValuesClick(Sender: TObject);
begin

end;

procedure TfraMappings.lstMappingValuesSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
   LookupData:TLongIntLookup;
begin
  LookupData:=TLongIntLookup(Item.Data);
  if LookupData <> Nil then
  begin
   FMappingValueDataSet.Locate('MappingValueID', LookupData.Key, [loCaseInsensitive]);
  end;
end;

constructor TfraMappings.Create(PForm:TComponent);
begin
    inherited;
    ListLookupForm:=TfrmLookupDetailLookup.Create(self);
end;

destructor TfraMappings.Destroy();
begin
    inherited;
    {if Assigned(ListLookupForm) then
       FreeAndNil(ListLookupForm);}
end;


procedure TfraMappings.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
    case PEntityName of
    'Mapping':
      begin
         self.dbNavMapping.DataSource:=PDataSource;
         self.dbGridMapping.DataSource:=PDataSource;
         self.dbEditFromDescription.DataSource:=PDataSource;
         self.dbEditToDescription.DataSource:=PDataSource;
         self.dbMemoNotes.DataSource:=PDataSource;
         self.dbEditSystemCode.DataSource:=PDataSource;
         FMappingDataSet:=PDataSource.DataSet;
         FMappingDataSet.AfterScroll:=@self.OnMappingAfterScroll;
         FMappingDataSet.Active:=True;
      end;
    'MappingValue':
      begin
         self.dbNavMappingValue.DataSource:=PDataSource;
         self.dbGridMappingValue.DataSource:=PDataSource;
         self.dbEditSourceValue.DataSource:=PDataSource;
         self.dbEditTargetValue.DataSource:=PDataSource;
         self.dbEditTargetLookup.DataSource:=PDataSource;
         self.dbEditSourceLookup.DataSource:=PDataSource;
         FMappingValueDataSource:=PDataSource;
         FMappingValueDataSet:=PDataSource.DataSet;
         FMappingValueDataSet.AfterScroll:=@self.OnMappingValueAfterScroll;
         FMappingValueDataSet.AfterPost:=@self.OnMappingValueAfterPost;
      //   PDataSource.OnStateChange:=@self.OnMappingValueDataSourceStateChange;
      end;
    'ListHeader':
      begin
         FListHeaderDataSource:=PDataSource;
      end;
    'ListDetail':
      begin
           FListDetailDataSource:=PDataSource;
      end;

    end;
end;

end.

