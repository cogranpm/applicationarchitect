unit ScreenFamilyViewModel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, appinterfacesunit, ComCtrls, AssociationTree, ValEdit, sqldb, db, frmModels, MasterPropertyHelper, Forms;

type
   TScreenFamilyViewModel = class(TObject)
   private
      FTreeView: TTreeView;
      FPropertyEditor:TValueListEditor;
   public
      constructor Create();
      destructor Destroy(); override;
      procedure LoadFormsTree (PRelationId : LongInt; PScreenFamilyId : LongInt; var PDataProvider: IDataProvider; var PTreeView:TTreeView; var PPropertyEditor:TValueListEditor);
      procedure LoadScreenProperties(var PDataProvider: IDataProvider; PActiveFrame : TFrame; treeData : TAssociationTree);
      procedure SaveScreenProperties(var PDataProvider: IDataProvider; PActiveFrame : TFrame);
   private
     procedure PopulateFormsTree(var PDataProvider: IDataProvider; PParentNode : TTreeNode; PRelationId : LongInt; ScreenChildKey : LongInt);
     procedure FreeTreeData();
     procedure MapTreeDataFromAssociation(PAssociationData: TSQLQuery; var PTreeDataList: TList);
     function InsertScreenChild(var PDataProvider: IDataProvider; AssociationTreeItem : TAssociationTree; ParentKey : LongInt; SelfToSelfParentKey : Boolean) : LongInt;

end;

implementation

constructor TScreenFamilyViewModel.Create();
begin
   inherited Create;

end;

destructor TScreenFamilyViewModel.Destroy();
begin
   inherited;
end;

procedure TScreenFamilyViewModel.LoadFormsTree (PRelationId : LongInt; PScreenFamilyId : LongInt; var PDataProvider: IDataProvider; var PTreeView:TTreeView; var PPropertyEditor:TValueListEditor);
{
 add items to tree view
 also create all needed screen child records
}
var
   rootAssociation : TAssociationTree;
   rootNode : TTreeNode;
   fieldsNode : TTreeNode;
   entityNode : TTreeNode;
   currentNode : TTreeNode;
   childNodes : TList; //as list of association data mapped to object
   i:integer;
   rootName : string;
   screenChildId  :LongInt;
   fields : TList;
   fieldData : TAssociationTree;

begin
     FTreeView:=PTreeView;
     FPropertyEditor:=PPropertyEditor;


     self.FreeTreeData;
     FTreeView.Items.Clear;
     FPropertyEditor.Clear;
     FPropertyEditor.Row:=0;
     childNodes := TList.Create;

     PDataProvider.GetAssociationsByOwner.Active:=False;
     PDataProvider.GetAssociationsByOwner.ParamByName('RelationId').AsLargeInt:=PRelationId;
     PDataProvider.GetAssociationsByOwner.Active:=True;

     rootName:=PDataProvider.GetNameByRelationId(PRelationId);
     rootNode := FTreeView.Items.Add(Nil, rootName);
     rootNode.ImageIndex:=ord(modelImageIndex.miEntity);
     rootNode.SelectedIndex:=ord(modelImageIndex.miEntity);
     rootAssociation := TAssociationTree.Create();
     rootAssociation.FOwnerName:='';
     rootAssociation.FOwnedName:=rootName;
     rootAssociation.FOwned:=PRelationId;
     rootAssociation.FOwner:=-1;
     rootAssociation.FAssociationId:=-1;
     rootAssociation.FScreenFamilyId:=PScreenFamilyId;
     rootNode.Data:=rootAssociation;

     entityNode:= FTreeView.Items.AddChild(rootNode, 'Associations');
     entityNode.ImageIndex:= ord(modelImageIndex.miHierarchy);
     entityNode.SelectedIndex:=ord(modelImageIndex.miHierarchy);

     fieldsNode:=FTreeView.Items.AddChild(rootNode, 'Attributes');
     fieldsNode.ImageIndex:=ord(modelImageIndex.miAttribute);
     fieldsNode.SelectedIndex:=ord(modelImageIndex.miAttribute);

      PDataProvider.RefreshFamilyArtifacts(PScreenFamilyId);

      self.MapTreeDataFromAssociation(PDataProvider.GetAssociationsByOwner, childNodes);

      //all related associations are stored in childNodes List
     for i:=0 to childNodes.Count-1 do
     begin
       currentNode := FTreeView.Items.AddChild(entityNode, TAssociationTree(childNodes[i]).FOwnedName);
       currentNode.SelectedIndex:=ord(modelImageIndex.miAssociation);
       currentNode.ImageIndex:=ord(modelImageIndex.miAssociation);
       currentNode.Data:=TAssociationTree(childNodes[i]);
       //add a screen child record with screen family id parent
       screenChildId:=InsertScreenChild(PDataProvider, TAssociationTree(childNodes[i]), PScreenFamilyId, false);
       TAssociationTree(currentNode.Data).FScreenChildId:=screenChildId;
       PopulateFormsTree(PDataProvider, currentNode, TAssociationTree(childNodes[i]).FOwned, screenChildId);
     end;

    //add the fields as child nodes at the end
    fields:=TList.Create;
    PDataProvider.GetArtifactsByScreenFamily(PScreenFamilyId, fields);
    for i:=0 to fields.Count-1 do
    begin
      fieldData:=TAssociationTree(fields[i]);
      currentNode:= FTreeView.Items.AddChild(fieldsNode, fieldData.FName);
      currentNode.Data:=fieldData;
      currentNode.SelectedIndex:=ord(modelImageIndex.miField);
      currentNode.ImageIndex:=ord(modelImageIndex.miField);
    end;


