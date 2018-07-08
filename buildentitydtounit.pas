unit BuildEntityDTOUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, appinterfacesunit;

type
  TBuildEntityDTO = class(TObject)
     { a convenient way to pass around all data required by builds }
    private
       FModelData:TSQLQuery;
       FRelationData:TSQLQuery;
       FLoadRelationData:TSQLQuery;
       FAttributeData:TSQLQuery;
       FChildAssociationData:TSQLQuery;
       FParentAssociationData:TSQLQuery;
       FBuildData:TSQLQuery;
       FBuildTemplateData:TSQLQuery;
       FDatabaseType:databaseType;
    public
       constructor Create();
       property ModelData: TSQLQuery read FModelData write FModelData;
       property RelationData: TSQLQuery read FRelationData write FRelationData;
       property AttributeData: TSQLQuery read FAttributeData write FAttributeData;
       property ChildAssociationData: TSQLQuery read FChildAssociationData write FChildAssociationData;
       property ParentAssociationData: TSQLQuery read FParentAssociationData write FParentAssociationData;
       property BuildData: TSQLQuery read FBuildData write FBuildData;
       property LoadRelationData:TSQLQuery read FLoadRelationData write FLoadRelationData;
       property BuildTemplateData:TSQLQuery read FBuildTemplateData write FBuildTemplateData;

       { for the sake of the script engine, no property support }
       function GetModelData():TDataSet;
       function GetRelationData():TDataSet;
       function GetBuildData():TDataSet;
  end;

implementation

constructor TBuildEntityDTO.Create();
begin
  inherited.Create;
end;

function TBuildEntityDTO.GetModelData():TDataSet;
begin
   GetModelData:=FModelData;
end;

function TBuildEntityDTO.GetRelationData():TDataSet;
begin
   GetRelationData:=FRelationData;
end;

function TBuildEntityDTO.GetBuildData():TDataSet;
begin
   GetBuildData:=FBuildData;
end;

end.

