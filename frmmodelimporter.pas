unit frmModelImporter;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, appinterfacesunit, AppSettingsUnit, types,
  MYSQLImportProvider, db, sqldb;

type

  { TfrmModelImporter }

  TfrmModelImporter = class(TForm)
    btnClose: TButton;
    btnImport: TButton;
    chkSelectAll: TCheckBox;
    chkTablePrefix: TCheckBox;
    chkExcludePrimary: TCheckBox;
    cboModelLookup: TComboBox;
    pnlActions: TPanel;
    txtTablePrefix: TEdit;
    txtModelName: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblConnectionDisplay: TLabel;
    lvColumns: TListView;
    lvTables: TListView;
    pnlColumnsBody: TPanel;
    pnlColumnsHeader: TPanel;
    pnlColumnsMain: TPanel;
    pnlTableViewBody: TPanel;
    pnlTableViewHeader: TPanel;
    pnlTablesView: TPanel;
    pnlStatus: TPanel;
    pnlBackground: TPanel;
    rdExistingModel: TRadioButton;
    rdNewModel: TRadioButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure chkSelectAllChange(Sender: TObject);
    procedure chkTablePrefixChange(Sender: TObject);
    procedure lvTablesClick(Sender: TObject);
    procedure rdExistingModelChange(Sender: TObject);
    procedure rdNewModelChange(Sender: TObject);
  private
    { private declarations }
    FAppSettings : TAppSettings;
    FDataProvider: IDataImportProvider;
    FModelsList: TDataSet;
    FModelProvider: IDataProvider;
  public
    { public declarations }
    constructor Create(AOwner: TComponent; var PAppSettings: TAppSettings; var PModelProvider:IDataProvider; PModelsList:TDataSet);
    destructor Destroy(); override;
    procedure Connect();
  private
    procedure LoadColumns(PTableName:String);
  end;



implementation

procedure TfrmModelImporter.lvTablesClick(Sender: TObject);
var
  TableName:String;
begin
  if self.lvTables.SelCount = 0 then exit;
  TableName:=self.lvTables.Selected.SubItems[0];
  LoadColumns(TableName);
end;

procedure TfrmModelImporter.rdExistingModelChange(Sender: TObject);
begin
  self.cboModelLookup.Enabled:=self.rdExistingModel.Checked;
end;

procedure TfrmModelImporter.rdNewModelChange(Sender: TObject);
begin
  self.txtModelName.Enabled:=self.rdNewModel.Checked;
end;

procedure TfrmModelImporter.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;



procedure TfrmModelImporter.btnImportClick(Sender: TObject);
var
  ModelId:LongInt;
  ModelData: TLongIntLookup;
  ModelDataSet:TSQLQuery;
  CurrentListItem: TListItem;
  RelationName: String;
  TablePrefix:String;


  MappingSystemCode:String; //what is mapping system code for selected database type
  MappingValuesDataSet:TDataSet;
  NewModelName:String;
begin
   {
     iterate all the items in the listview that are checked
   }

  NewModelName:='';
  ModelDataSet:=FModelProvider.GetModels();
  if self.rdExistingModel.Checked then
   begin
      ModelData:=TLongIntLookup(self.cboModelLookup.Items.Objects[cboModelLookup.ItemIndex]);
      if ModelData = Nil then
       begin
          ShowMessage('Error: Existing Model not selected.');
          exit;
       end;

      ModelId:=ModelData.Key;
      ModelDataSet.Active:=True;
      ModelDataSet.Locate('ModelId', ModelId, [loCaseInsensitive]);
   end
   else
   begin
      NewModelName:=self.txtModelName.Text;
      if NewModelName = '' then
       begin
          ShowMessage('Error: Model Name not specified.');
          exit;
       end;
     FDataProvider.CreateModel(FModelProvider, NewModelName);
   end;

  {
 load mapping from mapping and mappingValue tables
  each model database should have mappings set up for each of the
  databases from which an import is supported:
  }
  MappingSystemCode:=FModelProvider.GetImportMappingSystemCode(self.FAppSettings.DatabaseType);
  if (MappingSystemCode = '') then
  begin
    ShowMessage('Mapping System Code not set up');
    Exit;
  end;
  MappingValuesDataSet:=FModelProvider.GetMappingDataSetBySystemCode(MappingSystemCode);

   for CurrentListItem in lvTables.Items do
   begin
      if CurrentListItem.Checked then
       begin
          RelationName:=CurrentListItem.Caption;
          if self.chkTablePrefix.Checked then
           begin
              TablePrefix:=self.txtTablePrefix.Text;
              RelationName:=StringReplace(RelationName, TablePrefix, '', [rfIgnoreCase]);
           end;
           {provider method here}
           self.FDataProvider.CreateRelation(self.FModelProvider, MappingValuesDataSet, RelationName, CurrentListItem.Caption, self.chkExcludePrimary.Checked);
       end;
   end;

