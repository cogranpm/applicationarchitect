unit MySqlBuildQueryModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql80conn, FileUtil;

type

  { MySqlBuildQuery }

  { TMySqlBuildQuery }

  TMySqlBuildQuery = class(TDataModule)
    SQLChildAssociation: TSQLQuery;
    SQLGetBuildScriptByID: TSQLQuery;
    SQLGetBuildTemplateByName: TSQLQuery;
    SQLLoadAttribute: TSQLQuery;
    SQLLoadBuild: TSQLQuery;
    SQLLoadModel: TSQLQuery;
    SQLParentAssociation: TSQLQuery;
    SQLLoadRelation: TSQLQuery;
    SQLGetBuildScriptsForController: TSQLQuery;
    SQLGetBuildScriptParameters: TSQLQuery;
    SQLRelationsByModel: TSQLQuery;
  private
    { private declarations }
    FDatabase:TMySQL80Connection;
    FTransaction:TSQLTransaction;
  public
    { public declarations }
    property Database: TMySQL80Connection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
  end;



implementation

{$R *.lfm}

end.

