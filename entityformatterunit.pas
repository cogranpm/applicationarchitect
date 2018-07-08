unit EntityFormatterUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpjson, jsonparser, db, sqldb, appinterfacesunit, BuildEntityDTOUnit, contnrs, uPSComponent;


{
type
  lazFieldDataTypeMapArray = array[1..16] of string;

type
  lazFieldTypeClassMapArray = array[1..16] of string;
}

type
  TIterationCallback = procedure(DataSet:TDataSet; Payload:TJSONObject) of object;


type
  TEntityFormatter = class(TObject)

  private
       function GetBuild(BuildData:TSQLQuery):TJSONArray;
       function GetManyToManyEntity(PBuildScript: TPSScript; PAssociationName:String; PParentName:String; PChildName:String):TJSONObject;

  public
       constructor Create();
       destructor Destroy(); override;
       procedure Init(var BuildDataDTO:TBuildEntityDTO);
       function GetModel(): TJSONObject;
       function GetRelationByRelationId(RelationId:LongInt; IncludeAttributes:Boolean; IncludeRelatedEntities:Boolean):TJSONObject;

       {iterate procedures}
       procedure IterateModel(PBuildScript: TPSScript);
       function IterateRelation(PBuildScript: TPSScript; RelationData:TSQLQuery; IncludeAttributes:Boolean; IncludeRelatedEntities:Boolean):TJSONObject;
       function IterateAttributes(PBuildScript: TPSScript; PRelationId: LongInt; PRelationName:String):TJSONArray;
       function IterateRelatedEntities(PBuildScript: TPSScript; PRelationId: LongInt; AssociationData:TSQLQuery; ParameterName:String; PAssociationType:associationType; var PCount:Integer):TJSONArray;
       function GetPrimaryKeys(PBuildScript: TPSScript; PRelationId: LongInt; PRelationName:String):TJSONArray;
       function GetForeignKeys(PBuildScript: TPSScript; PRelationId: LongInt; PRelationName:String):TJSONArray;

  private
       FBuildDataDTO:TBuildEntityDTO;
       //FLazFieldDataTypes:lazFieldDataTypeMapArray;
       //FLazFieldDataTypeClass:lazFieldTypeClassMapArray;
  end;

implementation


constructor TEntityFormatter.Create();
begin

   {
   FLazFieldDataTypes[1]:='ftString';
   FLazFieldDataTypes[2]:='ftInteger';
   FLazFieldDataTypes[3]:='ftBoolean';
   FLazFieldDataTypes[4]:='ftDate';
   FLazFieldDataTypes[5]:='ftFloat';
   FLazFieldDataTypes[6]:='ftFixedChar';
   FLazFieldDataTypes[7]:='ftBytes';
   FLazFieldDataTypes[8]:='ftSmallint';
   FLazFieldDataTypes[9]:='ftLargeint';
   FLazFieldDataTypes[10]:='ftFloat';
   FLazFieldDataTypes[11]:='ftFloat';
   FLazFieldDataTypes[12]:='ftVarBytes';
   FLazFieldDataTypes[13]:='ftString';
   FLazFieldDataTypes[14]:='ftTime';
   FLazFieldDataTypes[15]:='ftDateTime';
   FLazFieldDataTypes[16]:='ftGuid';

   FLazFieldDataTypeClass[1]:='TStringField';
   FLazFieldDataTypeClass[2]:='TIntegerField';
   FLazFieldDataTypeClass[3]:='TBooleanField';
   FLazFieldDataTypeClass[4]:='TDateField';
   FLazFieldDataTypeClass[5]:='TFloatField';
   FLazFieldDataTypeClass[6]:='TStringField';
   FLazFieldDataTypeClass[7]:='TBytesField';
   FLazFieldDataTypeClass[8]:='TSmallintField';
   FLazFieldDataTypeClass[9]:='TLargeintField';
   FLazFieldDataTypeClass[10]:='TFloatField';
   FLazFieldDataTypeClass[11]:='TFloatField';
   FLazFieldDataTypeClass[12]:='TBlobField';
   FLazFieldDataTypeClass[13]:='TStringField';
   FLazFieldDataTypeClass[14]:='TTimeField';
   FLazFieldDataTypeClass[15]:='TDateTimeField';
   FLazFieldDataTypeClass[16]:='TGuidField';
   }

  inherited.Create();
end;

