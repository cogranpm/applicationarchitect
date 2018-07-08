unit FirebirdBuildQueryModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, IBConnection, FileUtil;

type

  { TFirebirdBuildQuery }

  TFirebirdBuildQuery = class(TDataModule)
    SQLChildAssociation: TSQLQuery;
    SQLGetBuildScriptParameters: TSQLQuery;
    SQLGetBuildScriptsForController: TSQLQuery;
    SQLLoadBuild: TSQLQuery;
    SQLLoadModel: TSQLQuery;
    SQLParentAssociation: TSQLQuery;
    SQLLoadRelation: TSQLQuery;
    SQLGetBuildTemplateByName: TSQLQuery;
    SQLGetBuildScriptByID: TSQLQuery;
    SQLLoadAttribute: TSQLQuery;
    SQLRelationsByModel: TSQLQuery;
  private
    { private declarations }
    FDatabase:TIBConnection;
    FTransaction:TSQLTransaction;
  public
    { public declarations }
    property Database: TIBConnection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
  end;

var
  FirebirdBuildQuery: TFirebirdBuildQuery;

implementation

{$R *.lfm}

end.

