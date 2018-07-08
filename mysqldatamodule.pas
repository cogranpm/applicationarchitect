unit MySQLDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, sqldb, FileUtil;

type

  { TMySQLDataModule }

  TMySQLDataModule = class(TDataModule)
    Connection: TMySQL55Connection;
    SQLCreateSchema: TSQLScript;
    SQLQueryDBObjects: TSQLQuery;
    Transaction: TSQLTransaction;
  private
    { private declarations }
  public
    { public declarations }
  end;



implementation

{$R *.lfm}

end.

