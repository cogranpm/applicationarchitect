unit jsonObjectWrapper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpjson;

Type
   TJSONObjectWrapper = class(TObject)

     private
       FJSONObject: TJSONObject;

     public
       constructor Create(PJSONObject: TJSONObject);
       destructor Destroy; override;
   end;

implementation


constructor TJSONObjectWrapper.Create(PJSONObject: TJSONObject);
begin

end;

destructor TJSONObjectWrapper.Destroy;
begin

  FreeAndNil(FJSONObject);
  inherited Destroy;
end;

end.

