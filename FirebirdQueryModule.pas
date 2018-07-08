unit FirebirdQueryModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, FileUtil, db, firebirdDataModule;

type

  { TFirebirdQueryModule }

  TFirebirdQueryModule = class(TDataModule)
    AssociationOwnedLookup: TStringField;
    AssociationOwnerLookup: TStringField;
    dsBuildScriptParameter: TDataSource;
    dsBuildControllerScript: TDataSource;
    dsBuildScript: TDataSource;
    dsBuildTemplate: TDataSource;
    dsBuildController: TDataSource;
  
	dsArtifactPropertyValue: TDataSource;
	dsAssociation: TDataSource;
	dsAttribute: TDataSource;
	dsAttributePropertyValue: TDataSource;
	dsBuild: TDataSource;
	dsEnvironment: TDataSource;
	dsListDetail: TDataSource;
	dsListHeader: TDataSource;
	dsMasterCategory: TDataSource;
	dsMasterProperty: TDataSource;
	dsMasterPropertyValueList: TDataSource;
	dsModel: TDataSource;
	dsPropertyGroup: TDataSource;
	dsPropertyType: TDataSource;
	dsRelation: TDataSource;
	dsRelationPropertyValue: TDataSource;
	dsScreenArtifact: TDataSource;
	dsScreenArtifactType: TDataSource;
	dsScreenChild: TDataSource;
	dsScreenFamily: TDataSource;
	dsScreenPropertyValue: TDataSource;
        PropertyGroup: TStringField;
        PropertyType: TStringField;
        RelationLookup: TStringField;
  
	
	SQLArtifactPropertyValue: TSQLQuery;
    SQLArtifactPropertyValueArtifactPropertyValueId: TLargeintField;
    SQLArtifactPropertyValueARTIFACTPROPVALUETOPROPERTY: TLargeintField;
	    SQLArtifactPropertyValueArtifactToPropertyValue: TLargeintField;
	    SQLArtifactPropertyValueScreenArtifactToPropertyValue: TLargeintField;
	    SQLArtifactPropertyValuePropertyValue: TStringField;
		

	SQLAssociation: TSQLQuery;
    SQLAssociationAssociationId: TLargeintField;
	    SQLAssociationModelAssociation: TLargeintField;
	    SQLAssociationName: TStringField;
            SQLAssociationOWNED: TLargeintField;
            SQLAssociationOWNER: TLargeintField;
	    SQLAssociationtype: TIntegerField;
		

	SQLAttribute: TSQLQuery;
    SQLAttributeAttributeId: TLargeintField;
	    SQLAttributeRelationAttribute: TLargeintField;
	    SQLAttributeallownull: TBooleanField;
	    SQLAttributeattributelength: TIntegerField;
	    SQLAttributename: TStringField;
	    SQLAttributetype: TIntegerField;
		

	SQLAttributePropertyValue: TSQLQuery;
		

	SQLBuild: TSQLQuery;
    SQLBuildBuildId: TLargeintField;
    SQLBuildControllerBUILDCONTROLLERID: TLargeintField;
    SQLBuildControllerNAME: TStringField;
    SQLBuildControllerScriptBUILDCONTROLLERID: TLargeintField;
    SQLBuildControllerScriptBUILDCONTROLLERSCRIPTID: TLargeintField;
    SQLBuildControllerScriptBUILDSCRIPTID: TLargeintField;
    SQLBuildControllerScriptSEQUENCE: TLongintField;
    SQLBuildControllerScriptVERSION: TDateTimeField;
    SQLBuildControllerVERSION: TDateTimeField;
	    SQLBuildModelToBuild: TLargeintField;
	    SQLBuildName: TStringField;
	    SQLBuildProjectPath: TStringField;
            SQLBuildScriptBUILDSCRIPTID: TLargeintField;
            SQLBuildScriptNAME: TStringField;
            SQLBuildScriptParameterBUILDCONTROLLERSCRIPTID: TLargeintField;
            SQLBuildScriptParameterBUILDSCRIPTPARAMETERID: TLargeintField;
            SQLBuildScriptParameterNAME: TStringField;
            SQLBuildScriptParameterVALUE: TStringField;
            SQLBuildScriptParameterVERSION: TDateTimeField;
            SQLBuildScriptSCRIPT: TMemoField;
            SQLBuildScriptVERSION: TDateTimeField;
            SQLBuildTemplateBUILDTEMPLATEID: TLargeintField;
            SQLBuildTemplateNAME: TStringField;
            SQLBuildTemplateSCRIPT: TMemoField;
            SQLBuildTemplateVERSION: TDateTimeField;
		

	SQLEnvironment: TSQLQuery;
    SQLEnvironmentEnvironmentId: TLargeintField;
	    SQLEnvironmentDatabaseName: TStringField;
	    SQLEnvironmentDatabaseServer: TStringField;
	    SQLEnvironmentMembershipDatabase: TStringField;
	    SQLEnvironmentMembershipServer: TStringField;
		

	SQLListDetail: TSQLQuery;
    SQLListDetailListDetailId: TLargeintField;
	    SQLListDetailListHeaderToDetail: TLargeintField;
	    SQLListDetailCode: TStringField;
	    SQLListDetailLabel: TStringField;
		

	SQLListHeader: TSQLQuery;
    SQLListHeaderListHeaderId: TLargeintField;
	    SQLListHeaderName: TStringField;
            SQLMappingSYSTEMCODE: TStringField;
            SQLMappingValueSOURCECODE: TStringField;
            SQLMappingValueSOURCELABEL: TStringField;
            SQLMappingValueSOURCELISTNAME: TStringField;
            SQLMappingValueTARGETCODE: TStringField;
            SQLMappingValueTARGETLABEL: TStringField;
            SQLMappingValueTARGETLISTNAME: TStringField;
		

	SQLMasterCategory: TSQLQuery;
    SQLMasterCategoryMasterCategoryId: TLargeintField;
	    SQLMasterCategoryName: TStringField;
		

	SQLMasterProperty: TSQLQuery;
    SQLMasterPropertyMasterPropertyId: TLargeintField;
	    SQLMasterPropertyDefaultValue: TStringField;
            SQLMasterPropertyMASTERPROPERTYTOGROUP: TLargeintField;
            SQLMasterPropertyMASTERPROPERTYTOTYPE: TLargeintField;
	    SQLMasterPropertyName: TStringField;
	    SQLMasterPropertyNotes: TStringField;
		

	SQLMasterPropertyValueList: TSQLQuery;
    SQLMasterPropertyValueListMasterPropertyValueListId: TLargeintField;
	    SQLMasterPropertyValueListMasterProperyToValueList: TLargeintField;
	    SQLMasterPropertyValueListCode: TStringField;
	    SQLMasterPropertyValueListDisplay: TStringField;
	    SQLMasterPropertyValueListName: TStringField;
		

	SQLModel: TSQLQuery;
    SQLModelModelId: TLargeintField;
	    SQLModelname: TStringField;
		

	SQLPropertyGroup: TSQLQuery;
    SQLPropertyGroupPropertyGroupId: TLargeintField;
	    SQLPropertyGroupName: TStringField;
		

	SQLPropertyType: TSQLQuery;
    SQLPropertyTypePropertyTypeId: TLargeintField;
	    SQLPropertyTypeDisplayControl: TIntegerField;
	    SQLPropertyTypeName: TStringField;
	    SQLPropertyTypeNotes: TStringField;
            SQLMasterPropertyToCategory: TSQLQuery;
            SQLBuildTemplate: TSQLQuery;
            SQLBuildController: TSQLQuery;
            SQLBuildScript: TSQLQuery;
            SQLBuildControllerScript: TSQLQuery;
            SQLBuildScriptParameter: TSQLQuery;
		

	SQLRelation: TSQLQuery;
    SQLRelationRelationId: TLargeintField;
	    SQLRelationModelRelation: TLargeintField;
	    SQLRelationfrozen: TBooleanField;
	    SQLRelationlastbuilt: TLargeintField;
	    SQLRelationlastmodified: TLargeintField;
	    SQLRelationname: TStringField;
		

	SQLRelationPropertyValue: TSQLQuery;
		

	SQLScreenArtifact: TSQLQuery;
        SQLScreenArtifactARTIFACTTOATTRIBUTE: TLargeintField;
    SQLScreenArtifactScreenArtifactId: TLargeintField;
	    SQLScreenArtifactChildToArtifact: TLargeintField;
	    SQLScreenArtifactFamilyToArtifact: TLargeintField;
	    SQLScreenArtifactName: TStringField;
		

	SQLScreenArtifactType: TSQLQuery;
    SQLScreenArtifactTypeScreenArtifactTypeId: TLargeintField;
	    SQLScreenArtifactTypeName: TStringField;
		

	SQLScreenChild: TSQLQuery;
    SQLScreenChildScreenChildId: TLargeintField;
    SQLScreenChildSCREENCHILDTOASSOCIATION: TLargeintField;
	    SQLScreenChildScreenFamilyToScreenChild: TLargeintField;
	    SQLScreenChildScreenChildToSelf: TLargeintField;
	    SQLScreenChildName: TStringField;
		

	SQLScreenFamily: TSQLQuery;
    SQLScreenFamilyScreenFamilyId: TLargeintField;
	    SQLScreenFamilyModelToScreenFamily: TLargeintField;
	    SQLScreenFamilyName: TStringField;
            SQLScreenFamilySCREENFAMILYTORELATION: TLargeintField;
		

	SQLScreenPropertyValue: TSQLQuery;
        SQLScreenChildPropertyValue: TSQLQuery;
        SQLScreenPropertyValueChildToScreenPropValue1: TLargeintField;
        SQLScreenPropertyValueFamilyToScreenPropValue1: TLargeintField;
        SQLScreenPropertyValuePropertyValue1: TStringField;
    SQLScreenPropertyValueScreenPropertyValueId: TLargeintField;
	    SQLScreenPropertyValueFamilyToScreenPropValue: TLargeintField;
	    SQLScreenPropertyValueChildToScreenPropValue: TLargeintField;
	    SQLScreenPropertyValuePropertyValue: TStringField;
            AssociationTypeLookup: TStringField;
            SQLScreenPropertyValueScreenPropertyValueId1: TLargeintField;
            SQLScreenPropertyValueSCREENPROPVALUETOPROPERTY: TLargeintField;
            SQLScreenPropertyValueSCREENPROPVALUETOPROPERTY1: TLargeintField;
            BuildScriptLookup: TStringField;
            TypeLookup: TStringField;
			
	dsAssociationPropertyValue: TDataSource;
        dsBuildPropertyValue: TDataSource;

	SQLAssociationPropertyValue: TSQLQuery;
        SQLAssociationPropertyValueAssociationPropertyValueId: TLargeintField;
        SQLAssociationPropertyValueAssociationToPropertyValue: TLargeintField;
        SQLAssociationPropertyValueMasterProperty: TLargeintField;
        SQLAssociationPropertyValuePropertyValue: TStringField;



	SQLBuildPropertyValue: TSQLQuery;
    SQLBuildPropertyValueBuildPropertyValueId: TLargeintField;
    SQLBuildPropertyValueBuildToPropertyValue: TLargeintField;
    SQLBuildPropertyValueMasterProperty: TLargeintField;
    SQLBuildPropertyValuePropertyValue: TStringField;

	dsMapping: TDataSource;
	SQLMapping: TSQLQuery;
	SQLMappingMappingId: TLargeintField;
	SQLMappingCategory: TIntegerField;
	SQLMappingNotes: TStringField;
	SQLMappingFromDescription: TStringField;
	SQLMappingToDescription: TStringField;
	dsMappingValue: TDataSource;

	SQLMappingValue: TSQLQuery;
	SQLMappingValueMappingValueId: TLargeintField;
	SQLMappingValueMappingToValue: TLargeintField;
	SQLMappingValueMapValueTargetLookup: TLargeintField;
	SQLMappingValueMapValueSourceLookup: TLargeintField;
	SQLMappingValueSourceValue: TStringField;
	SQLMappingValueTargetValue: TStringField;	


    procedure SQLAssociationPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLAssociationPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLAssociationPropertyValueAfterPost(DataSet: TDataSet);
    procedure SQLBuildControllerScriptAfterDelete(DataSet: TDataSet);
    procedure SQLBuildControllerScriptAfterInsert(DataSet: TDataSet);
    procedure SQLBuildControllerScriptAfterPost(DataSet: TDataSet);
    procedure SQLBuildControllerScriptAfterScroll(DataSet: TDataSet);



	procedure SQLBuildPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLBuildPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLBuildPropertyValueAfterPost(DataSet: TDataSet);		
		
	
	procedure SQLArtifactPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLArtifactPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLArtifactPropertyValueAfterPost(DataSet: TDataSet);
		procedure SQLAssociationAfterDelete(DataSet: TDataSet);
    procedure SQLAssociationAfterInsert(DataSet: TDataSet);
    procedure SQLAssociationAfterPost(DataSet: TDataSet);
		procedure SQLAttributeAfterDelete(DataSet: TDataSet);
    procedure SQLAttributeAfterInsert(DataSet: TDataSet);
    procedure SQLAttributeAfterPost(DataSet: TDataSet);
		procedure SQLAttributePropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLAttributePropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLAttributePropertyValueAfterPost(DataSet: TDataSet);
		procedure SQLBuildAfterDelete(DataSet: TDataSet);
    procedure SQLBuildAfterInsert(DataSet: TDataSet);
    procedure SQLBuildAfterPost(DataSet: TDataSet);
    procedure SQLBuildControllerAfterDelete(DataSet: TDataSet);
    procedure SQLBuildControllerAfterInsert(DataSet: TDataSet);
    procedure SQLBuildControllerAfterPost(DataSet: TDataSet);
    procedure SQLBuildControllerAfterScroll(DataSet: TDataSet);
    procedure SQLBuildScriptAfterDelete(DataSet: TDataSet);
    procedure SQLBuildScriptAfterInsert(DataSet: TDataSet);
    procedure SQLBuildScriptAfterPost(DataSet: TDataSet);
    procedure SQLBuildScriptParameterAfterDelete(DataSet: TDataSet);
    procedure SQLBuildScriptParameterAfterInsert(DataSet: TDataSet);
    procedure SQLBuildScriptParameterAfterPost(DataSet: TDataSet);
    procedure SQLBuildTemplateAfterDelete(DataSet: TDataSet);
    procedure SQLBuildTemplateAfterInsert(DataSet: TDataSet);
    procedure SQLBuildTemplateAfterPost(DataSet: TDataSet);
		procedure SQLEnvironmentAfterDelete(DataSet: TDataSet);
    procedure SQLEnvironmentAfterInsert(DataSet: TDataSet);
    procedure SQLEnvironmentAfterPost(DataSet: TDataSet);
		procedure SQLListDetailAfterDelete(DataSet: TDataSet);
    procedure SQLListDetailAfterInsert(DataSet: TDataSet);
    procedure SQLListDetailAfterPost(DataSet: TDataSet);
		procedure SQLListHeaderAfterDelete(DataSet: TDataSet);
    procedure SQLListHeaderAfterInsert(DataSet: TDataSet);
    procedure SQLListHeaderAfterPost(DataSet: TDataSet);
    procedure SQLListHeaderAfterScroll(DataSet: TDataSet);
   // procedure SQLMappingAfterScroll(DataSet: TDataSet);
    procedure SQLMappingValueBeforePost(DataSet: TDataSet);
		procedure SQLMasterCategoryAfterDelete(DataSet: TDataSet);
    procedure SQLMasterCategoryAfterInsert(DataSet: TDataSet);
    procedure SQLMasterCategoryAfterPost(DataSet: TDataSet);
		procedure SQLMasterPropertyAfterDelete(DataSet: TDataSet);
    procedure SQLMasterPropertyAfterInsert(DataSet: TDataSet);
    procedure SQLMasterPropertyAfterPost(DataSet: TDataSet);
    procedure SQLMasterPropertyAfterScroll(DataSet: TDataSet);
		procedure SQLMasterPropertyValueListAfterDelete(DataSet: TDataSet);
    procedure SQLMasterPropertyValueListAfterInsert(DataSet: TDataSet);
    procedure SQLMasterPropertyValueListAfterPost(DataSet: TDataSet);
		procedure SQLModelAfterDelete(DataSet: TDataSet);
    procedure SQLModelAfterInsert(DataSet: TDataSet);
    procedure SQLModelAfterPost(DataSet: TDataSet);
		procedure SQLPropertyGroupAfterDelete(DataSet: TDataSet);
    procedure SQLPropertyGroupAfterInsert(DataSet: TDataSet);
    procedure SQLPropertyGroupAfterPost(DataSet: TDataSet);
		procedure SQLPropertyTypeAfterDelete(DataSet: TDataSet);
    procedure SQLPropertyTypeAfterInsert(DataSet: TDataSet);
    procedure SQLPropertyTypeAfterPost(DataSet: TDataSet);
		procedure SQLRelationAfterDelete(DataSet: TDataSet);
    procedure SQLRelationAfterInsert(DataSet: TDataSet);
    procedure SQLRelationAfterPost(DataSet: TDataSet);

    procedure SQLRelationBeforePost(DataSet: TDataSet);
		procedure SQLRelationPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLRelationPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLRelationPropertyValueAfterPost(DataSet: TDataSet);
		procedure SQLScreenArtifactAfterDelete(DataSet: TDataSet);
    procedure SQLScreenArtifactAfterInsert(DataSet: TDataSet);
    procedure SQLScreenArtifactAfterPost(DataSet: TDataSet);
		procedure SQLScreenArtifactTypeAfterDelete(DataSet: TDataSet);
    procedure SQLScreenArtifactTypeAfterInsert(DataSet: TDataSet);
    procedure SQLScreenArtifactTypeAfterPost(DataSet: TDataSet);
		procedure SQLScreenChildAfterDelete(DataSet: TDataSet);
    procedure SQLScreenChildAfterInsert(DataSet: TDataSet);
    procedure SQLScreenChildAfterPost(DataSet: TDataSet);
		procedure SQLScreenFamilyAfterDelete(DataSet: TDataSet);
    procedure SQLScreenFamilyAfterInsert(DataSet: TDataSet);
    procedure SQLScreenFamilyAfterPost(DataSet: TDataSet);
    procedure SQLScreenFamilyAfterScroll(DataSet: TDataSet);
		procedure SQLScreenPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLScreenPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLScreenPropertyValueAfterPost(DataSet: TDataSet);
	


	procedure SQLMappingAfterDelete(DataSet: TDataSet);
	procedure SQLMappingAfterInsert(DataSet: TDataSet);
	procedure SQLMappingAfterPost(DataSet: TDataSet);
	
	procedure SQLMappingValueAfterDelete(DataSet: TDataSet);
	procedure SQLMappingValueAfterInsert(DataSet: TDataSet);
	procedure SQLMappingValueAfterPost(DataSet: TDataSet);	

	
		
  private
    FDatabase:TIBConnection;
    FTransaction:TSQLTransaction;
  private
    { private declarations }
    function GetNewPrimaryKeyValue(PSequenceName : string) : LongInt;
   // constructor Create(AComponent: TComponent); override;
  public
    { public declarations }
   // constructor Create(PDatabase: TIBConnection; PTransaction : TSQLTransaction);
    property Database: TIBConnection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
  end;



