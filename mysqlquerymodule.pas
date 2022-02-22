unit MySQLQueryModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql80conn, sqldb, FileUtil, db;

type

  { TMySQLQueryModule }

  TMySQLQueryModule = class(TDataModule)
    dsBuildController: TDataSource;
    dsBuildScript: TDataSource;
    dsBuildTemplate: TDataSource;
  
	dsRelationPropertyValue: TDataSource;
	dsModel: TDataSource;
	dsAssociation: TDataSource;
	dsRelation: TDataSource;
	dsAttribute: TDataSource;
	dsMasterProperty: TDataSource;
	dsMasterCategory: TDataSource;
	dsPropertyGroup: TDataSource;
	dsScreenArtifact: TDataSource;
	dsScreenPropertyValue: TDataSource;
	dsArtifactPropertyValue: TDataSource;
	dsScreenArtifactType: TDataSource;
	dsPropertyType: TDataSource;
	dsBuild: TDataSource;
	dsScreenFamily: TDataSource;
	dsScreenChild: TDataSource;
	dsMasterPropertyValueList: TDataSource;
	dsListHeader: TDataSource;
	dsListDetail: TDataSource;
	dsEnvironment: TDataSource;
	dsAttributePropertyValue: TDataSource;
        SQLArtifactPropertyValueARTIFACTPROPVALUETOPROPERTY: TLargeintField;
        SQLArtifactPropertyValueCREATEDBY: TStringField;
        SQLArtifactPropertyValueCREATEDON: TDateTimeField;
        SQLArtifactPropertyValueUPDATEDBY: TStringField;
        SQLArtifactPropertyValueUPDATEDON: TDateTimeField;
        SQLArtifactPropertyValueVERSION: TDateTimeField;
        SQLAssociationCREATEDBY: TStringField;
        SQLAssociationCREATEDON: TDateTimeField;
        SQLAssociationOwned: TLargeintField;
        SQLAssociationOwner: TLargeintField;
        SQLAssociationUPDATEDBY: TStringField;
        SQLAssociationUPDATEDON: TDateTimeField;
        SQLAssociationVERSION: TDateTimeField;
        SQLAttributeCREATEDBY: TStringField;
        SQLAttributeCREATEDON: TDateTimeField;
        SQLAttributePropertyValueAttributeToPropertyValue: TLargeintField;
        SQLAttributePropertyValueCREATEDBY: TStringField;
        SQLAttributePropertyValueCREATEDON: TDateTimeField;
        SQLAttributePropertyValueMasterProperty: TLargeintField;
        SQLAttributePropertyValueUPDATEDBY: TStringField;
        SQLAttributePropertyValueUPDATEDON: TDateTimeField;
        SQLAttributePropertyValueVERSION: TDateTimeField;
        SQLAttributeUPDATEDBY: TStringField;
        SQLAttributeUPDATEDON: TDateTimeField;
        SQLAttributeVERSION: TDateTimeField;
        SQLBuildController: TSQLQuery;
        SQLBuildControllerbuildcontrollerid: TLargeintField;
        SQLBuildControllerCreatedBy: TStringField;
        SQLBuildControllerCreatedOn: TDateField;
        SQLBuildControllername: TStringField;
        SQLBuildControllerScriptCreatedBy: TStringField;
        SQLBuildControllerScriptCreatedOn: TDateField;
        SQLBuildControllerScriptSequence: TLongintField;
        SQLBuildControllerScriptUpdatedBy: TStringField;
        SQLBuildControllerScriptUpdatedOn: TDateField;
        SQLBuildControllerScriptVersion: TDateTimeField;
        SQLBuildControllerUpdatedBy: TStringField;
        SQLBuildControllerUpdatedOn: TDateField;
        SQLBuildControllerVersion: TDateTimeField;
        SQLBuildCREATEDBY: TStringField;
        SQLBuildCREATEDON: TDateTimeField;
        SQLBuildProjectPath: TStringField;
        SQLBuildScript: TSQLQuery;
        SQLBuildScriptBUILDSCRIPTID: TLargeintField;
        SQLBuildScriptCreatedBy: TStringField;
        SQLBuildScriptCreatedOn: TDateField;
        SQLBuildScriptname: TStringField;
        SQLBuildScriptParameterBUILDCONTROLLERSCRIPTID: TLargeintField;
        SQLBuildScriptParameterCreatedBy: TStringField;
        SQLBuildScriptParameterCreatedOn: TDateField;
        SQLBuildScriptParameterUpdatedBy: TStringField;
        SQLBuildScriptParameterUpdatedOn: TDateField;
        SQLBuildScriptParameterVersion: TDateTimeField;
        SQLBuildScriptscript: TMemoField;
        SQLBuildScriptUpdatedBy: TStringField;
        SQLBuildScriptUpdatedOn: TDateField;
        SQLBuildScriptVersion: TDateTimeField;
        SQLBuildTemplate: TSQLQuery;
        SQLBuildTemplateBUILDTEMPLATEID: TLargeintField;
        SQLBuildTemplateCreatedBy: TStringField;
        SQLBuildTemplateCreatedOn: TDateField;
        SQLBuildTemplateNAME: TStringField;
        SQLBuildTemplateSCRIPT: TMemoField;
        SQLBuildTemplateUpdatedBy: TStringField;
        SQLBuildTemplateUpdatedOn: TDateField;
        SQLBuildTemplateVERSION: TDateTimeField;
        SQLBuildUPDATEDBY: TStringField;
        SQLBuildUPDATEDON: TDateTimeField;
        SQLBuildVERSION: TDateTimeField;
        SQLEnvironmentCREATEDBY: TStringField;
        SQLEnvironmentCREATEDON: TDateTimeField;
        SQLEnvironmentUPDATEDBY: TStringField;
        SQLEnvironmentUPDATEDON: TDateTimeField;
        SQLEnvironmentVERSION: TDateTimeField;
        SQLListDetailCREATEDBY: TStringField;
        SQLListDetailCREATEDON: TDateTimeField;
        SQLListDetailUPDATEDBY: TStringField;
        SQLListDetailUPDATEDON: TDateTimeField;
        SQLListDetailVERSION: TDateTimeField;
        SQLListHeaderCREATEDBY: TStringField;
        SQLListHeaderCREATEDON: TDateTimeField;
        SQLListHeaderUPDATEDBY: TStringField;
        SQLListHeaderUPDATEDON: TDateTimeField;
        SQLListHeaderVERSION: TDateTimeField;
        SQLMappingCreatedBy: TStringField;
        SQLMappingCreatedOn: TDateTimeField;
        SQLMappingSystemCode: TStringField;
        SQLMappingUpdatedBy: TStringField;
        SQLMappingUpdatedOn: TDateTimeField;
        SQLMappingValueCreatedBy: TStringField;
        SQLMappingValueCreatedOn: TDateTimeField;
        SQLMappingValueSourceCode: TStringField;
        SQLMappingValueSourceLabel: TStringField;
        SQLMappingValueSourceListName: TStringField;
        SQLMappingValueTargetCode: TStringField;
        SQLMappingValueTargetLabel: TStringField;
        SQLMappingValueTargetListName: TStringField;
        SQLMappingValueUpdatedBy: TStringField;
        SQLMappingValueUpdatedOn: TDateTimeField;
        SQLMappingValueVersion: TDateTimeField;
        SQLMappingVersion: TDateTimeField;
        SQLMasterCategoryCREATEDBY: TStringField;
        SQLMasterCategoryCREATEDON: TDateTimeField;
        SQLMasterCategoryUPDATEDBY: TStringField;
        SQLMasterCategoryUPDATEDON: TDateTimeField;
        SQLMasterCategoryVERSION: TDateTimeField;
        SQLMasterPropertyCREATEDBY: TStringField;
        SQLMasterPropertyCREATEDON: TDateTimeField;
        SQLMasterPropertyMASTERPROPERTYTOGROUP: TLargeintField;
        SQLMasterPropertyMASTERPROPERTYTOTYPE: TLargeintField;
        SQLMasterPropertyToCategory: TSQLQuery;
        SQLMasterPropertyUPDATEDBY: TStringField;
        SQLMasterPropertyUPDATEDON: TDateTimeField;
        SQLMasterPropertyValueListCREATEDBY: TStringField;
        SQLMasterPropertyValueListCREATEDON: TDateTimeField;
        SQLMasterPropertyValueListUPDATEDBY: TStringField;
        SQLMasterPropertyValueListUPDATEDON: TDateTimeField;
        SQLMasterPropertyValueListVERSION: TDateTimeField;
        SQLMasterPropertyVERSION: TDateTimeField;
        SQLModelCREATEDBY: TStringField;
        SQLModelCREATEDON: TDateTimeField;
        SQLModelUPDATEDBY: TStringField;
        SQLModelUPDATEDON: TDateTimeField;
        SQLModelVERSION: TDateTimeField;
        SQLPropertyGroupCREATEDBY: TStringField;
        SQLPropertyGroupCREATEDON: TDateTimeField;
        SQLPropertyGroupUPDATEDBY: TStringField;
        SQLPropertyGroupUPDATEDON: TDateTimeField;
        SQLPropertyGroupVERSION: TDateTimeField;
        SQLPropertyTypeCREATEDBY: TStringField;
        SQLPropertyTypeCREATEDON: TDateTimeField;
        SQLPropertyTypeUPDATEDBY: TStringField;
        SQLPropertyTypeUPDATEDON: TDateTimeField;
        SQLPropertyTypeVERSION: TDateTimeField;
        SQLRelationCREATEDBY: TStringField;
        SQLRelationCREATEDON: TDateTimeField;
  
	
	SQLRelationPropertyValue: TSQLQuery;
        SQLRelationPropertyValueCREATEDBY: TStringField;
        SQLRelationPropertyValueCREATEDON: TDateTimeField;
        SQLRelationPropertyValueMasterProperty: TLargeintField;
    SQLRelationPropertyValueRelationPropertyValueId: TLargeintField;
	    SQLRelationPropertyValueRelationToPropertyValue: TLargeintField;
	    SQLRelationPropertyValuePropertyValue: TStringField;
		

	SQLModel: TSQLQuery;
    SQLModelModelId: TLargeintField;
	    SQLModelname: TStringField;
		

	SQLAssociation: TSQLQuery;
    SQLAssociationAssociationId: TLargeintField;
	    SQLAssociationModelAssociation: TLargeintField;
	    SQLAssociationName: TStringField;
	    SQLAssociationtype: TIntegerField;
		

	SQLRelation: TSQLQuery;
        SQLRelationPropertyValueUPDATEDBY: TStringField;
        SQLRelationPropertyValueUPDATEDON: TDateTimeField;
        SQLRelationPropertyValueVERSION: TDateTimeField;
    SQLRelationRelationId: TLargeintField;
	    SQLRelationModelRelation: TLargeintField;
	    SQLRelationname: TStringField;
	    SQLRelationlastmodified: TLargeintField;
	    SQLRelationlastbuilt: TLargeintField;
	    SQLRelationfrozen: TBooleanField;
		

	SQLAttribute: TSQLQuery;
    SQLAttributeAttributeId: TLargeintField;
	    SQLAttributeRelationAttribute: TLargeintField;
	    SQLAttributename: TStringField;
	    SQLAttributetype: TIntegerField;
	    SQLAttributeattributelength: TIntegerField;
	    SQLAttributeallownull: TBooleanField;
		

	SQLMasterProperty: TSQLQuery;
    SQLMasterPropertyMasterPropertyId: TLargeintField;
	    SQLMasterPropertyName: TStringField;
	    SQLMasterPropertyDefaultValue: TStringField;
	    SQLMasterPropertyNotes: TStringField;
		

	SQLMasterCategory: TSQLQuery;
    SQLMasterCategoryMasterCategoryId: TLargeintField;
	    SQLMasterCategoryName: TStringField;
		

	SQLPropertyGroup: TSQLQuery;
    SQLPropertyGroupPropertyGroupId: TLargeintField;
	    SQLPropertyGroupName: TStringField;
            SQLRelationUPDATEDBY: TStringField;
            SQLRelationUPDATEDON: TDateTimeField;
            SQLRelationVERSION: TDateTimeField;
		

	SQLScreenArtifact: TSQLQuery;
        SQLScreenArtifactArtifactToAttribute: TLargeintField;
        SQLScreenArtifactCREATEDBY: TStringField;
        SQLScreenArtifactCREATEDON: TDateTimeField;
    SQLScreenArtifactScreenArtifactId: TLargeintField;
	    SQLScreenArtifactChildToArtifact: TLargeintField;
	    SQLScreenArtifactFamilyToArtifact: TLargeintField;
	    SQLScreenArtifactName: TStringField;
            SQLScreenArtifactTypeCREATEDBY: TStringField;
            SQLScreenArtifactTypeCREATEDON: TDateTimeField;
            SQLScreenArtifactTypeUPDATEDBY: TStringField;
            SQLScreenArtifactTypeUPDATEDON: TDateTimeField;
            SQLScreenArtifactTypeVERSION: TDateTimeField;
            SQLScreenArtifactUPDATEDBY: TStringField;
            SQLScreenArtifactUPDATEDON: TDateTimeField;
            SQLScreenArtifactVERSION: TDateTimeField;
            SQLScreenChildCREATEDBY: TStringField;
            SQLScreenChildCREATEDON: TDateTimeField;
            SQLScreenChildSCREENCHILDTOASSOCIATION: TLargeintField;
            SQLScreenChildUPDATEDBY: TStringField;
            SQLScreenChildUPDATEDON: TDateTimeField;
            SQLScreenChildVERSION: TDateTimeField;
            SQLScreenFamilyCREATEDBY: TStringField;
            SQLScreenFamilyCREATEDON: TDateTimeField;
            SQLScreenFamilySCREENFAMILYTORELATION: TLargeintField;
            SQLScreenFamilyUPDATEDBY: TStringField;
            SQLScreenFamilyUPDATEDON: TDateTimeField;
            SQLScreenFamilyVERSION: TDateTimeField;
		

	SQLScreenPropertyValue: TSQLQuery;
        SQLScreenChildPropertyValue: TSQLQuery;
        SQLScreenPropertyValueChildToScreenPropValue1: TLargeintField;
        SQLScreenPropertyValueCREATEDBY: TStringField;
        SQLScreenPropertyValueCREATEDBY1: TStringField;
        SQLScreenPropertyValueCREATEDON: TDateTimeField;
        SQLScreenPropertyValueCREATEDON1: TDateTimeField;
        SQLScreenPropertyValueFamilyToScreenPropValue1: TLargeintField;
        SQLScreenPropertyValuePropertyValue1: TStringField;
    SQLScreenPropertyValueScreenPropertyValueId: TLargeintField;
	    SQLScreenPropertyValueFamilyToScreenPropValue: TLargeintField;
	    SQLScreenPropertyValueChildToScreenPropValue: TLargeintField;
	    SQLScreenPropertyValuePropertyValue: TStringField;
		

	SQLArtifactPropertyValue: TSQLQuery;
    SQLArtifactPropertyValueArtifactPropertyValueId: TLargeintField;
	    SQLArtifactPropertyValueArtifactToPropertyValue: TLargeintField;
	    SQLArtifactPropertyValueScreenArtifactToPropertyValue: TLargeintField;
	    SQLArtifactPropertyValuePropertyValue: TStringField;
		

	SQLScreenArtifactType: TSQLQuery;
    SQLScreenArtifactTypeScreenArtifactTypeId: TLargeintField;
	    SQLScreenArtifactTypeName: TStringField;
		

	SQLPropertyType: TSQLQuery;
    SQLPropertyTypePropertyTypeId: TLargeintField;
	    SQLPropertyTypeName: TStringField;
	    SQLPropertyTypeDisplayControl: TIntegerField;
	    SQLPropertyTypeNotes: TStringField;
		

	SQLBuild: TSQLQuery;
    SQLBuildBuildId: TLargeintField;
	    SQLBuildModelToBuild: TLargeintField;
	    SQLBuildName: TStringField;
		

	SQLScreenFamily: TSQLQuery;
    SQLScreenFamilyScreenFamilyId: TLargeintField;
	    SQLScreenFamilyModelToScreenFamily: TLargeintField;
	    SQLScreenFamilyName: TStringField;
		

	SQLScreenChild: TSQLQuery;
    SQLScreenChildScreenChildId: TLargeintField;
	    SQLScreenChildScreenFamilyToScreenChild: TLargeintField;
	    SQLScreenChildScreenChildToSelf: TLargeintField;
	    SQLScreenChildName: TStringField;
		

	SQLMasterPropertyValueList: TSQLQuery;
    SQLMasterPropertyValueListMasterPropertyValueListId: TLargeintField;
	    SQLMasterPropertyValueListMasterProperyToValueList: TLargeintField;
	    SQLMasterPropertyValueListName: TStringField;
	    SQLMasterPropertyValueListCode: TStringField;
	    SQLMasterPropertyValueListDisplay: TStringField;
		

	SQLListHeader: TSQLQuery;
    SQLListHeaderListHeaderId: TLargeintField;
	    SQLListHeaderName: TStringField;
		

	SQLListDetail: TSQLQuery;
    SQLListDetailListDetailId: TLargeintField;
	    SQLListDetailListHeaderToDetail: TLargeintField;
	    SQLListDetailCode: TStringField;
	    SQLListDetailLabel: TStringField;
		

	SQLEnvironment: TSQLQuery;
    SQLEnvironmentEnvironmentId: TLargeintField;
	    SQLEnvironmentMembershipServer: TStringField;
	    SQLEnvironmentMembershipDatabase: TStringField;
	    SQLEnvironmentDatabaseServer: TStringField;
	    SQLEnvironmentDatabaseName: TStringField;
		

	SQLAttributePropertyValue: TSQLQuery;
    SQLAttributePropertyValueAttributePropertyValueId: TLargeintField;
	    SQLAttributePropertyValuePropertyValue: TStringField;
            SQLScreenPropertyValueScreenPropertyValueId1: TLargeintField;
            SQLScreenPropertyValueSCREENPROPVALUETOPROPERTY: TLargeintField;
            SQLScreenPropertyValueSCREENPROPVALUETOPROPERTY1: TLargeintField;
            SQLScreenPropertyValueUPDATEDBY: TStringField;
            SQLScreenPropertyValueUPDATEDBY1: TStringField;
            SQLScreenPropertyValueUPDATEDON: TDateTimeField;
            SQLScreenPropertyValueUPDATEDON1: TDateTimeField;
            SQLScreenPropertyValueVERSION: TDateTimeField;
            AssociationTypeLookup: TStringField;
            OwnerLookup: TStringField;
            OwnedLookup: TStringField;
            RelationLookup: TStringField;
            SQLScreenPropertyValueVERSION1: TDateTimeField;
            PropertyGroup: TStringField;
            PropertyType: TStringField;
            BuildScriptLookup: TStringField;
            TypeLookup: TStringField;
		
	dsAssociationPropertyValue: TDataSource;

	SQLAssociationPropertyValue: TSQLQuery;
	SQLAssociationPropertyValueAssociationPropertyValueId: TLargeintField;
	SQLAssociationPropertyValueAssociationToPropertyValue: TLargeintField;
	SQLAssociationPropertyValueMasterProperty: TLargeintField;
	SQLAssociationPropertyValuePropertyValue: TStringField;
	
	
	dsBuildPropertyValue: TDataSource;

	SQLBuildPropertyValue: TSQLQuery;
	SQLBuildPropertyValueBuildPropertyValueId: TLargeintField;
	SQLBuildPropertyValueBuildToPropertyValue: TLargeintField;
	SQLBuildPropertyValueMasterProperty: TLargeintField;
	SQLBuildPropertyValuePropertyValue: TStringField;
	
	dsBuildControllerScript: TDataSource;

	SQLBuildControllerScript: TSQLQuery;
	SQLBuildControllerScriptBuildControllerScriptId: TLargeintField;
	SQLBuildControllerScriptBuildControllerId: TLargeintField;
	SQLBuildControllerScriptBuildScriptId: TLargeintField;
	
	
	dsBuildScriptParameter: TDataSource;

	SQLBuildScriptParameter: TSQLQuery;
	SQLBuildScriptParameterBuildScriptParameterId: TLargeintField;
	SQLBuildScriptParameterName: TStringField;
	SQLBuildScriptParameterValue: TStringField;
	
	
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

        procedure SQLBuildControllerScriptAfterScroll(DataSet: TDataSet);
 procedure SQLBuildScriptParameterAfterDelete(DataSet: TDataSet);
	procedure SQLBuildScriptParameterAfterInsert(DataSet: TDataSet);
	procedure SQLBuildScriptParameterAfterPost(DataSet: TDataSet);	

	procedure SQLBuildControllerScriptAfterDelete(DataSet: TDataSet);
	procedure SQLBuildControllerScriptAfterInsert(DataSet: TDataSet);
	procedure SQLBuildControllerScriptAfterPost(DataSet: TDataSet);
	
	

	procedure SQLBuildPropertyValueAfterDelete(DataSet: TDataSet);
	procedure SQLBuildPropertyValueAfterInsert(DataSet: TDataSet);
	procedure SQLBuildPropertyValueAfterPost(DataSet: TDataSet);	
	procedure SQLAssociationPropertyValueAfterDelete(DataSet: TDataSet);
	procedure SQLAssociationPropertyValueAfterInsert(DataSet: TDataSet);
	procedure SQLAssociationPropertyValueAfterPost(DataSet: TDataSet);
	procedure DataModuleCreate(Sender: TObject);
	procedure SQLBuildControllerAfterDelete(DataSet: TDataSet);
	procedure SQLBuildControllerAfterInsert(DataSet: TDataSet);
	procedure SQLBuildControllerAfterPost(DataSet: TDataSet);
	procedure SQLBuildControllerAfterScroll(DataSet: TDataSet);
	procedure SQLBuildScriptAfterDelete(DataSet: TDataSet);
	procedure SQLBuildScriptAfterInsert(DataSet: TDataSet);
	procedure SQLBuildScriptAfterPost(DataSet: TDataSet);
	procedure SQLBuildTemplateAfterDelete(DataSet: TDataSet);
	procedure SQLBuildTemplateAfterInsert(DataSet: TDataSet);
	procedure SQLBuildTemplateAfterPost(DataSet: TDataSet);
	procedure SQLListHeaderAfterScroll(DataSet: TDataSet);
       // procedure SQLMappingAfterScroll(DataSet: TDataSet);
        procedure SQLMappingValueBeforePost(DataSet: TDataSet);
	procedure SQLMasterPropertyAfterScroll(DataSet: TDataSet);
 procedure SQLRelationPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLRelationPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLRelationPropertyValueAfterPost(DataSet: TDataSet);
		procedure SQLModelAfterDelete(DataSet: TDataSet);
    procedure SQLModelAfterInsert(DataSet: TDataSet);
    procedure SQLModelAfterPost(DataSet: TDataSet);
		procedure SQLAssociationAfterDelete(DataSet: TDataSet);
    procedure SQLAssociationAfterInsert(DataSet: TDataSet);
    procedure SQLAssociationAfterPost(DataSet: TDataSet);
		procedure SQLRelationAfterDelete(DataSet: TDataSet);
    procedure SQLRelationAfterInsert(DataSet: TDataSet);
    procedure SQLRelationAfterPost(DataSet: TDataSet);
		procedure SQLAttributeAfterDelete(DataSet: TDataSet);
    procedure SQLAttributeAfterInsert(DataSet: TDataSet);
    procedure SQLAttributeAfterPost(DataSet: TDataSet);
		procedure SQLMasterPropertyAfterDelete(DataSet: TDataSet);
    procedure SQLMasterPropertyAfterInsert(DataSet: TDataSet);
    procedure SQLMasterPropertyAfterPost(DataSet: TDataSet);
		procedure SQLMasterCategoryAfterDelete(DataSet: TDataSet);
    procedure SQLMasterCategoryAfterInsert(DataSet: TDataSet);
    procedure SQLMasterCategoryAfterPost(DataSet: TDataSet);
		procedure SQLPropertyGroupAfterDelete(DataSet: TDataSet);
    procedure SQLPropertyGroupAfterInsert(DataSet: TDataSet);
    procedure SQLPropertyGroupAfterPost(DataSet: TDataSet);
		procedure SQLScreenArtifactAfterDelete(DataSet: TDataSet);
    procedure SQLScreenArtifactAfterInsert(DataSet: TDataSet);
    procedure SQLScreenArtifactAfterPost(DataSet: TDataSet);
    procedure SQLScreenFamilyAfterScroll(DataSet: TDataSet);
		procedure SQLScreenPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLScreenPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLScreenPropertyValueAfterPost(DataSet: TDataSet);
		procedure SQLArtifactPropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLArtifactPropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLArtifactPropertyValueAfterPost(DataSet: TDataSet);
		procedure SQLScreenArtifactTypeAfterDelete(DataSet: TDataSet);
    procedure SQLScreenArtifactTypeAfterInsert(DataSet: TDataSet);
    procedure SQLScreenArtifactTypeAfterPost(DataSet: TDataSet);
		procedure SQLPropertyTypeAfterDelete(DataSet: TDataSet);
    procedure SQLPropertyTypeAfterInsert(DataSet: TDataSet);
    procedure SQLPropertyTypeAfterPost(DataSet: TDataSet);
		procedure SQLBuildAfterDelete(DataSet: TDataSet);
    procedure SQLBuildAfterInsert(DataSet: TDataSet);
    procedure SQLBuildAfterPost(DataSet: TDataSet);
		procedure SQLScreenFamilyAfterDelete(DataSet: TDataSet);
    procedure SQLScreenFamilyAfterInsert(DataSet: TDataSet);
    procedure SQLScreenFamilyAfterPost(DataSet: TDataSet);
		procedure SQLScreenChildAfterDelete(DataSet: TDataSet);
    procedure SQLScreenChildAfterInsert(DataSet: TDataSet);
    procedure SQLScreenChildAfterPost(DataSet: TDataSet);
		procedure SQLMasterPropertyValueListAfterDelete(DataSet: TDataSet);
    procedure SQLMasterPropertyValueListAfterInsert(DataSet: TDataSet);
    procedure SQLMasterPropertyValueListAfterPost(DataSet: TDataSet);
		procedure SQLListHeaderAfterDelete(DataSet: TDataSet);
    procedure SQLListHeaderAfterInsert(DataSet: TDataSet);
    procedure SQLListHeaderAfterPost(DataSet: TDataSet);
		procedure SQLListDetailAfterDelete(DataSet: TDataSet);
    procedure SQLListDetailAfterInsert(DataSet: TDataSet);
    procedure SQLListDetailAfterPost(DataSet: TDataSet);
		procedure SQLEnvironmentAfterDelete(DataSet: TDataSet);
    procedure SQLEnvironmentAfterInsert(DataSet: TDataSet);
    procedure SQLEnvironmentAfterPost(DataSet: TDataSet);
		procedure SQLAttributePropertyValueAfterDelete(DataSet: TDataSet);
    procedure SQLAttributePropertyValueAfterInsert(DataSet: TDataSet);
    procedure SQLAttributePropertyValueAfterPost(DataSet: TDataSet);
	
	procedure SQLMappingAfterDelete(DataSet: TDataSet);
	procedure SQLMappingAfterInsert(DataSet: TDataSet);
	procedure SQLMappingAfterPost(DataSet: TDataSet);	
	
	procedure SQLMappingValueAfterDelete(DataSet: TDataSet);
	procedure SQLMappingValueAfterInsert(DataSet: TDataSet);
	procedure SQLMappingValueAfterPost(DataSet: TDataSet);	
		
  private
    FDatabase:TMySQL80Connection;
    FTransaction:TSQLTransaction;
	FUserName:String;
  private
    { private declarations }
    function GenerateSequentialKey(KeyName : string) : LongInt;
   
  public
    { public declarations }
    property Database: TMySQL80Connection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
	property UserName:String read FUserName write FUserName;
  end;



