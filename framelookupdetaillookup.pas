unit FrameLookupDetailLookup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, DbCtrls, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TfraLookupDetailLookup }

  TfraLookupDetailLookup = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    lstListValue: TListView;
    lstHeader: TListBox;
    pnlSelect: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

implementation

{$R *.lfm}

{ TfraLookupDetailLookup }


end.

