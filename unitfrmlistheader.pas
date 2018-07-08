unit unitfrmListHeader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, DbCtrls, DBGrids, db, appinterfacesunit;

type

  { TfrmListHeader }

  TfrmListHeader = class(TFrame, IAppFrame)
    dbgListDetail: TDBGrid;
    dbgListHeader: TDBGrid;
    dbNavListDetail: TDBNavigator;
    dbNavListHeader: TDBNavigator;
    pnlListHeaderMain: TPanel;
    pnlListDetailMain: TPanel;
    pnlListDetailTop: TPanel;
    pnlListDetail: TPanel;
    pnlTop: TPanel;
    sptOne: TSplitter;
    procedure sptOneCanOffset(Sender: TObject; var NewOffset: Integer;
      var Accept: Boolean);
  private
    { private declarations }
  public
    { public declarations }
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
    procedure SetupDataSource(PEntityName:String; PDataSource:TDataSource);
  end;

implementation

{$R *.lfm}

procedure TfrmListHeader.sptOneCanOffset(Sender: TObject;
  var NewOffset: Integer; var Accept: Boolean);
begin

end;

constructor TfrmListHeader.Create(AOwner: TComponent);
begin
  inherited Create(AOwner) ;

end;

destructor TfrmListHeader.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmListHeader.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
  case PEntityName of
  'ListHeader':
    begin
       self.dbgListHeader.DataSource:=PDataSource;
       self.dbNavListHeader.DataSource:=PDataSource;
    end;
  'ListDetail':
    begin
         self.dbgListDetail.DataSource:=PDataSource;
         self.dbNavListDetail.DataSource:=PDataSource;
    end;
  end;
end;

end.