implementation

{$R *.lfm}

{ TMySQLQueryModule }

procedure TMySQLQueryModule.SQLRelationPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLRelationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLRelationPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLRelationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLListHeaderAfterScroll(DataSet: TDataSet);
begin
  self.SQLListDetail.Active:=False;
  self.SQLListDetail.ParamByName('ListHeaderId').AsLargeInt:=DataSet.FieldByName('ListHeaderId').AsLargeInt;
  self.SQLListDetail.Active:=True;
end;

{
procedure TMySQLQueryModule.SQLMappingAfterScroll(DataSet: TDataSet);
begin
  self.SQLMappingValue.Active:=False;
  self.SQLMappingValue.ParamByName('MappingId').AsLargeInt:=DataSet.FieldByName('MappingID').AsLargeInt;
  self.SQLMappingValue.Active:=True;
end;
}

procedure TMySQLQueryModule.SQLMappingValueBeforePost(DataSet: TDataSet);
var
   TargetValue:String;
   SourceValue:String;
begin
  if DataSet.FieldByName('SourceValue').IsNull then
  begin
       SourceValue:='';
  end
  else
  begin
       SourceValue:=DataSet.FieldByName('SourceValue').AsString;
  end;

  if DataSet.FieldByName('TargetValue').IsNull then
  begin
       TargetValue:=''
  end
  else
  begin
       TargetValue:=DataSet.FieldByName('TargetValue').AsString
  end;

  if TargetValue <> '' then
  begin
     DataSet.FieldByName('MapValueTargetLookup').Clear;
  end
  else
  begin
       DataSet.FieldByName('TargetValue').Clear;
  end;

  if SourceValue <> '' then
  begin
     DataSet.FieldByName('MapValueSourceLookup').Clear;
  end
  else
  begin
       DataSet.FieldByName('SourceValue').Clear;
  end;
