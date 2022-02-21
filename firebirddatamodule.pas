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
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;



implementation

{$R *.lfm}

{ TFirebirdDataModule }




procedure TFirebirdDataModule.DataModuleCreate(Sender: TObject);
begin
           { writeln('hello');   }
  { xAppPath := ExtractFileDir(Application.ExeName) + PathDelim;  }

end;

end.

