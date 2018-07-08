unit firebirdDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, FileUtil, db;

type

  { TFirebirdDataModule }

  TFirebirdDataModule = class(TDataModule)
    IBConnection1: TIBConnection;
    SQLCreateTables: TSQLScript;
    SQLQueryDBObjects: TSQLQuery;
    SQLCreateData: TSQLScript;
    SQLTransaction1: TSQLTransaction;
  private
    { private declarations }
  public
    { public declarations }

  end;



implementation

{$R *.lfm}

{ TFirebirdDataModule }




end.

