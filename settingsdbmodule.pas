unit SettingsDBModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, FileUtil;

type

  { TSettingsDB }

  TSettingsDB = class(TDataModule)
    Connection: TIBConnection;
    SQLCreateSchema: TSQLScript;
    Transaction: TSQLTransaction;
  private
    { private declarations }
  public
    { public declarations }
    //procedure CreateDatabase;
  end;

var
  SettingsDB: TSettingsDB;

implementation

{$R *.lfm}

end.

