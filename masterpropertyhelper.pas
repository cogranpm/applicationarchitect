unit MasterPropertyHelper;

{$mode objfpc}{$H+}

interface



uses
  Classes, SysUtils, appinterfacesunit, Controls, Grids, ValEdit, sqldb, db;

{
maybe http://www.nldelphi.com/showthread.php?24978-TValueListEditor-vs-manuele-ComboBox
for a solution for codes/display in combo box
type
    TMyValueListEditor = class(TValueListEditor);
}

type
  TMasterPropertyHelper = class(TObject)
    private

    public
      constructor Create();
      procedure BindPropertyValuesToValuesList(var PDataProvider: IDataProvider; PDataSet : TSQLQuery; MasterPropertyKeyName:String; PPropertyValuesListWidget : TValueListEditor; PMasterCategory:String);
      procedure BindPropertyValuesToDataSet(var PDataProvider: IDataProvider; PDataSet : TSQLQuery; ParentKeyName:String; ParentKeyValue:LongInt; MasterPropertyKeyName:String; PPropertyValuesListWidget : TValueListEditor; PMasterCategory:String);
  end;

implementation


constructor TMasterPropertyHelper.Create();
begin

end;

procedure TMasterPropertyHelper.BindPropertyValuesToValuesList(var PDataProvider: IDataProvider; PDataSet : TSQLQuery; MasterPropertyKeyName:String; PPropertyValuesListWidget : TValueListEditor; PMasterCategory:String);
{
given a source dataset, will create a row in passed in value list object for each
master property for the given category.
}

var
   ItemProp : TItemProp;
   FoundScreenProperty : Boolean;
   FoundScreenPropertyValue : String;
   lookups : TStringList;
   booleanLookup : TStringList;
   MasterPropertiesData:TSQLQuery;
   LookupItem:TStringLookup;
   LookupCount:Integer;
   LookupCounter:Integer;
begin

    booleanLookup := TStringList.Create;
    booleanLookup.Add('True');
    booleanLookup.Add('False');
    PPropertyValuesListWidget.Clear;
    PPropertyValuesListWidget.Row:=0;

    MasterPropertiesData := PDataProvider.GetMasterPropertiesLookup();
    MasterPropertiesData.Active:=False;
    MasterPropertiesData.ParamByName('category').AsString:=PMasterCategory;
    MasterPropertiesData.Active:=True;
    while not MasterPropertiesData.EOF do
    begin
        FoundScreenProperty := PDataSet.Locate(MasterPropertyKeyName, MasterPropertiesData.FieldByName('masterpropertyid').AsLongint, [loCaseInsensitive]);
        if FoundScreenProperty then
            FoundScreenPropertyValue :=  PDataSet.FieldByName('PROPERTYVALUE').AsString
        else
             FoundScreenPropertyValue :=  MasterPropertiesData.FieldByName('defaultvalue').AsString;

        lookups := TStringList.Create;
        PDataProvider.GetListOfMasterPropertyLookups(MasterPropertiesData.FieldByName('masterpropertyid').AsLongint, lookups);
        LookupCount:=lookups.Count;
        ItemProp := TItemProp.Create(PPropertyValuesListWidget);
        if LookupCount > 0 then
        begin
           ItemProp.KeyDesc:='Lookups: PickList';
           ItemProp.EditStyle := esPickList;
           ItemProp.ReadOnly := True;
           //ItemProp.PickList := lookups;
           //ItemProp.PickList.AddStrings(lookups);
           ItemProp.PickList:=lookups;
           //set the variable FoundScreenPropertyValue to the display side of the lookup item
           //which is stored as an object of type TStringLookup in the StringList
           for LookupCounter:=0 to LookupCount - 1 do
             begin
                LookupItem:=TStringLookup(lookups.Objects[LookupCounter]);
                if LookupItem <> Nil then
                begin
                   if LookupItem.Key = FoundScreenPropertyValue then
                    begin
                      FoundScreenPropertyValue:=LookupItem.Display;
                      Break;
                    end;
                end;
             end;
        end
        else if MasterPropertiesData.FieldByName('propertyTypeName').AsString = 'Boolean' then
        begin
            ItemProp.KeyDesc:='True False: PickList';
            ItemProp.EditStyle := esPickList;
            ItemProp.ReadOnly := True;
            ItemProp.PickList := booleanLookup;

        end
        else
        begin
           ItemProp.EditStyle:=esSimple;
        end;
        PPropertyValuesListWidget.InsertRow(MasterPropertiesData.FieldByName('name').AsString, FoundScreenPropertyValue, true);
        PPropertyValuesListWidget.ItemProps[MasterPropertiesData.FieldByName('name').AsString] := ItemProp;
        MasterPropertiesData.Next;
    end;
    MasterPropertiesData.First;

