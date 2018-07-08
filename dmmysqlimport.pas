unit dmMySQLImport;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, sqldb, FileUtil;

type

  { TdmMYSQLImport }

  TdmMYSQLImport = class(TDataModule)
    Connection: TMySQL55Connection;
    SQLListTables: TSQLQuery;
    SQLListColumns: TSQLQuery;
    SQLListForeignKey: TSQLQuery;
    Transaction: TSQLTransaction;
  private
    { private declarations }
  public
    { public declarations }
  end;



implementation

{$R *.lfm}

end.

