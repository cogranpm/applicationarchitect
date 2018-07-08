unit CommonDataProvider;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, appinterfacesunit;

type
  TCommonDataProvider = class(TObject)

    public
      function GetImportMappingSystemCode(PDatabaseType:databaseType; var PSqlQuery:TSQLQuery ):String;
    private

  end;

implementation

function TCommonDataProvider.GetImportMappingSystemCode(PDatabaseType:databaseType; var PSqlQuery:TSQLQuery ):String;
var
  DatabaseType:String;
  TargetValue:String;
begin
   TargetValue:='';
    PSqlQuery.Active:=False;
    DatabaseType:= IntToStr(ord(PDatabaseType));
    PSqlQuery.ParamByName('SourceValue').AsString:=DatabaseType;
    PSqlQuery.Active:=True;
    while not PSqlQuery.EOF do
    begin
         TargetValue:=PSqlQuery.FieldByName('TargetValue').AsString;
         PSqlQuery.Next;
    end;
    PSqlQuery.Active:=False;
    Result:=TargetValue;
end;



end.