destructor TEntityFormatter.Destroy();
begin
     if Assigned(FBuildDataDTO) then
        FreeAndNil(FBuildDataDTO);
end;

procedure TEntityFormatter.Init(var BuildDataDTO:TBuildEntityDTO);
begin
   self.FBuildDataDTO:=BuildDataDTO;
end;

procedure TEntityFormatter.IterateModel(PBuildScript: TPSScript);
var
   StartIterateModelCallback: TIterationCallback;
   EndIterateModelCallback: TIterationCallback;
   jData : TJSONObject;
   jRelations : TJSONArray;
   jRelationData : TJSONObject;
begin

   try
     StartIterateModelCallback:=TIterationCallback(PBuildScript.GetProcMethod('StartIterateModel'));
     EndIterateModelCallback:=TIterationCallback(PBuildScript.GetProcMethod('EndIterateModel'));

     jData:=TJSONObject.Create;
     jData.Add('ModelId', self.FBuildDataDTO.ModelData.FieldByName('ModelID').AsLargeInt);
     jData.Add('Name', self.FBuildDataDTO.ModelData.FieldByName('Name').AsString);
     jData.Add('Build', GetBuild(self.FBuildDataDTO.BuildData));
     jRelations := TJSONArray.Create;

     if StartIterateModelCallback <> Nil then
     begin
         StartIterateModelCallback(FBuildDataDTO.ModelData, jData);
     end;
      while not self.FBuildDataDTO.RelationData.EOF do
      begin
        jRelationData:=self.IterateRelation(PBuildScript, self.FBuildDataDTO.RelationData, True, True);
        jRelations.Add(jRelationData);
        FBuildDataDTO.RelationData.Next;
      end;
      jData.Add('Relations', jRelations);
      if EndIterateModelCallback <> Nil then
      begin
           EndIterateModelCallback(FBuildDataDTO.ModelData, jData);
      end;
   finally

     {  can't free these items, left as a reminder
     if Assigned(StartIterateModelCallback) then
        FreeAndNil(StartIterateModelCallback);
     if Assigned(EndIterateModelCallback) then
        FreeAndNil(EndIterateModelCallback);
     }
     if Assigned(jData) then
        FreeAndNil(jData);

     self.FBuildDataDTO.RelationData.First;
     self.FBuildDataDTO.AttributeData.First;
     self.FBuildDataDTO.ParentAssociationData.First;
     self.FBuildDataDTO.ChildAssociationData.First;

   end;

end;

function TEntityFormatter.GetModel(): TJSONObject;
var
   jData : TJSONObject;
   jRelations : TJSONArray;
   jRelationData : TJSONObject;

begin
     jData:=TJSONObject.Create;
     jData.Add('ModelId', self.FBuildDataDTO.ModelData.FieldByName('ModelID').AsLargeInt);
     jData.Add('Name', self.FBuildDataDTO.ModelData.FieldByName('Name').AsString);
     jRelations := TJSONArray.Create;
     while not self.FBuildDataDTO.RelationData.EOF do
     begin
       jRelationData:=self.IterateRelation(Nil, self.FBuildDataDTO.RelationData, True, True);
       jRelations.Add(jRelationData);
       FBuildDataDTO.RelationData.Next;
     end;
     jData.Add('Relations', jRelations);
     jData.Add('Build', GetBuild(self.FBuildDataDTO.BuildData));
     GetModel:=jData;
end;

function TEntityFormatter.IterateRelation(PBuildScript: TPSScript; RelationData:TSQLQuery; IncludeAttributes:Boolean; IncludeRelatedEntities:Boolean):TJSONObject;
var
   StartIterateCallback: TIterationCallback;
   EndIterateCallback: TIterationCallback;
   jRelationData : TJSONObject;
   RelationName: String;
   RelationId: LongInt;
   RelatedCount:Integer;

