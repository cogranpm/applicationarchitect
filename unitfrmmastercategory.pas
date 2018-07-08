unit unitFrmMasterCategory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, DbCtrls, DBGrids,
  appinterfacesunit, db;

type

  { TfrmMasterCategory }

  TfrmMasterCategory = class(TFrame, IAppFrame)
    dbgMasterCategory: TDBGrid;
    dbNavMasterCategory: TDBNavigator;
    dsMasterCategory: TDataSource;
    pnlMasterCategoryMain: TPanel;
    pnlMasterCategoryTop: TPanel;
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

constructor TfrmMasterCategory.Create(AOwner: TComponent);
begin
  inherited Create(AOwner) ;
end;

destructor TfrmMasterCategory.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmMasterCategory.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
     self.dbgMasterCategory.DataSource:=PDataSource;
     self.dbNavMasterCategory.DataSource:=PDataSource;
end;

end.

