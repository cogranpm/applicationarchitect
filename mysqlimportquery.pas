unit mysqlimportquery;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, sqldb, db, mysql80conn;

type
  TMYSQLImportQuery = class(TDataModule)
  
	dsConnection: TDataSource;

	SQLConnection: TSQLQuery;
        SQLConnectionConnectionId: TLargeintField;
        SQLConnectionServerName: TStringField;
        SQLConnectionPort: TIntegerField;
        SQLConnectionUserName: TStringField;
        SQLConnectionPassword: TStringField;
        SQLConnectionDateOfLastConnection: TDateTimeField;
        SQLConnectionDatabaseName: TStringField;
        SQLConnectionDatabaseType: TIntegerField;
        SQLConnectionConnectionType: TIntegerField;

	procedure SQLConnectionAfterDelete(DataSet: TDataSet);
        procedure SQLConnectionAfterInsert(DataSet: TDataSet);
        procedure SQLConnectionAfterPost(DataSet: TDataSet);  
  
  
  private
    { private declarations }
    FDatabase:TMySQL80Connection;
    FTransaction:TSQLTransaction;

  public
    { public declarations }
    property Database: TMySQL80Connection read FDatabase write FDatabase;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;

    private
      function GenerateSequentialKey(KeyName: String) : LongInt;
  end;


implementation

procedure TMYSQLImportQuery.SQLConnectionAfterPost(DataSet: TDataSet);
begin
  self.SQLConnection.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMYSQLImportQuery.SQLConnectionAfterDelete(DataSet: TDataSet);
begin
  self.SQLConnection.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TMYSQLImportQuery.SQLConnectionAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ConnectionID').AsLargeInt:=self.GenerateSequentialKey('Connection_GEN');
   
end;

function TMYSQLImportQuery.GenerateSequentialKey(KeyName: String) : LongInt;
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

{$R *.lfm}

end.