begin

   try
      jRelationData:=TJSONObject.Create;
      RelationName:=RelationData.FieldByName('Name').AsString;
      RelationId:= RelationData.FieldByName('RelationId').AsLargeInt;
      jRelationData.Add('RelationName', RelationName);
      jRelationData.Add('PrimaryKeyName', RelationName + 'Id');
      jRelationData.Add('Frozen', RelationData.FieldByName('Frozen').AsBoolean);

      if PBuildScript <> Nil then
      begin
        StartIterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('StartIterateRelation'));
        EndIterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('EndIterateRelation'));
        if StartIterateCallback <> Nil then
        begin
          StartIterateCallback(RelationData, jRelationData);
        end;
      end;

      if IncludeAttributes then
      begin
        {add attributes to json}
        jRelationData.Add('Attributes', self.IterateAttributes(PBuildScript, RelationId, RelationName));
      end;
      {add child associations to relation}
      if IncludeRelatedEntities then
      begin
        RelatedCount:=0;
        jRelationData.Add('ChildRelationsLookup', self.IterateRelatedEntities(PBuildScript, RelationId, self.FBuildDataDTO.ChildAssociationData, 'ownerid', atLookup, RelatedCount));
        RelatedCount:=0;
        jRelationData.Add('ChildRelationsOneToOne', self.IterateRelatedEntities(PBuildScript, RelationId, self.FBuildDataDTO.ChildAssociationData, 'ownerid', atOneToOne, RelatedCount));
        RelatedCount:=0;
        jRelationData.Add('ChildRelationsOneToMany', self.IterateRelatedEntities(PBuildScript, RelationId, self.FBuildDataDTO.ChildAssociationData, 'ownerid', atOneToMany, RelatedCount));
        RelatedCount:=0;
        jRelationData.Add('ChildRelationsManyToMany', self.IterateRelatedEntities(PBuildScript, RelationId, self.FBuildDataDTO.ChildAssociationData, 'ownerid', atManyToMany, RelatedCount));
        RelatedCount:=0;
        jRelationData.Add('ParentRelations', self.IterateRelatedEntities(PBuildScript, RelationId, self.FBuildDataDTO.ParentAssociationData, 'ownedid', atOneToMany, RelatedCount));

        if RelatedCount = 0 then
        begin
           jRelationData.Add('HasParents', False);
           jRelationData.Add('MultipleParents', False);
        end
        else
        begin
           jRelationData.Add('HasParents', True);
           if RelatedCount > 1 then
              jRelationData.Add('MultipleParents', True)
           else
              jRelationData.Add('MultipleParents', False);
        end;
      end;


      if PBuildScript <> Nil then
      begin
        if EndIterateCallback <> Nil then
        begin
          EndIterateCallback(RelationData, jRelationData);
        end;
      end;

      IterateRelation:=jRelationData;
   finally

   end;

end;

function TEntityFormatter.GetRelationByRelationId(RelationId:LongInt; IncludeAttributes:Boolean; IncludeRelatedEntities:Boolean):TJSONObject;
begin
     self.FBuildDataDTO.LoadRelationData.Active:=False;
     self.FBuildDataDTO.LoadRelationData.ParamByName('relationid').AsLargeInt:=RelationId;
     self.FBuildDataDTO.LoadRelationData.Active:=True;
     GetRelationByRelationId:=self.IterateRelation(Nil, self.FBuildDataDTO.LoadRelationData, IncludeAttributes, IncludeRelatedEntities);

end;


function TEntityFormatter.GetBuild(BuildData:TSQLQuery):TJSONArray;
var
   jBuilds: TJSONArray;
   jBuildData : TJSONObject;

begin
   jBuilds := TJSONArray.Create;
   while not BuildData.EOF do
   begin
     jBuildData:=TJSONObject.Create;
     jBuildData.Add('Build', BuildData.FieldByName('Name').AsString);
     jBuilds.Add(jBuildData);
     BuildData.Next;
   end;
   GetBuild:=jBuilds;
end;

function TEntityFormatter.GetPrimaryKeys(PBuildScript: TPSScript; PRelationId: LongInt; PRelationName:String):TJSONArray;
var
   jAttributeData : TJSONObject;
   jAttributes: TJSONArray;
   IterateCallback: TIterationCallback;
begin
   IterateCallback:=Nil;
     if PBuildScript <> Nil then
     begin
       IterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('IterateAttribute'));
     end;
   jAttributes:=TJSONArray.Create;
   jAttributeData:=TJSONObject.Create;
   jAttributeData.Add('AttributeName', PRelationName + 'Id');
   jAttributeData.Add('AttributeType', ord(atLong));
   jAttributeData.Add('AttributeLength', 0);
   jAttributeData.Add('AllowNull', False);
   jAttributeData.Add('Visible', False);
   jAttributeData.Add('IsPrimaryKey', True);
   jAttributeData.Add('IsForeignKey', False);
   jAttributeData.Add('IsKeyField', True);
   jAttributes.Add(jAttributeData);
     if IterateCallback <> Nil then
     begin
       IterateCallback(self.FBuildDataDTO.AttributeData, jAttributeData);
     end;
   GetPrimaryKeys:=jAttributes;
