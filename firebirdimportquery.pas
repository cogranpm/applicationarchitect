unit FirebirdImportQuery;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, sqldb, db, IBConnection;

type
  TFirebirdImportQuery = class(TDataModule)
  
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
        FDatabase:TIBConnection;
        FTransaction:TSQLTransaction;
  public
    { public declarations }
        property Database: TIBConnection read FDatabase write FDatabase;
        property Transaction: TSQLTransaction read FTransaction write FTransaction;

  private
        function GetNewPrimaryKeyValue(PSequenceName : string) : LongInt;
  end;



implementation

procedure TFirebirdImportQuery.SQLConnectionAfterPost(DataSet: TDataSet);
begin
  self.SQLConnection.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdImportQuery.SQLConnectionAfterDelete(DataSet: TDataSet);
begin
  self.SQLConnection.ApplyUpdates(-1);
  FTransaction.CommitRetaining;
end;

procedure TFirebirdImportQuery.SQLConnectionAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ConnectionID').AsLargeInt:=self.GetNewPrimaryKeyValue('GEN_Connection');
   
end;

function TFirebirdImportQuery.GetNewPrimaryKeyValue(PSequenceName : string) : LongInt;
var
  QueryText:string;
   proc : TSQLQuery;
   NewID : LongInt;
begin
     QueryText:='SELECT GEN_ID( ' + PSequenceName + ' ,1 ) AS NEWID FROM RDB$DATABASE;';
     proc := TSQLQuery.Create(Nil);
     proc.DataBase := FDatabase;
     proc.Transaction:= FTransaction;
     proc.SQL.Text :=QueryText;
     proc.Open;
     while not proc.EOF do
     begin
         NewID:=proc.FieldByName('NEWID').AsLargeInt;
         proc.Next;
     end;
     GetNewPrimaryKeyValue:=NewID;
end;

{$R *.lfm}

end.