end;

procedure TMySQLQueryModule.SQLMasterPropertyAfterScroll(DataSet: TDataSet);
begin

end;

procedure TMySQLQueryModule.DataModuleCreate(Sender: TObject);
begin

end;

procedure TMySQLQueryModule.SQLBuildControllerAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildController.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildControllerAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildControllerID').AsLargeInt:=self.GenerateSequentialKey('BuildController_GEN');
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLBuildControllerAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildController.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildControllerAfterScroll(DataSet: TDataSet);
begin
  {
  SQLBuildScript.Active:=False;
  SQLBuildScript.ParamByName('BuildControllerID').AsLargeInt:=DataSet.FieldByName('BuildControllerID').AsLargeInt;
  SQLBuildScript.Active:=True;
  }
end;

procedure TMySQLQueryModule.SQLBuildScriptAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildScript.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildScriptAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildScriptID').AsLargeInt:=self.GenerateSequentialKey('BuildScript_GEN');
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLBuildScriptAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildScript.ApplyUpdates(-1);
  self.FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildTemplateAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildTemplate.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildTemplateAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildTemplateID').AsLargeInt:=self.GenerateSequentialKey('BuildTemplate_GEN');
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLBuildTemplateAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildTemplate.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLRelationPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('RelationPropertyValueID').AsLargeInt:=self.GenerateSequentialKey('RelationPropertyValue_GEN');
   
  DataSet.FieldByName('RelationToPropertyValue').AsLargeInt:=SQLRelation.FieldByName('RelationID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLModelAfterPost(DataSet: TDataSet);
begin
  self.SQLModel.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLModelAfterDelete(DataSet: TDataSet);
begin
  self.SQLModel.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLModelAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ModelID').AsLargeInt:=self.GenerateSequentialKey('Model_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLAssociationAfterPost(DataSet: TDataSet);
begin
  self.SQLAssociation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAssociationAfterDelete(DataSet: TDataSet);
begin
  self.SQLAssociation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAssociationAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AssociationID').AsLargeInt:=self.GenerateSequentialKey('Association_GEN');
   
  DataSet.FieldByName('ModelAssociation').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLAssociationPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLAssociationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAssociationPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLAssociationPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAssociationPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AssociationPropertyValueID').AsLargeInt:=self.GenerateSequentialKey('AssociationPropertyValue_GEN');
  DataSet.FieldByName('AssociationToPropertyValue').AsLargeInt:=SQLAssociation.FieldByName('AssociationID').AsLargeInt; 
end;

procedure TMySQLQueryModule.SQLRelationAfterPost(DataSet: TDataSet);
begin
  self.SQLRelation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLRelationAfterDelete(DataSet: TDataSet);
begin
  self.SQLRelation.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLRelationAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('RelationID').AsLargeInt:=self.GenerateSequentialKey('Relation_GEN');
   
  DataSet.FieldByName('ModelRelation').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLAttributeAfterPost(DataSet: TDataSet);
begin
  self.SQLAttribute.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAttributeAfterDelete(DataSet: TDataSet);
begin
  self.SQLAttribute.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAttributeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AttributeID').AsLargeInt:=self.GenerateSequentialKey('Attribute_GEN');
  DataSet.FieldByName('RelationAttribute').AsLargeInt:=SQLRelation.FieldByName('RelationID').AsLargeInt;
  DataSet.FieldByName('AllowNull').AsLargeInt:=0;
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLAttributePropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLAttributePropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAttributePropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLAttributePropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLAttributePropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AttributePropertyValueID').AsLargeInt:=self.GenerateSequentialKey('AttributePropertyValue_GEN');
  DataSet.FieldByName('AttributeToPropertyValue').AsLargeInt:=SQLAttribute.FieldByName('AttributeID').AsLargeInt; 
end;



procedure TMySQLQueryModule.SQLMasterPropertyAfterPost(DataSet: TDataSet);
begin

end;

procedure TMySQLQueryModule.SQLMasterPropertyAfterDelete(DataSet: TDataSet);
begin
  self.SQLMasterProperty.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMasterPropertyAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MasterPropertyID').AsLargeInt:=self.GenerateSequentialKey('MasterProperty_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLMasterCategoryAfterPost(DataSet: TDataSet);
begin
  self.SQLMasterCategory.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMasterCategoryAfterDelete(DataSet: TDataSet);
begin
  self.SQLMasterCategory.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMasterCategoryAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MasterCategoryID').AsLargeInt:=self.GenerateSequentialKey('MasterCategory_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLPropertyGroupAfterPost(DataSet: TDataSet);
begin
  self.SQLPropertyGroup.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLPropertyGroupAfterDelete(DataSet: TDataSet);
begin
  self.SQLPropertyGroup.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLPropertyGroupAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('PropertyGroupID').AsLargeInt:=self.GenerateSequentialKey('PropertyGroup_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLScreenArtifactAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenArtifact.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenFamilyAfterScroll(DataSet: TDataSet);
begin

end;

procedure TMySQLQueryModule.SQLScreenArtifactAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenArtifact.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenArtifactAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenArtifactID').AsLargeInt:=self.GenerateSequentialKey('ScreenArtifact_GEN');
   
  DataSet.FieldByName('ChildToArtifact').AsLargeInt:=SQLScreenChild.FieldByName('ScreenChildID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLScreenPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenPropertyValueID').AsLargeInt:=self.GenerateSequentialKey('ScreenPropertyValue_GEN');
  //DataSet.FieldByName('FamilyToScreenPropValue').AsLargeInt:=SQLScreenFamily.FieldByName('ScreenFamilyID').AsLargeInt;
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLArtifactPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLArtifactPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLArtifactPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLArtifactPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLArtifactPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ArtifactPropertyValueID').AsLargeInt:=self.GenerateSequentialKey('ArtifactPropertyValue_GEN');
 // DataSet.FieldByName('ArtifactToPropertyValue').AsLargeInt:=SQLScreenArtifact.FieldByName('ScreenArtifactID').AsLargeInt;
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLScreenArtifactTypeAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenArtifactType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenArtifactTypeAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenArtifactType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenArtifactTypeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenArtifactTypeID').AsLargeInt:=self.GenerateSequentialKey('ScreenArtifactType_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLPropertyTypeAfterPost(DataSet: TDataSet);
begin
  self.SQLPropertyType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLPropertyTypeAfterDelete(DataSet: TDataSet);
begin
  self.SQLPropertyType.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLPropertyTypeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('PropertyTypeID').AsLargeInt:=self.GenerateSequentialKey('PropertyType_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLBuildAfterPost(DataSet: TDataSet);
begin
  self.SQLBuild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildID').AsLargeInt:=self.GenerateSequentialKey('Build_GEN');
   
  DataSet.FieldByName('ModelToBuild').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLScreenFamilyAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenFamily.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenFamilyAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenFamily.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenFamilyAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenFamilyID').AsLargeInt:=self.GenerateSequentialKey('ScreenFamily_GEN');
   
  DataSet.FieldByName('ModelToScreenFamily').AsLargeInt:=SQLModel.FieldByName('ModelID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLScreenChildAfterPost(DataSet: TDataSet);
begin
  self.SQLScreenChild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenChildAfterDelete(DataSet: TDataSet);
begin
  self.SQLScreenChild.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLScreenChildAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ScreenChildID').AsLargeInt:=self.GenerateSequentialKey('ScreenChild_GEN');
   
  DataSet.FieldByName('ScreenFamilyToScreenChild').AsLargeInt:=SQLScreenFamily.FieldByName('ScreenFamilyID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLMasterPropertyValueListAfterPost(DataSet: TDataSet);
begin
  self.SQLMasterPropertyValueList.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMasterPropertyValueListAfterDelete(DataSet: TDataSet);
begin
  self.SQLMasterPropertyValueList.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMasterPropertyValueListAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MasterPropertyValueListID').AsLargeInt:=self.GenerateSequentialKey('MasterPropertyValueList_GEN');
   
  DataSet.FieldByName('MasterProperyToValueList').AsLargeInt:=SQLMasterProperty.FieldByName('MasterPropertyID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLListHeaderAfterPost(DataSet: TDataSet);
begin
  self.SQLListHeader.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLListHeaderAfterDelete(DataSet: TDataSet);
begin
  self.SQLListHeader.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLListHeaderAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ListHeaderID').AsLargeInt:=self.GenerateSequentialKey('ListHeader_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLListDetailAfterPost(DataSet: TDataSet);
begin
  self.SQLListDetail.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLListDetailAfterDelete(DataSet: TDataSet);
begin
  self.SQLListDetail.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLListDetailAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ListDetailID').AsLargeInt:=self.GenerateSequentialKey('ListDetail_GEN');
   
  DataSet.FieldByName('ListHeaderToDetail').AsLargeInt:=SQLListHeader.FieldByName('ListHeaderID').AsLargeInt; 
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLEnvironmentAfterPost(DataSet: TDataSet);
begin
  self.SQLEnvironment.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLEnvironmentAfterDelete(DataSet: TDataSet);
begin
  self.SQLEnvironment.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLEnvironmentAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('EnvironmentID').AsLargeInt:=self.GenerateSequentialKey('Environment_GEN');
  
  DataSet.FieldByName('CreatedBy').Text:=FUserName;
end;

procedure TMySQLQueryModule.SQLBuildPropertyValueAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildPropertyValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildPropertyValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildPropertyValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildPropertyValueID').AsLargeInt:=self.GenerateSequentialKey('BuildPropertyValue_GEN');
  DataSet.FieldByName('BuildToPropertyValue').AsLargeInt:=SQLBuild.FieldByName('BuildID').AsLargeInt; 
end;

procedure TMySQLQueryModule.SQLBuildControllerScriptAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildControllerScript.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildControllerScriptAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildControllerScript.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildControllerScriptAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildControllerScriptID').AsLargeInt:=self.GenerateSequentialKey('BuildControllerScript_GEN');
  DataSet.FieldByName('BUILDCONTROLLERID').AsLargeInt:=SQLBuildController.FieldByName('BUILDCONTROLLERID').AsLargeInt;

end;

procedure TMySQLQueryModule.SQLBuildScriptParameterAfterPost(DataSet: TDataSet);
begin
  self.SQLBuildScriptParameter.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildScriptParameterAfterDelete(DataSet: TDataSet);
begin
  self.SQLBuildScriptParameter.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLBuildControllerScriptAfterScroll(
  DataSet: TDataSet);
begin
  SQLBuildScriptParameter.Active:=False;
  SQLBuildScriptParameter.ParamByName('buildcontrollerscriptid').AsLargeInt:=DataSet.FieldByName('buildcontrollerscriptid').AsLargeInt;
  SQLBuildScriptParameter.Active:=True;
end;

procedure TMySQLQueryModule.SQLBuildScriptParameterAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('BuildScriptParameterID').AsLargeInt:=self.GenerateSequentialKey('BuildScriptParameter_GEN');
  DataSet.FieldByName('BUILDCONTROLLERSCRIPTID').AsLargeInt:=self.SQLBuildControllerScript.FieldByName('BuildControllerScriptId').AsLargeInt;
end;

procedure TMySQLQueryModule.SQLMappingAfterPost(DataSet: TDataSet);
begin
  self.SQLMapping.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMappingAfterDelete(DataSet: TDataSet);
begin
  self.SQLMapping.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMappingAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MappingID').AsLargeInt:=self.GenerateSequentialKey('Mapping_GEN');

end;

procedure TMySQLQueryModule.SQLMappingValueAfterPost(DataSet: TDataSet);
begin
  self.SQLMappingValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMappingValueAfterDelete(DataSet: TDataSet);
begin
  self.SQLMappingValue.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMySQLQueryModule.SQLMappingValueAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('MappingValueID').AsLargeInt:=self.GenerateSequentialKey('MappingValue_GEN');
  DataSet.FieldByName('MappingToValue').AsLargeInt:=SQLMapping.FieldByName('MappingID').AsLargeInt; 
end;

function TMySQLQueryModule.GenerateSequentialKey(KeyName: String) : LongInt;
var
   proc : TSQLQuery;
   NewID : LongInt;
begin
  proc := TSQLQuery.Create(Nil);
  proc.DataBase := self.FDatabase;
  proc.Transaction:= self.FTransaction;
  proc.SQL.Text :='call pSelectSequentialKey(:sequenceName)';
  proc.ParamByName('sequenceName').AsString:=KeyName;
  proc.ParamByName('sequenceName').ParamType:=ptInput;
  proc.Open;
  while not proc.EOF do
  begin
       NewID:=proc.FieldByName('SEQ_VALUE').AsLargeInt;
       proc.Next;
  end;
  GenerateSequentialKey:=NewID;
end;

end.