end;

procedure TMasterPropertyHelper.BindPropertyValuesToDataSet(var PDataProvider: IDataProvider; PDataSet : TSQLQuery; ParentKeyName:String; ParentKeyValue:LongInt; MasterPropertyKeyName:String; PPropertyValuesListWidget : TValueListEditor; PMasterCategory:String);
var
   MasterPropertiesData:TSQLQuery;
   PropertyValue : String;
   valueListRowCount : integer;
   valueListCounter : integer;
   currentValueListKey : string;
   currentValueListString : string;
   foundMasterProperty : boolean;
   currentMasterPropertyId : LongInt;
   foundPropertyValue:boolean;
   MasterPropertyName:String;
   Lookups:TStrings;
   ItemProperty:TItemProp;
   Item:TObject;
   LookupItem:TStringLookup;
   LookupCount:Integer;
   LookupCounter:Integer;
begin
   MasterPropertiesData := PDataProvider.GetMasterPropertiesLookup();
   MasterPropertiesData.Active:=False;
   MasterPropertiesData.ParamByName('category').AsString:=PMasterCategory;
   MasterPropertiesData.Active:=True;

    valueListRowCount := PPropertyValuesListWidget.RowCount;
    for valueListCounter := 0 to valueListRowCount - 1 do
      begin
         currentValueListKey := PPropertyValuesListWidget.Keys[valueListCounter];
         currentValueListString := PPropertyValuesListWidget.Values[currentValueListKey];
         foundMasterProperty := MasterPropertiesData.Locate('name', currentValueListKey, [loCaseInsensitive]);
         if foundMasterProperty then
         begin
            currentMasterPropertyId := MasterPropertiesData.FieldByName('MASTERPROPERTYID').AsLongint;
            MasterPropertyName:=MasterPropertiesData.FieldByName('name').AsString;

            //  Lookups   - need to save the lookup code rather then the display (lookups are stored in db as code/display)
            // this requires a string compare on value in valuelist with display data in lookup
            ItemProperty:=PPropertyValuesListWidget.ItemProps[MasterPropertyName];
             if ItemProperty <> Nil then
            begin
               if ItemProperty.EditStyle = esPickList then
                begin
                   Lookups:=ItemProperty.PickList;
                   LookupCount:=Lookups.Count;
                   for LookupCounter:=0 to LookupCount - 1 do
                     begin
                       if Lookups.Strings[LookupCounter] = currentValueListString then
                        begin
                           Item:=Lookups.Objects[LookupCounter];
                           if Item <> Nil then
                            begin
                               LookupItem:=TStringLookup(Item);
                               currentValueListString:=LookupItem.Key;
                            end;
                           Break;
                        end;
                     end;
                end;
            end;

            foundPropertyValue :=  PDataSet.Locate(MasterPropertyKeyName, currentMasterPropertyId, [loCaseInsensitive]);
             if foundPropertyValue then
                 begin
                 PDataSet.Edit;
                 PDataSet.FieldByName('PROPERTYVALUE').AsString := currentValueListString;
                 end
              else
                if  currentValueListString <> '' then
                 begin
                  //insert a new record
                  PDataSet.Append;
                  PDataSet.FieldByName(MasterPropertyKeyName).AsLongint:= currentMasterPropertyId;
                  PDataSet.FieldByName(ParentKeyName).AsLongint:=ParentKeyValue;
                  PDataSet.FieldByName('PROPERTYVALUE').AsString:=currentValueListString;
                  end;
         end;
       end;
   PDataSet.ApplyUpdates(-1);
   TSQLTransaction(PDataSet.Transaction).CommitRetaining;
   PDataSet.First;
   MasterPropertiesData.First;

 end;

end.

