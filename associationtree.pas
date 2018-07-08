unit AssociationTree;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
   TAssociationTree = class;    //forward reference
   TAssociationTree = class(TObject)
   private
     FChildren : array of TAssociationTree;
   public
      FAssociationId : LongInt;
      FOwner, FOwned : LongInt;
      FScreenChildId : LongInt;         //for ScreenChildren and ScreenArtifacts
      FScreenArtifactId : LongInt;      //for screen artifacts
      FScreenFamilyId : LongInt;        //for screen artifacts
      FType : ShortInt;
      FOwnerName, FOwnedName, FName : string;
      constructor Create();

end;

implementation


constructor TAssociationTree.Create();
begin
   inherited Create;
   FAssociationId := 0;
   FOwner := 0;
   FOwned := 0;
   FScreenFamilyId:=0;
   FScreenChildId:=0;
   FScreenArtifactId:=0;
   FOwnerName := '';
   FOwnedName := '';
end;

end.

