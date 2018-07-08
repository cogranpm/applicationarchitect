unit frmLookupDetailLookup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, FrameLookupDetailLookup, db, sqldb, appinterfacesunit, ComCtrls;

type

  { TfrmLookupDetailLookup }

  TfrmLookupDetailLookup = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    fraLookup: TfraLookupDetailLookup;
    pnlButtons: TPanel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstListValueSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);

  private
    { private declarations }
    FListHeaderLookup:TDataSource;
    FListDetailLookup:TDataSource;
    FSelectedListItemData:TLongIntLookup;
  public
    { public declarations }
    property ListHeaderLookup : TDataSource read FListHeaderLookup write  FListHeaderLookup;
    property ListDetailLookup : TDataSource read FListDetailLookup write FListDetailLookup;
    property SelectedListItemData:TLongIntLookup read FSelectedListItemData write FSelectedListItemData;
  private
    procedure PopulateListHeader();
    procedure PopulateListDetail(PListHeaderID:LongInt);
    procedure lstHeaderSelectionChange(Sender: TObject;User: boolean);
  end;



implementation

{$R *.lfm}

{ TfrmLookupDetailLookup }

procedure TfrmLookupDetailLookup.FormShow(Sender: TObject);
begin
     self.PopulateListHeader();
     self.fraLookup.lstHeader.OnSelectionChange:=@lstHeaderSelectionChange;
end;

procedure TfrmLookupDetailLookup.lstListValueSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  self.btnOK.Enabled:=True;
end;


procedure TfrmLookupDetailLookup.btnCancelClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmLookupDetailLookup.btnOKClick(Sender: TObject);
var
  ListItemData:TLongIntLookup;
begin
     ListItemData:=TLongIntLookup(self.fraLookup.lstListValue.Selected.Data);
     FSelectedListItemData:=TLongIntLookup.Create(ListItemData.Key, ListItemData.Display, ListItemData.Code);
     self.Close;
end;

procedure TfrmLookupDetailLookup.lstHeaderSelectionChange(Sender: TObject;User: boolean);
var
   SelectedData:TObject;
begin
   SelectedData:=self.fraLookup.lstHeader.Items.Objects[self.fraLookup.lstHeader.ItemIndex];
   if SelectedData <> Nil then
   begin
     self.PopulateListDetail(TLongIntLookup(SelectedData).Key);
   end;
end;

procedure TfrmLookupDetailLookup.PopulateListHeader();
var
  ListData:TLongIntLookup;
begin
     self.fraLookup.lstHeader.Clear;
     FListHeaderLookup.DataSet.Active:=True;
     FListHeaderLookup.DataSet.First;
     while not FListHeaderLookup.DataSet.EOF do
     begin
       ListData:=TLongIntLookup.Create(FListHeaderLookup.DataSet.FieldByName('ListHeaderId').AsLargeInt, FListHeaderLookup.DataSet.FieldByName('Name').AsString);
       self.fraLookup.lstHeader.AddItem(ListData.Display, ListData);
       FListHeaderLookup.DataSet.Next;
     end;
end;

procedure TfrmLookupDetailLookup.PopulateListDetail(PListHeaderID:LongInt);
var
  ListData:TLongIntLookup;
  ListDetailQuery:TSQLQuery;
  ListItemData:TLongIntLookup;
begin
  self.fraLookup.lstListValue.Items.BeginUpdate;
  self.fraLookup.lstListValue.Clear;
  FListDetailLookup.DataSet.Active:=False;
  ListDetailQuery:=TSQLQuery(FListDetailLookup.DataSet);
  ListDetailQuery.ParamByName('ListHeaderId').AsLargeInt:=PListHeaderID;
  ListDetailQuery.Active:=True;
  while not ListDetailQuery.EOF do
  begin
    with self.fraLookup.lstListValue.Items.Add() do
    begin
       Caption:=ListDetailQuery.FieldByName('Code').AsString;
       SubItems.Add(ListDetailQuery.FieldByName('Label').AsString);
       ListItemData:=TLongIntLookup.Create(ListDetailQuery.FieldByName('ListDetailID').AsLargeInt,
       ListDetailQuery.FieldByName('Label').AsString, ListDetailQuery.FieldByName('Code').AsString);
       Data:=ListItemData;
    end;
    ListDetailQuery.Next;
  end;
  self.fraLookup.lstListValue.EndUpdate;
  self.fraLookup.lstListValue.Enabled:=True;
end;

end.

