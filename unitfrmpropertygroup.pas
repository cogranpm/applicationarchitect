unit unitFrmPropertyGroup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, DbCtrls, DBGrids,
   db, appinterfacesunit;

type

  { TfrmPropertyGroup }

  TfrmPropertyGroup = class(TFrame, IAppFrame)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
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

constructor TfrmPropertyGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner) ;

end;

destructor TfrmPropertyGroup.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmPropertyGroup.SetupDataSource(PEntityName:String; PDataSource:TDataSource);
begin
    self.DBGrid1.DataSource:=PDataSource;
    self.DBNavigator1.DataSource:=PDataSource;
end;

end.