end;

function TEntityFormatter.GetForeignKeys(PBuildScript: TPSScript; PRelationId: LongInt; PRelationName:String):TJSONArray;
var
   jAttributeData : TJSONObject;
   jAttributes: TJSONArray;
   ForeignKeyType:Integer;
   IterateCallback: TIterationCallback;
begin
   IterateCallback:=Nil;
     if PBuildScript <> Nil then
     begin
       IterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('IterateAttribute'));
     end;
     jAttributes:=TJSONArray.Create;
     jAttributeData:=TJSONObject.Create;
    self.FBuildDataDTO.ParentAssociationData.Active:=False;
    self.FBuildDataDTO.ParentAssociationData.ParamByName('ownedid').AsLargeInt:=PRelationId;
    self.FBuildDataDTO.ParentAssociationData.Active:=True;
    if not self.FBuildDataDTO.ParentAssociationData.EOF then
    begin
       self.FBuildDataDTO.ParentAssociationData.First;
       while not self.FBuildDataDTO.ParentAssociationData.EOF do
       begin
         ForeignKeyType:=self.FBuildDataDTO.ParentAssociationData.FieldByName('type').AsInteger;
         if ForeignKeyType=ord(atOneToMany) then
         begin
           jAttributeData:=TJSONObject.Create;
           jAttributeData.Add('AttributeName', self.FBuildDataDTO.ParentAssociationData.FieldByName('Name').AsString);
           jAttributeData.Add('AttributeType', ord(atLong));
           jAttributeData.Add('AttributeLength', 0);
           jAttributeData.Add('AllowNull', True);
           jAttributeData.Add('Visible', False);
           jAttributeData.Add('IsPrimaryKey', False);
           jAttributeData.Add('IsForeignKey', True);
           jAttributeData.Add('IsKeyField', True);
           if IterateCallback <> Nil then
           begin
             IterateCallback(self.FBuildDataDTO.AttributeData, jAttributeData);
           end;
           jAttributes.Add(jAttributeData);
         end;
         self.FBuildDataDTO.ParentAssociationData.Next;
       end;
    end;

    self.FBuildDataDTO.ChildAssociationData.Active:=False;
    self.FBuildDataDTO.ChildAssociationData.ParamByName('ownerid').AsLargeInt:=PRelationId;
    self.FBuildDataDTO.ChildAssociationData.Active:=True;
    if not self.FBuildDataDTO.ChildAssociationData.EOF then
    begin
       self.FBuildDataDTO.ChildAssociationData.First;
       while not self.FBuildDataDTO.ChildAssociationData.EOF do
       begin
         ForeignKeyType:=self.FBuildDataDTO.ChildAssociationData.FieldByName('type').AsInteger;
         if (ForeignKeyType=ord(atOneToOne)) or (ForeignKeyType=ord(atLookup)) then
         begin
           jAttributeData:=TJSONObject.Create;
           jAttributeData.Add('AttributeName', self.FBuildDataDTO.ChildAssociationData.FieldByName('Name').AsString);
           jAttributeData.Add('AttributeType', ord(atLong));
           jAttributeData.Add('AttributeLength', 0);
           jAttributeData.Add('AllowNull', True);
           jAttributeData.Add('Visible', False);
           jAttributeData.Add('IsPrimaryKey', False);
           jAttributeData.Add('IsForeignKey', True);
           jAttributeData.Add('IsKeyField', True);
           if IterateCallback <> Nil then
           begin
             IterateCallback(self.FBuildDataDTO.AttributeData, jAttributeData);
           end;
           jAttributes.Add(jAttributeData);
         end;
         self.FBuildDataDTO.ChildAssociationData.Next;
       end;
    end;
    GetForeignKeys:=jAttributes;
end;

function TEntityFormatter.IterateAttributes(PBuildScript: TPSScript; PRelationId: LongInt; PRelationName:String):TJSONArray;
var
   jAttributes: TJSONArray;
   jAttributeData : TJSONObject;
   AttributeLength:Integer;
   AttributeType:Integer;
   IterateCallback: TIterationCallback;
   JPrimaryKeys: TJSONArray;
   JForeignKeys: TJSONArray;
   JArrayIterator: Integer;