end;

procedure TfrmModelImporter.CheckBox1Change(Sender: TObject);
begin

end;

procedure TfrmModelImporter.chkSelectAllChange(Sender: TObject);
var
  Item:TListItem;
begin
   for Item in self.lvTables.Items do
   begin
      Item.Checked:=self.chkSelectAll.Checked;
   end;
end;

procedure TfrmModelImporter.chkTablePrefixChange(Sender: TObject);
begin
  self.txtTablePrefix.Enabled:=self.chkTablePrefix.Checked;
end;


constructor TfrmModelImporter.Create(AOwner: TComponent; var PAppSettings: TAppSettings; var PModelProvider:IDataProvider; PModelsList:TDataSet);
begin
  inherited Create(AOwner);
  self.FAppSettings:=PAppSettings;
  FModelsList:=PModelsList;
  FModelProvider:=PModelProvider;
  if self.FAppSettings.DatabaseType=edbMySQL then
   begin
      self.FDataProvider:=TMYSQLImportProvider.Create();
  end;
end;

destructor TfrmModelImporter.Destroy();
begin
  if Assigned(FDataProvider) then
   begin
     FDataProvider.Disconnect();
     //FreeAndNil(FDataProvider);
   end;

  if Assigned(FModelProvider) then
   FreeAndNil(FModelProvider);
  inherited;
end;

procedure TfrmModelImporter.Connect;
var
  DSTables:TDataSet;
  TableName:String;
  ModelLookupData:TLongIntLookup;
begin
  self.FDataProvider.Connect(FAppSettings.DatabaseHost, FAppSettings.DatabasePort, FAppSettings.DatabaseName, FAppSettings.DatabaseUser, FAppSettings.DatabasePassword);
  self.lblConnectionDisplay.Caption:=self.FDataProvider.DisplayConnection();
  self.FDataProvider.LoadTables();
  DSTables:=self.FDataProvider.GetTables();
  self.lvTables.Items.BeginUpdate;
  self.lvTables.Clear;
  while not DSTables.EOF do
  begin
     TableName:=DSTables.FieldByName('TABLE_NAME').AsString;
     with self.lvTables.Items.Add() do
     begin
        Caption:=TableName;
        SubItems.Add(TableName);
     end;
     DSTables.Next;
  end;
  self.lvTables.EndUpdate;
  self.cboModelLookup.Clear;
  while not self.FModelsList.EOF do
  begin
     ModelLookupData:=TLongIntLookup.Create(self.FModelsList.FieldByName('ModelId').AsLongint, self.FModelsList.FieldByName('Name').AsString);
     self.cboModelLookup.AddItem(ModelLookupData.Display, ModelLookupData);
     //self.cboModelLookup.Items.Add(self.FModelsList.FieldByName('Name').AsString);
     self.FModelsList.Next;
  end;

end;

procedure TfrmModelImporter.LoadColumns(PTableName:String);
var
  DSColumns:TDataSet;
  ColumnName:String;
  ColumnType:String;
  ColumnNullable:String;
  ColumnLength:String;
  ColumnKey:String;
begin
     self.FDataProvider.LoadColumns(PTableName);
     DSColumns:=self.FDataProvider.GetColumns();
     self.lvColumns.Items.BeginUpdate;
     self.lvColumns.Clear;
     while not DSColumns.EOF do
     begin
        ColumnName:=DSColumns.FieldByName('COLUMN_NAME').AsString;
        ColumnType:=DSColumns.FieldByName('DATA_TYPE').AsString;
        ColumnNullable:=DSColumns.FieldByName('IS_NULLABLE').AsString;
        ColumnLength:='';
        if not DSColumns.FieldByName('CHARACTER_MAXIMUM_LENGTH').IsNull then
         ColumnLength:=DSColumns.FieldByName('CHARACTER_MAXIMUM_LENGTH').AsString;
        ColumnKey:='NO';
        if not DSColumns.FieldByName('COLUMN_KEY').IsNull then
         begin
           ColumnKey:=DSColumns.FieldByName('COLUMN_KEY').AsString;
           if ColumnKey = 'PRI' then
            ColumnKey:= 'YES'
           else
             ColumnKey:='NO';
         end;
        with self.lvColumns.Items.Add() do
        begin
           Caption:=ColumnName;
           //SubItems.Add(ColumnName);
           SubItems.Add(ColumnType);
           SubItems.Add(ColumnNullable);
           SubItems.Add(ColumnLength);
           SubItems.Add(ColumnKey);
        end;
        DSColumns.Next;
     end;
     self.lvColumns.EndUpdate;
end;

{$R *.lfm}

end.

