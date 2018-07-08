unit unitFrmPropertyType;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, ExtCtrls, DbCtrls, DBGrids, appinterfacesunit;

type

  { TfrmPropertyType }

  TfrmPropertyType = class(TFrame, IAppFrame)
    dgPropertyType: TDBGrid;
    DBNavigator1: TDBNavigator;
    pnlPropertyTypeMain: TPanel;
    pnlPropertyTypeTop: TPanel;
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

constructor TfrmPropertyType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner) ;
  //DMMasterProperties.SQLPropertyType.Active:=True;
end;

destructor TfrmPropertyType.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmPropertyType.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
  self.DBNavigator1.DataSource:=PDataSource;
  self.dgPropertyType.DataSource:=PDataSource;
end;



end.