end;



procedure TScreenFamilyViewModel.MapTreeDataFromAssociation(PAssociationData: TSQLQuery; var PTreeDataList: TList);
var
  associationTree : TAssociationTree;
begin
   while not PAssociationData.EOF do
    begin
       associationTree := TAssociationTree.Create();
       associationTree.FOwnerName := PAssociationData.FieldByName('OwnerName').AsString;;
       associationTree.FOwnedName := PAssociationData.FieldByName('OwnedName').AsString;
       associationTree.FOwned := PAssociationData.FieldByName('Owned').AsLargeInt;
       associationTree.FOwner := PAssociationData.FieldByName('Owner').AsLargeInt;
       associationTree.FName :=  PAssociationData.FieldByName('Name').AsString;
       associationTree.FAssociationId:=PAssociationData.FieldByName('AssociationId').AsLargeInt;
       associationTree.FType:=PAssociationData.FieldByName('Type').AsInteger;
       PTreeDataList.Add(associationTree);
       PAssociationData.Next;
     end;
end;


procedure TScreenFamilyViewModel.PopulateFormsTree(var PDataProvider: IDataProvider; PParentNode : TTreeNode; PRelationId : LongInt; ScreenChildKey : LongInt);
{
 recursive function to load all child classes of passed in PRelationId, if any, and add to tree
 this is done by loading the dataset and copying to AssociationTree instances and putting inside list
 and iterating the list
}
var
   childNode : TTreeNode;
   fieldsNode : TTreeNode;
   entityNode : TTreeNode;
  // associationTree : TAssociationTree;
   childNodes : TList;
   i:integer;
   screenChildId : LongInt;
   fields : TList;
   fieldData : TAssociationTree;
   fieldNode : TTreeNode;
