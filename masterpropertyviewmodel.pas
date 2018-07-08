unit MasterPropertyViewModel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, appinterfacesunit, Forms, frmMasterProperty;

type
   TMasterPropertyViewModel = class(TObject)
   private
      FMasterPropertyDataSet:TSQLQuery;
      FMasterPropertyToCategoryDataSet:TSQLQuery;
      FMasterCategoryLookupDataSource:TDataSet;
      FGetMasterCategoryByMasterPropertyIDDataSet:TDataSource;
      FFrameInstance: TfrmMasterProperty;
   public
      constructor Create();
      destructor Destroy();
      procedure Init(PFrameInstance:TfrmMasterProperty; PMasterPropertyDataSet:TSQLQuery; PMasterPropertyToCategoryDataSet:TSQLQuery; PMasterCategoryLookupDataSource:TDataSet;
        PGetMasterCategoryByMasterPropertyIDDataSet:TDataSource);
      procedure RefreshCategoryList();
      procedure LoadCategoryList();
      procedure OnPost();
      procedure OnPostMasterProperty(DataSet:TDataSet);
      procedure OnScrollMasterProperty(DataSet:TDataSet);
   end;

implementation

constructor TMasterPropertyViewModel.Create();
begin
   inherited Create;

end;

destructor TMasterPropertyViewModel.Destroy();
begin
   inherited;
end;

procedure TMasterPropertyViewModel.Init(PFrameInstance:TfrmMasterProperty; PMasterPropertyDataSet:TSQLQuery; PMasterPropertyToCategoryDataSet:TSQLQuery;
  PMasterCategoryLookupDataSource:TDataSet; PGetMasterCategoryByMasterPropertyIDDataSet:TDataSource);
begin
     FFrameInstance:=PFrameInstance;
     FMasterPropertyDataSet:=PMasterPropertyDataSet;
     FMasterPropertyToCategoryDataSet:=PMasterPropertyToCategoryDataSet;
     FMasterCategoryLookupDataSource:=PMasterCategoryLookupDataSource;
     FGetMasterCategoryByMasterPropertyIDDataSet:=PGetMasterCategoryByMasterPropertyIDDataSet;
     self.LoadCategoryList();
     self.RefreshCategoryList();
end;

procedure TMasterPropertyViewModel.OnPostMasterProperty(DataSet:TDataSet);
begin
    self.OnPost();
end;

procedure TMasterPropertyViewModel.OnScrollMasterProperty(DataSet:TDataSet);
begin
    RefreshCategoryList();
end;

procedure TMasterPropertyViewModel.OnPost();
var
  MasterPropertyID : LongInt;
  MasterCategoryID : LongInt;
  i : Integer;
  CheckboxData : MasterCategoryCheckboxListItem;
  ItemChecked : Boolean;
begin
  { save the master category choices
    if not checked, then delete all where masterpropertyid = current master property id
    if checked then insert if not already inserted
  }


  MasterPropertyID:=FMasterPropertyDataSet.FieldByName('MASTERPROPERTYID').AsLargeInt;
  FMasterPropertyToCategoryDataSet.Active:=False;
  FMasterPropertyToCategoryDataSet.ParamByName('MASTERPROPERTYID').AsLargeInt:=MasterPropertyID;
  FMasterPropertyToCategoryDataSet.Active:=True;

  for i:= 0 to FFrameInstance.chkCategoriesList.Count -1 do
  begin
     CheckboxData:=MasterCategoryCheckboxListItem(FFrameInstance.chkCategoriesList.Items.Objects[i]);
     MasterCategoryID:=CheckboxData.FMasterCategoryId;
     ItemChecked := FFrameInstance.chkCategoriesList.Checked[i];
     if ItemChecked then

     begin
       if not FMasterPropertyToCategoryDataSet.Locate('MASTERCATEGORYID', MasterCategoryID, [loCaseInsensitive]) then
       begin
         FMasterPropertyToCategoryDataSet.Append;
         FMasterPropertyToCategoryDataSet.FieldByName('MASTERCATEGORYID').AsLargeInt:=MasterCategoryID;
         FMasterPropertyToCategoryDataSet.FieldByName('MASTERPROPERTYID').AsLargeInt:=MasterPropertyID;
       end;
     end
     else
     begin
       if FMasterPropertyToCategoryDataSet.Locate('MASTERCATEGORYID', MasterCategoryID, [loCaseInsensitive]) then
       begin
         FMasterPropertyToCategoryDataSet.Delete;
       end;
     end;
  end;

  FMasterPropertyToCategoryDataSet.ApplyUpdates(-1);
  TSQLTransaction(FMasterPropertyToCategoryDataSet.Transaction).CommitRetaining;
  FMasterPropertyToCategoryDataSet.Active:=False;

end;

procedure TMasterPropertyViewModel.LoadCategoryList();
var
  MasterCategoryId : LongInt;
  CheckboxData : MasterCategoryCheckboxListItem;
  Counter : LongInt;
begin
    {
     store the mastercategoryid in the data of the checkbox list item
     recover this value in the apply of the sql query via:
     CheckboxData:=MasterCategoryCheckboxListItem(self.chkCategoriesList.Items.Objects[0]);
    }


    FFrameInstance.chkCategoriesList.Clear;
   Counter:=0;
   FMasterCategoryLookupDataSource.First;
   while not FMasterCategoryLookupDataSource.EOF do
   begin

      MasterCategoryId := FMasterCategoryLookupDataSource.FieldByName('MasterCategoryId').AsLargeInt;
      CheckboxData:=MasterCategoryCheckboxListItem.Create;
      CheckboxData.FMasterCategoryId:=MasterCategoryId;
      FFrameInstance.chkCategoriesList.AddItem(FMasterCategoryLookupDataSource.FieldByName('Name').AsString, CheckboxData);
      FMasterCategoryLookupDataSource.Next;
      Counter:=Counter+1;
   end;
   FMasterCategoryLookupDataSource.First;

end;

procedure TMasterPropertyViewModel.RefreshCategoryList();
var
  MasterPropertyID : LongInt;
  MasterCategoryID : LongInt;
  MasterCategoryFound : Boolean;
  CheckboxData : MasterCategoryCheckboxListItem;
  i : Integer;
begin
{ loop over the checkbox list and set the checked item appropriately }

  MasterPropertyID:=FMasterPropertyDataSet.FieldByName('MASTERPROPERTYID').AsLargeInt;
  self.FGetMasterCategoryByMasterPropertyIDDataSet.DataSet.Active:=False;
  TSQLQuery(self.FGetMasterCategoryByMasterPropertyIDDataSet.DataSet).ParamByName('MASTERPROPERTYID').AsLargeInt:=MasterPropertyID;
  self.FGetMasterCategoryByMasterPropertyIDDataSet.DataSet.Active:=True;

  for i:= 0 to FFrameInstance.chkCategoriesList.Count -1 do
  begin
     CheckboxData:=MasterCategoryCheckboxListItem(FFrameInstance.chkCategoriesList.Items.Objects[i]);
     MasterCategoryID:=CheckboxData.FMasterCategoryId;
     MasterCategoryFound:=self.FGetMasterCategoryByMasterPropertyIDDataSet.DataSet.Locate('MASTERCATEGORYID', MasterCategoryID, [loCaseInsensitive]);
     FFrameInstance.chkCategoriesList.Checked[i]:=MasterCategoryFound;
  end;

  self.FGetMasterCategoryByMasterPropertyIDDataSet.DataSet.Active:=False;

end;

end.

