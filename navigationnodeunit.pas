unit NavigationNodeUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, appinterfacesunit;

type
  TNavigationNode = class(TObject)
  public
        FType: navigationNodeType;
        FKey: LongInt;
  public
        constructor Create(PType: navigationNodeType; PKey: LongInt);
  end;

implementation

constructor TNavigationNode.Create(PType: navigationNodeType; PKey: LongInt);
begin
    self.FType:=PType;
    self.FKey:=PKey;
end;

end.