begin

   childNodes := TList.Create;

   PDataProvider.GetAssociationsByOwner().Active:=False;
   PDataProvider.GetAssociationsByOwner().ParamByName('RelationId').AsLargeInt:=PRelationId;
   PDataProvider.GetAssociationsByOwner().Active:=True;

   //get a list of associations for this relation
   self.MapTreeDataFromAssociation(PDataProvider.GetAssociationsByOwner(), childNodes);

   //a couple of static nodes to act as containers for related Associations and Attributes
   entityNode:= FTreeView.Items.AddChild(PParentNode, 'Associations');
   entityNode.ImageIndex:=ord(modelImageIndex.miHierarchy);
   entityNode.SelectedIndex:=ord(modelImageIndex.miHierarchy);

   fieldsNode:=FTreeView.Items.AddChild(PParentNode, 'Attributes');
   fieldsNode.ImageIndex:=ord(modelImageIndex.miAttribute);
   fieldsNode.SelectedIndex:=ord(modelImageIndex.miAttribute);

   //create a tree node for each related Association
   for i:=0 to childNodes.Count-1 do
   begin
     childNode := FTreeView.Items.AddChild(entityNode, TAssociationTree(childNodes[i]).FOwnedName);
     childNode.Data:=TAssociationTree(childNodes[i]);
     childNode.SelectedIndex:=ord(modelImageIndex.miAssociation);
     childNode.ImageIndex:=ord(modelImageIndex.miAssociation);
     screenChildId:=InsertScreenChild(PDataProvider, TAssociationTree(childNodes[i]), ScreenChildKey, true);
     TAssociationTree(childNode.Data).FScreenChildId:=screenChildId;
     PopulateFormsTree(PDataProvider, childNode, TAssociationTree(childNodes[i]).FOwned, screenChildId);
   end;


   //create tree nodes for each Attribute associated with this relation
     fields:=TList.Create;
     PDataProvider.GetArtifactsByScreenChild(ScreenChildKey, fields);
     for i:=0 to fields.Count-1 do
     begin
       fieldData:=TAssociationTree(fields[i]);
       fieldNode:= FTreeView.Items.AddChild(fieldsNode, fieldData.FName);
       fieldNode.Data:=fieldData;
       fieldNode.SelectedIndex:=ord(modelImageIndex.miField);
       fieldNode.ImageIndex:=ord(modelImageIndex.miField);
     end;

   if childNodes.Count = 0 then
      exit;

end;

function TScreenFamilyViewModel.InsertScreenChild(var PDataProvider: IDataProvider; AssociationTreeItem : TAssociationTree; ParentKey : LongInt; SelfToSelfParentKey : Boolean) : LongInt;
var
   screenFamilyId : LongInt;
   screenChildId : LongInt;
begin
   if SelfToSelfParentKey then
    begin
      screenFamilyId:=-1;
      screenChildId:=ParentKey
    end
   else
   begin
     screenFamilyId:=ParentKey;
     screenChildId:=-1;
   end;
   InsertScreenChild := PDataProvider.InsertScreenChild(AssociationTreeItem, screenFamilyId, screenChildId );

end;


procedure TScreenFamilyViewModel.LoadScreenProperties(var PDataProvider: IDataProvider; PActiveFrame : TFrame; treeData : TAssociationTree);
var
  ForeignKeyName : string;
  MPHelper: TMasterPropertyHelper;
  PropertiesData:TSQLQuery;
  ModelsFrame: TfrmModels;
  MasterPropertyCategory:String;

begin

   {
   Iterate all the Master Properties of Type Screen
   Create a row in the ViewProperties list control for each
   Default the data in depending on whether or not 1 exists in (ArtifactPropertyValue | ScreenPropertyValue )
   depending on the entity that is passed in
   FScreenFamily > 0 = screen family
   FScreenChild > 0 = screen child
   FArtifactId > 0 = artifact
   }

   MPHelper:=TMasterPropertyHelper.Create();
   ModelsFrame:=TfrmModels(PActiveFrame);
   ForeignKeyName := 'SCREENPROPVALUETOPROPERTY';
   if treeData.FScreenFamilyId > 0 then
   begin
     //set the argument on the query and load it
      PropertiesData := PDataProvider.GetScreenPropertyValue();
      PropertiesData.Active:=False;
      PropertiesData.ParamByName('ScreenfamilyId').AsLargeInt := treeData.FScreenFamilyId; //ScreenfamilyId
      PropertiesData.Active:=True;
      MasterPropertyCategory:='Screen';
   end
   else if treeData.FScreenChildId > 0 then
   begin
    PropertiesData := PDataProvider.GetScreenChildPropertyValue();
    PropertiesData.Active:=False;
    PropertiesData.ParamByName('ScreenChildId').AsLargeInt:=treeData.FScreenChildId;
    PropertiesData.Active:=True;
    MasterPropertyCategory:='Screen';
   end
   else if treeData.FScreenArtifactId > 0 then
   begin
    PropertiesData:= PDataProvider.GetArtifactPropertyValue();
    PropertiesData.Active:=False;
    PropertiesData.ParamByName('ScreenArtifactId').AsLargeInt:=treeData.FScreenArtifactId;
    PropertiesData.Active:=True;
    MasterPropertyCategory:='ScreenArtifact';
    ForeignKeyName := 'ARTIFACTPROPVALUETOPROPERTY';
   end
   else
       exit;
   MPHelper.BindPropertyValuesToValuesList(PDataProvider, PropertiesData, ForeignKeyName, ModelsFrame.vlScreenProps, MasterPropertyCategory);