begin
   jAttributes:=TJSONArray.Create;
   self.FBuildDataDTO.AttributeData.Active:=False;
   self.FBuildDataDTO.AttributeData.ParamByName('RelationId').AsLargeInt:=PRelationId;
   self.FBuildDataDTO.AttributeData.Active:=True;
   IterateCallback:=Nil;

   if PBuildScript <> Nil then
   begin
     IterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('IterateAttribute'));
   end;

   JPrimaryKeys:=self.GetPrimaryKeys(PBuildScript, PRelationId, PRelationName);
   JForeignKeys:=self.GetForeignKeys(PBuildScript, PRelationId, PRelationName);
   for JArrayIterator:=0 to (JPrimaryKeys.Count - 1) do
   begin
      jAttributes.Add(JPrimaryKeys.Items[JArrayIterator]);
   end;

   for JArrayIterator:=0 to (JForeignKeys.Count -1) do
   begin
      jAttributes.Add(JForeignKeys.Items[JArrayIterator]);
   end;

   if not self.FBuildDataDTO.AttributeData.EOF then
   begin
     self.FBuildDataDTO.AttributeData.First;
     while not self.FBuildDataDTO.AttributeData.EOF do
     begin
        jAttributeData:=TJSONObject.Create;
        jAttributeData.Add('AttributeName', self.FBuildDataDTO.AttributeData.FieldByName('Name').AsString);
        AttributeType:=self.FBuildDataDTO.AttributeData.FieldByName('Type').AsInteger;
        jAttributeData.Add('AttributeType', AttributeType);
        AttributeLength:=self.FBuildDataDTO.AttributeData.FieldByName('AttributeLength').AsInteger;
        jAttributeData.Add('AttributeLength', AttributeLength);
        if self.FBuildDataDTO.AttributeData.FieldByName('AllowNull').IsNull then
           jAttributeData.Add('AllowNull', False)
        else
        jAttributeData.Add('AllowNull', self.FBuildDataDTO.AttributeData.FieldByName('AllowNull').AsBoolean);
        jAttributeData.Add('Visible', True);
        jAttributeData.Add('IsPrimaryKey', False);
        jAttributeData.Add('IsForeignKey', False);
        jAttributeData.Add('IsKeyField', False);
        jAttributes.Add(jAttributeData);
        if IterateCallback <> Nil then
        begin
          IterateCallback(self.FBuildDataDTO.AttributeData, jAttributeData);
        end;
        self.FBuildDataDTO.AttributeData.Next;
     end;
   end;


   IterateAttributes:=jAttributes;
end;

function TEntityFormatter.IterateRelatedEntities(PBuildScript: TPSScript; PRelationId: LongInt; AssociationData:TSQLQuery; ParameterName:String; PAssociationType:associationType; var PCount:Integer):TJSONArray;
var
   jChildRelations: TJSONArray;
   jChildRelationData : TJSONObject;
   Counter:Integer;
   IterateCallback: TIterationCallback;
   AssociationType:Integer;
   AssociationName:String;
   ParentName:String;
   ChildName:String;
   //
   doubleCheck:String;
begin
   Counter:=0;
   jChildRelations:=TJSONArray.Create;
   AssociationData.Active:=False;
   AssociationData.ParamByName(ParameterName).AsLargeInt:=PRelationId;
   //AssociationData.ParamByName('AssociationType').AsInteger:=ord(PAssociationType);
   AssociationData.Active:=True;
   IterateCallback:=Nil;
   if PBuildScript <> Nil then
   begin
     IterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('IterateRelatedEntity'));
   end;

   if not AssociationData.EOF then
   begin
     AssociationData.First;
     while not AssociationData.EOF do
     begin
        AssociationType:=AssociationData.FieldByName('Type').AsInteger;
        if AssociationType = ord(PAssociationType) then
        begin
          AssociationName:=AssociationData.FieldByName('Name').AsString;
          ParentName:=AssociationData.FieldByName('ParentName').AsString;
          ChildName:=AssociationData.FieldByName('ChildName').AsString;
          doubleCheck:=AssociationData.FieldByName('Name').AsString;
          jChildRelationData:=TJSONObject.Create;
          jChildRelationData.Add('AssociationName', AssociationName);
          jChildRelationData.Add('AssociationType', AssociationData.FieldByName('Type').AsInteger);
          jChildRelationData.Add('ParentName', ParentName);
          jChildRelationData.Add('ChildName', ChildName);
          jChildRelationData.Add('ParentRelation', self.GetRelationByRelationId(AssociationData.FieldByName('owner').AsLargeInt, True, False));
          jChildRelationData.Add('ChildRelation', self.GetRelationByRelationId(AssociationData.FieldByName('owned').AsLargeInt, True, False));
          if AssociationType = ord(atManyToMany) then
          begin
            jChildRelationData.Add('ManyToManyEntity', self.GetManyToManyEntity(PBuildScript, AssociationName, ParentName, ChildName));
          end;
          jChildRelations.Add(jChildRelationData);
          if IterateCallback <> Nil then
          begin
            IterateCallback(AssociationData, jChildRelationData);
          end;
        end;
        AssociationData.Next;
        Counter:=Counter+1;
     end;
   end;
   PCount:=Counter;
   IterateRelatedEntities:=jChildRelations;

