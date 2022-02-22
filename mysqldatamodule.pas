unit MySQLDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, mysql80conn, sqldb, FileUtil;

type

  { TMySQLDataModule }

  TMySQLDataModule = class(TDataModule)
    Connectionx: TMySQL55Connection;
    connection: TMySQL80Connection;
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