implementation

{$R *.lfm}

{ TFirebirdQueryModule }

procedure TFirebirdQueryModule.SQLArtifactPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLArtifactPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLArtifactPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLArtifactPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLArtifactPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ArtifactPropertyValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ArtifactPropertyValue');
   
  //DataSet.FieldByName('ArtifactToPropertyValue').AsLargeInt:=SQLScreenArtifact.FieldByName('ScreenArtifactID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLAssociationAfterPost(DataSet: TDataSet);
begin
  self.SQLAssociation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLAssociationAfterDelete(DataSet: TDataSet);
begin
  self.SQLAssociation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLAssociationAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AssociationID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Association');
   
  DataSet.FieldByName('ModelAssociation').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLAssociationPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLAssociationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildControllerScriptAfterDelete(
  DataSet: TDataSet);
begin
  self.SQLBuildControllerScript.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildControllerScriptAfterInsert(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildControllerScriptID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_BuildControllerScript');
  DataSet.FieldByName('BuildControllerID').AsLargeInt:=SQLBuildController.FieldByName('BUILDCONTROLLERID').AsLargeInt;
end;

procedure TFirebirdQueryModule.SQLBuildControllerScriptAfterPost(
  DataSet: TDataSet);
begin
  self.SQLBuildControllerScript.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildControllerScriptAfterScroll(
  DataSet: TDataSet);
begin
  SQLBuildScriptParameter.Active:=False;
  SQLBuildScriptParameter.ParamByName('buildcontrollerscriptid').AsLargeInt:=DataSet.FieldByName('buildcontrollerscriptid').AsLargeInt;
  SQLBuildScriptParameter.Active:=True;
end;

procedure TFirebirdQueryModule.SQLAssociationPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLAssociationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;



procedure TFirebirdQueryModule.SQLAssociationPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AssociationPropertyValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_AssociationPropertyValue');
  DataSet.FieldByName('AssociationToPropertyValue').AsLargeInt:=SQLAssociation.FieldByName('AssociationID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLAttributeAfterPost(DataSet: TDataSet);
begin
  self.SQLAttribute.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLAttributeAfterDelete(DataSet: TDataSet);
begin
  self.SQLAttribute.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLAttributeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AttributeID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Attribute');
  DataSet.FieldByName('RelationAttribute').AsLargeInt:=SQLRelation.FieldByName('RelationID').AsLargeInt;
  DataSet.FieldByName('AllowNull').AsBoolean:=True;
  DataSet.FieldByName('AttributeLength').AsLargeInt:=0;
end;

procedure TFirebirdQueryModule.SQLAttributePropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLAttributePropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLAttributePropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLAttributePropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLAttributePropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AttributePropertyValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_AttributePropertyValue');
  
end;

procedure TFirebirdQueryModule.SQLBuildAfterPost(DataSet: TDataSet);
begin
  self.SQLBuild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildControllerAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildController.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildControllerAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildControllerID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_BuildController');
end;

procedure TFirebirdQueryModule.SQLBuildControllerAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildController.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildPropertyValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_BuildPropertyValue');
  DataSet.FieldByName('BuildToPropertyValue').AsLargeInt:=SQLBuild.FieldByName('BuildID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLBuildControllerAfterScroll(DataSet: TDataSet);
begin
  {SQLBuildScript.Active:=False;
  SQLBuildScript.ParamByName('BuildControllerID').AsLargeInt:=DataSet.FieldByName('BuildControllerID').AsLargeInt;
  SQLBuildScript.Active:=True;
  }
end;

procedure TFirebirdQueryModule.SQLBuildScriptAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildScript.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildScriptAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildScriptID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_BuildScript');
end;

procedure TFirebirdQueryModule.SQLBuildScriptAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildScript.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildScriptParameterAfterDelete(
  DataSet: TDataSet);
begin
  self.SQLBuildScriptParameter.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildScriptParameterAfterInsert(
  DataSet: TDataSet);
begin
     DataSet.FieldByName('BuildScriptParameterID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_BuildScriptParameter');
    DataSet.FieldByName('BUILDCONTROLLERSCRIPTID').AsLargeInt:=self.SQLBuildControllerScript.FieldByName('BuildControllerScriptId').AsLargeInt;
end;

procedure TFirebirdQueryModule.SQLBuildScriptParameterAfterPost(
  DataSet: TDataSet);
begin
  self.SQLBuildScriptParameter.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildTemplateAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildTemplate.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildTemplateAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildTemplateID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_BuildTemplate');
end;

procedure TFirebirdQueryModule.SQLBuildTemplateAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildTemplate.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLBuildAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Build');
   
  DataSet.FieldByName('ModelToBuild').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLEnvironmentAfterPost(DataSet: TDataSet);
begin
  self.SQLEnvironment.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLEnvironmentAfterDelete(DataSet: TDataSet);
begin
  self.SQLEnvironment.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLEnvironmentAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('EnvironmentID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Environment');
  
end;

procedure TFirebirdQueryModule.SQLListDetailAfterPost(DataSet: TDataSet);
begin
  self.SQLListDetail.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLListDetailAfterDelete(DataSet: TDataSet);
begin
  self.SQLListDetail.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLListDetailAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ListDetailID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ListDetail');
   
  DataSet.FieldByName('ListHeaderToDetail').AsLargeInt:=SQLListHeader.FieldByName('ListHeaderID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLListHeaderAfterPost(DataSet: TDataSet);
begin
  self.SQLListHeader.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLListHeaderAfterScroll(DataSet: TDataSet);
begin
  self.SQLListDetail.Active:=False;
  self.SQLListDetail.ParamByName('ListHeaderId').AsLargeInt:=DataSet.FieldByName('ListHeaderId').AsLargeInt;
  self.SQLListDetail.Active:=True;
end;

{
procedure TFirebirdQueryModule.SQLMappingAfterScroll(DataSet: TDataSet);
begin
  self.SQLMappingValue.Active:=False;
  self.SQLMappingValue.ParamByName('MappingId').AsLargeInt:=DataSet.FieldByName('MappingID').AsLargeInt;
  self.SQLMappingValue.Active:=True;
end;
}

procedure TFirebirdQueryModule.SQLMappingValueBeforePost(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('SourceValue').IsNull then
  begin
    DataSet.FieldByName('MapValueSourceLookup').Clear;
  end;
  if not DataSet.FieldByName('TargetValue').IsNull then
  begin
    DataSet.FieldByName('MapValueTargetLookup').Clear;
  end;
end;

procedure TFirebirdQueryModule.SQLListHeaderAfterDelete(DataSet: TDataSet);
begin
  self.SQLListHeader.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLListHeaderAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ListHeaderID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ListHeader');
  
end;

procedure TFirebirdQueryModule.SQLMasterCategoryAfterPost(DataSet: TDataSet);
begin
  self.SQLMasterCategory.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMasterCategoryAfterDelete(DataSet: TDataSet);
begin
  self.SQLMasterCategory.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMasterCategoryAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MasterCategoryID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_MasterCategory');
  
end;

procedure TFirebirdQueryModule.SQLMasterPropertyAfterPost(DataSet: TDataSet);
begin

end;

procedure TFirebirdQueryModule.SQLMasterPropertyAfterScroll(DataSet: TDataSet);
begin

end;

procedure TFirebirdQueryModule.SQLMasterPropertyAfterDelete(DataSet: TDataSet);
begin
  self.SQLMasterProperty.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMasterPropertyAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MasterPropertyID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_MasterProperty');
  
end;

procedure TFirebirdQueryModule.SQLMasterPropertyValueListAfterPost(DataSet: TDataSet);
begin
  self.SQLMasterPropertyValueList.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMasterPropertyValueListAfterDelete(DataSet: TDataSet);
begin
  self.SQLMasterPropertyValueList.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMasterPropertyValueListAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MasterPropertyValueListID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_MasterPropertyValueList');
   
  DataSet.FieldByName('MasterProperyToValueList').AsLargeInt:=SQLMasterProperty.FieldByName('MasterPropertyID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLModelAfterPost(DataSet: TDataSet);
begin
  self.SQLModel.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLModelAfterDelete(DataSet: TDataSet);
begin
  self.SQLModel.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLModelAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ModelID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Model');
  
end;

procedure TFirebirdQueryModule.SQLPropertyGroupAfterPost(DataSet: TDataSet);
begin
  self.SQLPropertyGroup.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLPropertyGroupAfterDelete(DataSet: TDataSet);
begin
  self.SQLPropertyGroup.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLPropertyGroupAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('PropertyGroupID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_PropertyGroup');
  
end;

procedure TFirebirdQueryModule.SQLPropertyTypeAfterPost(DataSet: TDataSet);
begin
  self.SQLPropertyType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLPropertyTypeAfterDelete(DataSet: TDataSet);
begin
  self.SQLPropertyType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLPropertyTypeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('PropertyTypeID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_PropertyType');
  
end;

procedure TFirebirdQueryModule.SQLRelationAfterPost(DataSet: TDataSet);
begin
  self.SQLRelation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;





procedure TFirebirdQueryModule.SQLRelationBeforePost(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('Name').AsString='') or (DataSet.FieldByName('Name').IsNull) then
      raise Exception.Create('Name is required.');
     //Abort;
end;

procedure TFirebirdQueryModule.SQLRelationAfterDelete(DataSet: TDataSet);
begin
  self.SQLRelation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLRelationAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('RelationID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Relation');
   
  DataSet.FieldByName('ModelRelation').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt;
  DataSet.FieldByName('Frozen').AsBoolean:=False;
end;

procedure TFirebirdQueryModule.SQLRelationPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLRelationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLRelationPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLRelationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLRelationPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('RelationPropertyValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_RelationPropertyValue');
   
  DataSet.FieldByName('RelationToPropertyValue').AsLargeInt:=SQLRelation.FieldByName('RelationID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLScreenArtifactAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenArtifact.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenArtifactAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenArtifact.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenArtifactAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenArtifactID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ScreenArtifact');
   
  //DataSet.FieldByName('ChildToArtifact').AsLargeInt:=SQLScreenChild.FieldByName('ScreenChildID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLScreenArtifactTypeAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenArtifactType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenArtifactTypeAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenArtifactType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenArtifactTypeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenArtifactTypeID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ScreenArtifactType');
  
end;

procedure TFirebirdQueryModule.SQLScreenChildAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenChild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenChildAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenChild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenChildAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenChildID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ScreenChild');
   
  DataSet.FieldByName('ScreenFamilyToScreenChild').AsLargeInt:=SQLScreenFamily.FieldByName('ScreenFamilyID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLScreenFamilyAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenFamily.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenFamilyAfterScroll(DataSet: TDataSet);
begin

end;

procedure TFirebirdQueryModule.SQLScreenFamilyAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenFamily.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenFamilyAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenFamilyID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ScreenFamily');
   
  DataSet.FieldByName('ModelToScreenFamily').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLScreenPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLScreenPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenPropertyValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_ScreenPropertyValue');
   
 // DataSet.FieldByName('FamilyToScreenPropValue').AsLargeInt:=SQLScreenFamily.FieldByName('ScreenFamilyID').AsLargeInt; 
end;

procedure TFirebirdQueryModule.SQLMappingAfterPost(DataSet: TDataSet);
begin
  self.SQLMapping.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMappingAfterDelete(DataSet: TDataSet);
begin
  self.SQLMapping.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMappingAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MappingID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Mapping');

end;

procedure TFirebirdQueryModule.SQLMappingValueAfterPost(DataSet: TDataSet);
begin
  self.SQLMappingValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMappingValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLMappingValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdQueryModule.SQLMappingValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MappingValueID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_MappingValue');
  DataSet.FieldByName('MappingToValue').AsLargeInt:=SQLMapping.FieldByName('MappingID').AsLargeInt; 
end;


function TFirebirdQueryModule.GetNewPrimaryKeyValue(PSequenceName : string) : LongInt;
var
  QueryText:string;
   proc : TSQLQuery;
   NewID : LongInt;
begin
     QueryText:='SELECT GEN_ID( ' + PSequenceName + ' ,1 ) AS NEWID FROM RDB$DATABASE;';
     proc := TSQLQuery.Create(Nil);
     proc.DataBase := FDatabase;
     proc.Transaction:= FTransaction;
     proc.SQL.Text :=QueryText;
     proc.Open;
     while not proc.EOF do
     begin
         NewID:=proc.FieldByName('NEWID').AsLargeInt;
         proc.Next;
     end;
     GetNewPrimaryKeyValue:=NewID;
end;

end.