end;

function TEntityFormatter.GetManyToManyEntity(PBuildScript: TPSScript; PAssociationName:String; PParentName:String; PChildName:String):TJSONObject;
var
   JEntity : TJSONObject;
   PrimaryKeyName: String;
   JAttributes:TJSONArray;
   jAttributeData:TJSONObject;
   jOwningAttribute:TJSONObject;
   jOwnedAttribute:TJSONObject;
   IterateCallback: TIterationCallback;
begin

   if PBuildScript <> Nil then
   begin
     IterateCallback:=TIterationCallback(PBuildScript.GetProcMethod('IterateAttribute'));
   end;

   PrimaryKeyName:=PAssociationName + 'Id';
   JEntity:=TJSONObject.Create;
    JEntity.Add('RelationName', PAssociationName);
    JEntity.Add('PrimaryKeyName', PrimaryKeyName);
    JEntity.Add('Frozen', False);

    JAttributes:=TJSONArray.Create;
    //attribute for primary key
    jAttributeData:=TJSONObject.Create;
    jAttributeData.Add('AttributeName', PrimaryKeyName);
    jAttributeData.Add('AttributeType', ord(atLong));
    jAttributeData.Add('AttributeLength', 0);
    jAttributeData.Add('AllowNull', False);
    jAttributeData.Add('Visible', False);
    jAttributeData.Add('IsPrimaryKey', True);
    jAttributeData.Add('IsForeignKey', False);
    jAttributeData.Add('IsKeyField', True);
    if IterateCallback <> Nil then
    begin
       IterateCallback(Nil, jAttributeData);
    end;
    JAttributes.Add(jAttributeData);

    //attribute for owner foreign key
    jOwningAttribute:=TJSONObject.Create;
    jOwningAttribute.Add('AttributeName', PParentName + 'Id');
    jOwningAttribute.Add('AttributeType', ord(atLong));
    jOwningAttribute.Add('AttributeLength', 0);
    jOwningAttribute.Add('AllowNull', False);
    jOwningAttribute.Add('Visible', False);
    jOwningAttribute.Add('IsPrimaryKey', False);
    jOwningAttribute.Add('IsForeignKey', True);
    jOwningAttribute.Add('IsKeyField', True);
    if IterateCallback <> Nil then
    begin
       IterateCallback(Nil, jOwningAttribute);
    end;
    JAttributes.Add(jOwningAttribute);

    //attribute for owned foreign key
    jOwnedAttribute:=TJSONObject.Create;
    jOwnedAttribute.Add('AttributeName', PChildName + 'Id');
    jOwnedAttribute.Add('AttributeType', ord(atLong));
    jOwnedAttribute.Add('AttributeLength', 0);
    jOwnedAttribute.Add('AllowNull', False);
    jOwnedAttribute.Add('Visible', False);
    jOwnedAttribute.Add('IsPrimaryKey', False);
    jOwnedAttribute.Add('IsForeignKey', True);
    jOwnedAttribute.Add('IsKeyField', True);
    if IterateCallback <> Nil then
    begin
       IterateCallback(Nil, jOwnedAttribute);
    end;
    JAttributes.Add(jOwnedAttribute);

    JEntity.Add('Attributes', JAttributes);
    Result:=JEntity;
end;

end.