end;


procedure TScreenFamilyViewModel.SaveScreenProperties(var PDataProvider: IDataProvider; PActiveFrame : TFrame);
{
 iterate the value list control, if the screenfamilypropertydata dataset has that property (based on key lblRelationName) then update it
 if it does not have the key AND the value in the widget is not empty string them add new
}

var
   ScreenProperties : TSQLQuery;
   MPHelper: TMasterPropertyHelper;
   SelectedEntityNode : TTreeNode;
   SelectedNodeData : TAssociationTree;
   ModelsFrame:TfrmModels;
   PropertyEdit:TValueListEditor;
   EntityTreeWidget:TTreeView;
   MasterPropertyCategory:String;
   ParentKeyValue:LongInt;
   ParentKeyName:String;
   ForeignKeyName : string;
begin

   MPHelper:=TMasterPropertyHelper.Create();
    ModelsFrame:=TfrmModels(PActiveFrame);
    PropertyEdit:=ModelsFrame.GetPropertyValueList('Forms');
    EntityTreeWidget:=ModelsFrame.GetTreeView('Forms');
     //which screen entity is selected, is it screenfamily, screenchild or artifact
     SelectedEntityNode := EntityTreeWidget.Selected;
     if SelectedEntityNode = Nil then
        exit;
     SelectedNodeData := TAssociationTree(SelectedEntityNode.Data);
     if SelectedNodeData = Nil then
        exit;

     if SelectedNodeData.FScreenFamilyId > 0 then
        begin
        ScreenProperties := PDataProvider.GetScreenPropertyValue();
        ForeignKeyName:= 'SCREENPROPVALUETOPROPERTY';
        MasterPropertyCategory:='Screen';
        ParentKeyValue:=SelectedNodeData.FScreenFamilyId;
        ParentKeyName:='FAMILYTOSCREENPROPVALUE';
        end
     else if SelectedNodeData.FScreenChildId > 0 then
        begin
          ScreenProperties:= PDataProvider.GetScreenChildPropertyValue();
          ForeignKeyName:= 'SCREENPROPVALUETOPROPERTY';
          MasterPropertyCategory:='Screen';
          ParentKeyValue:=SelectedNodeData.FScreenChildId;
          ParentKeyName:='CHILDTOSCREENPROPVALUE';
        end
     else if SelectedNodeData.FScreenArtifactId > 0 then
        begin
          ScreenProperties:=PDataProvider.GetArtifactPropertyValue();
          ForeignKeyName:='ARTIFACTPROPVALUETOPROPERTY';
          MasterPropertyCategory:='ScreenArtifact';
          ParentKeyValue:=SelectedNodeData.FScreenArtifactId;
          ParentKeyName:='ARTIFACTTOPROPERTYVALUE';
        end;
     MPHelper.BindPropertyValuesToDataSet(PDataProvider, ScreenProperties, ParentKeyName, ParentKeyValue, foreignKeyName, PropertyEdit, MasterPropertyCategory);

end;


procedure TScreenFamilyViewModel.FreeTreeData();
//free all the data in the tree
var
   currentTreeNode : TTreeNode;
   currentTreeNodeData : TAssociationTree;
   errorMessage : string;
begin
   if FTreeView.Items = Nil then
      exit;
    for  currentTreeNode in FTreeView.Items do
      begin
        if currentTreeNode.Data <> Nil then
        begin
           currentTreeNodeData := TAssociationTree(currentTreeNode.Data);
           if currentTreeNodeData <> Nil then
              Try
              currentTreeNodeData.Free;
              Except
                //do nothing
                on E:Exception do
                   errorMessage:=E.Message;
              end;
        end;
      end;
end;


end.

